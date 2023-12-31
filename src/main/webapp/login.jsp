<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>

<style type="text/css">
* {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
	word-wrap: break-word;
	font-family: -apple-system, BlinkMacSystemFont, Segoe UI, Roboto,
		Helvetica Neue, Ubuntu, sans-serif;
}

body {
	min-height: 100%;
	background-color: #ffffff;
	--theme-color: #f44177;
}

h1 {
	letter-spacing: -1px;
}

a {
	color: var(--theme-color);
	text-decoration: unset;
}

.login-root {
	background: #fff;
	display: flex;
	width: 100%;
	min-height: 100vh;
	overflow: hidden;
}

.flex-flex {
	display: flex;
}

.align-center {
	align-items: center;
}

.box-root {
	box-sizing: border-box;
}

.flex-direction--column {
	-ms-flex-direction: column;
	flex-direction: column;
}

.padding-top--24 {
	padding-top: 24px;
}

.padding-top--48 {
	padding-top: 48px;
}

.padding-bottom--24 {
	padding-bottom: 24px;
}

.padding-horizontal--48 {
	padding: 48px;
}

.padding-bottom--15 {
	padding-bottom: 15px;
}

.flex-justifyContent--center {
	-ms-flex-pack: center;
	justify-content: center;
}

.formbg {
	margin: 0px auto;
	width: 100%;
	max-width: 448px;
	background: white;
	border-radius: 4px;
	box-shadow: rgba(60, 66, 87, 0.12) 0px 7px 14px 0px, rgba(0, 0, 0, 0.12)
		0px 3px 6px 0px;
}

span {
	display: block;
	font-size: 20px;
	line-height: 28px;
	color: #1a1f36;
}

label {
	margin-bottom: 10px;
}

.reset-pass a, label {
	font-size: 14px;
	font-weight: 600;
	display: block;
}

.reset-pass>a {
	text-align: right;
	margin-bottom: 10px;
}

.grid--50-50 {
	display: grid;
	grid-template-columns: 50% 50%;
	align-items: center;
}

.field input {
	font-size: 16px;
	line-height: 28px;
	padding: 8px 16px;
	width: 100%;
	min-height: 44px;
	border: unset;
	border-radius: 4px;
	outline-color: rgb(84 105 212/ 0.5);
	background-color: rgb(255, 255, 255);
	box-shadow: rgba(0, 0, 0, 0) 0px 0px 0px 0px, rgba(0, 0, 0, 0) 0px 0px
		0px 0px, rgba(0, 0, 0, 0) 0px 0px 0px 0px, rgba(60, 66, 87, 0.16) 0px
		0px 0px 1px, rgba(0, 0, 0, 0) 0px 0px 0px 0px, rgba(0, 0, 0, 0) 0px
		0px 0px 0px, rgba(0, 0, 0, 0) 0px 0px 0px 0px;
}

input[type="submit"] {
	background-color: var(--theme-color);
	box-shadow: rgba(0, 0, 0, 0) 0px 0px 0px 0px, rgba(0, 0, 0, 0) 0px 0px
		0px 0px, rgba(0, 0, 0, 0.12) 0px 1px 1px 0px, rgb(84, 105, 212) 0px
		0px 0px 1px, rgba(0, 0, 0, 0) 0px 0px 0px 0px, rgba(0, 0, 0, 0) 0px
		0px 0px 0px, rgba(60, 66, 87, 0.08) 0px 2px 5px 0px;
	color: #fff;
	font-weight: 600;
	cursor: pointer;
}

.field-checkbox input {
	width: 20px;
	height: 15px;
	margin-right: 5px;
	box-shadow: unset;
	min-height: unset;
}

.field-checkbox label {
	display: flex;
	align-items: center;
	margin: 0;
}

a.ssolink {
	display: block;
	text-align: center;
	font-weight: 600;
}

#status_text {
	margin-bottom: 10px;
	text-align: center;
	font-size: 18px;
	font-weight: 600;
	color: red;
}

.footer-link span {
	font-size: 14px;
	text-align: center;
}


</style>

</head>
<body>
	<%
	System.out.println("login.jsp started running...");
	%>

	<div class="login-root">
		<div class="box-root flex-flex flex-direction--column"
			style="min-height: 100vh; flex-grow: 1;">
			
			<div class="box-root padding-top--24 flex-flex flex-direction--column"
				style="flex-grow: 1; z-index: 9;">
				<div
					class="box-root padding-top--48 padding-bottom--24 flex-flex flex-justifyContent--center">
					<h1>
						<a href="" rel="">FindNearest</a>
					</h1>
				</div>
				<div class="formbg-outer">
					<div class="formbg">
						<div class="formbg-inner padding-horizontal--48">
							<span class="padding-bottom--15">Sign in to your account</span>
							<form id="stripe-login" action="login" method="post">
								<div class="field padding-bottom--24">
									<label for="email">Email</label> 
									<input type="email"	name="email">
								</div>
								<div class="field padding-bottom--24">
									<div class="grid--50-50">
										<label for="password">Password</label>
										<div class="reset-pass">
											<a href="#">Forgot your password?</a>
										</div>
									</div>
									<input type="password" name="password">
								</div>
								<div
									class="field field-checkbox padding-bottom--24 flex-flex align-center">
									
								</div>
								<div class="field padding-bottom--24">
									<input type="submit" name="submit" value="Continue">
								</div>
								<p id="status_text"><%= session.getAttribute("login_status")==null ?"" :session.getAttribute("login_status") %></p>
								<% if(session.getAttribute("login_status")!=null) session.removeAttribute("login_status"); %>
								<div class="field">
									<a class="ssolink" href="#">Use single sign-on (Google)
										instead</a>
								</div>
							</form>
						</div>
					</div>
					<div class="footer-link padding-top--24">
						<span>Don't have an account? <a href="signup.jsp">Sign up</a></span>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>