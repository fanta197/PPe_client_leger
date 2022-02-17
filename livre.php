<<?php

require_once("header.php");
$client = array();
$client["idClient"] = $idUtilisateur;

$unControleur->setTable("livre_v");
$tab["idLivre"] = $_GET["id"];
$livre = $unControleur->selectWhere($tab);

$panier = new Controleur($server, $bdd, $user, $mdp);
$panier->setTable("ajoute__panier_");
$panierWhere = $panier->selectWhere($tab);

$ajoutButton = null;

if (isset($_POST["ajouterPanier"])){
  if($idUtilisateur){
    $panierTab = array();
    $panierTab["idClient"] = $idUtilisateur;
    $panierTab["idLivre"] = $_GET["id"];
    $panier->insert($panierTab);
    $GLOBALS["ajoutButton"] = "<p style='color:green'>Livre ajouté</p>";
    echo "<meta http-equiv='refresh' content='0'>";
  } else {
    header('location: connexion.php');
  }
}

?>

<section class="livre-article-produit">
  <div class="">
    <img src="./assets/images/<?=  $livre[0]["coverLivre"]; ?>" alt="">
  </div>
  <div class="livre-article-produit-info">
    <div class="">
      <h1><?=  $livre[0]["titreLivre"]; ?></h1>
    </div>
    <div class="">
      <h3><?=  $livre[0]["prixLivre"]; ?>€</h3>
    </div>
    <div class="">
      <p><?= $livre[0]["descLivre"]; ?></p>
    </div>
    <form class="" action="" method="post">
      <div class="">
        <button type="submit" name="ajouterPanier" id="form-submit" class="main-button-icon">Ajouter dans le Panier</button>
      </div>
    </form>
    <div class="">
      <?php if ($ajoutButton) echo $ajoutButton; ?>
    </div>
  </div>
</section>

<?php

require_once("footer.php");

?>
