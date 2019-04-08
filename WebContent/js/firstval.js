function getdate()
{
	var d = new Date();
	alert(d);
	return d.getDate()+"/"+d.getMonth()+"/"+d.getFullYear();
}

function myFunction() {
    var x = document.getElementById("myDIV");
    if (x.style.display === "none") {
        x.style.display = "block";
    } else {
        x.style.display = "none";
    }
}
