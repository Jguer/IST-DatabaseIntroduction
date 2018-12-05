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
  <?php include 'navbar2.php';?>

  <div>
    <h2>Veterinary Consults</h2>
    <?php
    $animal_vat = (empty($_REQUEST['animal_vat']) ? '' : $_REQUEST['animal_vat']);
    $date_timestamp = (empty($_REQUEST['date_timestamp']) ? '' : $_REQUEST['date_timestamp']);
    $animal_name = (empty($_REQUEST['animal_name']) ? '' : $_REQUEST['animal_name']);
    $connection = require_once('db.php');

    # Consult Data
    $sql = "SELECT animal.gender as gender,
                   animal.age as age,
                   consult.weight as weight,
                   consult.s as S,
                   consult.o as O,
                   consult.a as A,
                   consult.p as P
            FROM consult, animal
            where animal.name = :animal_name and animal.vat = :animal_vat and consult.name = :animal_name and consult.vat_owner = :animal_vat and consult.date_timestamp = :date_timestamp";
    $result_consult = $connection->prepare($sql);
    $result_consult->bindParam(':animal_name', $animal_name);
    $result_consult->bindParam(':animal_vat', $animal_vat);
    $result_consult->bindParam(':date_timestamp', $date_timestamp);
    if ($result_consult == FALSE)
    {
      $info = $connection->errorInfo();
      echo("<p>Error: {$info[2]}</p>");
      exit();
    }
    $result_consult->execute();
    echo("<p>Consult Data:</p>");
    echo("<table border=\"1\">");
      echo("<tr><td>Gender</td><td>Age</td><td>Weight</td><td>S</td><td>O</td><td>A</td><td>P</tr>");
      foreach($result_consult as $row)
      {
        echo("<tr><td>");
        echo($row['gender']);
        echo("</td><td>");
        echo($row['age']);
        echo("</td><td>");
        echo($row['weight']);
        echo("</td><td>");
        echo($row['S']);
        echo("</td><td>");
        echo($row['O']);
        echo("</td><td>");
        echo($row['A']);
        echo("</td><td>");
        echo($row['P']);
        echo("</td><td>");
        echo("</td></tr>\n");
      }
      echo("</table>");

      # Diagnosis
      $sql = "SELECT diagnosis_code.code as code,
                     diagnosis_code.name as disease
              FROM consult_diagnosis, diagnosis_code
              where consult_diagnosis.name = :animal_name and consult_diagnosis.vat_owner = :animal_vat
              and consult_diagnosis.date_timestamp = :date_timestamp and consult_diagnosis.code = diagnosis_code.code";
      $result_consult = $connection->prepare($sql);
      $result_consult->bindParam(':animal_name', $animal_name);
      $result_consult->bindParam(':animal_vat', $animal_vat);
      $result_consult->bindParam(':date_timestamp', $date_timestamp);
      if ($result_consult == FALSE)
      {
        $info = $connection->errorInfo();
        echo("<p>Error: {$info[2]}</p>");
        exit();
      }
      $result_consult->execute();
      if($result_consult->rowCount()>0){
        echo("<p>Consult Diagnosis:</p>");
        echo("<table border=\"1\">");
        echo("<tr><td>Code</td><td>Description</tr>");
        foreach($result_consult as $row)
        {
          echo("<tr><td>");
          echo($row['code']);
          echo("</td><td>");
          echo($row['disease']);
          echo("</td></tr>\n");
        }
        echo("</table>");
      }
      else{
        echo("<p>No diagnosis.</p>");
      }

      # Prescriptions
      $sql = "SELECT prescription.name_med as med_name,
                     prescription.lab as med_lab,
                     prescription.dosage as med_dosage,
                     prescription.regime as med_regime
              FROM prescription
              where prescription.name = :animal_name and prescription.vat_owner = :animal_vat
              and prescription.date_timestamp = :date_timestamp";
      $result_consult = $connection->prepare($sql);
      $result_consult->bindParam(':animal_name', $animal_name);
      $result_consult->bindParam(':animal_vat', $animal_vat);
      $result_consult->bindParam(':date_timestamp', $date_timestamp);
      if ($result_consult == FALSE)
      {
        $info = $connection->errorInfo();
        echo("<p>Error: {$info[2]}</p>");
        exit();
      }
      $result_consult->execute();
      if($result_consult->rowCount()>0){
        echo("<p>Consult Prescription:</p>");
        echo("<table border=\"1\">");
        echo("<tr><td>Medication Name</td><td>Lab</td><td>Dosage</td><td>Regime</tr>");
        foreach($result_consult as $row)
        {
          echo("<tr><td>");
          echo($row['med_name']);
          echo("</td><td>");
          echo($row['med_lab']);
          echo("</td><td>");
          echo($row['med_dosage']);
          echo("</td><td>");
          echo($row['med_regime']);
          echo("</td></tr>\n");
        }
        echo("</table>");
      }
      else{
        echo("<p>No prescriptions.</p>");
      }
    $connection = NULL;
    ?>
  </div>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</body>

</html>
