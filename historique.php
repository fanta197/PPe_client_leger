<?php

require_once("header.php");

$tab = array();
$tab["idClient"] = $idUtilisateur;

$unControleur->setTable("achat");
if (!$ifAdmin){
  $achat = $unControleur->selectWhere($tab, true);
} else {
  $achat = $unControleur->selectAll("dateAchat", true);
}

?>

<section>
  <?php if(!$ifAdmin) : ?>
    <div class="dashboard">
      <h3 style="display:inline">Mon historique d'achat</h3>
    </div>
    <div class="historique">
      <div class="historique-box">
        <div>
          <p>Titre</p>
        </div>
        <div>
          <p>Quantité</p>
        </div>
        <div>
          <p>Prix total</p>
        </div>
        <div>
          <p>Date d'achat</p>
        </div>
      </div>
      <?php foreach ($achat as $a) {
        echo '
          <div class="historique-box">
            <div>
              <p>'.$a["titreLivre"].'</p>
            </div>
            <div>
              <p>'.$a["quantite"].'</p>
            </div>
            <div>
              <p>'.$a["prixAchat"].'€</p>
            </div>
            <div>
              <p>'. $myDateTime = DateTime::createFromFormat('Y-m-d H:i:s', $a["dateAchat"])->format('d-m-Y à h:i:s') . '</p>
            </div>
          </div>
        ';
      }
      ?>
    </div>
    <?php else : ?>
      <div class="dashboard">
        <h3 style="display:inline">Historique d'achat complet</h3>
      </div>
      <div class="historique">
        <div class="historique-box">
          <div>
            <p>Prénom - Client</p>
          </div>
          <div>
            <p>Nom - Client</p>
          </div>
          <div>
            <p>Titre</p>
          </div>
          <div>
            <p>Quantité</p>
          </div>
          <div>
            <p>Prix total</p>
          </div>
          <div>
            <p>Date d'achat</p>
          </div>
        </div>
        <?php foreach ($achat as $a) {
          echo '
            <div class="historique-box">
              <div>
                <p>'.$a["prenomClient"].'</p>
              </div>
              <div>
                <p>'.$a["nomClient"].'</p>
              </div>
              <div>
                <p>'.$a["titreLivre"].'</p>
              </div>
              <div>
                <p>'.$a["quantite"].'</p>
              </div>
              <div>
                <p>'.$a["prixAchat"].'€</p>
              </div>
              <div>
                <p>'. $myDateTime = DateTime::createFromFormat('Y-m-d H:i:s', $a["dateAchat"])->format('d-m-Y à h:i:s') . '</p>
              </div>
            </div>
          ';
        }
        ?>
      </div>
    <?php endif; ?>

</section>

<?php

require_once("footer.php");

?>
