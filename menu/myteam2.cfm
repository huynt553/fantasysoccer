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
		<cfquery name="get_goalkeeper" datasource="soccer">
			SELECT first_name, last_name, number, t1.team, position
			FROM `#get_team_name.name#` t1
			JOIN players p ON p.last_name = t1.LastName
			WHERE position = 'Goalkeeper'
		</cfquery>
		
		<cfquery name="get_defenders" datasource="soccer">
			SELECT first_name, last_name, number, t1.team, position
			FROM `#get_team_name.name#` t1
			JOIN players p ON p.last_name = t1.LastName
			WHERE position = 'Defender'
		</cfquery>
		
		<cfquery name="get_midfielders" datasource="soccer">
			SELECT first_name, last_name, number, t1.team, position
			FROM `#get_team_name.name#` t1
			JOIN players p ON p.last_name = t1.LastName
			WHERE position = 'Midfielder'
		</cfquery>
		
		<cfquery name="get_forwards" datasource="soccer">
			SELECT first_name, last_name, number, t1.team, position
			FROM `#get_team_name.name#` t1
			JOIN players p ON p.last_name = t1.LastName
			WHERE position = 'Forward'
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
	<cfoutput query="get_goalkeeper">
		<div class="goalkeeper">
			<img src="../resources/images/playerpics/#last_name#.png" width="100px" height="100px" />
			<figcaption id="caption">#last_name#</figcaption>
		</div>
	</cfoutput>
	
	<cfset def_count = 0>
	<cfloop query="get_defenders">
		<cfoutput>
		<cfswitch expression=#def_count#>
			<cfcase value = 0>
				<div class="defender1">
					<img src="../resources/images/playerpics/#last_name#.png" width="100px" height="100px" />
					<figcaption id="caption">#last_name#</figcaption>
				</div>
				<cfset def_count += 1>
			</cfcase>
			<cfcase value = 1>
				<div class="defender2">
					<img src="../resources/images/playerpics/#last_name#.png" width="100px" height="100px" />
					<figcaption id="caption">#last_name#</figcaption>
				</div>
				<cfset def_count += 1>
			</cfcase>
			<cfcase value = 2>
				<div class="defender3">
					<img src="../resources/images/playerpics/#last_name#.png" width="100px" height="100px" />
					<figcaption id="caption">#last_name#</figcaption>
				</div>
				<cfset def_count += 1>
			</cfcase>
			<cfcase value = 3>
				<div class="defender4">
					<img src="../resources/images/playerpics/#last_name#.png" width="100px" height="100px" />
					<figcaption id="caption">#last_name#</figcaption>
				</div>
				<cfset def_count += 1>
			</cfcase>
		</cfswitch>
		</cfoutput>
	</cfloop>
	
	<cfset mid_count = 0>
	<cfloop query="get_midfielders">
		<cfoutput>
		<cfswitch expression=#mid_count#>
			<cfcase value = 0>
				<div class="midfielder1">
					<img src="../resources/images/playerpics/#last_name#.png" width="100px" height="100px" />
					<figcaption id="caption">#last_name#</figcaption>
				</div>
				<cfset mid_count += 1>
			</cfcase>
			<cfcase value = 1>
				<div class="midfielder2">
					<img src="../resources/images/playerpics/#last_name#.png" width="100px" height="100px" />
					<figcaption id="caption">#last_name#</figcaption>
				</div>
				<cfset mid_count += 1>
			</cfcase>
			<cfcase value = 2>
				<div class="midfielder3">
					<img src="../resources/images/playerpics/#last_name#.png" width="100px" height="100px" />
					<figcaption id="caption">#last_name#</figcaption>
				</div>
				<cfset mid_count += 1>
			</cfcase>
		</cfswitch>
		</cfoutput>
	</cfloop>
	
	<cfset forward_count = 0>
	<cfloop query="get_forwards">
		<cfoutput>
		<cfswitch expression=#forward_count#>
			<cfcase value = 0>
				<div class="forward1">
					<img src="../resources/images/playerpics/#last_name#.png" width="100px" height="100px" />
					<figcaption id="caption">#last_name#</figcaption>
				</div>
				<cfset forward_count += 1>
			</cfcase>
			<cfcase value = 1>
				<div class="forward2">
					<img src="../resources/images/playerpics/#last_name#.png" width="100px" height="100px" />
					<figcaption id="caption">#last_name#</figcaption>
				</div>
				<cfset forward_count += 1>
			</cfcase>
			<cfcase value = 2>
				<div class="forward3">
					<img src="../resources/images/playerpics/#last_name#.png" width="100px" height="100px" />
					<figcaption id="caption">#last_name#</figcaption>
				</div>
				<cfset forward_count += 1>
			</cfcase>
		</cfswitch>
		</cfoutput>
	</cfloop>
</div>
	
	
</cfif>

</body>
</html>
