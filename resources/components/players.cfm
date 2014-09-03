<cfquery name="get_players" datasource="soccer">
	SELECT *
	FROM players
	WHERE last_name =  '#lastname#'
</cfquery>
<cfoutput query="get_players">
	<h2><cfif #first_name# NEQ "N/A">#first_name#</cfif> #last_name#</h2>
</cfoutput>

<cfoutput query="get_players">
#team# - ###number# - #position#
</cfoutput>

