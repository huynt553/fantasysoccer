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

<cfquery name="get_last_user" datasource="soccer">
	SELECT user_id 
	FROM users 
	ORDER BY user_id DESC LIMIT 1;
</cfquery>

<cfoutput>
	<cfquery name="insert_team" datasource="soccer">
			INSERT INTO teams (user_id, name)
			VALUES ('#get_last_user.user_id#', '#TeamName#')
	</cfquery>
</cfoutput>

<cflocation url = "league.cfm">

</body>
</html>
