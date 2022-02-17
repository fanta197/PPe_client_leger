<?php
//
require_once("header.php");
$tab = array();
$tab["idClient"] = $idUtilisateur;
echo $idUtilisateur;

$panier = new Controleur($server, $bdd, $user, $mdp);
$panier->setTable("panier");
$panierWhere = $panier->selectWhere($tab);
//var_dump($panierWhere);
if (isset($_POST["viderPanier"])){
  $livre = new Controleur($server, $bdd, $user, $mdp);
  $livre->setTable("ajoute__panier_");
  $idLivre = array();
  $idLivre["idLivre"] = $_POST["idLivre"];
  $livre->delete($idLivre);
  echo "<meta http-equiv='refresh' content='0'>";
}

if (isset($_POST["acheterPanier"])){
  //
  $panier->acheter($idUtilisateur);

  echo "<script>window.location.replace('acheter.php');</script>";
}

?>

<section>
  <div class="dashboard">
    <h3 style="display:inline">Mon panier</h3>
  </div>
</section>
<section class="livre-article-panier">
<?php
  if (sizeof($panierWhere) == 0){
    echo "<p>Panier vide</p>";
  } else {
    foreach ($panierWhere as $p) {
      echo '<div class="livre-article-panier-info">
      <div class="panier-cover">
        <img src="./assets/images/'.$p["coverLivre"].'" alt="">
      </div>
        <div class="panier-title">
          <p>'.$p["titreLivre"].'</p>
        </div>
        <div class="panier-prix">
          <p>'.$p["prixTotal"].'€</p>
        </div>
        <div class="panier-quantite"><button class="button_moins"> - </button>
          <p>quantité : x'.$p["quantite"].'</p><button class="button_plus"> + </button>
        </div>
        <form method="post">
          <div class="">
            <input type="hidden" name="idLivre" value="'.$p["idLivre"].'">
            <button type="submit" name="viderPanier" class="main-button-icon">Retirer du panier</button>
          </div>
        </form>
      </div>';
    }
    echo '<form method="post">
      <div class="">
        <button type="submit" name="acheterPanier" class="main-button-icon">Acheter</button>
      </div>
    </form>';
  }
?>
</section>

<?php

require_once("footer.php");

?>
