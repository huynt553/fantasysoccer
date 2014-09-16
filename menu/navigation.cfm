<cfinclude template="../resources/components/Application.cfm">


<div id="header">
	<cfquery name="get_user_id" datasource="soccer">
		SELECT username
		FROM users
		WHERE user_id = #Session.user_id#
	</cfquery>

	<cfoutput>
		<div id="login_corner">
			Logged in as #get_user_id.username#
		</div>
	</cfoutput>
</div>


<div id="navigation">
	<cfif #find("league",CGI.PATH_TRANSLATED)# IS NOT 0>
		<div class="activelink"><a href="league.cfm">League</a></div>
	<cfelse>
		<div><a href="league.cfm">League</a></div>
	</cfif>
	
	<cfif #find("myteam",CGI.PATH_TRANSLATED)# IS NOT 0>
		<div class="activelink"><a href="myteam.cfm">My Team</a></div>
	<cfelse>
		<div><a href="myteam.cfm">My Team</a></div>
	</cfif>
	
	<cfif #find("matchup",CGI.PATH_TRANSLATED)# IS NOT 0>
		<div class="activelink"><a href="matchup.cfm">Matchup</a></div>
	<cfelse>
		<div><a href="matchup.cfm">Matchup</a></div>
	</cfif>
	
	<cfif #find("players",CGI.PATH_TRANSLATED)# IS NOT 0>
		<div class="activelink"><a href="players.cfm">Players</a></div>
	<cfelse>
		<div><a href="players.cfm">Players</a></div>
	</cfif>
	
	<cfif #find("draft",CGI.PATH_TRANSLATED)# IS NOT 0>
		<div class="activelink"><a href="draft.cfm">Draft</a></div>
	<cfelse>
		<div><a href="draft.cfm">Draft</a></div>
	</cfif>
	
	<cfif #find("create",CGI.PATH_TRANSLATED)# IS NOT 0>
		<div class="activelink"><a href="create_team.cfm">Create Team</a></div>
	<cfelse>
		<div><a href="create_team.cfm">Create Team</a></div>
	</cfif>
</div>