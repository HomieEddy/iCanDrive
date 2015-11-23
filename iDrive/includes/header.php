<?php
	session_start();
?>

<html>
	<body>
		<a href="home.php" style="float:left;">
			<img src="includes/logo.png" style="height:28px;" alt="font is Harlow Solid Italic">
		</a>

		<?php
			if(isset($_SESSION['user']))
			{
				echo "WELCOME " . $_SESSION['userInfo'] . "!
						<a href='./logout.php'>LOGOUT</a>";
			}
			else
			{
				echo "<a href='./login.php'>LOGIN</a>";
			}
		?>
		
	</body>
</html>