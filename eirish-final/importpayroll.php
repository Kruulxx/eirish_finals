<?php
// Load the database configuration file
include_once 'config.php';

if(isset($_POST['importPayroll'])){
    
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
                $days = $line[3];
                $rate = $line[4];
                $overtime = $line[5];
                $gross_salary = $line[6];
                $deductions = $line[7];
                $net_salary = $line[8];
                
                
                // Check whether member already exists in the database with the same email
                $prevQuery = "SELECT id FROM payroll WHERE emp_id = '".$line[1]."'";
                $prevResult = $link->query($prevQuery);
                
                if($prevResult->num_rows > 0){
                    // Update member data in the database
                    $link->query("UPDATE payroll SET id = '".$id."', emp_id = '".$emp_id."', name = '".$name."', days = '".$days."', rate = '".$rate."', overtime = '".$overtime."', gross_salary = '".$gross_salary."', deductions = '".$deductions."', net_salary = '".$net_salary."', WHERE id = '".$id."'");
                }else{
                    // Insert member data in the database
                    $link->query("INSERT INTO payroll (id, emp_id, name, days,  rate, overtime, gross_salary, deductions, net_salary) VALUES ('".$id."', '".$emp_id."', '".$name."', '".$days."', '".$rate."''".$overtime."', '".$gross_salary."', '".$deductions."', '".$net_salary."',)");
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
header("Location: payrolls.php".$qstring);