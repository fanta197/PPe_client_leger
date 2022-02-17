<?php


include_once("header.php");

?>
<div class="login">
        
        <div class="divlog">
            <form action="connexion.php" method="post">
                &nbsp <p>Connexion à l'espace membre :</p><br>
                <label for="mail">mail</label>
                <input type="text" id="mail" name="mail"><br>
                
                <label for="pas">Mot de passe</label>
                <input type="password" id="pas" name="mdp"><br>
               
               <input type="submit" name="SeConnecter" value="Connexion">
    
               <br><br>
                <a href="inscription.php" class="sinscrire">S'inscrire</a>
    
            </form>
        </div>    
    </div>
    

<?php

include_once("footer.php");

?>
