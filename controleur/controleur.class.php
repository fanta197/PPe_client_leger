<?php
    require_once ("modele/modele.class.php");

    class Controleur
    {
        private $unModele ;

        public function __construct ($serveur, $bdd, $user, $mdp)
        {
            $this->unModele = new Modele ($serveur, $bdd, $user, $mdp);
        }

        public function getTable ()
        {
            return $this->unModele->getTable();
        }

        public function setTable ($uneTable)
        {
            return $this->unModele->setTable($uneTable);
        }

        public function selectAll ($id, $limit)
        {
            return $this->unModele->selectAll($id, $limit);
        }

        public function insert ($tab) {
            $this->unModele->insert($tab);
        }

        public function delete ($tab) {
            $this->unModele->delete($tab);
        }
        public function selectWhere ($where)
        {
            return $this->unModele->selectWhere($where);
        }
        public function connexion ($mail, $mdp)
        {
            return $this->unModele->connexion($mail, $mdp);
        }
        public function countPanier ($id)
        {
            return $this->unModele->countPanier($id);
        }
        public function countPanierWhere ($id)
        {
            return $this->unModele->countPanierWhere($id);
        }
        public function acheter($id)
        {
            return $this->unModele->acheter($id);
        }
        public function viderPanierEntier($id)
        {
            return $this->unModele->viderPanierEntier($id);
        }
        public function update ($tab, $where)
        {
            $this->unModele->update ($tab, $where);
        }
        public function selectLike ($tab, $mot)
        {
            return $this->unModele->selectLike ($tab, $mot);
        }
    }

?>
