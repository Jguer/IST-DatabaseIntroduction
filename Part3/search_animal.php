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
  <?php include 'navbar1.php';?>

  <div>
    <h2>Search results</h2>
    <?php
    $owner_name = (empty($_REQUEST['owner_name']) ? '' : $_REQUEST['owner_name']);
    $client_vat = (empty($_REQUEST['client_vat']) ? '' : $_REQUEST['client_vat']);
    $animal_name = (empty($_REQUEST['animal_name']) ? '' : $_REQUEST['animal_name']);
    $connection = require_once('db.php');

    # animal query result
    $sql = "SELECT animal.name as animal_name, animal.vat as vat, owner.name as owner_name
            FROM animal, person as owner
            where animal.name = :animal_name and animal.vat = owner.vat and owner.name like :owner_name";
    $result_animal = $connection->prepare($sql);
    $result_animal->bindParam(':animal_name', $animal_name);
    $owner_name_like = "%".$owner_name."%";
    $result_animal->bindParam(':owner_name', $owner_name_like);
    if ($result_animal == FALSE)
    {
      $info = $connection->errorInfo();
      echo("<p>Error: {$info[2]}</p>");
      exit();
    }
    $result_animal->execute();

    # client query result
    $sql = "SELECT *
            FROM client
            where client.vat = :client_vat";
    $result_client = $connection->prepare($sql);
    $result_client->bindParam(':client_vat', $client_vat);
    if ($result_client == FALSE)
    {
      $info = $connection->errorInfo();
      echo("<p>Error: {$info[2]}</p>");
      exit();
    }
    $result_client->execute();

    if($result_animal->rowCount() > 0) {
      echo("<p>Click on animal name to see and/or insert consults.</p>");
      echo("<table border=\"1\">");
      echo("<tr><td>Animal Name</td><td>Owner Name</td><td>Owner VAT</td><td>Client involved in previous consults</td></tr>");
      foreach($result_animal as $row)
      {
        echo("<tr><td>");
        echo("<a href=\"consults.php?animal_name=");
        echo($row['animal_name']);
        echo("&animal_vat=");
        echo($row['vat']);
        echo("&client_vat=");
        echo($client_vat);
        echo("\">");
        echo($row['animal_name']);
        echo("</a></td>\n");
        echo("</td><td>");
        echo($row['owner_name']);
        echo("</td><td>");
        echo($row['vat']);
        echo("</td><td>");
        if ($result_client->rowCount() == 0){
          echo("No such client in database");
        }
        else{
          $animal_name = $row['animal_name'];
          $animal_vat = $row['vat'];
          $sql = "SELECT distinct consult.date_timestamp
                  FROM consult
                  where consult.name = :animal_name and consult.vat_owner = :animal_vat
                  and consult.vat_client = :client_vat";
          $result_client = $connection->prepare($sql);
          $result_client->bindParam(':animal_name', $animal_name);
          $result_client->bindParam(':animal_vat', $animal_vat);
          $result_client->bindParam(':client_vat', $client_vat);
          if ($result_client == FALSE)
          {
            $info = $connection->errorInfo();
            echo("<p>Error: {$info[2]}</p>");
            exit();
          }
          $result_client->execute();
          $client_status = $result_client->rowCount();
          echo($client_status);
          echo(" times");
        }
        echo("</td></tr>");

        /*echo("<a href=\"consults.php?animal_name=");
        echo($row['animal_name']);
        echo("&animal_vat=");
        echo($row['vat']);
        echo("&client_vat=");
        echo($client_vat);
        echo("\">Insert Consult</a></td>\n");
        echo("</td></tr>\n");*/
      }
      echo("</table>");
    }
    else {
        echo("<p>No animal matching the search was found</p>");
        echo("<a href=\"new_animal.php?animal_name=");
        echo($animal_name);
        echo("&animal_vat=");
        echo($client_vat);
        echo("&owner_name=");
        echo($owner_name);
        echo("\">Insert Animal</a></td>\n");
    }
    $connection = NULL;
    ?>
  </div>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</body>

</html>
