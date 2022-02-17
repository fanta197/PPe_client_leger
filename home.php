<?php

include_once("header.php");
$unControleurLivres = new Controleur($server, $bdd, $user, $mdp);
    $unControleurLivres->setTable("livre_v");
    $bool = false;
    $livres = $unControleurLivres->selectAll("idLivre", $bool);
    $livresNote = $unControleurLivres->selectAll("prenomAuteur", $bool);


?>

<!DOCTYPE html>
<!-- ***** Main Banner Area Start ***** -->
<div id="top">
  <div class="container-fluid">
    <div class="row">
      <div class="col-lg-4">
        <div class="left-content">
          <div class="inner-content">
            <h4>Maison D'Edition Iris</h4>
            <h6>UNE NOUVELLE EXPERIENCE</h6>
          </div>
        </div>
      </div>
      <div class="col-lg-8">
        <div class="main-banner header-text">
          <div class="Modern-Slider">
            <!-- Item -->
            <div class="item">
              <div class="img-fill">
                <img src="assets/images/slide6.jpeg" alt="">
              </div>
            </div>
            <!-- // Item -->
            <!-- Item -->
            <div class="item">
              <div class="img-fill">
                <img src="assets/images/slide-03.jpg" alt="">
              </div>
            </div>
            <!-- // Item -->
            <!-- Item -->
            <div class="item">
              <div class="img-fill">
                <img src="assets/images/slide2.jpeg" alt="">
              </div>
            </div>
            <!-- // Item -->
            <div class="item">
              <div class="img-fill">
                <img src="assets/images/slide7.jpeg" alt="">
              </div>
            </div>

            <!-- // Item -->
            <!-- // Item -->
            <div class="item">
              <div class="img-fill">
                <img src="assets/images/slide8.jpeg" alt="">
              </div>
            </div>

            <!--  Item -->
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- ***** Main Banner Area End ***** -->

<section class="livres-home">
  <h2>Les derniers livres publiés</h2>
  <div class="livre-article-home">
  <?php
    foreach ($livres as $livre) {
      echo '<div>
        <a href="./livre?id='.$livre["idLivre"].'">
        <div class="book-cover">
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
  </div>
</section>

<section class="livres-home">
  <h2>Les mieux notés</h2>
  <div class="livre-article-home">
  <?php
    foreach ($livresNote as $livre) {
      echo '<div>
        <a href="./livre?id='.$livre["idLivre"].'">
        <div class="book-cover">
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
  </div>
</section>

    

<!-- ***** Footer Start ***** -->


<?php

include_once("footer.php");

?>
