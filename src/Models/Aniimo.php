<?php 

namespace App\Models;
use App\Services\Database;
use PDO;

class Aniimo extends Element{

    private(set) int $id;
    private(set) string $nom;
    private(set) string $forme;
    private(set) bool $estDejaCapturer = false;

    public function __construct(int $id, string $nom, string $forme, bool $estDejaCapturer = false, ?array $elements = null)
    {
        parent::__construct($elements);
        $this->id = $id;
        $this->nom = $nom;
        $this->forme = $forme;
    }

    function EstCapturer($idUser) : void 
    {
        $this->estDejaCapturer = true;
    }
    

    public static function findAll(int $idUser): array
    {
        $pdo = Database::getConnection();

        $sql = '
            SELECT 
                a.idAnimo,
                a.nom,
                a.forme,
                COALESCE(
                    (
                        SELECT JSON_ARRAYAGG(e.typeElement)
                        FROM Element e
                        WHERE e.idAnimo = a.idAnimo
                    ),
                    JSON_ARRAY()
                ) AS elements,
                EXISTS (
                    SELECT 1
                    FROM Aniimo_User au
                    WHERE au.idAniimo = a.idAnimo
                    AND au.idUser = :idUser
                ) AS captured
            FROM Animo a
            ORDER BY a.idAnimo
        ';

        $statement = $pdo->prepare($sql);
        $statement->execute([":idUSer" => $idUser]);
        $rows = $statement->fetchAll(PDO::FETCH_ASSOC);

        $aniimos = [];

        foreach ($rows as $row) {

            $row['elements'] = json_decode($row['elements'], true);
            $aniimos[] = new self(
                $row['idAnimo'],
                $row['nom'],
                $row['forme'],
                $row['captured'],
                $row['elements']
            );

            // if ($row['typeElement'] !== null) {
            //     $aniimos[$id]->addElement($row['typeElement']);
            // }
        }

        return $aniimos;
    }

}
?>