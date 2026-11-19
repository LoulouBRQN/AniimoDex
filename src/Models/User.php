<?php 

namespace App\Models;
use App\Services\Database;
use PDO;

class User{

    private(set) int $id;
    private(set) string $email;

    public function __construct(int $id, string $email)
    {
        $this->id = $id;
        $this->email = $email;
        
    }
    

    public static function login(string $email, string $password): void
    {
        $pdo = Database::getConnection();

        $sql = "
            SELECT 
                id,
                email,
                motDePasse,
            FROM User
            WHERE email = :email
            AND motDePasse = :password

        ";

        $statement = $pdo->prepare($sql);
        $statement->execute([":email" => $email]);
        $statement->execute([":password" => $password]);
        $rows = $statement->fetchAll(PDO::FETCH_ASSOC);

        if ($rows != null) {
            new self($rows["id"], $rows["email"]); 
        }
    }

    

}
?>