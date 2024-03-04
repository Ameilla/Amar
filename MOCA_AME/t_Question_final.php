<?php
session_start();

$response = array(); // Initialize an empty associative array to store response data


$conn = new mysqli("localhost", "root", "", "moca");
if ($conn->connect_error) {
    $response['status'] = false;
    $response['message'] = "Connection failed: " . $conn->connect_error;
} else {
    $sql = "SELECT * FROM tamil";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $questions = array(); // Initialize an array to store questions and responses

        while ($row = $result->fetch_assoc()) {
            $questionData = array(
                'id' => $row['id'],
                'question' => $row['ques'],
                'type' => $row['type'],
                'ques_content' => $row['ques_content'],
                'options' => array(
                    $row['option1'],
                    $row['option2'],
                    $row['option3'],
                    $row['option4']
                ),
                'answer' => $row['answer']
            );

            $questions[] = $questionData;
        }

        $response['questions'] = $questions;

    } else {
        $response['message'] = "No questions found";
    }

    $conn->close();
}

// Send JSON response
header('Content-Type: application/json; charset=UTF-8');
echo json_encode($response);
?>
