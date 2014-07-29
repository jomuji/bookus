<!DOCTYPE HTML>
<html>
    <head>
        <title>MySQLi: Read Records - code from codeofaninja.com</title>
    </head>
<body>
 
<h1>MySQLi: Read Records</h1>
 
<?php
//include database connection
include 'db_connect.php';
 
$action = isset($_GET['action']) ? $_GET['action'] : "";
 
//if the user clicked ok, run our delete query
if($action=='deleted'){
    echo "User was deleted.";
}
 
 
// if the form was submitted
if($_POST){
 
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
 
    
}
 
 
 
 
$query = "select * from user";
$result = $mysqli->query( $query );
 
$num_results = $result->num_rows;
 
echo "<div><a href='add-user.php'>Create New Record</a></div>";
 
if( $num_results ){
 
    // html table
    echo "<table border='1'>";
 
        // table heading
        echo "<tr>";
            echo "<th>id config</th>";
            echo "<th>username</th>";
            echo "<th>droit</th>";
            echo "<th>action</th>";
        echo "</tr>";
 
    //loop to show each records
    while( $row = $result->fetch_assoc() ){
     
        //extract row
        //this will make $row['firstname'] to just $firstname only
        extract($row);
 
        //creating new table row per record
        echo "<tr>";
            echo "<td>{$id_config}</td>";
            echo "<td>{$username}</td>";
            echo "<td>{$droit}</td>";
            echo "<td>";
                echo "<a href='edit-user.php?id={$id}'>Edit</a>";
                echo " / ";
                 
                // delete_user is a javascript function, see at the bottom par of the page
                echo "<a href='#' onclick='delete_user( {$id} );'>Delete</a>";
            echo "</td>";
        echo "</tr>";
    }
 
    //end table
    echo "</table>";
 
}
 
//if table is empty
else{
    echo "No records found.";
}
 
//disconnect from database
$result->free();
$mysqli->close();
?>
 
<script type='text/javascript'>
function delete_user( id ){
 
    var answer = confirm('Are you sure?');
 
    //if user clicked ok
    if ( answer ){
        //redirect to url with action as delete and id to the record to be deleted
        window.location = 'delete.php?id=' + id;
    }
}
</script>
 
 <!--we have our html form here where user information will be entered-->
<form action='index.php' method='post' border='0'>
    <table>
        <tr>
            <td>id config</td>
            <td><input type='text' name='id_config' /></td>
        </tr>
        <tr>
            <td>Username</td>
            <td><input type='text' name='username' /></td>
        </tr>
        <tr>
            <td>password</td>
            <td><input type='password' name='password' /></td>
        </tr>
        <tr>
            <td>Droit</td>
            <td><input type='text' name='droit' /></td>
        <tr>
            <td></td>
            <td>
                <input type='submit' value='Save' />
                <a href='index.php'>Back to index</a>
            </td>
        </tr>
    </table>
</form>
 
</body>
</html>