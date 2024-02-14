<?php 

$conn = new mysqli("localhost","root","","spinalcord");

if($_SERVER['REQUEST_METHOD'] === 'POST')
{
    $email = $_POST['email'];
    $password = $_POST['password'];

    $sql = "SELECT * FROM doctor_details WHERE email = '$email' AND password = '$password' ";
    $result = $conn->query($sql);

    if($result->num_rows > 0)
    {
        $response = array('status' => 'success', 'message' =>'Login Success');
    }
    else
    {
        $response = array('status' => 'error', 'message' =>'Login Failed');
    }
}
else
{
    $response = array('status' => 'error', 'message' =>'Invalid request method');
}
echo json_encode($response);

$conn->close();
?>