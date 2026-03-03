<?php
/**
 * API de soumission de score (POST uniquement).
 * Recoit les resultats d'une partie et les enregistre en BDD.
 */

header('Content-Type: application/json; charset=utf-8');

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(['error' => 'Methode non autorisee']);
    exit;
}

require_once __DIR__ . '/db.php';

$input = json_decode(file_get_contents('php://input'), true);
if (!is_array($input)) {
    http_response_code(400);
    echo json_encode(['error' => 'JSON invalide']);
    exit;
}

// --- Validation ---
$playerName = trim($input['player_name'] ?? 'Anonyme');
if (strlen($playerName) === 0 || strlen($playerName) > 50) $playerName = 'Anonyme';

$score = filter_var($input['score'] ?? null, FILTER_VALIDATE_INT);
if ($score === false || $score < 0 || $score > 50000) {
    http_response_code(400);
    echo json_encode(['error' => 'Score invalide']);
    exit;
}

$mode = $input['mode'] ?? 'classic';
if (!in_array($mode, ['classic', 'chrono', 'daily', 'duel'], true)) {
    http_response_code(400);
    echo json_encode(['error' => 'Mode invalide']);
    exit;
}

$difficulty = $input['difficulty'] ?? 'normal';
if (!in_array($difficulty, ['easy', 'normal', 'expert'], true)) {
    http_response_code(400);
    echo json_encode(['error' => 'Difficulte invalide']);
    exit;
}

// Validation des rounds_data (optionnel)
$roundsData = null;
if (isset($input['rounds_data']) && is_array($input['rounds_data'])) {
    // Charger les IDs de rounds existants pour valider
    $existingIds = $pdo->query('SELECT id FROM rounds')->fetchAll(PDO::FETCH_COLUMN);

    foreach ($input['rounds_data'] as $rd) {
        $rdYear = $rd['guess_year'] ?? null;
        $rdLat  = $rd['guess_lat'] ?? null;
        $rdLng  = $rd['guess_lng'] ?? null;
        $rdId   = $rd['round_id'] ?? null;

        if ($rdYear !== null && ($rdYear < 1970 || $rdYear > 2025)) {
            http_response_code(400);
            echo json_encode(['error' => 'Annee de guess invalide (1970-2025)']);
            exit;
        }
        if ($rdLat !== null && (!is_numeric($rdLat) || $rdLat < -90 || $rdLat > 90)) {
            http_response_code(400);
            echo json_encode(['error' => 'Latitude invalide']);
            exit;
        }
        if ($rdLng !== null && (!is_numeric($rdLng) || $rdLng < -180 || $rdLng > 180)) {
            http_response_code(400);
            echo json_encode(['error' => 'Longitude invalide']);
            exit;
        }
        if ($rdId !== null && !in_array((int)$rdId, $existingIds, true)) {
            http_response_code(400);
            echo json_encode(['error' => 'round_id inexistant : ' . (int)$rdId]);
            exit;
        }
    }
    $roundsData = json_encode($input['rounds_data']);
}

// --- Insertion ---
$stmt = $pdo->prepare('INSERT INTO scores (player_name, score, mode, difficulty, rounds_data) VALUES (?, ?, ?, ?, ?)');
$stmt->execute([$playerName, $score, $mode, $difficulty, $roundsData]);

echo json_encode(['success' => true, 'id' => (int)$pdo->lastInsertId()]);
