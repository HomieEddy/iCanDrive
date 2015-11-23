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
														<input type='hidden' name='question' value='" . $userRow['question_id'] . "'>
														<input type='submit' name='action' value='Submit'>
														</form>");
										}
										else {
											$score = ($_SESSION['quizScore'] / $_POST['question']) * 100;
											echo("<h1>You Finished!</h1><br><br>
												  Congrats ". $_SESSION['userInfo'] ." on completing the quiz!<br>
												  You got ". $_SESSION['quizScore'] ." right answers<br>
												  And ". $_POST['question'] - $_SESSION['quizScore'] ." wrong answers!<br>
												  Meaning that your final score is...<br><br><h1>". $score ."%</h1>");
											$stmt = $DBConn->connection->prepare("INSERT INTO `tbl_quiz_history`(`student_id`, `grade`) 
																				  VALUES (".$_SESSION['user'].",".$score.")");
											$stmt->execute();
										}
									
											
								}
								catch(PDOException $e)
								{
									echo $e->getMessage();
								}
							}
							else {
								$_SESSION['quizScore'] = 0;
								$stmt = $DBConn->connection->prepare("SELECT * FROM tbl_questions WHERE question_id=0");
											$stmt->execute();
											$userRow=$stmt->fetch(PDO::FETCH_ASSOC);
											if($stmt->rowCount() > 0)
												echo("<h1>Question ". $userRow['question_id'] . "</h1><br>
													  <form action='' method='POST'>
														<input type='radio' name='answer' value='a' checked>" . $userRow['choice_a'] . "<br>
														<input type='radio' name='answer' value='b'>" . $userRow['choice_b'] . "<br>
														<input type='radio' name='answer' value='c'>" . $userRow['choice_c'] . "<br>
														<input type='radio' name='answer' value='d'>" . $userRow['choice_d'] . "<br>
														<input type='hidden' name='question' value='" . $userRow['question_id'] . "'>
														<input type='submit' name='action' value='Submit'>
														</form>");
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