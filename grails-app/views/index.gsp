<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<title>Oor</title>
</head>
<body>
	<div class="row-fluid show-grid">
		<div class="span2"></div>
		<div class="span8">
			<section id="top">
				<div class="hero-unit">
					<h1>Ostéo On Rails</h1>
					<h6>Beta test !</h6>
					<p>Une nouvelle application Web pour les Ostéopathes. [Oor] est
						gratuit et simple !</p>
					<div class="span2"></div>
					<div class="span2"></div>

				</div>
			</section>
		</div>
		<div class="row-fluid show-grid">
			<div class="span12">
				<sec:ifLoggedIn>
					<g:render template="/commons/loggedInHome" />
				</sec:ifLoggedIn>
				<sec:ifNotLoggedIn>
					<g:render template="/commons/loggedOutHome" />
				</sec:ifNotLoggedIn>

			</div>
		</div>
	</div>
</body>
</html>
