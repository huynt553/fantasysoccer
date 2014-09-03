<!DOCTYPE html>

<html>
<head>
	<title>Fantasy Soccer</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!--- <cfsetting showDebugOutput="No"> --->
<!--- bring in style sheet --->
<link href="../resources/style_sheets/fsstyle.css" type=text/css rel=stylesheet>
</head>
<script type='text/javascript' src='http://code.jquery.com/jquery-1.8.3.js'></script>
<script type='text/javascript'>//<![CDATA[
$(window).load(function(){
$('select.changeStatus').change(function(){

    // You can access the value of your select field using the .val() method
	/*var str = $('#currentteam').html();
	var res = str.replace("<h1>Current team is", "");
	var team = res.replace("</h1>", "");*/
	
	var team = $('select.changeStatus').val();
	
	$.ajax({
		type: "GET",
		url: "../resources/components/DisplayTeams.cfm?Team="+team,
		cache: false,
		success: function(data){
		$("#teamdisplay").html(data);
		},
	});

});
$(function () {
    $('table tr').click(function () {
        var LastName = $(this).children('td:eq(0)').html();
        var FirstName = $(this).children('td:eq(1)').html();
        var Team = $(this).children('td:eq(2)').html();
        var Position = $(this).children('td:eq(3)').html();
		
		$.ajax({
		  type: "GET",
		  url: "../resources/components/players.cfm?lastname="+LastName,
		  cache: false,
		  success: function(data){
			$("#playerdetails").html(data);
		  },
		});
		
		$('#playerpicture').html(
				"<img src='../resources/images/playerpics/"+LastName+".png' width='100%' height='100%'/>"
		);
		
		// Replace source
		$('img').error(function(){
				$(this).attr('src', '../resources/images/genericphoto.png');
		});
		
		$('input[name="LastName"]').val(LastName);
		
		/*$('#playerstats').html(
            'First Name: ' + FirstName + '<br />' +
            'Last Name: ' + LastName + '<br />' + 
            'Team: ' + Team + '<br />' + 
            'Position: ' + Position + '<br />'
        );*/
		
    });        
});
});//]]>  

</script>
<body>
<div id="header"></div>

<cfinclude template="navigation.cfm">

<div id="wrapper">
	<form id="draftform" name="myform" onsubmit="" action="../resources/components/InsertLeagueTeam.cfm">
	<input type="hidden" name="lastname">
	<div id="currentteam">
		<cfoutput>
			<cfif isDefined("url.counter")>
				<cfquery name = "get_teams" datasource="soccer">
					SELECT *
					FROM teams
					WHERE rankorder = #counter#
				</cfquery>
					<h1>Current team is #get_teams.name#</h1>
			<cfelse>
				<cfset counter = 1>
				<cfquery name = "get_teams" datasource="soccer">
					SELECT *
					FROM teams
					WHERE rankorder = 1
				</cfquery>
					<h1>Current team is #get_teams.name#</h1>
			</cfif>
		</cfoutput>
	</div>
	
	<cfoutput>
			<cfif isDefined("url.counter")>
				<cfquery name = "get_teams" datasource="soccer">
					SELECT *
					FROM teams
					WHERE rankorder = #counter#
				</cfquery>
					<cfset counter += 1>
					<cfif #counter# GT "8">
						<cfset counter = 1>
					</cfif>
					<input type="hidden" value="#counter#" name="counter" id="count">
			<cfelse>
				<cfset counter = 1>
				<cfquery name = "get_teams" datasource="soccer">
					SELECT *
					FROM teams
					WHERE rankorder = 1
				</cfquery>
					<cfset counter += 1>
					<input type="hidden" value="#counter#" name="counter" id="count">
			</cfif>
	</cfoutput>	
		
	<div id="playerlist">
	
		<cfquery name="get_players" datasource="soccer">
			SELECT * 
			FROM players
			ORDER BY last_name
		</cfquery>
		
		<div class="CSSTableGenerator">
			<table>
					<tr>
						<th>Last Name</th>
						<th>First Name</th>
						<th>Team</th>
						<th>Position</th>
					</tr>
						<cfoutput query="get_players">
							<tr>
								<td>#last_name#</td>
								<td>#first_name#</td>
								<td>#team#</td>
								<td>#position#</td>
							</tr>
						</cfoutput>
			</table>
		</div>
		
	</div>
	
	<div id="playerinfo">
		<div id="playerpicture">
		</div>
		
		<div id="playerdetails">
		</div>
		
		<div id="playerstats">
		</div>
		<input type="submit" value="Draft" name="send" id="send" >
	</div>
	
	<div id="teaminfo">
		<div id="teamselect">
			<cfquery name="get_list_teams" datasource="soccer">
				SELECT * 
				FROM teams
			</cfquery>
			<select class="changeStatus" name="changeStatus" id="selectBox">
					<option selected="selected" disabled="disabled">Select a team</option>
			<cfoutput query="get_list_teams">
					<option value="#name#">#name#</option>
			</cfoutput>
			</select>
		</div>
		
		<div id="teamdisplay">
		</div>
	</div>
	
</div>	
	<cfoutput>
		<input type="hidden" name="TeamName" value="#get_teams.name#">
		<input type="hidden" name="LastName">
	</cfoutput>
</form>
		

</body>
</html>
