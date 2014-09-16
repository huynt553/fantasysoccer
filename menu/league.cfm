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

<cfquery name="get_league_teams" datasource="soccer">
	SELECT *
	FROM teams
</cfquery>

<table id="standings" border="1px">
	<tr>
		<th>Team</th>
		<th>Wins</th>
		<th>Losses</th>
		<th>Ties</th>
		<th>Percentage</th>
	</tr>
<cfoutput query="get_league_teams">
	<tr>
		<td>#name#</td>
		<td>#wins#</td>
		<td>#losses#</td>
		<td>#ties#</td>
		<td>#percentage#</td>
	</tr>
</cfoutput>
</table>
		

</body>
</html>
