<?php
$response = array(); // Initialize a response array
// Now $id contains the value passed from the previous page
$id = 1;
$response["id"] = $id;

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = $_POST["name"];
    $email = $_POST["email"];
    $password = $_POST["password"];
    $designation = $_POST["designation"];
    // Establish a connection to the database
    $conn = new mysqli("localhost", "root", "", "spinalcord");

    if ($conn->connect_error) {
        $response["status"] = "error";
        $response["message"] = "Connection failed: " . $conn->connect_error;
    } else {
        $sql = "SELECT * FROM doctor_details WHERE id = $id";
        $result = $conn->query($sql);
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                if (empty($name)) {
                    $name = $row["name"];
                }
                if (empty($email)) {
                    $email = $row["email"];
                }
                if (empty($password)) {
                    $password = $row["password"];
                }
                if (empty($designation)) {
                    $designation = $row["designation"];
                }
            }
        }

        // Update query
        $sql = "UPDATE doctor_details SET 
        name = '$name', 
        email = '$email', 
        password = '$password', 
        designation = '$designation' WHERE id = $id";
        $update = $conn->query($sql);
        if ($update) {
            $response["status"] = "success";
            $response["message"] = "Data updated successfully";
        } else {
            $response["status"] = "error";
            $response["message"] = "Error: " . $sql . "<br>" . $conn->error;
        }

        // Close the connection
        $conn->close();
    }
} else {
    $response["status"] = "error";
    $response["message"] = "Invalid request method";
}

// Encode the response array to JSON and echo it
header('Content-Type: application/json; charset=UTF-8');
echo json_encode($response);
?>
