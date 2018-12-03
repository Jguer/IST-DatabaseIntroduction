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
                    <li><a href="consult.html">2 - Consults</a></li>
                    <li class="active"><a href="registry.html">3 - Registry</a></li>
                </ul>
            </div>
        </nav>
        
        <div>
            <h2>Insert the results of the test</h2>
            <form action="new_test.php" method="post">
                <p>Animal Name: <input type="text" name="animal_name" value="<?=$_REQUEST['animal_name']?>" readonly/></p>
                <p>Animal VAT: <input type="text" name="animal_vat" value="<?=$_REQUEST['animal_vat']?>" readonly/></p>
                <p>Date: <input type="text" name="date_timestamp" value="<?=$_REQUEST['date_timestamp']?>" readonly/></p>
                <p>Assistant VAT: <input type="text" name="assist_vat"></p>
                <p>White blood cell count: <input type="text" name="white_cells"></p>
                <p>Number of neutrophils: <input type="text" name="neutrophils"></p>
                <p>Number of lymphocytes: <input type="text" name="lymphocytes"></p>
                <p>Number of monocytes: <input type="text" name="monocytes"></p>
                <p><input type="submit" value="Submit"></p>
            </form>
        </div>
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </body>
    
</html>
