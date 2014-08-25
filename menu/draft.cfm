<!DOCTYPE html>

<html>
<head>
	<title>F.S.</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<cfsetting showDebugOutput="No">
<!--- bring in style sheet --->
<link href="/tim/tim/resources/style_sheets/fsstyle.css" type=text/css rel=stylesheet>
</head>
<body>
<div id="header"></div>

<div id="navigation">
	<cfif #find("league",CGI.PATH_TRANSLATED)# IS NOT 0>
		<div class="activelink"><a href="/tim/tim/menu/league.cfm">League</a></div>
	<cfelse>
		<div><a href="/tim/tim/menu/league.cfm">League</a></div>
	</cfif>
	
	<cfif #find("myteam",CGI.PATH_TRANSLATED)# IS NOT 0>
		<div class="activelink"><a href="/tim/tim/menu/myteam.cfm">My Team</a></div>
	<cfelse>
		<div><a href="/tim/tim/menu/myteam.cfm">My Team</a></div>
	</cfif>
	
	<cfif #find("matchup",CGI.PATH_TRANSLATED)# IS NOT 0>
		<div class="activelink"><a href="/tim/tim/menu/matchup.cfm">Matchup</a></div>
	<cfelse>
		<div><a href="/tim/tim/menu/matchup.cfm">Matchup</a></div>
	</cfif>
	
	<cfif #find("players",CGI.PATH_TRANSLATED)# IS NOT 0>
		<div class="activelink"><a href="/tim/tim/menu/players.cfm">Players</a></div>
	<cfelse>
		<div><a href="/tim/tim/menu/players.cfm">Players</a></div>
	</cfif>
</div>

<div id="wrapper">
    
	<div id="c1">
	</div>
	
	<div id="c2">
	</div>
	
	<div id="c3">
	</div>
	
</div>
		

</body>
</html>
