<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.abc.termproject.controller.*"%>   
<% NavigationController control = new NavigationController(); %> 
<%@page import="com.abc.termproject.utils.*"%>   
<%  DatabaseUtility db = new DatabaseUtility(); %> 
<%  ReadUtilityCSV readCSVFile = new ReadUtilityCSV(); %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Admin Page</title>
	<link rel="stylesheet" href="./adminstyle.css">
</head>
<body>
<h1>Welcome <%= db.getUserFullName(control.getCurrentUser()) %></h1>
<!--  
<button class="ReadUtilityCSV" onclick="executeReadCSV()"> Invoice </button>
<script>
function executeReadCSV() {
    if (event.target === document.querySelector('.ReadUtilityCSV')) {
        <% //readCSVFile.readCSV(); %>
    }
}
</script>
-->

<!-- Currently this button only opens the file directory, script will be moved in a future push, this was for basic testing -->
<button id="readCSV" type="button">Upload Invoice</button>
<script>
	const readCSV = document.getElementById("readCSV");
	readCSV.addEventListener("click", function(e) {
		window.showDirectoryPicker({
			startIn: 'desktop'
		});
	});
</script>


<button class="logout" onclick="window.location.href='http://localhost:8080/login'">Log Out</button>
<div class="row">
	<div class="column1">
		<p>Deliveries for [Today's Date]</p>
		<ul id="delivListBuilder" style="list-style-type: none">   
		</ul>
	</div>
	<div class="column2" id="column2" style="display:none">
	</div>
	<script>
    const list = ["Delivery 1", "Delivery 2", "Delivery 3", "Delivery 4"];

    let text = "";
    for (let i = 0; i < list.length; i++) {
    	text += "<li><a href=\"#column2\" onclick=\"showDelivView(" + i + ")\">" + list[i] + "</a></li>";
    }

    document.getElementById("delivListBuilder").innerHTML = text;
    </script>
    <script>
    
    
    function showDelivView(i) {
        const list = ["1 Banana", "2 Banana", "3 Banana", "4 Banana"];
        
        var x = document.getElementById("column2");
        if (x.style.display === "none") {
            x.style.display = "block";
            
            let text = "<p>Invoice information for Delivery " + (i + 1) +
            "</p><ul style=\"list-style-type: none\"><li>" + list[i] +
            "</li></ul><button class=\"cancel\" onclick=\"\">Cancel Delivery</button><button class=\"verify\" onclick=\"\">Verify Delivery</button>";
            
            document.getElementById("column2").innerHTML = text;
            
        } else {
            x.style.display = "none";
        }
    }
    </script>
</div>
</body>
</html>