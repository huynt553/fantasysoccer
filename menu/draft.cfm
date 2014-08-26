<!DOCTYPE html>

<html>
<head>
	<title>F.S.</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<cfsetting showDebugOutput="No">
<!--- bring in style sheet --->
<link href="/tim/tim/resources/style_sheets/fsstyle.css" type=text/css rel=stylesheet>
</head>
<script>
function profileUpdate() {
    document.getElementById("testname").innerHTML = "CR7";
}
</script>
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
	<form id="draftform" name="myform" onsubmit="" action="draft.cfm">
	<div id="currentteam">
		<cfoutput>
			<cfif isDefined("url.counter")>
				<cfquery name = "get_teams" datasource="test2">
					SELECT *
					FROM teamtest
					WHERE rankorder = #counter#
				</cfquery>
					<h1>Current team is #get_teams.name#</h1>
			<cfelse>
				<cfset counter = 1>
				<cfquery name = "get_teams" datasource="test2">
					SELECT *
					FROM teamtest
					WHERE rankorder = 1
				</cfquery>
					<h1>Current team is #get_teams.name#</h1>
			</cfif>
		</cfoutput>
	</div>
	
	<cfoutput>
			<cfif isDefined("url.counter")>
				<cfquery name = "get_teams" datasource="test2">
					SELECT *
					FROM teamtest
					WHERE rankorder = #counter#
				</cfquery>
					<cfset counter += 1>
					<cfif #counter# GT "8">
						<cfset counter = 1>
					</cfif>
					<input type="hidden" value="#counter#" name="counter" id="count">
			<cfelse>
				<cfset counter = 1>
				<cfquery name = "get_teams" datasource="test2">
					SELECT *
					FROM teamtest
					WHERE rankorder = 1
				</cfquery>
					<cfset counter += 1>
					<input type="hidden" value="#counter#" name="counter" id="count">
			</cfif>
	</cfoutput>	
		
	<div id="playerlist">
		<div class="CSSTableGenerator">
            <table>
                    <tr>
                        <td>First Name</td>
                        <td>Last Name</td>
                        <td>Team</td>
						<td>Position</td>
                    </tr>
                    <tr>
                        <td>Row 1</td>
						<td>Row 1</td>
						<td>Row 1</td>
						<td>Row 1</td>
                    </tr>
            </table>
        </div>
	</div>
	
	<div id="playerinfo">
		<p id="testname"> 
			<!--- Player Info Here ---> 
			<input type="submit" value="Draft" name="send" id="send">
		</p>
	</div>
	
	<div id="teaminfo">
		<p id="testname2"> 
			<!--- Team Info Here --->
		</p>
	</div>
	
</div>>
		
</form>
</body>
</html>
