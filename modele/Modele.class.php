<?php
	class Modele
	{
		private $unPdo, $uneTable ;

		public function __construct ($serveur, $bdd, $user, $mdp)
		{
			$this->unPdo = null;
			$this->uneTable ="";
			try{
				$this->unPdo = new PDO ("mysql:host=".$serveur.";dbname=".$bdd, $user, $mdp);
			}
			catch (PDOException $exp)
			{
				echo "<br> Erreur de connexion à la base de donnée ";
			}

		}

		public function getTable ()
		{
			return $this->uneTable;
		}
		public function setTable ($uneTable)
		{
			$this->uneTable = $uneTable;
		}

		public function selectAll ($id, $limit)
		{
			if ($this->unPdo != null){

				if ($limit === false){
					$requete =" select * from  ".$this->uneTable." order by ".$id." asc limit 0, 5;" ;
				} else {
					$requete =" select * from  ".$this->uneTable." order by ".$id." asc;" ;
				}
				$select = $this->unPdo->prepare ($requete);
				$select->execute ();
				return $select->fetchAll ();
			}
			else {
				return 0;
			}
		}

		public function insert ($tab) {
			if ($this->unPdo != null){
				$listeValeurs = array();
				$listeChamps = array ();
				$donnees = array ();

				foreach ($tab as $cle => $valeur) {
					$listeChamps[ ] = $cle;
					$listeValeurs [ ] = ":".$cle;
					$donnees[":".$cle] = $valeur ;
				}
				$chaineChamps = implode(",", $listeChamps);
				$chaineValeurs = implode(",", $listeValeurs);

				$requete = " insert into  ".$this->uneTable. "(".$chaineChamps.")". "  values (".$chaineValeurs.");" ;

				$insert = $this->unPdo->prepare ($requete);
				$insert->execute($donnees);
			}
		}

		public function delete ($tab) {
			if ($this->unPdo != null){
				$listeChamps = array ();
				$donnees = array ();
				foreach ($tab as $cle => $valeur) {
					$listeChamps[ ] = $cle."=".":".$cle;
					$donnees[":".$cle] = $valeur ;
				}
				$chaineChamps = implode("  and  ", $listeChamps);

				$requete = " delete from ".$this->uneTable. "   where  ".$chaineChamps.";";

				$delete = $this->unPdo->prepare ($requete);
				$delete->execute($donnees);
			}
		}
        public function viderPanierEntier ($tab) {
            if ($this->unPdo != null){
                $requete ="delete from ajoute__panier_ where idClient =". $tab;
                $delete = $this->unPdo->prepare ($requete);
                $delete->execute();
            }
        }

		public function selectWhere ($where)
		{
			if ($this->unPdo != null){

				$listeChamps = array ();
				$donnees = array ();
				foreach ($where as $cle => $valeur) {
					$listeChamps[ ] = $cle."=".":".$cle;
					$donnees[":".$cle] = $valeur ;
				}
				$chaineChamps = implode("  and  ", $listeChamps);

				$requete = "select * from ".$this->uneTable." where ".$chaineChamps.";";

				$select = $this->unPdo->prepare ($requete);
				$select->execute($donnees);
				return $select->fetchAll (); //un seul résultat.
			}
			else
			{
				return null;
			}
		}

		public function connexion($mail, $mdp){
			if ($this->unPdo != null){

				$donnees = array ();
				$requete = "select * from client where adresseMailClient = '".$mail."' and mdpClient = '".$mdp."';";

				$select = $this->unPdo->prepare($requete);
				$select->execute();
				return $select->fetchAll(); //un seul résultat.
			}
			else
			{
				return null;
			}
		}

		public function acheter($id){
			if ($this->unPdo != null){
				$requete = "insert into achete (idClient, idLivre, quantite, prixAchat) select idClient, idLivre, quantite, prixTotal from panier where idClient = " .$id. ";";

				$select = $this->unPdo->prepare($requete);
				$select->execute();
				return $select->fetchAll(); //un seul résultat.
			}
			else
			{
				return null;
			}
		}

		public function countPanier($id){
			if ($this->unPdo != null){

				$donnees = array ();
				$requete = "select count(idClient) from ajoute__panier_ where idClient=".$id." group by idClient;";

				$select = $this->unPdo->prepare($requete);
				$select->execute();
				return $select->fetchAll(); //un seul résultat.
			}
			else
			{
				return null;
			}
		}

		public function countPanierWhere($id){
			if ($this->unPdo != null){

				$requete = "select count(idClient) from ajoute__panier_ where idLivre=".$id." group by idLivre;";

				$select = $this->unPdo->prepare($requete);
				$select->execute();
				return $select->fetchAll(); //un seul résultat.
			}
			else
			{
				return null;
			}
		}

		public function update ($tab, $where)
		{
			if ($this->unPdo != null){

				$listeChamps = array ();
				$listeValeurs = array();
				$donnees = array ();
				foreach ($tab as $cle => $valeur) {
					$listeValeurs[ ] = $cle."=".":".$cle;
					$donnees[":".$cle] = $valeur ;
				}
				foreach ($where as $cle => $valeur) {
					$listeChamps[ ] = $cle."=".":".$cle;
					$donnees[":".$cle] = $valeur ;
				}
				$chaineChamps = implode("  and  ", $listeChamps);
				$chaineValeurs = implode (", ", $listeValeurs);

				$requete = "update ".$this->uneTable." set ".$chaineValeurs." where ".$chaineChamps.";";

				$update = $this->unPdo->prepare ($requete);
				$update->execute ($donnees);
			}
		}

		public function selectLike ($tab, $mot)
		{
			if ($this->unPdo != null){
				$listeChamps= array();
				foreach ($tab as $valeur) {
					$listeChamps[ ] = $valeur." Like ".":mot";
				}
				$chaineChamps = implode(" or ", $listeChamps);

				$donnees = array(":mot"=>"%".$mot."%");

				$requete =" select  *  from  ".$this->uneTable." where ".$chaineChamps ;

				$select = $this->unPdo->prepare ($requete);
				$select->execute ($donnees);
				return $select->fetchAll ();
			}
			else {
				return 0;
			}
		}

	}//fin de la classe

?>
