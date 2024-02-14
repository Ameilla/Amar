<?php
$conn = new mysqli("localhost", "root", "", "moca");
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT * FROM doctor_page";
$result = $conn->query($sql);

$response = array(); // Create a response array

if ($result->num_rows > 0) {
    $response['status'] = "success";
    $response['message'] = "Data found";
    $response['data'] = array();
    // Output data of each row
    while ($row = $result->fetch_assoc()) {
        
        $data = array(
            "id" => $row["doctor_id"],
            "name" => $row["doctor_name"],
            "email" => $row["doctor_email"],
            "password" => $row["doctor_password"],
            "designation" => $row["doctor_designation"],
            "image" => base64_encode(file_get_contents($row["doctor_img"])));// Assuming the image is stored in the database as a base64 encoded string
    

        array_push($response['data'], $data);
    }
    echo json_encode($data);
} else {
    $response["error"] = "No results found";
}

// Close the connection
$conn->close();

// Convert the response array to JSON and echo it

?>
