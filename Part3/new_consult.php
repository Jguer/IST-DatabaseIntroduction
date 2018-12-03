<!DOCTYPE html>
<html>

<body>
  <form action="insert_consult.php" method="post">
    <table>
      <tr>
        <td align='right'>Animal Name:</td>
        <td>
          <p><input type="text" name="animal_name" value="<?=$_REQUEST['animal_name']?>" readonly /></p>
        </td>
      </tr>
      <tr>
        <td align='right'>Owner VAT:</td>
        <td>
          <p><input type="text" name="animal_vat" value="<?=$_REQUEST['animal_vat']?>" readonly /></p>
        </td>
      </tr>
      <tr>
        <td align='right'>Client VAT:</td>
        <td>
          <p><input type="text" name="client_vat" value="<?=$_REQUEST['client_vat']?>" readonly /></p>
        </td>
      </tr>
      <tr>
        <td align='right'>Subjective notes:</td>
        <td><input type="text" name="s"></td>
      </tr>
      <tr>
        <td align='right'>Objective notes:</td>
        <td><input type="text" name="o"></td>
      </tr>
      <tr>
        <td align='right'>Assessment notes:</td>
        <td><input type="text" name="a"></td>
      </tr>
      <tr>
        <td align='right'>Plan notes:</td>
        <td><input type="text" name="p"></td>
      </tr>
      <tr>
        <td align='right'>Animal weight:</td>
        <td><input type="text" name="weight"></td>
      </tr>
      <tr>
        <td align='right'>Veterinary Doctor:</td>
        <td>
          <select name="veterinary_vat">
            <?php
                            $connection = require_once('db.php');
                            $sql = "SELECT person.name as vname, veterinary.vat as vvat
                                    FROM veterinary, person
                                    WHERE person.vat = veterinary.vat";
                            $result = $connection->query($sql);
                            if ($result == FALSE)
                            {
                            $info = $connection->errorInfo();
                            echo("<p>Error: {$info[2]}</p>");
                            exit();
                            }
                            foreach($result as $row)
                            {
                                $vname = $row['vname'];
                                $vvat = $row['vvat'];
                                echo("<option value=\"$vvat\">$vname, $vvat</option>");
                            }

                             #$connection = null;
                        ?>
          </select>
        </td>
      </tr>
      <tr>
        <td align='right'>Diagnostic Code:</td>
        <td>
          <select name="diagnostic_code">
            <?php
                            #$connection = require_once('db.php');
                            $sql = "SELECT diagnosis_code.code as code, diagnosis_code.name as disease
                                    FROM diagnosis_code";
                            $result = $connection->query($sql);
                            if ($result == FALSE)
                            {
                            $info = $connection->errorInfo();
                            echo("<p>Error: {$info[2]}</p>");
                            exit();
                            }
                            foreach($result as $row)
                            {
                                $code = $row['code'];
                                $disease = $row['disease'];
                                echo("<option value=\"$code\">$code, $disease</option>");
                            }

                             $connection = null;
                        ?>
          </select>
        </td>
      </tr>
    </table>
    <p><input type="submit" value="Insert Consult"></p>
  </form>
</body>

</html>
