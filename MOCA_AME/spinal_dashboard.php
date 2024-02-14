<?php

$conn = new mysqli("localhost", "root", "", "spinalcord");
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$response = array();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $json = file_get_contents('php://input');
    $data = json_decode($json, true);

    
    $sql = "SELECT * FROM patient_details";

    $stmt = mysqli_prepare($conn, $sql);

    if ($stmt) {
        mysqli_stmt_execute($stmt);
        $result = mysqli_stmt_get_result($stmt);

        if ($result->num_rows > 0) {
            $response["status"] = "success";
            $response["message"] = "Data retrieved";
            $response['data']=array();
            while ($row = $result->fetch_assoc()) {
                $data = array(
                    "id" => strval($row["id"]),
                    "Name" => $row["Name"],
                    "Age" => strval($row["Age"]),
                    "Gender" => $row["Gender"],
                    "Diagnosis" => $row["Diagnosis"],
                );
                array_push($response['data'],$data);
            }
           
        } else {
            $response["status"] = "error";
            $response["message"] = "No results found";
        }

        mysqli_stmt_close($stmt);
    } else {
        $response["status"] = "error";
        $response["message"] = "Error preparing statement: " . mysqli_error($conn);
    }
} else {
    $response["status"] = "error";
    $response["message"] = "Invalid request method";
}

$conn->close();

echo json_encode($response);

?>
