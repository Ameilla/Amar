



<?php
$response = array(); // Initialize a response array

if(isset($_GET['id'])) {
    $id = $_GET['id'];
    // Now $id contains the value passed from the previous page
    $response["id"] = $id;

    $conn = new mysqli("localhost", "root", "", "spinalcord");

    // Check connection
    if ($conn->connect_error) {
        $response["status"] = "error";
        $response["message"] = "Connection failed: " . $conn->connect_error;
    } else {
        $sql = "DELETE FROM patient_details WHERE id = $id";

        if ($conn->query($sql) === TRUE) {
            $response["status"] = "success";
            $response["message"] = "Record with ID $id deleted successfully";
        } else {
            $response["status"] = "error";
            $response["message"] = "Error: " . $conn->error;
        }

        $conn->close();
    }
} else {
    $response["status"] = "error";
    $response["message"] = "ID parameter is missing or invalid";
}

// Encode the response array to JSON and echo it
echo json_encode($response);
?>
