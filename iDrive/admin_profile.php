<?php
	session_start();
	require 'includes/DBConnection.php';
?>

<!DOCTYPE>
<html>
	<head>
		<title>My profile </title>
		<script src="includes/jquery-1.11.3.min.js"></script>
		<link rel="stylesheet" href="includes/bootstrap-3.3.5-dist\css\bootstrap.css">
		<link rel="stylesheet" href="includes/style.css">	

		<script> 
			$(function(){
			  $("#header").load("includes/header.php"); 
			  $("#footer").load("includes/footer.php"); 
			});
		</script> 			
	</head>
	
	<body>
		<div class="wrapper">  
			<div id="header"> HEADER </div>  
			<div class="main">    
				<div class="box sidebar">
				
				</div>

				<div class="box content">
					<div class="inner">
						*** THIS USER IS AN ADMIN ***
						<br><br><br><br><br><br>
						<table align="center">
							<tr>
								<!-- Bio Table -->
								<?php
									$DBConn = new DBConnection();
									
									$current_id = $_SESSION['user'];
									$stmt = $DBConn->connection->prepare("SELECT * FROM tbl_users WHERE user_id=$current_id");
									$stmt->execute();
									$userRow=$stmt->fetch(PDO::FETCH_ASSOC);
								?>
								<td> 
									<?php
										echo $userRow['l_name'] . ", " . $userRow['f_name'] . "<br>";
										echo $userRow['phone'] . "<br>";
										echo $userRow['address'] . "<br>";
										echo $userRow['city'] . ", " . $userRow['province'] . "   " . $userRow['zip'] . "<br>";
										echo $userRow['country'] . "<br>";
									?>
								</td>
								
								<!-- User Menu Table -->
								<td> 
									<form method='POST'>
										<input type='Submit' name='option' value='Messages'/><br>
										<input type='Submit' name='option' value='Question Bank'/><br>
										<input type='Submit' name='option' value='Car Inventory'/><br>
										<input type='Submit' name='option' value='Management'/><br>
										<input type='Submit' name='option' value='Manage Users'/><br>
									</form>
								</td>
							</tr>
						</table>
					</div>
				</div>    
				<div class="box sidebar">
				
				</div>  
			</div>  
			<div id="footer"> FOOTER </div>
		</div>
	</body>
</html>