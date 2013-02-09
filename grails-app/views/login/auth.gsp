<html>
<head>
<meta name='layout' content='mainlite' />
<title><g:message code="springSecurity.login.title" /></title>
</head>

<body>
	<div class="container">
		<div class="row-fluid">
			<div class="span2"></div>
			<section id="main" class="span8">
				<div class="hero-unit">
					<div class="span2"></div>
					<div class="span8">
						<h1>Ostéo On Rails</h1>
						<h6>Beta test !</h6>
					</div>
					<div class="row-fluid">
						<div class="span3"></div>
						<div class="span6">
							<h2>Connectez-vous !</h2>
							<div id='login'>
								<div class='inner'>
									<small>
										<g:if test='${flash.message}'>
											<div class="alert alert-error">
												<button type="button" class="close" data-dismiss="alert">&times;</button>
												<div class='login_message'>
													${flash.message}
												</div>
											</div>
										</g:if>
									</small>
									<form action='${postUrl}' method='POST' id='loginForm'
										class='cssform' autocomplete='off'>
										<p>
											<label for='username'><g:message
													code="springSecurity.login.username.label" />:</label> <input
												type='text' class='text_' name='j_username' id='username' />
										</p>

										<p>
											<label for='password'><g:message
													code="springSecurity.login.password.label" />:</label> <input
												type='password' class='text_' name='j_password'
												id='password' />
										</p>

										<p id="remember_me_holder">
											<input type='checkbox' class='chk'
												name='${rememberMeParameter}' id='remember_me'
												<g:if test='${hasCookie}'>checked='checked'</g:if> /> <label
												for='remember_me'><g:message
													code="springSecurity.login.remember.me.label" /></label>
										</p>

										<p>
											<input type='submit' id="submit"
												value='${message(code: "springSecurity.login.button")}' />
										</p>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
	<script type='text/javascript'>
	<!--
		(function() {
			document.forms['loginForm'].elements['j_username'].focus();
		})();
	// -->
	</script>
</body>
</html>
