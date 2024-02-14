<?php

$conn = new mysqli("localhost", "root", "", "moca");
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$response = array(); // Initialize an empty array to store the response data
$id = $_GET['id'];
$sql = "SELECT * FROM results where id=$id";
$stmt = mysqli_prepare($conn, $sql);

if ($stmt) {
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);

    if ($result->num_rows > 0) {
        $data = array(); // Initialize an empty array to store individual data records
        while ($row = $result->fetch_assoc()) {
            $record = array(
                "iD" => strval($row["id"]), // Convert id to string
                "task1" => strval($row["task1"]),
                "task2" => strval($row["task2"]),
                "task3" => strval($row["task3"]),
                "task4" => strval($row["task4"]),
                "task5" => strval($row["task5"]),
                "task6" => strval($row["task6"]),
                "task7" => strval($row["task7"]),
                "interpretation" => strval($row["interpretation"]),
                

            );
            $record["submission_date"] = date('Y-m-d', strtotime($row["submission_datetime"]));

            $imagePath1 = $row["image1"];
            $record["image1"] = base64_encode(file_get_contents($imagePath1));
            $imagePath2 = $row["image2"];
            $record["image2"] = base64_encode(file_get_contents($imagePath2));


            // $imagePath = $row["patient_img"];

            // if (!empty($imagePath) && file_exists($imagePath)) {
            //     // Encode image to base64
            //     $record["patient_img"] = base64_encode(file_get_contents($imagePath));
            // } else {
            //     // Log an error if the image path is empty or the file doesn't exist
            //     error_log("Image not found or invalid path for ID: " . $row["id"]);
            //     $record["patient_img"] = ""; // or assign an appropriate default value
            // }
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
