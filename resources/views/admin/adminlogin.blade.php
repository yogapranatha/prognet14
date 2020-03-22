<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<link rel="stylesheet" type="text/css" href="{{ asset('asset/main.css') }}">
<link rel="stylesheet" type="text/css" href="{{ asset('asset/util.css') }}">

</head>
<body>
	<h1>Login Admin</h1><br>
	<div class="main" >
		
		<div class="agile">
			<div class="signin-form profile">
				<div class="login-form">
					<form action="{{ url('admin/login') }}" method="POST" enctype="multipart/form-data">
						{{ csrf_field() }}
						<table class="loginadmin" align="center" border="1">
							<thead>
								<tr>
									<th>USERNAME</th>
									<th><input type="text" name="username" placeholder="Username" ></th>
								</tr>
								<tr>
									<th>PASSWORD</th>
									<th><input type="password" name="password" placeholder="Password"></th>
								</tr>
							</thead>
						</table>
						<button class="btn btn-submit"><input type="submit" value="submit"></button>
					</form>
				</div>
			</div>
		</div>
		<div class="clear"></div>
	</div>				
</body>
</html>