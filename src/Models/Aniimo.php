<?php 

namespace App\Models;
use App\Services\Database;
use PDO;

class Aniimo extends Element{

    private(set) int $id;
    private(set) string $nom;
    private(set) string $forme;

    private(set) bool $estDejaCapturer = false;

    public function __construct(int $id, string $nom, string $forme, ?array $elements = null)
    {
        parent::__construct($elements);
        $this->id = $id;
        $this->nom = $nom;
        $this->forme = $forme;
    }

    function EstCapturer() : void 
    {
        $this->estDejaCapturer = true;
    }
    

    public static function findAll(): array
    {
        $pdo = Database::getConnection();

        $sql = '
            SELECT 
                a.idAnimo,
                a.nom,
                a.forme,
                e.typeElement
            FROM Animo a
            LEFT JOIN Element e ON a.idAnimo = e.idAnimo
            ORDER BY a.idAnimo
        ';

        $statement = $pdo->query($sql);
        $rows = $statement->fetchAll(PDO::FETCH_ASSOC);

        $aniimos = [];

        foreach ($rows as $row) {
            $id = $row['idAnimo'];

            if (!isset($aniimos[$id])) {
                $aniimos[$id] = new self(
                    $row['idAnimo'],
                    $row['nom'],
                    $row['forme'],
                    $row['typeElement']
                );
            }

            // if ($row['typeElement'] !== null) {
            //     $aniimos[$id]->addElement($row['typeElement']);
            // }
        }

        return array_values($aniimos);
    }

}
?>