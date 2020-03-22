<!DOCTYPE html>
<html>
<head>
<title>Register</title>
</head>
<body>
	<h1>Daftar User</h1>
	<!-- main -->
	<div class="main">
		<!--signin-form-->
		<div class="w3">
			<div class="signin-form profile">
				<h3>Daftar</h3>
				
				<div class="login-form">
					<form action="{{ url('user/register') }}" method="POST" enctype="multipart/form-data">
						{{ csrf_field() }}
						<input type="text" name="name" placeholder="Nama" required="">
						<input type="text" name="email" placeholder="Email" required="">
						<input type="password" name="password" placeholder="Password" required="">
						<input type="text" name="status" placeholder="Status" required="">
						<input type="file" name="file" placeholder="Photo" required="" style="color: white">
						<div class="tp">
							<input type="submit" value="REGISTER NOW">
						</div>
					</form>
				</div>
				<p><a href="{{ url('user/login') }}">Sudah Memiliki Akun ?</a></p>
			</div>
			<div class="copyright">
		<p> &copy; 2020 Dirty Shop . Palugada</p>
	</div>	
	</div>
				
</body>
</html>