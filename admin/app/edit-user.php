<!DOCTYPE HTML>
<html>
    <head>
        <title>MySQLi Create Record</title>
    </head>
<body>
 
<h1>MySQLi: Update a Record</h1>
 
<?php
//include database connection
include 'db_connect.php';
 
// if the form was submitted/posted, update the record
if($_POST){
 
    //write query
    $sql = "UPDATE
                user
            SET
                id_config = ?,
                username = ?,
                password = ?,
                droit  = ?
            WHERE
                id= ?";
     
    $stmt = $mysqli->prepare($sql);
     
    // you can bind params this way,
    // if you want to see the other way, see our add.php
    $stmt->bind_param(
        'ssssi',
        $_POST['id_config'],
        $_POST['username'],
        $_POST['password'],
        $_POST['droit'],
        $_POST['id']
    );
     
    // execute the update statement
    if($stmt->execute()){
        echo "User was updated.";
         
        // close the prepared statement
        $stmt->close();
    }else{
        die("Unable to update.");
    }
}
 
/*
 * select the record to be edited,
 * you can also use prepared statement here,
 * but my hosting provider seems it does not support the mysqli get_result() function
 * you can use it like this one http://php.net/manual/fr/mysqli.prepare.php#107568
  
 * so it I'm going to use $mysqli->real_escape_string() this time.
 */
 
$sql = "SELECT
            id, id_config, username, password, droit
        FROM
            user
        WHERE
            id = \"" . $mysqli->real_escape_string($_GET['id']) . "\"
        LIMIT
            0,1";
 
// execute the sql query
$result = $mysqli->query( $sql );
 
//get the result
$row = $result->fetch_assoc();
 
// php's extract() makes $row['firstname'] to $firstname automatically
extract($row);
 
//disconnect from database
$result->free();
$mysqli->close();
?>
 
<!--we have our html form here where new user information will be entered-->
<form action='edit-user.php?id=<?php echo $id; ?>' method='post' border='0'>
    <table>
        <tr>
            <td>ID config</td>
            <td><input type='text' name='id_config' value='<?php echo $id_config;  ?>' /></td>
        </tr>
        <tr>
            <td>Username</td>
            <td><input type='text' name='username' value='<?php echo $username;  ?>' /></td>
        </tr>
        <tr>
            <td>Password</td>
            <td><input type='password' name='password'  value='<?php echo $password;  ?>' /></td>
        </tr>
        <tr>
            <td>Droits</td>
            <td><input type='text' name='droit'  value='<?php echo $droit;  ?>' /></td>
        <tr>
            <td></td>
            <td>
                <!-- so that we could identify what record is to be updated -->
                <input type='hidden' name='id' value='<?php echo $id ?>' />
                <input type='submit' value='Edit' />
                <a href='index.php'>Back to index</a>
            </td>
        </tr>
    </table>
</form>
 
</body>
</html>