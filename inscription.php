<?php

//
setcookie("mail", "", time()-3600);
setcookie("mdp", "", time()-3600);
include_once("header.php");

?>
<div class="connexion_library">
  <form method="post">
    <div class="contact-form">
            <div class="row">
              <div class="col-lg-12">
                <h4>Créer un compte</h4>
              </div>
              <form class="" action="index.html" method="post">
                <div class="col-lg-6 col-sm-12">
                  <fieldset>
                    <input name="nom" type="name" id="name"  placeholder="Nom*">
                  </fieldset>
                </div>
                <div class="col-lg-6 col-sm-12">
                  <fieldset>
                    <input name="prenom" type="name" id="name"  placeholder="Prénom*">
                  </fieldset>
                </div>
                <div class="col-lg-6 col-sm-12">
                  <fieldset>
                    <input name="mdp" type="password" id="password"  placeholder="Mot de passe*">
                  </fieldset>
                </div>
                <div class="col-lg-6 col-sm-12">
                  <fieldset>
                    <input name="mail" type="mail" id="name" placeholder="Adresse Mail*">
                  </fieldset>
                </div>
                <div class="col-lg-12">
                  <fieldset>
                    <button name="inscription" type="submit" id="form-submit" class="main-button-icon">Inscription</button>
                  </fieldset>
                </div>
                <div class="col-lg-12">
                  <fieldset style="text-align: center;">
                    <a href="./connexion.php" style="color: #000!important;">Connexion ?</a>
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
