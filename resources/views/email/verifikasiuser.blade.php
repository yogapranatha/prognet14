<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="{{ asset('cssuser/dashboarduser.css') }}">

    <title>VERIFY EMAIL</title>
</head>
<body>

<h1>Hello {{ $user['name'] }},</h1>
<p>Please verify your email first by click on the link below to verify your email {{ $user['email'] }}</p>

<a href="{{ url('user/verifikasi',$user['email']) }}">LINK</a>

</body>
</html>