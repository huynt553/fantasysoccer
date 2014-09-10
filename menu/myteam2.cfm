<!DOCTYPE html>

<html>
<head>
	<title>Fantasy Soccer</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!--- <cfsetting showDebugOutput="No"> --->
<!--- bring in style sheet --->
<link href="../resources/style_sheets/fsstyle.css" type=text/css rel=stylesheet>
<link href="../resources/style_sheets/field.css" type=text/css rel=stylesheet>
<script>
function goBack() {
    window.history.back()
}
</script>
</head>
<body>
<div id="header"></div>

<cfinclude template="navigation.cfm">

<cfquery name="get_user_info" datasource="soccer">
	SELECT user_id 
	FROM users 
	WHERE (username = '#Username#' AND password = '#Password#')
</cfquery>

<cfif #get_user_info.RecordCount# EQ 0>
	<p>No username/password combination found. Please try again.</p>
	<button onclick="goBack()">Go Back</button>
<cfelse>
	<cfquery name="get_team_name" datasource="soccer">
		SELECT name
		FROM teams t
		JOIN users u on t.user_id = u.user_id
		WHERE t.user_id = #get_user_info.user_id#
	</cfquery>
	
	<cfoutput query="get_team_name">
		<h1>#name#</h1>
	</cfoutput>
	
	<cfoutput>
		<cfquery name="get_team_players" datasource="soccer">
			SELECT first_name, last_name, number, t1.team, position
			FROM `#get_team_name.name#` t1
			JOIN players p ON p.last_name = t1.LastName
			ORDER BY FIELD (position, 'Goalkeeper', 'Defender', 'Midfielder', 'Forward')
		</cfquery>
	</cfoutput>
	
	<!--- <cfoutput query="get_team_players">
		<cfif get_team_players.position EQ "Goalkeeper">
		Goalkeeper: #last_name#<cfif #first_name# NEQ "N/A">, #first_name# </cfif><br>
		<cfelseif get_team_players.position EQ "Defender">
		Defender: #last_name#<cfif #first_name# NEQ "N/A">, #first_name# </cfif> <br>
		<cfelseif get_team_players.position EQ "Midfielder">
		Midfielder: #last_name#<cfif #first_name# NEQ "N/A">, #first_name# </cfif> <br>
		<cfelseif get_team_players.position EQ "Forward">
		Forward: #last_name#<cfif #first_name# NEQ "N/A">, #first_name# </cfif> <br>
		</cfif>
	</cfoutput> --->
	
<div class="parent">
<img src="../resources/images/field.jpg" />
	<div class="goalkeeper">
		<img src="../resources/images/playerpics/neuer.png" width="100px" height="100px" />
		<figcaption style="text-align: center;">Neuer</figcaption>
	</div>
</div>
	
	
</cfif>

</body>
</html>
