<?php

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $targetDirectory = "uploads/";
    $conn = new mysqli("localhost", "root", "", "moca");

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }


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

    // Validate and sanitize input data
    $imagePath1 = isset($_FILES["image1"]) ? uploadImages("image1") : [];
    $imagePath2 = isset($_FILES["image2"]) ? uploadImages("image2") : [];
    
    // $iD = $_POST["iD"];
    $iD = isset($_POST["iD"]) ? $_POST["iD"] : null;
    $task1 = isset($_POST["task1"]) ? $_POST["task1"] : null;
    $task2 = isset($_POST["task2"]) ? $_POST["task2"] : null;
    $task3 = isset($_POST["task3"]) ? $_POST["task3"] : null;
    $task4 = isset($_POST["task4"]) ? $_POST["task4"] : null;
    $task5 = isset($_POST["task5"]) ? $_POST["task5"] : null;
    $task6 = isset($_POST["task6"]) ? $_POST["task6"] : null;
    $task7 = isset($_POST["task7"]) ? $_POST["task7"] : null;
    $result = isset($_POST["result"]) ? $_POST["result"] : null;
    $interpretation = isset($_POST["interpretation"]) ? $_POST["interpretation"] : null;

    $submissionDatetime = date('Y-m-d H:i:s');

    $imagePath1Imploded = implode(",", $imagePath1);
    $imagePath2Imploded = implode(",", $imagePath2);
   

    $insert_sql = "INSERT INTO results (id, task1, task2, task3, task4, task5, task6, task7, image1, image2, submission_datetime,result,interpretation,Discription)
        VALUES ('$iD', '$task1', '$task2', '$task3', '$task4', '$task5', '$task6', '$task7', '$imagePath1Imploded', '$imagePath2Imploded', '$submissionDatetime','$result','$interpretation','')";
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
