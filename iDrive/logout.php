<?php
	session_start();
?>

<!DOCTYPE>
<html>
	<head>
		<title>Logout Redirect</title>
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
						PLEASE WAIT WHILE WE LOG YOU OUT ... <br>
						You will be redirected to the home page.
						<?php
							unset($_SESSION['user']);
							unset($_SESSION['login']);
							unset($_SESSION['userInfo']);
							sleep(3);
							
							header("Location: home.php");
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