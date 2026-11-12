<?php
namespace App\Controllers;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use App\Controllers;

class AccueilController extends Controller
{
    public function index(Request $request, Response $response): Response
    {
        return $this->render('Collection Aniiiimo', $response, "accueil");
    }
}
