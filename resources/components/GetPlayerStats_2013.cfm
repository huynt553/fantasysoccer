<cfquery name="get_stats" datasource="soccer">
	SELECT *
	FROM player_stats_2013
	WHERE last_name =  '#lastname#'
</cfquery>

<h1>2013-2014 Statistics</h1>

<table border="1px">
	<tr>
		<th>Goals</th>
		<th>Assists</th>
		<th>Yellow Cards</th>
		<th>Red Cards</th>
		<th>Shots Per Game</th>
		<th>Pass Percentage</th>
	</tr>
	<cfoutput query="get_stats">
		<tr>
			<th>#Goals#</th>
			<th>#Assists#</th>
			<th>#Yel#</th>
			<th>#Red#</th>
			<th>#ShotsPerGame#</th>
			<th>#PassPercent#</th>
		</tr>
	</cfoutput>
</table>

