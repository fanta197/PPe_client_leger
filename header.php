<?php
header('Content-type: text/html; charset=UTF-8');

require_once("controleur/conf.ini.php");
require_once("controleur/controleur.class.php");
//
$unControleur = new Controleur($server, $bdd, $user, $mdp);
$unControleur->setTable("client");
$idUtilisateur = null;
$ifAdmin = null;
//

// log out

if (isset($_COOKIE["mail"]) && isset($_COOKIE["mdp"])){
  $login = $unControleur->connexion($_COOKIE["mail"], $_COOKIE["mdp"]);

  $idUtilisateur = $login[0]["idClient"];
  //$ifAdmin = $login[0]["admin"];
}

if (isset($_POST["connexion"]) && isset($_POST["mail"]) && isset($_POST["mdp"])){
  $login = $unControleur->connexion($_POST["mail"], $_POST["mdp"]);
  if(sizeof($login) == 0){
    header('location: ./connexion.php');
  } else {
    setcookie("mail", $_POST["mail"], time()+3600);
    setcookie("mdp", $_POST["mdp"], time()+3600);
    header('location: ./dashboard.php');
  }
}

if (isset($_POST["inscription"]) && isset($_POST["nom"]) && isset($_POST["prenom"]) && isset($_POST["mail"]) && isset($_POST["mdp"])){
  $tab = array();
  $tab["nomClient"] = $_POST["nom"];
  $tab["prenomClient"] = $_POST["prenom"];
  $tab["mdpClient"] = $_POST["mdp"];
  $tab["adresseMailClient"] = $_POST["mail"];
  $login = $unControleur->insert($tab);
  setcookie("mail", $_POST["mail"], time()+3600);
  setcookie("mdp", $_POST["mdp"], time()+3600);
  header('location: ./dashboard.php');
}

//
$panier = new Controleur($server, $bdd, $user, $mdp);
$panier->setTable("ajoute__panier_");
$panierCount = $panier->countPanier($idUtilisateur);
if (sizeof($panierCount) == 0){
  $panierCount = 0;
} else {
  $panierCount = $panierCount[0][0];
}

?>

<html lang="en">
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;500;600;700&display=swap" rel="stylesheet">
  <title>IRIS - Maison d'édition</title>
  <!--
    TemplateMo 558 Klassy Cafe
    https://templatemo.com/tm-558-klassy-cafe
  -->
  <!-- Additional CSS Files -->
  <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">
  <link rel="stylesheet" href="assets/css/templatemo-klassy-cafe.css">
  <link rel="stylesheet" href="assets/css/owl-carousel.css">
  <link rel="stylesheet" href="assets/css/lightbox.css">
</head>
<body>

  <!-- ***** Preloader Start ***** -->
  <div id="preloader">
    <div class="jumper">
      <div></div>
      <div></div>
      <div></div>
    </div>
  </div>
  <!-- ***** Preloader End ***** -->
  <!-- ***** Header Area Start ***** -->
  <header class="header-area header-sticky">
    <div class="container">
      <div class="row">
        <div class="col-12">
          <nav class="main-nav">
            <!-- ***** Logo Start ***** -->
            <?php  require_once("nav.php"); ?>
            <!-- ***** Menu End ***** -->
          </nav>
        </div>
      </div>
    </div>
  </header>
  <!-- ***** Header Area End ***** -->
