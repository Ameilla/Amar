<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $targetDirectory = "uploads/";

    // Function to upload image and return the paths
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



    // Connect to the database
    $conn = new mysqli("localhost", "root", "", "moca");
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    // Insert patient information and image paths into the database
    $name = $_POST["name"];
    $age = $_POST["age"];
    $gender = $_POST["gender"];
    $ph_num = $_POST["ph_num"];
    $alt_ph_num = $_POST["alt_ph_num"];
    $Diagnosis = $_POST["Diagnosis"];
    $Drug = $_POST["Drug"];
    $hippocampal = $_POST["hippocampal"];

    $sql = "INSERT INTO p_details (name, age, gender, phone_no, alter_ph_no, Diagnosis, Drug, hippocampal, patient_img, mri_before, mri_after,Discription) 
    VALUES ('$name', '$age', '$gender', '$ph_num', '$alt_ph_num', '$Diagnosis', '$Drug', '$hippocampal', '" . implode(",", $imagePath1) . "', '" . implode(",", $imagePath2) . "', '','')";
    
    $response = array();
    if ($conn->query($sql) === TRUE) {
        $response["status"] = "success";
        $response["message"] = "Patient information and images uploaded successfully.";
    } else {
        $response["status"] = "error";
        $response["message"] = "Error: " . $sql . "<br>" . $conn->error;
    }

    $conn->close();

    // Encode the response array to JSON and echo it
    echo json_encode($response);
} else {
    // Invalid request
    echo json_encode(array("status" => "error", "message" => "Invalid request."));
}
?>
