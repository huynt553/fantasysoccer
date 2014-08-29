<!DOCTYPE html>

<html>
<head>
	<title>Fantasy Soccer</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!--- <cfsetting showDebugOutput="No"> --->
<!--- bring in style sheet --->
<link href="../resources/style_sheets/fsstyle.css" type=text/css rel=stylesheet>
</head>
<script>
function profileUpdate() {
    document.getElementById("playerpicture").innerHTML = "<b>CR7</b>";
}
</script>
<script type='text/javascript' src='http://code.jquery.com/jquery-1.8.3.js'></script>
<script type='text/javascript'>//<![CDATA[ 
$(window).load(function(){
$(function () {
    $('table tr').click(function () {
        var LastName = $(this).children('td:eq(0)').html();
        var FirstName = $(this).children('td:eq(1)').html();
        var Team = $(this).children('td:eq(2)').html();
        var Position = $(this).children('td:eq(3)').html();
		
		$('#playerpicture').html(
			"<img src='../resources/images/genericphoto.png' width='100%' height='100%'/>"
        );
		
		$('#playerstats').html(
            'First Name: ' + FirstName + '<br />' +
            'Last Name: ' + LastName + '<br />' + 
            'Team: ' + Team + '<br />' + 
            'Position: ' + Position + '<br />'
        );
		
    });        
});
});//]]>  

</script>
<body>
<div id="header"></div>

<div id="navigation">
	<cfif #find("league",CGI.PATH_TRANSLATED)# IS NOT 0>
		<div class="activelink"><a href="league.cfm">League</a></div>
	<cfelse>
		<div><a href="league.cfm">League</a></div>
	</cfif>
	
	<cfif #find("myteam",CGI.PATH_TRANSLATED)# IS NOT 0>
		<div class="activelink"><a href="myteam.cfm">My Team</a></div>
	<cfelse>
		<div><a href="myteam.cfm">My Team</a></div>
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
</div>

<div id="wrapper">
	<form id="draftform" name="myform" onsubmit="" action="draft.cfm">
	<div id="currentteam">
		<cfoutput>
			<cfif isDefined("url.counter")>
				<cfquery name = "get_teams" datasource="soccer">
					SELECT *
					FROM teams
					WHERE rankorder = #counter#
				</cfquery>
					<h1>Current team is #get_teams.name#</h1>
			<cfelse>
				<cfset counter = 1>
				<cfquery name = "get_teams" datasource="soccer">
					SELECT *
					FROM teams
					WHERE rankorder = 1
				</cfquery>
					<h1>Current team is #get_teams.name#</h1>
			</cfif>
		</cfoutput>
	</div>
	
	<cfoutput>
			<cfif isDefined("url.counter")>
				<cfquery name = "get_teams" datasource="soccer">
					SELECT *
					FROM teams
					WHERE rankorder = #counter#
				</cfquery>
					<cfset counter += 1>
					<cfif #counter# GT "8">
						<cfset counter = 1>
					</cfif>
					<input type="hidden" value="#counter#" name="counter" id="count">
			<cfelse>
				<cfset counter = 1>
				<cfquery name = "get_teams" datasource="soccer">
					SELECT *
					FROM teams
					WHERE rankorder = 1
				</cfquery>
					<cfset counter += 1>
					<input type="hidden" value="#counter#" name="counter" id="count">
			</cfif>
	</cfoutput>	
		
	<div id="playerlist">
	
		<cfquery name="get_players" datasource="soccer">
			SELECT * 
			FROM players
			ORDER BY last_name
		</cfquery>
		
		<div class="CSSTableGenerator">
			<table>
					<tr>
						<th>Last Name</th>
						<th>First Name</th>
						<th>Team</th>
						<th>Position</th>
					</tr>
						<cfoutput query="get_players">
							<tr onclick="profileUpdate()">
								<td>#last_name#</td>
								<td>#first_name#</td>
								<td>#team#</td>
								<td>#position#</td>
							</tr>
						</cfoutput>
			</table>
		</div>
		
	</div>
	
	<div id="playerinfo">
		<div id="playerpicture">
		</div>
		
		<div id="playerstats">
			2013/2014 Player Statistics
		</div>
		<input type="submit" value="Draft" name="send" id="send">
	</div>
	
	<div id="teaminfo">
		<p id="testname2"> 
			<!--- Team Info Here --->
		</p>
	</div>
	
</div>	
</form>
		

</body>
</html>
