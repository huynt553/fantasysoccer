<style>
#teampic {
	float: right;
	margin-top: 10px;
	margin-right: 10px;
}
</style>

<cfquery name="get_players" datasource="soccer">
	SELECT *
	FROM players
	WHERE last_name =  '#lastname#'
</cfquery>
<cfoutput query="get_players">
	<div id="teampic">
		<cfif #team# EQ "FC Barcelona">
			<img src="../resources/images/teampics/fcbarca.png" height="40px" width="40px">
		<cfelseif #team# EQ "Real Madrid">
			<img src="../resources/images/teampics/realmadrid.png" height="40px" width="40px">
		<cfelseif #team# EQ "Manchester United">
			<img src="../resources/images/teampics/manu.png" height="40px" width="40px">
		<cfelseif #team# EQ "Chelsea">
			<img src="../resources/images/teampics/chelsea.png" height="40px" width="40px">
		<cfelseif #team# EQ "Bayern Munich">
			<img src="../resources/images/teampics/bayern.png" height="40px" width="40px">
		<cfelseif #team# EQ "Borussia Dortmund">
			<img src="../resources/images/teampics/borussia.png" height="40px" width="40px">
		<cfelseif #team# EQ "AC Milan">
			<img src="../resources/images/teampics/acmilan.png" height="40px" width="40px">
		<cfelseif #team# EQ "Arsenal">
			<img src="../resources/images/teampics/arsenal.png" height="40px" width="40px">
		</cfif>
	</div>
	<h2><cfif #first_name# NEQ "N/A">#first_name#</cfif> #last_name#</h2>
</cfoutput>

<cfoutput query="get_players">
#team# - ###number# - #position#
</cfoutput>

