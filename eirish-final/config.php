<?php
 $servername = 'localhost';
 $username = 'root';
 $password = '';
 $dbname = 'eirish_db';

# Connection
$link = mysqli_connect($servername, $username, $password, "$dbname");

# Check connection
if (!$link) {
  die("Connection failed: " . mysqli_connect_error());
}
?>