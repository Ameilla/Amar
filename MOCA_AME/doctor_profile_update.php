<?php
$response = array(); // Initialize a response array

// Now $id contains the value passed from the previous page
$id = 0;
$response["id"] = $id;

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $targetDirectory = "uploads/";

    function uploadImages($fieldName)
    {
        global $targetDirectory;
        $result = [];
        // Check if the field name exists and if it's an array
        if (isset($_FILES[$fieldName]) && is_array($_FILES[$fieldName]["name"])) {
            foreach ($_FILES[$fieldName]["name"] as $key => $value) {
                $targetFile = $targetDirectory . basename($_FILES[$fieldName]["name"][$key]);
                if (move_uploaded_file($_FILES[$fieldName]["tmp_name"][$key], $targetFile)) {
                    $result[] = $targetFile;
                } else {
                    $result[] = null;
                }
            }
        } elseif (isset($_FILES[$fieldName])) {
            // If there's only one file, treat it as an array
            $targetFile = $targetDirectory . basename($_FILES[$fieldName]["name"]);
            if (move_uploaded_file($_FILES[$fieldName]["tmp_name"], $targetFile)) {
                $result[] = $targetFile;
            } else {
                $result[] = null;
            }
        }
        return $result;
    }

    // Upload Image 1
    $imagePath1 = isset($_FILES["doctor_img"]) ? uploadImages("doctor_img") : null;

    $name = $_POST["name"];
    $email = $_POST["email"];
    $password = $_POST["password"];
    $designation = $_POST["designation"];

    // Establish a connection to the database
    $conn = new mysqli("localhost", "root", "", "moca");

    if ($conn->connect_error) {
        $response["status"] = "error";
        $response["message"] = "Connection failed: " . $conn->connect_error;
    } else {
        $sql = "SELECT * FROM doctor_page WHERE doctor_id = $id";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                // Use existing details for fields not provided in the form
                if (empty($name)) {
                    $name = $row["doctor_name"];
                }
                if (empty($email)) {
                    $email = $row["doctor_email"];
                }
                if (empty($password)) {
                    $password = $row["doctor_password"];
                }
                if (empty($designation)) {
                    $designation = $row["doctor_designation"];
                }
            }
        }

        // Update query
        $sql = "UPDATE doctor_page SET 
        doctor_name = '$name', 
        doctor_email = '$email', 
        doctor_password = '$password', 
        doctor_designation = '$designation'";

        // Append Image 1 path to the query if available
        if (!empty($imagePath1[0])) {
            $sql .= ", doctor_img = '" . $imagePath1[0] . "'";
        }

        // Complete the update query with WHERE clause
        $sql .= " WHERE doctor_id = $id";

        // Execute the update query
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
