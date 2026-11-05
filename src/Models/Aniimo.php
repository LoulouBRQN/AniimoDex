<?php 

namespace App\Models;
use App\Services\Database;
use PDO;

class Aniimo{

    private(set) int $id;
    private(set) string $nom;
    private(set) string $forme;
    private(set) ?array $elements;

    public function __construct(int $id, string $nom, string $forme, ?array $elements = null)
    {
        $this->id = $id;
        $this->nom = $nom;
        $this->forme = $forme;
        $this->elements = $elements;
    }
    

    public static function findAll(): array
    {
        $pdo = Database::getConnection();
        $statement = $pdo->query('SELECT idAnimo, nom, forme FROM equipes ORDER BY id');
        $rows = $statement->fetchAll();
        $aniimos = [];
        foreach ($rows as $row) {
            $aniimos = new self($row['idAnimo'], $row['nom'], $row['forme']);
        }
        return $aniimos;
    }

}
?>