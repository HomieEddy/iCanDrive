<?php
	session_start();
	
	require 'includes/DBConnection.php';
?>

<!DOCTYPE>
<html>
	<head>
		<title>Login</title>
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
						<form action='' method='POST'>		
							Login<br>
							<input type='text' size='15' maxlength='20' placeholder='User Name' name='userNameLog'><br>
							<input type='password' size='15' maxlength='20' placeholder='Password' name='passLog'><br>
							<input type='submit' name='action' value='Login' >
						</form>
					</div>
				</div>    
				<div class="box sidebar">
				
				</div>  
			</div>  
			<div id="footer"> FOOTER </div>
		</div>
		
		<?php
			$DBConn = new DBConnection();
			
			if(isset($_POST['action']) && $_POST['action'] == 'Login')
			{
				$username 	= $_POST['userNameLog'];
				$passwd 	= $_POST['passLog'];
								
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
			}						
		?>
	</body>
</html>