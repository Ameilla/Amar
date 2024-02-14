<?php
header('Content-Type: application/json'); // Set the content type to JSON

$conn = new mysqli("localhost", "root", "", "moca");

if ($conn->connect_error) {
    die(json_encode(["error" => "Connection failed: " . $conn->connect_error])); // Return an error response in JSON
}

// Use $_POST to get data for POST requests
if(isset($_POST['num'])) {
    $num = $_POST['num'];

    // Corrected SQL query with the WHERE clause
    $sql = "SELECT * FROM p_details WHERE id = $num LIMIT 1";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    
    if ($result->num_rows > 0) {
        $response['status'] = "success";
        $response['message'] = "Data found";
        $response['data'] = array();
        
        while($row = $result->fetch_assoc()) {
            $imagePath = $row["patient_img"];
            $data = array(
                "id" => strval($row["id"]),
                "Name" => $row["Name"],
                "Age" => strval($row["Age"]),
                "Gender" => $row["Gender"],
                "Phone number" => $row['phone_no'],
                "Alternate mobile num" => $row['alter_ph_no'],
                "Diagnosis" => $row['Diagnosis'],
                "Drug" => $row['Drug'],
                "Hippocampal" => $row['hippocampal'],
                "patient_img" => base64_encode(file_get_contents($imagePath)) // Add the base64-encoded image data to the array
            );

            array_push($response['data'], $data); // Add the record to the data array
        }
        echo json_encode($response);
    } else {
        echo json_encode(["error" => "No results found"]); // Return an error response in JSON
    }
} else {
    echo json_encode(["error" => "'num' parameter not found in the request"]); // Return an error response in JSON
}

$conn->close();
?>
