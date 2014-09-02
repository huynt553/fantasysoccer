<cfquery name="get_players" datasource="soccer">
	SELECT *
	FROM #Team#
</cfquery>
<h1>Players</h1>

<cfoutput query="get_players">
	#LastName#, #FirstName# <br>
</cfoutput>

