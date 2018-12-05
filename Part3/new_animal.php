<!DOCTYPE html>
<html>

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

  <form action="insert_animal.php" method="post">
    <table>
      <tr>
        <td align='right'>Animal Name:</td>
        <td>
          <p><input type="text" name="new_animal_name" value="<?=$_REQUEST['animal_name']?>" readonly /></p>
        </td>
      </tr>
      <tr>
        <td align='right'>Client VAT:</td>
        <td>
          <p><input type="text" name="new_client_vat" value="<?=$_REQUEST['animal_vat']?>" readonly /></p>
        </td>
      </tr>
      <tr>
        <td align='right'>Client Name (if new in database):</td>
        <td>
          <p><input type="text" name="new_client_name" value="<?=$_REQUEST['owner_name']?>" readonly /></p>
        </td>
      </tr>
      <!-- <tr>
                    <td align='right'>Name:</td>
                    <td><input type="text" name="new_animal_name"></td>
                </tr> -->
      <tr>
        <td align='right'>Colour:</td>
        <td><input type="text" name="new_animal_colour"></td>
      </tr>
      <tr>
        <td align='right'>Gender:</td>
        <td>
          <select name="new_animal_gender">
            <option value="male">Male</option>
            <option value="female">Female</option>
          </select>
        </td>
      </tr>
      <tr>
        <td align='right'>Birth year:</td>
        <td><input type="text" name="new_animal_birth_year"></td>
      </tr>
      <tr>
        <td align='right'>Species:</td>
        <td>
          <select name="new_animal_species">
            <?php
              $connection = require_once('db.php');
              $sql = "SELECT species.name FROM species";
              $result = $connection->query($sql);
              if ($result == FALSE)
              {
                $info = $connection->errorInfo();
                echo("<p>Error: {$info[2]}</p>");
                exit();
              }
              foreach($result as $row)
              {
                $species_name = $row['name'];
                echo("<option value=\"$species_name\">$species_name</option>");
              }

              $connection = null;
              ?>
          </select>
        </td>
      </tr>
      <!-- <tr>
                    <td align='right'>Owner Vat:</td>
                    <?php
                    #echo("<td><input type="text" value="$owner_vat" name="new_animal_vat"></td>")
                    ?>
                </tr> -->
    </table>
    <p><input type="submit" value="Insert Animal"></p>
  </form>
  <?php include 'back.php';?>

</body>

</html>
