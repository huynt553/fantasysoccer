<!--- This will create the tables on the database --->
<cftry>
	<cfquery name="CreateTable" datasource="soccer">
		CREATE TABLE <cfoutput>#TeamName#</cfoutput>
		(
			PersonID int,
			LastName varchar(255),
			FirstName varchar(255),
			Address varchar(255),
			City varchar(255)
		); 
	</cfquery>
	
	<cfcatch>
		<p>Team already exists!</p>
	</cfcatch>
</cftry>

<cflocation url="../../menu/draft.cfm?counter=#counter#">
