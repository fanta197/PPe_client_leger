<?php
//
require_once("header.php");
$tab = array();
$tab["idClient"] = $idUtilisateur;
$compte = $unControleur->selectWhere($tab);

if (!$compte){
  header("location: ./");
}

?>

<section>
  <div class="dashboard">
    <h3 style="display:inline"><?=  $compte[0]["prenomClient"]; ?></h3>
    <h3 style="display:inline"><?=  $compte[0]["nomClient"]; ?></h3>
  </div>
</section>

<?php

require_once("footer.php");

?>
