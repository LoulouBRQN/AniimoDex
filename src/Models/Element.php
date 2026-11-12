<?php 

namespace App\Models;
use App\Services\Database;
use PDO;

abstract class Element{

    private(set) ?array $elements;

    public function __construct(array $elements)
    {
        $this->elements = $elements;
    }

}
?>