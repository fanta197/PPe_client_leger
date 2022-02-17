<?php

setcookie("mail", "", time()-3600);
setcookie("mdp", "", time()-3600);
header("location: ./");

?>
