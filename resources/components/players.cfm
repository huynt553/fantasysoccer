<cfquery name="get_players" datasource="soccer">
	SELECT *
	FROM players
	WHERE last_name =  '#lastname#'
</cfquery>
<h1>Players</h1>

<cfoutput query="get_players">
<cfif #first_name# NEQ "N/A">
<b>#first_name# </b>
</cfif>
<b>#last_name# </b> - #team# - #number# - #position#
</cfoutput>

