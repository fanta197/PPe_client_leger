<?php

// Program to display URL of current page.

if(isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on')
    $link = "https";
else
    $link = "http";

// Here append the common URL characters.
$link .= "://";

// Append the host(domain name, ip) to the URL.
$link .= $_SERVER['HTTP_HOST'];

// Append the requested resource location to the URL
$link .= $_SERVER['REQUEST_URI'];

//

// log out
//setcookie("mail", "", time()-3600);
//setcookie("mdp", "", time()-3600);

?>


<a href="./" class="logo">
  <img src="assets/images/klassy-logo.png" align="klassy cafe html template">
</a>
<!-- ***** Logo End ***** -->
<!-- ***** Menu Start ***** -->
<ul class="nav">
  <?php
  if (strpos($link, 'connexion') == true){
    echo '  <li class=""><a href="./">Accueil</a></li>
      <li><a href="./livres.php">Livres</a></li>';
      if (isset($_COOKIE["mail"]) && $ifAdmin == 0){
        echo '
        <li class="">
          <a href="./panier.php">Panier - '.$panierCount.'</a>
        </li>
        <li class="submenu">
          <a href="javascript:;">Mon compte</a>
          <ul>
            <li><a href="./dashboard.php">Paramètres</a></li>
            <li><a href="./historique.php">Historique d\'achats"</a></li>
            <li><a href="./deconnexion.php">Déconnexion</a></li>
          </ul>
        </li>
        ';
      } else if (isset($_COOKIE["mail"]) && $ifAdmin == 1){
        echo '
        <li class="submenu">
          <a href="javascript:;">Mon compte administrateur</a>
          <ul>
            <li><a href="./dashboard.php">Paramètres</a></li>
            <li><a href="./historique.php">Historique d\'achats"</a></li>
            <li><a href="./deconnexion.php">Déconnexion</a></li>
          </ul>
        </li>
        ';
      } else {
        echo '<li><a href="./connexion.php" class="active">Connexion</a></li>';
      }
  } else if (strpos($link, 'livres') == true || strpos($link, 'livre') == true ) {
    echo '  <li class=""><a href="./">Accueil</a></li>
      <li><a href="./livres.php.php" class="active">Livres</a></li>';
      if (isset($_COOKIE["mail"]) && $ifAdmin == 0){
        echo '
        <li class="">
          <a href="./panier.php">Panier - '.$panierCount.'</a>
        </li>
        <li class="submenu">
          <a href="javascript:;">Mon compte</a>
          <ul>
            <li><a href="./dashboard.php">Paramètres</a></li>
            <li><a href="./historique.php">Historique d\'achats"</a></li>
            <li><a href="./deconnexion.php">Déconnexion</a></li>
          </ul>
        </li>
        ';
      }  else if (isset($_COOKIE["mail"]) && $ifAdmin == 1){
        echo '
        <li class="submenu">
          <a href="javascript:;">Mon compte administrateur</a>
          <ul>
            <li><a href="./dashboard.php">Paramètres</a></li>
            <li><a href="./historique.php">Historique d\'achats"</a></li>
            <li><a href="./deconnexion.php">Déconnexion</a></li>
          </ul>
        </li>
        ';
      } else {
        echo '<li><a href="./connexion.php">Connexion</a></li>';
      }
  } else if (strpos($link, 'panier') == true && $ifAdmin == 0) {
    echo '
    <li class=""><a href="./">Accueil</a></li>
    <li><a href="./livres.php">Livres</a></li>
    <li class="">
      <a href="./panier.php" class="active">Panier - '.$panierCount.'</a>
    </li>
    <li class="submenu">
      <a href="javascript:;">Mon compte</a>
      <ul>
      <li><a href="./dashboard.php">Paramètres</a></li>
      <li><a href="./historique.php">Historique d\'achats"</a></li>
      <li><a href="./deconnexion.php">Déconnexion</a></li>
      </ul>
    </li>';
  }  else if (strpos($link, 'panier') == true && $ifAdmin == 1){
    echo '
    <li class="submenu">
      <a href="javascript:;">Mon compte administrateur</a>
      <ul>
        <li><a href="./dashboard.php">Paramètres</a></li>
        <li><a href="./historique.php">Historique d\'achats"</a></li>
        <li><a href="./deconnexion.php">Déconnexion</a></li>
      </ul>
    </li>
    ';
  } else {
    echo '  <li class=""><a href="./" class="active">Accueil</a></li>
      <li><a href="./livres.php">Livres</a></li>';
      if (isset($_COOKIE["mail"]) && $ifAdmin == 0){
        echo '
        <li class="">
          <a href="./panier.php">Panier - '.$panierCount.'</a>
        </li>
        <li class="submenu">
          <a href="javascript:;">Mon compte</a>
          <ul>
            <li><a href="./dashboard.php">Paramètres</a></li>
            <li><a href="./historique.php">Historique d\'achats"</a></li>
            <li><a href="./deconnexion.php">Déconnexion</a></li>
          </ul>
        </li>
        ';
      }  else if (isset($_COOKIE["mail"]) && $ifAdmin == 1){
        echo '
        <li class="submenu">
          <a href="javascript:;">Mon compte administrateur</a>
          <ul>
            <li><a href="./dashboard.php">Paramètres</a></li>
            <li><a href="./historique.php">Historique d\'achats"</a></li>
            <li><a href="./deconnexion.php">Déconnexion</a></li>
          </ul>
        </li>
        ';
      } else {
        echo '<li><a href="./connexion.php">Connexion</a></li>';
      }
  }

  ?>


  <!-- <li class=""><a rel="sponsored" href="https://templatemo.com" target="_blank">External URL</a></li> -->
</ul>
<a class='menu-trigger'>
  <span>Menu</span>
</a>
