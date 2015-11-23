<?php
	class DBConnection{
		public $connection;

		private $_DBUser = 'root';
		private $_DBPass = ''; // WHEN AT VANIER
		//private $_DBPass = 'tiger'; // WHEN AT EDDY's HOME
		private $_DBName = 'case_study';

		public function __construct(){
			$this->connection = new PDO('mysql:host=localhost;dbname=' .$this->_DBName, $this->_DBUser, $this->_DBPass);
			$this->connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		}
	}
?>