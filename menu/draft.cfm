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
		
	<div id="playerlist">
		<cfoutput>
			<cfif isDefined("url.counter")>
				<cfquery name = "get_teams" datasource="test2">
					SELECT *
					FROM teamtest
					WHERE rankorder = #counter#
				</cfquery>
				<form id="draftform" name="myform" onsubmit="" action="draft.cfm">
					Current team is #get_teams.name# 
					<cfset counter += 1>
					<cfif #counter# GT "8">
						<cfset counter = 1>
					</cfif>
					<input type="hidden" value="#counter#" name="counter" id="count">
					<input type="submit" value="Submit" name="send" id="send">
				</form>
			<cfelse>
				<cfset counter = 1>
				<cfquery name = "get_teams" datasource="test2">
					SELECT *
					FROM teamtest
					WHERE rankorder = 1
				</cfquery>
				<form id="draftform" name="myform" onsubmit="" action="draft.cfm">
					Current team is #get_teams.name# 
					<cfset counter += 1>
					<input type="hidden" value="#counter#" name="counter" id="count">
					<input type="submit" value="Submit" name="send" id="send">
				</form>
			</cfif>
		</cfoutput>
	</div>
	
	<div id="playerinfo">
		Filler
	</div>
	
	<div id="teaminfo">
		Filler
	</div>
	
</div>
		

</body>
</html>
