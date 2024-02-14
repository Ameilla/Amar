<?php
// Check if 'num' parameter is set in the request
$conn = new mysqli("localhost", "root", "", "spinalcord");
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
header('Content-Type: application/json; charset=UTF-8');
$response = array();

if (isset($_POST['num'])) {
    // Retrieve the 'num' parameter value
    $num = $_POST['num'];

    $sql = "SELECT * 
            FROM patient_details 
            WHERE id = $num";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);

    if ($result->num_rows > 0) {
        $response['status'] = "success";
        $response['message'] = "Data found";
        $response['data'] = array();

        while ($row = $result->fetch_assoc()) {
            $data = array(
                "id" => strval($row["id"]),
                "Name" => $row["Name"],
                "Age" => strval($row["Age"]),
                "Gender" => $row["Gender"],
                "Diagnosis" => $row['Diagnosis'],
            );
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
echo json_encode($response);
?>
