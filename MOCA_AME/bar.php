<?php
// Check if 'num' parameter is set in the URL
$conn = new mysqli("localhost", "root", "", "moca");
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$response = array();

if (isset($_GET['id'])) {
    // Retrieve the 'num' parameter value
    $num = $_GET['id'];

    $sql = "SELECT * 
            FROM results 
            WHERE id = $num";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);

    if ($result->num_rows > 0) {
        $response['status'] = "success";
        $response['message'] = "Data found";
        $response['resultData'] = array(); // Array to store "Result"
        $response['dateData'] = array();   // Array to store "date"
        while ($row = $result->fetch_assoc()) {
            // Convert each character in "Result" to a string
            $resultArray = str_split($row["result"]);
            array_push($response['resultData'], $resultArray);

            // Assuming "submission_datetime" is a date field in the database
            $dateData = date('d-m-Y', strtotime($row["submission_datetime"]));
            array_push($response['dateData'], $dateData);

            $response['id'] = strval($row["id"]);
        }
        // Combine "Result" arrays into a single array
        $combinedResultArray = array();
        foreach ($response['resultData'] as $resultArray) {
            $combinedResultArray = array_merge($combinedResultArray, $resultArray);
        }
        $response['resultData'] = $combinedResultArray;
        
    } else {
        $response['status'] = "error";
        $response['message'] = "No results found";
    }
} else {
    // If 'num' parameter is not set, handle the error accordingly
    $response['status'] = "error";
    $response['message'] = "'num' parameter not found in the URL.";
}

$conn->close();

// Convert PHP array to JSON and output the response
echo json_encode($response);
?>
