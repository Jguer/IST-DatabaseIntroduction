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
  <?php include 'navbar3.php';?>

  <div>
    <h2>Consult Insertion</h2>
    <?php
    $animal_name = (empty($_REQUEST['animal_name']) ? '' : $_REQUEST['animal_name']);
    $animal_vat = (empty($_REQUEST['animal_vat']) ? '' : $_REQUEST['animal_vat']);
    $client_vat = (empty($_REQUEST['client_vat']) ? '' : $_REQUEST['client_vat']);
    $s = (empty($_REQUEST['s']) ? '' : $_REQUEST['s']);
    $o = (empty($_REQUEST['o']) ? '' : $_REQUEST['o']);
    $a = (empty($_REQUEST['a']) ? '' : $_REQUEST['a']);
    $p = (empty($_REQUEST['p']) ? '' : $_REQUEST['p']);
    $weight = (empty($_REQUEST['weight']) ? '' : $_REQUEST['weight']);
    $code = (empty($_REQUEST['diagnostic_code']) ? '' : $_REQUEST['diagnostic_code']);
    $data = date("Y-m-d H:i:s");
    $veterinary_vat = (empty($_REQUEST['veterinary_vat']) ? '' : $_REQUEST['veterinary_vat']);
    $go = 0;

    $connection = require_once('db.php');
    # INSERT CONSULT
    $sql = "INSERT INTO consult VALUES (:animal_name, :animal_vat, :date_timestamp,
                                      :s, :o, :a, :p, :client_vat, :veterinary_vat, :weight)";
    $sth = $connection->prepare($sql);
    $sth->bindParam(':animal_name', $animal_name);
    $sth->bindParam(':animal_vat', $animal_vat);
    $sth->bindParam(':date_timestamp', $data);
    $sth->bindParam(':s', $s);
    $sth->bindParam(':o', $o);
    $sth->bindParam(':a', $a);
    $sth->bindParam(':p', $p);
    $sth->bindParam(':client_vat', $client_vat);
    $sth->bindParam(':veterinary_vat', $veterinary_vat);
    $sth->bindParam(':weight', $weight);
    $sth->execute();
    if($sth->rowCount()>0){
      echo("<p>Consult sucessfully inserted.</p>");
    }
    else{
      echo("<p>Error during consult insertion.</p>"); 
    }


    $sql = "INSERT INTO consult_diagnosis
            VALUES (:code, :animal_name, :animal_vat, :date_timestamp)";
    $sth = $connection->prepare($sql);
    $sth->bindParam(':animal_name', $animal_name);
    $sth->bindParam(':animal_vat', $animal_vat);
    $sth->bindParam(':date_timestamp', $data);
    $sth->bindParam(':code', $code);
    $sth->execute();
    if($sth->rowCount()>0){
      echo("<p>Diagnosis sucessfully inserted.</p>");
      $go = 1;
    }
    else{
      echo("<p>Error during diagnosis insertion.</p>"); 
      $go = 0;
    }

      if($go == 1){
        echo("<br>");
        echo("<a href=\"registry.php?animal_name=");
        echo($animal_name);
        echo("&animal_vat=");
        echo($animal_vat);
        echo("&date_timestamp=");
        echo($data);
        echo("\">Insert New Blood Test</a>");
      }

    $connection = null;

    ?>
  </div>
  <?php include 'back.php';?>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</body>

</html>
