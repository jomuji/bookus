<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="shortcut icon" href="">
        <title>MySQLi: Read Records - code from codeofaninja.com</title>

        <!-- Bootstrap core CSS -->
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <style>body{padding-top:50px;}.starter-template{padding:40px 15px;text-align:center;}</style>

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.2/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>

    <body ng-app>
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">Project name</a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#">Home</a></li>
                        <li><a href="#about">About</a></li>
                        <li><a href="#contact">Contact</a></li>
                    </ul>
                </div><!--/.nav-collapse -->
            </div>
        </nav>
        <div class="container">
            <div class="starter-template">
                <h1>Hello, world!</h1>
                <p class="lead">Now you can start your own project with Bootstrap 3.2.0. This plugin is a fork from <a href="https://github.com/le717/brackets-html-skeleton">HTML Skeleton</a>.</p>
            </div>
            
            
            
            <div>
                <h1>MySQLi: Read Records</h1><br><br>
 
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

?>                    
                     <!--we have our html form here where user information will be entered-->
                    <form action='add-user.php' method='post' class="form-inline" role="form">
                        <fieldset>
                        <legend>Ajouter un usager</legend>
                        
                        
                        <input type='hidden' name='id_config' class="form-control" placeholder="enter id config" />
                       
                        
                        <div class="form-group">
                        <input type='text' name='username' class="form-control" placeholder="enter username" />
                        </div>
                        
                        <div class="form-group">
                        <input type='password' name='password' class="form-control" placeholder="enter password" />
                        </div>
                        
                        <div class="form-group">
                        <select class="form-control" name="droit">
                          <option value="1">Accés Rendez-vous</option>
                          <option value="2">Accès Configuration</option>
                          <option value="3">Accès Complet</option>
                          <option value="4">Accès Administratif</option>
                        </select>
                        </div>
                        
                        <button type='submit' value='Save' class="btn btn-success" ><span class="glyphicon glyphicon-plus-sign"></span> Ajouter</button>
                        
                       
                        </fieldset>
                    </form><br><br>

<?php
                    $query = "select * from user";
                    $result = $mysqli->query( $query );

                    $num_results = $result->num_rows;

                    echo "<div><a href='add-user.php'>Create New Record</a></div>";

                    if( $num_results ){

                        // html table
                        echo "<table class='table table-striped'>";

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
                                    echo "<a href='edit-user.php?id={$id}' ng-model='mustShow' class='btn btn-primary btn-lg disabled' role='button' >Edit</a>";
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


                    
            </div>
            
            <br><br>
            
            
        </div>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <!-- compiled and minified Bootstrap JavaScript -->
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <scrip src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.21/angular.min.js"></scrip>
    </body>
</html>




