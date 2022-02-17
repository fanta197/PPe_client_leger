<?php
//
    require_once("header.php");
    echo $idUtilisateur."\n";
    $panier = new Controleur($server,$bdd,$user,$mdp);
    $panier->viderPanierEntier($idUtilisateur);

echo "<script>setTimeout(function(){ window.location.replace('/ppe2_iris/'); }, 3000);</script>";
?>

<div class="articles-achetes">
  <div class="">
    <h1>Vos articles ont été achetés !</h1>
  </div>
  <div class="">
    <h3>Vous allez être redirigés vers la page d'accueil dans 3 secondes.</h3>
  </div>
</div>
<?php

require_once("footer.php");

?>
