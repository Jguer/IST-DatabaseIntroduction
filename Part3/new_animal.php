<!DOCTYPE html>
<html>
    <body>
        <form action="insert_animal.php" method="post">
            <table>
                <p><input type="hidden" name="new_animal_name" value="<?=$_REQUEST['animal_name']?>"/></p>
                <p><input type="hidden" name="new_client_vat" value="<?=$_REQUEST['animal_vat']?>"/></p>
                <p><input type="hidden" name="new_client_name" value="<?=$_REQUEST['owner_name']?>"/></p>
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
                            <option value="male">Female</option>
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
    </body>
</html>
