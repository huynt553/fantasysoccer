var sumName = "";

function summonerLookUp() {
    var SUMMONER_NAME = "";
    SUMMONER_NAME = $("#userName").val();

    if (SUMMONER_NAME !== "") {

        $.ajax({
            url: 'https://na.api.pvp.net/api/lol/na/v1.4/summoner/by-name/' + SUMMONER_NAME + '?api_key=e684e379-5514-4f44-a836-bb61a7253508',
            type: 'GET',
            dataType: 'json',
            data: {

            },
            success: function (json) {
                var SUMMONER_NAME_NOSPACES = SUMMONER_NAME.replace(" ", "");

                SUMMONER_NAME_NOSPACES = SUMMONER_NAME_NOSPACES.toLowerCase().trim();

                summonerLevel = json[SUMMONER_NAME_NOSPACES].summonerLevel;
                summonerID = json[SUMMONER_NAME_NOSPACES].id;
				
			$.ajax({
				url: 'https://na.api.pvp.net/api/lol/na/v2.2/matchhistory/' + summonerID + '?api_key=e684e379-5514-4f44-a836-bb61a7253508',
				type: 'GET',
				dataType: 'json',
				data: {

				},
				success: function (json) {
					var TotalWardsKilled = 0;
					for(i = 0; i <= json.matches.length; i++) {
						TotalWardsKilled += json.matches[i].participants[0].stats.wardsKilled;
						document.getElementById("sWardsKilled").innerHTML = TotalWardsKilled;
					}
				},
				error: function (XMLHttpRequest, textStatus, errorThrown) {
					alert("error getting Summoner data!");
				}
			});

                document.getElementById("sLevel").innerHTML = summonerLevel;
                document.getElementById("sID").innerHTML = summonerID;
                
                // give sumName the Summoner Name from the json Object
                sumName = json[SUMMONER_NAME_NOSPACES].name;
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("error getting Summoner data!");
            }
        });
    } else {}
}

function Name() {
    alert(sumName);
}
