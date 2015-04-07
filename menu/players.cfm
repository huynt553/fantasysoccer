<!DOCTYPE html>

<html>
<head>
	<title>Fantasy Soccer</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!--- <cfsetting showDebugOutput="No"> --->
<!--- bring in style sheet --->
<link href="../resources/style_sheets/fsstyle.css" type=text/css rel=stylesheet>
<!--- bring in external javascript --->
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="../resources/js/LeagueAPI.js"></script> 
</head>
<body>

<cfinclude template="navigation.cfm">

<div id="InputSection">
	<input id="userName" />
	<input id="InputBox" type="submit" onclick="summonerLookUp();" />
	<br />
	<br />Summoner Level: <span id="sLevel"></span>
	<br />Summoner ID: <span id="sID"></span>
	<br />Wards Killed: <span id="sWardsKilled"></span>
</div>

</body>
</html>
