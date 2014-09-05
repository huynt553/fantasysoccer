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

<cfquery name="insert_user" datasource="soccer">
		INSERT INTO users (username, password)
		VALUES ('#username#', '#password#')
</cfquery>

<!--- <cfquery name="insert_team" datasource="soccer">
	
</cfquery>--->

</body>
</html>
