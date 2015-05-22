<?php
class ModelCatalogUpload extends Model {
  public function
}



// found online http://coyotelab.org/php/upload-csv-and-insert-into-database-using-phpmysql.html

    if (isset($_POST['submit'])) {
    if (is_uploaded_file($_FILES['filename']['tmp_name'])) {
        echo "<h1>" . "File ". $_FILES['filename']['name'] ." uploaded successfully." . "</h1>";
        echo "<h2>Displaying contents:</h2>";
        readfile($_FILES['filename']['tmp_name']);
    }

    //Import uploaded file to Database
    $handle = fopen($_FILES['filename']['tmp_name'], "r");

    while (($data = fgetcsv($handle, 1000, ",")) !== FALSE) {
        $import="INSERT into tablename(month,accountid,accountname,keyword,clicks,impressions,avgposition,averagecpc,spend,ctr) values('$data[0]','$data[1]','$data[2]','$data[3]','$data[4]', '$data[5]','$data[6]','$data[7]','$data[8]','$data[9]')";

        mysql_query($import) or die(mysql_error());
    }

    fclose($handle);
