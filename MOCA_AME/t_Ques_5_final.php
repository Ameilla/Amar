<?php

$conn = new mysqli("localhost", "root", "", "moca");
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$response = array(); // Initialize an empty array to store the response data

$sql = "SELECT * FROM tamil where id=5";

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
            );
            $opt= $row["answer"];
            $record["answer"] = $opt;
            $imagePath1= $row["option1"];
            $record["option1"] = base64_encode(file_get_contents($imagePath1));
            $imagePath2= $row["option2"];
            $record["option2"] = base64_encode(file_get_contents($imagePath2));
            $imagePath3= $row["option3"];
            $record["option3"] = base64_encode(file_get_contents($imagePath3));
            $imagePath4= $row["option4"];
            $record["option4"] = base64_encode(file_get_contents($imagePath4));
            
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
