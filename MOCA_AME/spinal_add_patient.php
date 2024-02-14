<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Connect to the database
    $conn = new mysqli("localhost", "root", "", "spinalcord");
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    // Insert patient information and image paths into the database
    $name = $_POST["name"];
    $age = $_POST["age"];
    $gender = $_POST["gender"];
    $diagnosis= $_POST["diagnosis"];
    $sql = "INSERT INTO patient_details (Name, Age, Gender, Diagnosis) 
    VALUES ('$name', '$age', '$gender', '$diagnosis')";
    $response = array();
    if ($conn->query($sql) === TRUE) {
        $response["status"] = "success";
        $response["message"] = "Patient information and images uploaded successfully.";
    } else {
        $response["status"] = "error";
        $response["message"] = "Error: " . $sql . "<br>" . $conn->error;
    }
    $conn->close();
    echo json_encode($response);
} else {
    echo json_encode(array("status" => "error", "message" => "Invalid request."));
}
?>
