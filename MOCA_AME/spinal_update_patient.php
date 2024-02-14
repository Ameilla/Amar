<?php
$response = array(); // Initialize a response array

if(isset($_GET['id'])) {
    $id = $_GET['id'];
    $response["id"] = $id;

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        
        $name = $_POST["name"];
        $age = $_POST["age"];
        $gender = $_POST["gender"];
        $Diagnosis = $_POST["Diagnosis"];
        // Establish a connection to the database
        $conn = new mysqli("localhost", "root", "", "spinalcord");
        if ($conn->connect_error) {
            $response["status"] = "error";
            $response["message"] = "Connection failed: " . $conn->connect_error;
        } else {
            $sql = "SELECT * FROM patient_details WHERE id = $id";
            $result = $conn->query($sql);

            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    // Use existing details for fields not provided in the form
                    if (empty($name)) {
                        $name = $row["Name"];
                    }
                    if (empty($age)) {
                        $age = $row["Age"];
                    }
                    if (empty($gender)) {
                        $gender = $row["Gender"];
                    }
                    if (empty($Diagnosis)) {
                        $Diagnosis = $row["Diagnosis"];
                    }
                }
            }

            // Update query
            $sql = "UPDATE patient_details SET 
            Name = '$name', 
            Age = '$age', 
            Gender = '$gender',  
            Diagnosis = '$Diagnosis' WHERE id = $id";
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
} else {
    $response["status"] = "error";
    $response["message"] = "Invalid request: ID not provided";
}

// Encode the response array to JSON and echo it
echo json_encode($response);
?>
