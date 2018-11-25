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
    <h2>Search results</h2>
    <?php
    $owner_name = (empty($_REQUEST['owner_name']) ? '' : $_REQUEST['owner_name']);
    $owner_vat = (empty($_REQUEST['owner_vat']) ? '' : $_REQUEST['owner_vat']);
    $animal_name = (empty($_REQUEST['animal_name']) ? '' : $_REQUEST['animal_name']);
    $connection = require_once('db.php');
    $stmt = $connection->prepare("SELECT number, name FROM person WHERE name LIKE :owner_name");
    echo("<h4>Results for: $animal_name belonging to $owner_name </h4>");
    $owner_name = '%'.$owner_name.'%';
    $stmt->bindParam(':owner_name', $owner_name);
    if ( !$stmt->execute() ) {
        echo("<p>An error occurred!</p>");
        exit();
    }
    if ($stmt->rowCount() > 0 ) {
        echo("<table border=1 cellpadding='5'>");
        echo("<thead><tr><th>Animal</th><th>Owner VAT</th><th>Animal</th></tr></thead>");
        foreach($stmt as $animal) {
          echo("<tr><td><a href='consult_info.php?vat=".$animal['vat']."&name=".$animal['name']."'>".$animal['name']."</a></td>");
          echo("<td>.$animal['vat'].</td>");
          echo("</tr>");
        }
        echo("</table>");
    } else {
        echo("<p>No animal matching the search was found</p>");
        include('new_animal.php');
    }
    $connection = NULL;
    ?>
  </div>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</body>

</html>
