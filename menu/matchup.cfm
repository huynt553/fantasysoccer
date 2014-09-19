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

<div id="scoreboard"> <!--- Show scoreboard ---> 
	<table border="1px">
		<tr>
			<th></th>
			<th>Goals</th>
			<th>Assists</th>
			<th>Yellow Cards</th>
			<th>Red Cards</th>
			<th>Shots Per Game</th>
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
			<td>3.1</td>
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
			<td>3.5</td>
			<td>85.6</td>
			<td>1</td>
			<td>3</td>
			<td>4</td>
		</tr>
	</table>
</div>

<div id="team1"> <!--- Get current user's team --->
</div>

<div id="team2"> <!--- Get current user's opposition team --->
</div>
		

</body>
</html>
