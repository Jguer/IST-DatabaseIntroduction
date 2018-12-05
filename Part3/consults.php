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
        <li><a href="search.html">1 - Search and Insertion</a></li>
        <li class="active"><a>2 - Consults</a></li>
        <li><a>3 - Registry</a></li>
      </ul>
    </div>
  </nav>


  <div>
    <h2>Veterinary Consults</h2>
    <?php
    $animal_vat = (empty($_REQUEST['animal_vat']) ? '' : $_REQUEST['animal_vat']);
    $client_vat = (empty($_REQUEST['client_vat']) ? '' : $_REQUEST['client_vat']);
    $animal_name = (empty($_REQUEST['animal_name']) ? '' : $_REQUEST['animal_name']);
    $connection = require_once('db.php');

    $sql = "SELECT consult.date_timestamp as date_timestamp
            FROM consult
            where name = :animal_name and vat_owner = :animal_vat";
    $result_consult = $connection->prepare($sql);
    $result_consult->bindParam(':animal_name', $animal_name);
    $result_consult->bindParam(':animal_vat', $animal_vat);
    if ($result_consult == FALSE)
    {
      $info = $connection->errorInfo();
      echo("<p>Error: {$info[2]}</p>");
      exit();
    }
    $result_consult->execute();
    echo("<p> Consult list</p>");
    echo("<table border=\"1\" cellspacing=\"5\">\n");
    foreach($result_consult as $row)
      {
        echo("<tr>\n");
        echo("<td><a href=\"consult_data.php?animal_name=");
        echo($animal_name);
        echo("&animal_vat=");
        echo($animal_vat);
        echo("&date_timestamp=");
        echo($row['date_timestamp']);
        echo("\">");
        echo($row['date_timestamp']);
        echo("</a></td>");
        echo("<td><a href=\"registry.php?animal_name=");
        echo($animal_name);
        echo("&animal_vat=");
        echo($animal_vat);
        echo("&date_timestamp=");
        echo($row['date_timestamp']);
        echo("\">Insert New Blood Test</a></td>\n");
        echo("</tr>\n");
      }
      echo("</table>\n");

      echo("<br>");
      echo("<a href=\"new_consult.php?animal_name=");
      echo($animal_name);
      echo("&animal_vat=");
      echo($animal_vat);
      echo("&client_vat=");
      echo($client_vat);
      echo("\">Insert New Consult</a>");
    $connection = NULL;
    ?>
  </div>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</body>

</html>
