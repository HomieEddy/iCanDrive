<?php
	session_start();
	require 'includes/DBConnection.php';
?>

<!DOCTYPE>
<html>
	<head>
		<title>Home	</title>
		<script src="includes\jquery-1.11.3.min.js"></script>
		<link rel="stylesheet" href="includes\bootstrap-3.3.5-dist\css\bootstrap.css">
		<link rel="stylesheet" href="includes\style.css">
	 		
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
						*** MESSAGING SERVICES ***
						<br><br><br><br><br>
						<?php
							$DBConn = new DBConnection();
									
							$current_id = $_SESSION['user'];
							$stmt = $DBConn->connection->prepare("
								SELECT date_sent, CONCAT(f_name, ' ' ,l_name) AS sender, message_title, message_content
								FROM tbl_messages INNER JOIN tbl_users 
								WHERE sender_id = user_id
								AND receiver_id = $current_id;");
							$stmt->execute();
							
						?>
						
						<table>
							<tr>
								<th><b>Date</b>		</th>
								<th><b>Sender</b> 	</th>
								<th><b>Title</b> 	</th>
								<th><b>Content</b> 	</th>
								<th><b>Action</b> 	</th>
							</tr>
							
						<?php
						while($messageRow=$stmt->fetch(PDO::FETCH_ASSOC)){
							echo
								"<tr>
									<td>" . $messageRow['date_sent'] . "</td>
									<td>" . $messageRow['sender'] . "</td>
									<td>" . $messageRow['message_title'] . "</td>
									<td>" . $messageRow['message_content'] . "</td>
									<td>**DELETE BUTTON**</td>
								</tr>";
						}
						?>
						</table>
						
						<br><br><br><br><br><br><br><br><br><br>
						 ************ WRITE NEW MESSAGE ***************
						 NOT COMPLETE YET
						<form method='POST'>
							<input type='text' size='30' maxlength='30' placeholder='Title' name='title_input'>
							<input type='text' size='50' maxlength='255' placeholder='Message' name='mess_input'>
						</form>
					</div>
				</div>    
				<div class="box sidebar">
				
				</div>  
			</div>  
			<div id="footer"> FOOTER </div>
		</div>
	</body>
</html>