<?php
// Load the database configuration file
include_once 'config.php';

if(isset($_POST['importSubmit'])){
    
    // Allowed mime types
    $csvMimes = array('text/x-comma-separated-values', 'text/comma-separated-values', 'application/octet-stream', 'application/vnd.ms-excel', 'application/x-csv', 'text/x-csv', 'text/csv', 'application/csv', 'application/excel', 'application/vnd.msexcel', 'text/plain');
    
    // Validate whether selected file is a CSV file
    if(!empty($_FILES['file']['name']) && in_array($_FILES['file']['type'], $csvMimes)){
        
        // If the file is uploaded
        if(is_uploaded_file($_FILES['file']['tmp_name'])){
            
            // Open uploaded CSV file with read-only mode
            $csvFile = fopen($_FILES['file']['tmp_name'], 'r');
            
            // Skip the first line
            fgetcsv($csvFile);
            
            // Parse data from CSV file line by line
            while(($line = fgetcsv($csvFile)) !== FALSE){
                // Get row data
                $id   = $line[0];
                $emp_id  = $line[1];
                $name  = $line[2];
                $dateTime = $line[3];
                $logType = $line[4];
                
                
                // Check whether member already exists in the database with the same email
                $prevQuery = "SELECT id FROM attendancee WHERE emp_id = '".$line[1]."'";
                $prevResult = $link->query($prevQuery);
                
                if($prevResult->num_rows > 0){
                    // Update member data in the database
                    $link->query("UPDATE attendancee SET id = '".$id."', emp_id = '".$emp_id."',  name = '".$name."', dateTime = '".$dateTime."', logType = '".$logType."',  WHERE id = '".$id."'");
                }else{
                    // Insert member data in the database
                    $link->query("INSERT INTO attendancee (id, emp_id, name, dateTime,  logType ) VALUES ('".$id."', '".$emp_id."', '".$name."', '".$dateTime."', '".$logType."')");
                }
            }
            
            // Close opened CSV file
            fclose($csvFile);
            
            $qstring = '?status=succ';
        }else{
            $qstring = '?status=err';
        }
    }else{
        $qstring = '?status=invalid_file';
    }
}

// Redirect to the listing page
header("Location: attendance.php".$qstring);