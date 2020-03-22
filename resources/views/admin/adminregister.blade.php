<!DOCTYPE html>
<html>
<head>
<title>Register</title>
</head>
<body>
	<h1>Register Admin</h1>
	<div class="main">
		<div class="agile">
			<div class="signin-form profile">
				<div class="login-form">
					<form action="{{ url('admin/register') }}" method="POST" enctype="multipart/form-data">
						{{ csrf_field() }}
						<input type="text" name="name" placeholder="name" required="">
						<input type="text" name="phone" placeholder="phone" required="">
						<input type="text" name="username" placeholder="username" required="">
						<input type="password" name="password" placeholder="password" required="">
						<input type="file" name="file" placeholder="photo" required="" style="color: white">
						<input type="submit" value="SIGN UP">
					</form>
				</div>
			</div>
		</div>	
	</div>				
</body>
</html>