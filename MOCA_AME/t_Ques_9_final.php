<?php

$conn = new mysqli("localhost", "root", "", "moca");
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$response = array(); // Initialize an empty array to store the response data

$sql = "SELECT * FROM tamil where id=9";

$stmt = mysqli_prepare($conn, $sql);

if ($stmt) {
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);

    if ($result->num_rows > 0) {
        $data = array(); // Initialize an empty array to store individual data records
        while ($row = $result->fetch_assoc()) {
            $record = array(
                "id" => strval($row["id"]), // Convert id to string
                "Type" => $row["type"],
                "ques" => ($row["ques"]), // Convert Age to string
                "option1" => $row["option1"],
                "option2" => $row["option2"],
                "option3" => $row["option3"],
                "option4" => $row["option4"],
                "answer" => $row["answer"]
            );

            $imagePath = $row["ques_content"];

            if (!empty($imagePath) && file_exists($imagePath)) {
                // Encode image to base64
                $record["ques_content"] = base64_encode(file_get_contents($imagePath));
            } else {
                // Log an error if the image path is empty or the file doesn't exist
                error_log("Image not found or invalid path for ID: " . $row["id"]);
                $record["patient_img"] = ""; // or assign an appropriate default value
            }
            $data[] = $record; // Add the record to the data array
        }
        $response["status"] = "success";
        $response["message"] = "Data retrieved successfully";
        $response["data"] = $data; // Add the data array to the response
    } else {
        $response["status"] = "error";
        $response["message"] = "No results found";
    }

    mysqli_stmt_close($stmt);
} else {
    $response["status"] = "error";
    $response["message"] = "Error preparing statement: " . mysqli_error($conn);
}

$conn->close();

// Encode the response array to JSON and echo it
echo json_encode($response);
?>
