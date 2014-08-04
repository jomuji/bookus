
 
<?php
// if the form was submitted
if($_POST){
 
    // connect to database
    include 'db_connect.php';
 
    // sql query
    $sql = "INSERT INTO
                user (id_config, username, password, droit)
            VALUES
                (?, ?, ?, ?)";
 
    // if the statement was prepared
    if($stmt = $mysqli->prepare($sql) ){
 
        /*
         * bind the values,
         * "ssss" means 4 string were being binded,
         * aside from s for string, you can also use:
         * i for integer
         * d for decimal
         * b for blob
         */
        $stmt->bind_param(
            "ssss",
            $_POST['id_config'],
            $_POST['username'],
            $_POST['password'],
            $_POST['droit']
        );
 
        // execute the insert query
        if($stmt->execute()){
            echo "User was saved.";
            $stmt->close();
        }else{
            die("Unable to save.");
        }
 
    }else{
        die("Unable to prepare statement.");
    }
    
    header('Location: index.php');

    
 
    // close the database
    $mysqli->close();
}
 
?>
 
