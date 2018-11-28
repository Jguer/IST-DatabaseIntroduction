<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Vet Management System</title>
  <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  <!-- Optional theme -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

</head>

<body>
  <nav class="navbar navbar-default">
    <div class="container-fluid">
      <div class="navbar-header">
        <a class="navbar-brand" href="#">Vet Management Systems</a>
      </div>
      <ul class="nav navbar-nav">
        <li><a href="index.html">Home</a></li>
        <li class="active"><a href="search.html">1 - Search and Insertion</a></li>
        <li><a href="consult.html">2 - Consults</a></li>
        <li><a href="registry.html">3 - Registry</a></li>
      </ul>
    </div>
  </nav>

  <div>
    <h2>Animal Insertion</h2>
    <?php
    $animal_vat = (empty($_REQUEST['new_client_vat']) ? '' : $_REQUEST['new_client_vat']);
    $animal_name = (empty($_REQUEST['new_animal_name']) ? '' : $_REQUEST['new_animal_name']);
    $animal_colour = (empty($_REQUEST['new_animal_colour']) ? '' : $_REQUEST['new_animal_colour']);
    $animal_gender = (empty($_REQUEST['new_animal_gender']) ? '' : $_REQUEST['new_animal_gender']);
    $animal_birth_year = (empty($_REQUEST['new_animal_birth_year']) ? '' : $_REQUEST['new_animal_birth_year']);
    $animal_species = (empty($_REQUEST['new_animal_species']) ? '' : $_REQUEST['new_animal_species']);
    $animal_age = date("Y") - $animal_birth_year;
    $owner_name = (empty($_REQUEST['new_client_name']) ? '' : $_REQUEST['new_client_name']);

    $host = "db.tecnico.ulisboa.pt";
    $user = "***REMOVED***";
    $pass = "***REMOVED***";
    $dsn = "mysql:host=$host;dbname=$user";
    try
    {
      $connection = new PDO($dsn, $user, $pass);
    }
    catch(PDOException $exception)
    {
      echo("<p>Error: ");
      echo($exception->getMessage());
      echo("</p>");
      exit();
    }
    $sql = "SELECT * 
            FROM client 
            where client.vat = :animal_vat";
    $result_client = $connection->prepare($sql);
    if ($result_client == FALSE)
    {
      $info = $connection->errorInfo();
      echo("<p>Error: {$info[2]}</p>");
      exit();
    }
    $result_client->bindParam(':animal_vat', $animal_vat);
    $result_client->execute();
    if ($result_client->rowCount() == 0){
          $sql = "SELECT * 
            FROM person 
            where person.vat = :animal_vat";
            $result_person = $connection->prepare($sql);
            if ($result_person == FALSE)
            {
              $info = $connection->errorInfo();
              echo("<p>Error: {$info[2]}</p>");
              exit();
            }
            $result_person->bindParam(':animal_vat', $animal_vat);
            $result_person->execute();
            if ($result_person->rowCount() == 0){
                $sql = "INSERT INTO person VALUES (:animal_vat, :owner_name, '','','')";
                $sth = $connection->prepare($sql);
                $sth->bindParam(':animal_vat', $animal_vat);
                $sth->bindParam(':owner_name', $owner_name);
                $sth->execute();
                if($sth->rowCount()>0){
                  echo("<p>Person sucessfully inserted.</p>");
                }
            }
            $sql = "INSERT INTO client VALUES (:animal_vat)";
            $sth = $connection->prepare($sql);
            $sth->bindParam(':animal_vat', $animal_vat);
            $sth->execute();
            if($sth->rowCount()>0){
                  echo("<p>Client sucessfully inserted.</p>");
            }
        }
    $sql = "INSERT INTO animal VALUES (:animal_name, :animal_vat, :animal_species, 
                                      :animal_colour, :animal_gender, :animal_birth_year, :animal_age)";
    $sth = $connection->prepare($sql);
    $sth->bindParam(':animal_name', $animal_name);
    $sth->bindParam(':animal_vat', $animal_vat);
    $sth->bindParam(':animal_species', $animal_species);
    $sth->bindParam(':animal_colour', $animal_colour);
    $sth->bindParam(':animal_gender', $animal_gender);
    $sth->bindParam(':animal_birth_year', $animal_birth_year);
    $sth->bindParam(':animal_age', $animal_age);
    $sth->execute();
    if($sth->rowCount()>0){
      echo("<p>Animal sucessfully inserted.</p>");
    }
    $connection = null;

    ?>





  </div>


  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</body>

</html>