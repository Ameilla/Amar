<?php

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    
    $conn = new mysqli("localhost", "root", "", "spinalcord");

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    // $iD = $_POST["iD"];
    $iD = isset($_POST["iD"]) ? $_POST["iD"] : null;
    $result = isset($_POST["result"]) ? $_POST["result"] : null;
    $interpretation = isset($_POST["interpretation"]) ? $_POST["interpretation"] : null;

    $submissionDatetime = date('Y-m-d H:i:s');
    $insert_sql = "INSERT INTO results (id,submission_datetime,result,interpretation)
        VALUES ('$iD','$submissionDatetime','$result','$interpretation')";
    $response = array();

    if ($conn->query($insert_sql) === TRUE) {
        $response["status"] = "success";
        $response["message"] = "Data inserted successfully";
    } else {
        $response["status"] = "error";
        $response["message"] = "Error inserting tasks data: " . $conn->error;
    }

    $conn->close();

    // Encode the response array to JSON and echo it
    echo json_encode($response);
}
?>
