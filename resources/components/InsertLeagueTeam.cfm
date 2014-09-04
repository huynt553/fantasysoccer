<html>
<head>
<body>

<!--- This will create the tables on the database --->
<cftry>
	<cfquery name="CreateTable" datasource="soccer">
		CREATE TABLE <cfoutput>#TeamName#</cfoutput>
		(
			player_id int,
			LastName varchar(255),
			FirstName varchar(255),
			Team varchar(255)
		); 
	</cfquery>
	
	<cfcatch>
		<p>Team already exists!</p>
	</cfcatch>
</cftry>

<cfoutput>
	<p>#LastName#</p>
	<cfset NewLastName = #Replace(LastName, ',','',"all")#>
	<p>#NewLastName#</p>
	<cfquery name="GetPlayer" datasource="soccer">
		SELECT * 
		FROM players
		WHERE last_name = "#NewLastName#"
	</cfquery>
	<cfquery name="InsertPlayer" datasource="soccer">
		INSERT INTO #TeamName# (player_id, LastName, FirstName, Team)
		VALUES ('#GetPlayer.player_id#', '#GetPlayer.last_name#', '#GetPlayer.first_name#', '#GetPlayer.team#')
	</cfquery>
	
	<cfquery name="UpdateDraftStatus" datasource="soccer">
		UPDATE players
		SET drafted = 'Y'
		WHERE last_name = "#NewLastName#"
	</cfquery>
	
</cfoutput>

Updating Database...

<cflocation url="../../menu/draft.cfm?counter=#counter#">

</body>
</head>
</html>
