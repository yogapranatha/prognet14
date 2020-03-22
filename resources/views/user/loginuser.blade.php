<!DOCTYPE html>
<html>
<head>
<title>Login</title>
 <?php 
    if(isset($_GET['alert'])){
      if($_GET['alert']=="belum_verifikasi"){
        echo "<script>alert(\"ANDA BELUM VERIFIKASI EMAIL\")</script>";
      }else if($_GET['alert']=="belum_terdaftar"){
        echo "<script>alert(\"ANDA BELUM TERDAFTAR\")</script>";
      }
    }
   ?>
</head>
<body>
	<h1>Welcome to Dirty Shop</h1>
	<!-- main -->
	<div class="main">
		<!--signin-form-->
		<div class="w3">
			<div class="signin-form profile">
				<h3>login</h3>
				<div class="login-form">
					<form action="{{ url('user/login') }}" method="POST" enctype="multipart/form-data">
						{{ csrf_field() }}
						<input type="text" name="email" placeholder="email" required="">
						<input type="password" name="password" placeholder="password" required="">
						<div class="tp">
							<input type="submit" value="LOGIN NOW">
						</div>
					</form>
				</div>
				<div class="header-social wthree">
							<a href="https://www.facebook.com/" class="face"><h5>Facebook</h5></a>
							<a href="https://accounts.google.com/signin/v2/identifier?hl=id&continue=https%3A%2F%2Fmail.google.com%2Fmail&service=mail&flowName=GlifWebSignIn&flowEntry=AddSession" class="goog"><h5>Google+</h5></a>
							<div class="clear"></div>
				</div>
				<p><a href="{{ url('user/register') }}"> Klik Disini Untuk Daftar!</a></p>
			</div>
			</div>
			<div class="copyright">
		<p> &copy; 2020 Dirty Shop . Palugada</p>
	</div>	
	</div>
				
</body>
</html>