<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<script>
    function AllowAlphabet() {
		if (!ureg.fname.value.match(/^[a-zA-Z]+$/) && ureg.fname.value != "") {
			ureg.fname.value = "";
			ureg.fname.focus();
			alert("Please Enter only alphabets in First Name");
		}
		
		if (!ureg.lname.value.match(/^[a-zA-Z]+$/) && ureg.lname.value != "") {
			ureg.lname.value = "";
			ureg.lname.focus();
			alert("Please Enter only alphabets in Last Name");
		}

	}

    
	function validEmail() 
	{
		var mail = document.ureg.email.value;
		if (mail == "") 
		{
			ureg.email.value= "";
			alert("Please insert Email Address");

			return false;
		}
		if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(mail)) {
		} else 
		{
			ureg.email.value= "";
			alert("Email Address is Not Valid");

			return false;
		}
	}
	function Validate() 
	{
		var y = document.ureg.contact.value;

		if (y.charAt(0)!="7"&&y.charAt(0)!="8"&&y.charAt(0)!="9" ) 
        {
			ureg.contact.value = "";
			 alert("Invalide Start Digit");
             return false;
        } 
		
		if (isNaN(y) || y.indexOf(" ") != -1) {

			ureg.contact.value = "";
			alert("Enter Only Numeric value");
			return false;
		}
		if (y.length != 10) 
		{
			ureg.contact.value = "";
			alert("Enter 10 Number");
			return false;
		}

		if (!y.match(/^[0-9]+$/) && y != "") {
			y = "";
			
			ureg.contact.value = "";
			ureg.contact.focus();
			alert("Enter only Digits");
		}

	}

	
	function validuaernameandpass() {
	      var pass = document.ureg.password.value;
	       if (pass != "") 
			{
				if (pass.length < 6) 
				{
					document.ureg.password="";
					alert("Password must contain at least 6 characters!");
					return false;
				}
			}
	       else
	    	   {
	    	   	document.ureg.password="";
				alert("Please Insert password");
				
				return false;
	    	   
	    	   }
		}
</script>

<body>

</body>
</html>