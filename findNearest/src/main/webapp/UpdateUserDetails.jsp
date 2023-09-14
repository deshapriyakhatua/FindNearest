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
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Abel&display=swap" rel="stylesheet">
	
	<style>

		* {
			background-color: rgb(255, 255, 255);
			font-family: 'Abel', sans-serif;
		}

		.form-container {
			--theme-color: #f44177;
			position: relative;
			display: flex;
			width: 80%;
			height: 850px;
			margin: 80px auto;
		}

		.form-container .form-horizontal {
			position: relative;
			top: 50%;
			left: 50%;
			-webkit-transform: translate(-50%, -50%);
			transform: translate(-50%, -50%);
			width: calc(100% - 10px);
			height: calc(100% - 10px);
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
		}

		.form-container .form-horizontal .title {
			box-sizing: border-box;
			height: 70px;
			color: #333;
			font-size: 24px;
			font-weight: 600;
			line-height: 75px;
			text-align: center;
			vertical-align: middle;
			text-transform: uppercase;
			letter-spacing: 0.5px;
			margin: 0;
		}

		.form-container .form-horizontal .sub-title {
			font-size: 15px;
			font-weight: 600;
			text-transform: uppercase;
			text-align: center;
			letter-spacing: 1px;
			margin: 20px 0 25px;
			padding: 27px 0 0;
			border-bottom: 1px solid #9e9c9c;
		}

		.form-horizontal .form-group {
			box-sizing: border-box;
			width: calc(80% - 10px);
			height: 40px;
			margin: 15px auto;
			display: flex;
			flex-direction: row;
			justify-content: center;
			border-width: 0 0 1px 0;
			border-style: solid;
			border-color: #dcdada;
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
		#map {
			width: 100%;
			height: 480px;
		}
	</style>
</head>

<body>

	<%@ include file="navbar.html" %>
	
	<div class="form-container">
		<form id="myForm" action="updateUserDetails" method="post" class="form-horizontal" spellcheck="false" >
			<h3 class="title">Update Profile</h3>
			<h4 class="sub-title">Personal Details</h4>
			<div class="form-group">
				<label>Name:</label>
				<input id="name" name="name" class="form-control" type="text" value="" disabled autocomplete="off" onpaste="return false;" ondrop="return false;" >
				<i class="material-icons edit-icon">edit</i>
			</div>
			<div class="form-group">
				<label>Phone:</label>
				<input id="phone" name="phone" class="form-control" type="number" value="" disabled autocomplete="off" onpaste="return false;" ondrop="return false;" >
				<i class="material-icons edit-icon">edit</i>
			</div>
			<div class="form-group">
				<label>Gender:</label>
				<input id="gender" name="gender" class="form-control" type="text" value="" disabled autocomplete="off" onpaste="return false;" ondrop="return false;" >
				<i class="material-icons edit-icon">edit</i>
			</div>
			<div class="form-group">
				<label>Profession:</label>
				<input id="profession" name="profession" class="form-control" type="text" value="" disabled autocomplete="off" onpaste="return false;" ondrop="return false;" >
				<i class="material-icons edit-icon">edit</i>
			</div>
			<h4 class="sub-title">Address</h4>
			<div class="form-group phone-no">
				<label>Address:</label>
				<input id="address" name="address" class="form-control" type="text" value="" disabled autocomplete="off" onpaste="return false;" ondrop="return false;" >
				<i class="material-icons edit-icon">edit</i>
			</div>
			<div class="form-group age">
				<label>Latitude:</label>
				<input id="latitude" name="latitude" class="form-control" type="number" step="0.00000000001" value="" disabled autocomplete="off" onpaste="return false;" ondrop="return false;" >
				<i class="material-icons edit-icon">edit</i>
			</div>
			<div class="form-group age">
				<label>Longitude:</label>
				<input id="longitude" name="longitude" class="form-control" type="number" step="0.00000000001" value="" disabled autocomplete="off" onpaste="return false;" ondrop="return false;" >
				<i class="material-icons edit-icon">edit</i>
			</div>
			<input id="formSubmit" type="submit" class="btn" value="save changes" disabled>
		</form>
	</div>

	<br>
	<button id="confirmPosition">Confirm Position</button>
	<br>
	<p>On idle position: <span id="onIdlePositionView"></span></p>
	<p>On click position: <span id="onClickPositionView"></span></p>
	
	<div id="map"></div>


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
			lat: 21.940570,
			lng: 87.347965
		}, {
			zoom: 15 // You can set any google map options here, zoom defaults to 15
		});

		// Listen to button onclick event
		confirmBtn.onclick = function () {
			// Get current location and show it in HTML
			var location = lp.getMarkerPosition();
			onClickPositionView.innerHTML = 'The chosen location is ' + location.lat + ',' + location.lng;
			document.getElementById("latitude").value = location.lat;
			document.getElementById("longitude").value = location.lng;
			
		};

		// Listen to map idle event, listening to idle event more accurate than listening to ondrag event
		google.maps.event.addListener(lp.map, 'idle', function (event) {
			// Get current location and show it in HTML
			var location = lp.getMarkerPosition();
			onIdlePositionView.innerHTML = 'The chosen location is ' + location.lat + ',' + location.lng;
		});
	</script>

</html>