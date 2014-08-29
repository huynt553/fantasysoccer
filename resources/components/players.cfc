<cfcomponent displayname="Players" hint="ColdFusion Component for Players">
 <!--- This function retrieves all customers from the database --->
 <cffunction name="retrievePlayers"
	hint="Gets a player(s) from the database" returntype="query">
   <cfquery name="getPlayers" datasource="soccer">
	 SELECT last_name 
	 FROM players 
	 WHERE player_id = 10
   </cfquery>
   <cfreturn getPlayers>
 </cffunction>
</cfcomponent>