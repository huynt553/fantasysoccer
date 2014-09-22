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

<cfquery name="MyTeamName" datasource="soccer">
	SELECT name 
	FROM teams
	WHERE user_id = #Session.user_id#
</cfquery>

<div id="scoreboard"> <!--- Show scoreboard ---> 
	<table border="1px">
		<tr>
			<th></th>
			<th>Goals</th>
			<th>Assists</th>
			<th>Yellow Cards</th>
			<th>Red Cards</th>
			<th>Shots On Target</th>
			<th>Pass Percentage</th>
			<th>Clean Sheets</th>
			<th>Saves</th>
			<th>Score</th>
		</tr>
		<tr>
			<td>Wild Fishermen</td>
			<td>15</td>
			<td>27</td>
			<td>3</td>
			<td>1</td>
			<td>16</td>
			<td>81.9</td>
			<td>2</td>
			<td>5</td>
			<td>3</td>
		</tr>
		<tr>
			<td>Check</td>
			<td>12</td>
			<td>30</td>
			<td>1</td>
			<td>1</td>
			<td>22</td>
			<td>85.6</td>
			<td>1</td>
			<td>3</td>
			<td>4</td>
		</tr>
	</table>
</div>

<cfquery name="get_team1" datasource="soccer">
	SELECT name
	FROM teams
	WHERE user_id = #Session.user_id#
</cfquery>

<cfquery name="get_team1_stats" datasource="soccer">
	SELECT *
	FROM `#get_team1.name#`
</cfquery>

<cfquery name="get_team2" datasource="soccer">
	SELECT team2
	FROM schedule
	WHERE team1 = "#get_team1.name#"
</cfquery>

<cfquery name="get_team2_stats" datasource="soccer">
	SELECT *
	FROM `#get_team2.team2#`
</cfquery>

<div id="team1"> <!--- Get current user's team --->
	<table border="1px">
		<tr>
			<th colspan="9"><cfoutput>#MyTeamName.name#</cfoutput></th>
		</tr>
		<tr>
			<th>Players</th>
			<th>Goals</th>
			<th>Assists</th>
			<th>YC</th>
			<th>RC</th>
			<th>SPG</th>
			<th>Pass %</th>
			<th>CS</th>
			<th>Saves</th>
		</tr>
		<cfoutput query="get_team1_stats">
			<tr>
				<td><cfif #FirstName# NEQ "N/A">#FirstName#</cfif> #LastName#</td>
				<td>-</td>
				<td>-</td>
				<td>-</td>
				<td>-</td>
				<td>-</td>
				<td>-</td>
				<td>-</td>
				<td>-</td>
			</tr>
		</cfoutput>
	</table>
</div>

<div id="team2"> <!--- Get current user's opposition team --->
	<table border="1px">
		<tr>
			<th colspan="9"><cfoutput>#get_team2.team2#</cfoutput></th>
		</tr>
		<tr>
			<th>Players</th>
			<th>Goals</th>
			<th>Assists</th>
			<th>YC</th>
			<th>RC</th>
			<th>SPG</th>
			<th>Pass %</th>
			<th>CS</th>
			<th>Saves</th>
		</tr>
		<cfoutput query="get_team2_stats">
			<tr>
				<td><cfif #FirstName# NEQ "N/A">#FirstName#</cfif> #LastName#</td>
				<td>-</td>
				<td>-</td>
				<td>-</td>
				<td>-</td>
				<td>-</td>
				<td>-</td>
				<td>-</td>
				<td>-</td>
			</tr>
		</cfoutput>
	</table>
</div>
		

</body>
</html>
