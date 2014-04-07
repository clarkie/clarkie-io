	<cfif structKeyExists(form,"username") and structKeyExists(form,"password") and len(trim(form.username)) and len(trim(form.password))>

		<!--- hack --->
		<cfquery name="getUser" datasource="clarkiei_main">
			SELECT id FROM user where username = <cfqueryparam value="#form.username#" cfsqltype="cf_sql_varchar"> and password = <cfqueryparam value="#form.password#" cfsqltype="cf_sql_varchar">
		</cfquery>

		<cfif getUser.recordcount>
			<cfset session.loggedIn = true>

			<cflocation addtoken="false" url="/admin/">
		</cfif>

	</cfif>

	<html>
		<head>
			<link rel="stylesheet" href="/css/bootstrap.min.css">
		</head>

	<body>
		<div class="container">
	        <div id="loginbox" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">

	<form method="post">
	<fieldset>

	<!-- Form Name -->
	<legend>Login</legend>

	<!-- Text input-->
	<div class="control-group">
	  <label class="control-label" for="username">Username</label>
	  <div class="controls">
	    <input id="username" name="username" type="text" placeholder="Username" class="input-xlarge" required="">

	  </div>
	</div>

	<!-- Password input-->
	<div class="control-group">
	  <label class="control-label" for="password">Password</label>
	  <div class="controls">
	    <input id="password" name="password" type="password" placeholder="Password" class="input-xlarge" required="">

	  </div>
	</div>

	<!-- Button -->
	<div class="control-group">
	  <label class="control-label" for="submit"></label>
	  <div class="controls">
	    <button id="submit" name="submit" class="btn btn-default">Login</button>
	  </div>
	</div>

	</fieldset>
	</form>
	</div>
	</div>
	</body>
	</html>