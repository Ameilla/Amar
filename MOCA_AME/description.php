<?php
$response = array(); // Initialize a response array

if (isset($_GET['id'])) {
    $id = $_GET['id'];

    // Now $id contains the value passed from the previous page

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $Discription = $_POST["Discription"];

        $conn = new mysqli("localhost", "root", "", "moca");

        if ($conn->connect_error) {
            $response["status"] = "error";
            $response["message"] = "Connection failed: " . $conn->connect_error;
        } else {
            // Check if the record with the specified ID exists
            $checkSql = "SELECT * FROM p_details WHERE id = $id ";
            $checkResult = $conn->query($checkSql);

            if ($checkResult->num_rows > 0) {
                // Record with the specified ID exists, proceed with the update
                $updateSql = "UPDATE p_details SET Discription = '$Discription' WHERE id = $id";

                if ($conn->query($updateSql) === TRUE) {
                    $response["status"] = "success";
                    $response["message"] = "Record updated successfully";
                } else {
                    $response["status"] = "error";
                    $response["message"] = "Error updating record: " . $conn->error;
                }
            } else {
                $response["status"] = "error";
                $response["message"] = "Record with ID $id does not exist";
            }

            $conn->close();
        }
    }
} else {
    $response["status"] = "error";
    $response["message"] = "ID not provided";
}

// Return the response as JSON
echo json_encode($response);
?>
