<!DOCTYPE html>
<html>
    <body>
        <form action="insert_animal.php" method="post">
            <table>
                <tr>
                    <td align='right'>Name:</td>
                    <td><input type="text" name="new_animal_name"></td>
                </tr>
                <tr>
                    <td align='right'>Colour:</td>
                    <td><input type="text" name="new_animal_colour"></td>
                </tr>
                <tr>
                    <td align='right'>Gender:</td>
                    <td><input type="date" name="new_animal_gender"></td>
                </tr>
                <tr>
                    <td align='right'>Birth year:</td>
                    <td><input type="text" name="new_animal_birth_year"></td>
                </tr>
                <tr>
                    <td align='right'>Species:</td>
                    <td><input type="text" name="new_animal_species"></td>
                </tr>
                <tr>
                    <td align='right'>Owner Vat:</td>
                    <?php
                    echo("<td><input type="text" value="$owner_vat" name="new_animal_vat"></td>")
                    ?>
                </tr>
            </table>
            <p><input type="submit" value="Submit"></p>
        </form>
    </body>
</html>
