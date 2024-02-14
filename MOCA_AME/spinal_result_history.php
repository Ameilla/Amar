<?php

$conn = new mysqli("localhost", "root", "", "spinalcord");
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
                "result" => strval($row["result"]),
                "interpretation" => strval($row["interpretation"])
            );
            $record["submission_date"] = date('Y-m-d', strtotime($row["submission_datetime"]));
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
