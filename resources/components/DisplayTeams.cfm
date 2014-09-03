<cfquery name="get_players" datasource="soccer">
	SELECT *
	FROM #Team#
	JOIN players
	ON #Team#.LastName = players.last_name
	ORDER BY FIELD (position, 'Goalkeeper', 'Defender', 'Midfielder', 'Forward')
</cfquery>
<cfoutput><h1>#Team#</h1></cfoutput>
<h3>
	<cfoutput query="get_players">
		<cfif get_players.position EQ "Goalkeeper">
		Goalkeeper: #LastName#<cfif #FirstName# NEQ "N/A">, #FirstName# </cfif><br>
		<cfelseif get_players.position EQ "Defender">
		Defender: #LastName#<cfif #FirstName# NEQ "N/A">, #FirstName# </cfif> <br>
		<cfelseif get_players.position EQ "Midfielder">
		Midfielder: #LastName#<cfif #FirstName# NEQ "N/A">, #FirstName# </cfif> <br>
		<cfelseif get_players.position EQ "Forward">
		Forward: #LastName#<cfif #FirstName# NEQ "N/A">, #FirstName# </cfif> <br>
		</cfif>
	</cfoutput>
</h3>
