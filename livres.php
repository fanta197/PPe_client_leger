<?php

require_once("header.php");
$unControleur->setTable("livre_v");
$livres = $unControleur->selectAll("idLivre", true);

?>

<section class="livres">
  <?php
    foreach ($livres as $livre) {
      echo '<div class="livre-article">
        <a href="./livre.php?id='.$livre["idLivre"].'">
        <div class="">
          <img src="./assets/images/'.$livre["coverLivre"].'">
        </div>
        <div class="">
          <p>'.$livre["titreLivre"].'</p>
        </div>
        <div class="prix">
          <h3>'.$livre["prixLivre"].'€</h3>
        </div>
        </a>
      </div>';
    }
  ?>
</section>

<?php

require_once("footer.php");

?>
