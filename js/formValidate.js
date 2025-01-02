
function validateForm(event) {
	var bio = document.getElementById("bio").value;
	var password = document.getElementById("password").value;
	var confirmPassword = document.getElementById("confirm-password").value;
	
	// Clear previous error messages
	var errorMessage = "";
	
	// Bio validation
	if (bio.length > 500) {
		errorMessage += "Bio must be less than 500 characters.\n";
	}
	
	// Password validation
	if (password.length < 5) {
	  	errorMessage += "Password must be at least 5 characters long.\n";
	}
	
	// Confirm password validation
	if (password !== confirmPassword) {
	  	errorMessage += "Passwords do not match.\n";
	}
	
	
	if (errorMessage !== "") {
	  	event.preventDefault();  
	  	alert(errorMessage);   
	  	return false;
	}
	
	return true;
	
}
