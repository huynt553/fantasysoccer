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

<div id="header">
</div>


<div id="navigation">
	<cfif #find("league",CGI.PATH_TRANSLATED)# IS NOT 0>
		<div class="activelink"><a href="league.cfm">League</a></div>
	<cfelse>
		<div><a href="league.cfm">League</a></div>
	</cfif>
	
	<cfif #find("myteam",CGI.PATH_TRANSLATED)# IS NOT 0>
		<div class="activelink"><a href="myteam2.cfm">My Team</a></div>
	<cfelse>
		<div><a href="myteam2.cfm">My Team</a></div>
	</cfif>
	
	<cfif #find("matchup",CGI.PATH_TRANSLATED)# IS NOT 0>
		<div class="activelink"><a href="matchup.cfm">Matchup</a></div>
	<cfelse>
		<div><a href="matchup.cfm">Matchup</a></div>
	</cfif>
	
	<cfif #find("players",CGI.PATH_TRANSLATED)# IS NOT 0>
		<div class="activelink"><a href="players.cfm">Players</a></div>
	<cfelse>
		<div><a href="players.cfm">Players</a></div>
	</cfif>
	
	<cfif #find("draft",CGI.PATH_TRANSLATED)# IS NOT 0>
		<div class="activelink"><a href="draft.cfm">Draft</a></div>
	<cfelse>
		<div><a href="draft.cfm">Draft</a></div>
	</cfif>
	
	<cfif #find("create",CGI.PATH_TRANSLATED)# IS NOT 0>
		<div class="activelink"><a href="create_team.cfm">Create Team</a></div>
	<cfelse>
		<div><a href="create_team.cfm">Create Team</a></div>
	</cfif>
</div>
<form name="create_team" action="../resources/components/login_process.cfm" method="post">
<div id="formsheet">
	
	<label>Username: </label>
	<input type="text" name="user_name"><br>
	
	<label>Password: </label>
	<input type="password" name="user_pass"><br><br>
	<input type="submit" value="Submit">
</div>
</form>

</body>
</html>
