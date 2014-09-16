<!DOCTYPE html>

<html>
<head>
	<title>Fantasy Soccer</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!--- <cfsetting showDebugOutput="No"> --->
<!--- bring in style sheet --->
<link href="../resources/style_sheets/fsstyle.css" type=text/css rel=stylesheet>
</head>
<body>

<cfinclude template="navigation.cfm">
<form name="create_team" action="myteam2.cfm" method="post">
<div id="formsheet">
	
	<label>Username: </label>
	<input type="text" name="Username"><br>
	
	<label>Password: </label>
	<input type="password" name="Password"><br><br>
	<input type="submit" value="Submit">
</div>
</form>

</body>
</html>
