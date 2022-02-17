<?php

//
include_once("header.php");

?>
<div class="connexion_library">
  <form method="post">
    <div class="contact-form">
            <div class="row">
              <div class="col-lg-12">
                <h4>Connexion</h4>
              </div>
              <form class="" action="index.html" method="post">
                <div class="col-lg-6 col-sm-12">
                  <fieldset>
                    <input name="mail" type="mail" id="name" placeholder="Adresse Mail*">
                  </fieldset>
                </div>
                <div class="col-lg-6 col-sm-12">
                  <fieldset>
                    <input name="mdp" type="password" id="password"  placeholder="Mot de passe*">
                  </fieldset>
                </div>
                <div class="col-lg-12">
                  <fieldset>
                    <button name="connexion" type="submit" id="form-submit" class="main-button-icon">Connexion</button>
                  </fieldset>
                </div>
                <div class="col-lg-12">
                  <fieldset style="text-align: center;">
                    <a href="./inscription.php" style="color: #000!important;">Inscription ?</a>
                  </fieldset>
                </div>
            </form>
            </div>
        </div>
  </form>
</div>

<?php

include_once("footer.php");

?>

