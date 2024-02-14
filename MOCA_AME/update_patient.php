<?php
$response = array(); // Initialize a response array

if(isset($_GET['id'])) {
    $id = $_GET['id'];

    // Now $id contains the value passed from the previous page
    $response["id"] = $id;

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        // Retrieve form data
        $targetDirectory = "uploads/";

        function uploadImages($fieldName) {
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
        $imagePath1 = isset($_FILES["patient_img"]) ? uploadImages("patient_img") : null;

        // Upload Image 2
        $imagePath2 = isset($_FILES["mri_before"]) ? uploadImages("mri_before") : null;

        // Upload Image 3
        $imagePath3 = isset($_FILES["mri_after"]) ? uploadImages("mri_after") : null;

        $name = $_POST["name"];
        $age = $_POST["age"];
        $gender = $_POST["gender"];
        $ph_num = $_POST["ph_num"];
        $alt_ph_num = $_POST["alt_ph_num"];
        $Diagnosis = $_POST["Diagnosis"];
        $Drug = $_POST["Drug"];
        $hippo = $_POST["hippocampal"];

        // Establish a connection to the database
        $conn = new mysqli("localhost", "root", "", "moca");

        if ($conn->connect_error) {
            $response["status"] = "error";
            $response["message"] = "Connection failed: " . $conn->connect_error;
        } else {
            $sql = "SELECT * FROM p_details WHERE id = $id";
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
                    if (empty($ph_num)) {
                        $ph_num = $row["phone_no"];
                    }
                    if (empty($alt_ph_num)) {
                        $alt_ph_num = $row["alter_ph_no"];
                    }
                    if (empty($Diagnosis)) {
                        $Diagnosis = $row["Diagnosis"];
                    }
                    if (empty($Drug)) {
                        $Drug = $row["Drug"];
                    }
                    if (empty($hippo)) {
                        $hippo = $row["hippocampal"];
                    }
                }
            }

            // Update query
            $sql = "UPDATE p_details SET 
            Name = '$name', 
            Age = '$age', 
            Gender = '$gender', 
            phone_no = '$ph_num', 
            alter_ph_no = '$alt_ph_num', 
            Diagnosis = '$Diagnosis', 
            Drug = '$Drug', 
            hippocampal = '$hippo'";
    
    // Append Image 1 path to the query if available
    if (!empty($imagePath1[0])) {
        $sql .= ", patient_img = '" . $imagePath1[0] . "'";
    }
    
    // Append Image 2 path to the query if available
    if (!empty($imagePath2[0])) {
        $sql .= ", mri_before= '" . $imagePath2[0] . "'";
    }
    
    // Append Image 3 path to the query if available
    if (!empty($imagePath3[0])) {
        $sql .= ", mri_after= '" . $imagePath3[0] . "'";
    }
    
    // Complete the update query with WHERE clause
    $sql .= " WHERE id = $id";
    
    // // Execute the update query
    // $update = $conn->query($sql);
    
    // Execute the update query
    $update = $conn->query($sql);

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
} else {
    $response["status"] = "error";
    $response["message"] = "Invalid request: ID not provided";
}

// Encode the response array to JSON and echo it
echo json_encode($response);
?>
