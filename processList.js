
var XMLHttp;

function init() {
    if(navigator.appName == "Microsoft Internet Explorer") {
	XMLHttp = new ActiveXObject("Microsoft.XMLHTTP");
    } else {
	XMLHttp = new XMLHttpRequest();
    }
}

function getProcList () {

    var uname = document.getElementById('uname').value;

    if (uname.length <= 0) uname = '.';
    XMLHttp.open("GET", "/cgi-bin/skon_processList.cgi?"
		 + "uname=" + uname
		 ,true);
    XMLHttp.onreadystatechange=function() {
	if (XMLHttp.readyState == 4) {
	    document.getElementById('response_area').innerHTML = XMLHttp.responseText;;
	}
    }
    XMLHttp.send(null);
}

var intVar;
function AutoRefresh() {

    intVar = setInterval(function(){ getProcList()}, 2000);
}

function StopRefresh() {
    clearInterval(intVar);
}
