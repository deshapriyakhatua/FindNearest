<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<title>Update Profile</title>
	<script type="text/javascript"
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC5Jrp9PtHe0WapppUzxbIpMDWMAcV3qE4"></script>
	<script src="https://unpkg.com/location-picker/dist/location-picker.min.js"></script>
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link href="https://fonts.googleapis.com/css2?family=Abel&display=swap" rel="stylesheet">
	
	<style>

		* {
			padding:0;
			margin: 0;
			box-sizing: border-box;
		}
		
		body {
			font-family: 'Abel', sans-serif;
		}

		.form-container {
			--theme-color: #f44177;
			display: block;
			width: 900px;
			margin: 50px auto;
			margin-left: 400px;
		}
		

		.form-container .form-horizontal {
			width: 100%;
			height: calc(100% - 10px);
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
			gap: 10px;
		}

		.form-container .form-horizontal .sub-title {
			font-size: 15px;
			font-weight: 600;
			text-transform: uppercase;
			text-align: center;
			letter-spacing: 1px;
			margin: 20px 0 25px;
			padding: 27px 0 0;
		}

		.form-horizontal .form-group {
			box-sizing: border-box;
			width: calc(90% - 10px);
			height: 40px;
			margin: 15px auto;
			display: flex;
			flex-direction: row;
			justify-content: center;
		}

		.form-horizontal .form-group label {
			box-sizing: border-box;
			width: 150px;
			height: 100%;
			color: #000000;
			font-size: 14px;
			font-weight: bold;
			line-height: 40px;
			text-align: left;
			vertical-align: middle;
			text-transform: uppercase;
			letter-spacing: 1px;
			border: 0px solid rgb(174, 174, 174);
		}

		.form-horizontal .form-control {
			box-sizing: border-box;
			width: 100%;
			height: 100%;
			padding: 0 2px;
			color: #000;
			background-color: transparent;
			font-size: 17px;
			font-weight: normal;
			letter-spacing: 1px;
			box-shadow: none;
			border: 0px solid #d1d1d1;
			border-radius: 0;
			transition: all 0.3s;
		}

		input[type=number]::-webkit-inner-spin-button, 
		input[type=number]::-webkit-outer-spin-button { 
			-webkit-appearance: none;
			-moz-appearance: none;
			appearance: none;
			margin: 0; 
		}

		.form-horizontal .form-control:focus {
			outline: none;
			color: #000000;
			border: 0px solid #0cd674;
			font-weight: bold;
		}

		.edit-icon {
			color: #8e8d8d;
			font-size: medium;
			line-height: 40px;
			text-align: left;
			vertical-align: middle;
			cursor: pointer;
		}

		.clicked-icon {
			color: #000;
		}

		.form-horizontal .btn {
			background-color: #fdb7cf;
			color: #fffdfd;
			font-size: 15px;
			font-weight: 600;
			text-transform: uppercase;
			text-align: center;
			letter-spacing: 1px;
			margin: 40px 0 0 0;
			padding: 10px 30px;
			border-width: 0;
			border-radius: 5px;
			cursor: not-allowed;
			transition: all 0.3s ease;
		}

		.form-horizontal .btn-enable {
			background-color: var(--theme-color);
			color: #ffffff;
			cursor: pointer;
		}
		
	</style>
	<style type="text/css">
		.map-section {
			width: 900px;
			height: 900px;
			display: flex;
			flex-direction: column;
			
			margin: 50px auto;
		}
		
		#map {
			width: 900px;
			height: 900px;
		}
	</style>
</head>

<body> 

	<%@ include file="navbar.html" %>
	
	<div class="form-container">
		<h1 class="title">Update Profile</h1>
		<form id="myForm" action="updateUserDetails" method="post" class="form-horizontal" spellcheck="false" >
			
			<h4 class="sub-title">Personal Details</h4>
			<div class="form-group">
				<label>Name:</label>
				<input id="name" name="name" class="form-control" type="text" value="" disabled autocomplete="off" ondrop="return false;" >
				<i class="material-icons edit-icon">edit</i>
			</div>
			<div class="form-group">
				<label>Phone:</label>
				<input id="phone" name="phone" class="form-control" type="number" value="" disabled autocomplete="off" ondrop="return false;" >
				<i class="material-icons edit-icon">edit</i>
			</div>
			<div class="form-group">
				<label>Gender:</label>
				<input id="gender" name="gender" class="form-control" type="text" value="" disabled autocomplete="off"  ondrop="return false;" >
				<i class="material-icons edit-icon">edit</i>
			</div>
			<div class="form-group">
				<label>Profession:</label>
				<input id="profession" name="profession" class="form-control" type="text" value="" disabled autocomplete="off"  ondrop="return false;" >
				<i class="material-icons edit-icon">edit</i>
			</div>
			<h4 class="sub-title">Address</h4>
			<div class="form-group phone-no">
				<label>Address:</label>
				<input id="address" name="address" class="form-control" type="text" value="" disabled autocomplete="off" ondrop="return false;" >
				<i class="material-icons edit-icon">edit</i>
			</div>
			<div class="form-group">
				<label>Prifile Pic.:</label>
				<input id="profile_pic" name="profile_pic" class="form-control" type="text" value="" disabled autocomplete="off"  ondrop="return false;" >
				<i class="material-icons edit-icon">edit</i>
			</div>
			<div class="form-group">
				<label>Cover Pic.:</label>
				<input id="cover_pic" name="cover_pic" class="form-control" type="text" value="" disabled autocomplete="off"  ondrop="return false;" >
				<i class="material-icons edit-icon">edit</i>
			</div>
			<div class="form-group">
				<label>Latitude:</label>
				<input id="latitude" name="latitude" class="form-control" type="number" step="0.000000000000001" value="" disabled autocomplete="off"  ondrop="return false;" >
				<i class="material-icons edit-icon">edit</i>
			</div>
			<div class="form-group">
				<label>Longitude:</label>
				<input id="longitude" name="longitude" class="form-control" type="number" step="0.000000000000001" value="" disabled autocomplete="off"  ondrop="return false;" >
				<i class="material-icons edit-icon">edit</i>
			</div>
			<input id="formSubmit" type="submit" class="btn" value="save changes" disabled>
		</form>
	</div>

	<br>
	<section class="map-section">
		<button id="confirmPosition">Confirm Position</button>
		<br>
		<p>On idle position: <span id="onIdlePositionView"></span></p>
		<p>On click position: <span id="onClickPositionView"></span></p>
		
		<div id="map"></div>
	</section>
	


</body>

<script>

	// prevant default form
	
	const form = document.getElementById('myForm');
    form.addEventListener('keypress', function (e) {
		if (e.keyCode === 13) {
			e.preventDefault();
		}
	});

	// //enable input on icon click
	
	enableInput();
	
	function enableInput(){
		
		for(let element of document.getElementsByClassName("edit-icon")){

			element.addEventListener("click",(elem) => {
				
				enableButton();
				
				if(elem.target.className == "material-icons edit-icon"){
					elem.target.className = "material-icons edit-icon clicked-icon";
					elem.target.parentNode.children[1].disabled = false;
					elem.target.parentNode.children[1].focus()
					 
				}else{
					elem.target.className = "material-icons edit-icon";
					elem.target.parentNode.children[1].disabled = true;
				}
				
			});
			
		}	

	}
	
	// //enable all input tags otherwise it will send null values
	
	document.getElementById("formSubmit").addEventListener("click", ()=>{
		
		for(let inputTag of document.getElementsByClassName("form-control")){
			inputTag.disabled = false;
		}
		
	});
	

	// //get user data from database and set value to input tags
	
	let user = {};

	getUserDetails();

	async function getUserDetails() {

		console.log("getUserDetails called");

		try {

			console.log("Fetch Process Initiated...");

			let res = await fetch("http://localhost:8080/findNearest/getUserDetails", {
				"headers": {
					"content-type": "application/x-www-form-urlencoded"
				},
				"body": "userid=<%= request.getAttribute("userid") %>",
				"method": "POST"
			});

			let data = await res.text();
			console.log("User : " + data);
			user = JSON.parse(data);
			sessionStorage.setItem("user", user);

			populateUser();

		}
		catch (err) {
			console.log(err);
		}

	}

	// //set input tag values
	
	function populateUser() {


		// append in user profile

		if (user.userid != undefined) {
			document.getElementById("name").value = user.name == undefined ?"Not available" :user.name;
			document.getElementById("phone").value = user.phone == undefined ?"0000000000" :user.phone;
			document.getElementById("gender").value = user.gender == undefined ?"Not available" :user.gender;
			document.getElementById("profession").value = user.profession == undefined ?"Not available" :user.profession;
			document.getElementById("address").value = user.address == undefined ?"Not available" :user.address;
			document.getElementById("profile_pic").value = user.profile_pic == undefined ?"" :user.profile_pic;
			document.getElementById("cover_pic").value = user.cover_pic == undefined ?"" :user.cover_pic;
			document.getElementById("latitude").value = user.latitude == undefined ?"00.000000" :user.latitude;
			document.getElementById("longitude").value = user.longitude == undefined ?"00.000000" :user.longitude;
		}


	}

	// // saveButton enable/disable
		
	for(let inputTag of document.getElementsByClassName("form-control")){
		
		inputTag.addEventListener("change", ()=>{
		
			enableButton();
			
		});
		
	}

	function enableButton(){
			if(document.getElementById("name").value != user.name ||
		    	document.getElementById("phone").value != user.phone ||
		    	document.getElementById("gender").value != user.gender ||
		    	document.getElementById("profession").value != user.profession ||
		    	document.getElementById("address").value != user.address ||
		    	document.getElementById("profile_pic").value != user.profile_pic ||
		    	document.getElementById("cover_pic").value != user.cover_pic ||
		    	document.getElementById("latitude").value != user.latitude ||
		    	document.getElementById("longitude").value != user.longitude){
					let button = document.getElementById("formSubmit");
					button.className = "btn btn-enable";
					button.disabled = false;
				}else{
					let button = document.getElementById("formSubmit");
					button.className = "btn";
					button.disabled = true;
				}
				console.log("input change");
	}


</script>

	<script>
		// Get element references
		var confirmBtn = document.getElementById('confirmPosition');
		var onClickPositionView = document.getElementById('onClickPositionView');
		var onIdlePositionView = document.getElementById('onIdlePositionView');
		var map = document.getElementById('map');

		// Initialize LocationPicker plugin
		var lp = new locationPicker(map, {
			setCurrentPosition: true, // You can omit this, defaults to true
			lat: 22.5,
			lng: 82
		}, {
			zoom: 5 // You can set any google map options here, zoom defaults to 15
		});

		// Listen to button onclick event
		confirmBtn.onclick = function () {
			// Get current location and show it in HTML
			var location = lp.getMarkerPosition();
			onClickPositionView.innerHTML = 'The chosen location is ' + location.lat + ',  ' + location.lng;
			document.getElementById("latitude").value = location.lat;
			document.getElementById("longitude").value = location.lng;
			enableButton();
		};

		// Listen to map idle event, listening to idle event more accurate than listening to ondrag event
		google.maps.event.addListener(lp.map, 'idle', function (event) {
			// Get current location and show it in HTML
			var location = lp.getMarkerPosition();
			onIdlePositionView.innerHTML = 'The chosen location is ' + location.lat + ',  ' + location.lng;
		});
	</script>

</html>