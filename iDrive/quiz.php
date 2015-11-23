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
						ughhhhhhhhh<br>
						<?php
							$DBConn = new DBConnection();
							
							if(isset($_POST['action']) && $_POST['action'] == 'Submit') {
							try
							{
								$stmt = $DBConn->connection->prepare("SELECT rightAnswer FROM tbl_questions WHERE question_id=" . $_POST['question']);
								$stmt->execute();
								$userRow=$stmt->fetch(PDO::FETCH_ASSOC);
								
								if($stmt->rowCount() > 0)
									if($userRow['rightAnswer'] == $_POST['answer'])
										$_SESSION['quizScore'] = $_SESSION['quizScore'] + 1;
								
								
								$stmt = $DBConn->connection->prepare("SELECT MAX(question_id) as max FROM tbl_questions");
								$stmt->execute();
								$userRow=$stmt->fetch(PDO::FETCH_ASSOC);
								
								if($stmt->rowCount() > 0) {
									if($_POST['question'] < $userRow['max']) {
										$stmt = $DBConn->connection->prepare("SELECT * FROM tbl_questions WHERE question_id=" . $_POST['question'] + 1);
										$stmt->execute();
										$userRow=$stmt->fetch(PDO::FETCH_ASSOC);
										if($stmt->rowCount() > 0)
											echo("<h1>Question ". $userRow['question_id'] . "</h1><br>
												  <form action='' method='POST'>
													<input type='radio' name='answer' value='a' checked>" . $userRow['choice_a'] . "<br>
													<input type='radio' name='answer' value='b'>" . $userRow['choice_b'] . "<br>
													<input type='radio' name='answer' value='c'>" . $userRow['choice_c'] . "<br>
													<input type='radio' name='answer' value='d'>" . $userRow['choice_d'] . "<br>
													<input type='submit' name='action' value='Submit'>
													</form>");
									}
									else 
										echo("<h1>You Finished!</h1><br><br>
											  Congrats ". $_SESSION['userInfo'] ." on completing the quiz!<br>
											  You got ". $_SESSION['rightAnswer'] ." right answers<br>
											  And ". $_POST['question'] - $_SESSION['rightAnswer'] ." wrong answers!<br>
											  Meaning that your final score is...<br><br><h1>"
											  . ($_SESSION['rightAnswer']) / $_POST['question'] * 100 ."%</h1>");
									
								
										
							}
							
							try
							{
								$stmt = $DBConn->connection->prepare("SELECT * FROM tbl_users WHERE user_name='$username' AND user_password='$passwd' LIMIT 1");
								$stmt->execute();
								$userRow=$stmt->fetch(PDO::FETCH_ASSOC);
								if($stmt->rowCount() > 0)
								{
									$_SESSION['user'] = $userRow['user_id'];
									$_SESSION['userInfo'] = $userRow['l_name'] . ", " . $userRow['f_name'];
									$_SESSION['login'] = "true";
									
									$user_category = $userRow['category_id'];
									switch($user_category)
									{
										case 1:
											header("Location: student_profile.php");
											break;
										case 2:
											header("Location: teacher_profile.php");
											break;
										case 3:
											header("Location: admin_profile.php");
											break;			
										
										default:
											header("Location: home.php");
									}	
									return true;
								}
							}
							catch(PDOException $e)
							{
								echo $e->getMessage();
							}
							
						?>
					</div>
				</div>    
				<div class="box sidebar">
				
				</div>  
			</div>  
			<div id="footer"> FOOTER </div>
		</div>
	</body>
</html>