<?php

echo "Pets!<hr>";
$conn = new mysqli("mysql-test", "root", "sweetpwd", "test");
if ($conn->connect_error) {
	die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT * FROM pet";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
	// output data of each row
	while($row = $result->fetch_assoc()) {
		echo $row['name']." the ".$row['species']." is ".$row['owner']."'s pet.";
		echo "<br>";
	}
} else {
	echo "0 results";
}
$conn->close();

//phpinfo();
?>
