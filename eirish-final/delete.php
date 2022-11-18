<?php
  include "config.php";

  if (isset($_GET['id'])) {  
    $id = $_GET['id'];  
    $query = "DELETE FROM `employee` WHERE id = '$id'";  
    $run = mysqli_query($link,$query);  
    if ($run) {  
         header('location:employee.php');  
    }else{  
         echo "Error: ".mysqli_error($link);  
    }  
}  
          
     
     
 
?>