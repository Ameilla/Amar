<?php
// Check if 'num' parameter is set in the request
$conn = new mysqli("localhost", "root", "", "moca");
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
header('Content-Type: application/json; charset=UTF-8');
$response = array();

if (isset($_POST['num'])) {
    // Retrieve the 'num' parameter value
    $num = $_POST['num'];

    $sql = "SELECT * 
            FROM p_details 
            WHERE id = $num";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);

    if ($result->num_rows > 0) {
        $response['status'] = "success";
        $response['message'] = "Data found";
        $response['data'] = array();

        while ($row = $result->fetch_assoc()) {
            $imagePath1 = $row["patient_img"];
            $imagePath2 = $row["mri_before"];
            $imagePath3 = $row["mri_after"];

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
                "Discription" => $row['Discription'],
            );

            // Check if image paths are not empty before attempting to read and encode images
            if (!empty($imagePath1)) {
                $data["patient_img"] = base64_encode(file_get_contents($imagePath1));
            } else {
                $data["patient_img"] = ""; // Set to empty string or any default value
            }

            if (!empty($imagePath2)) {
                $data["mri_before"] = base64_encode(file_get_contents($imagePath2));
            } else {
                $data["mri_before"] = ""; // Set to empty string or any default value
            }

            if (!empty($imagePath3)) {
                $data["mri_after"] = base64_encode(file_get_contents($imagePath3));
            } else {
                $data["mri_after"] = ""; // Set to empty string or any default value
            }

            array_push($response['data'], $data);
        }
    } else {
        $response['status'] = "error";
        $response['message'] = "No results found";
    }
} else {
    // If 'num' parameter is not set, handle the error accordingly
    $response['status'] = "error";
    $response['message'] = "'num' parameter not found in the request.";
}

$conn->close();

// Convert PHP array to JSON and output the response
echo json_encode($response);
?>
