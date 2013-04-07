<!-- NAVBAR -->
<div class="navbar navbar-inverse navbar-fixed-top">
	<div class="navbar-inner">
		<div class="container">
			<a href="${createLink(uri: '/')}" class="brand">[Oor]</a>
			<ul class="nav">
				<li
					<%= request.forwardURI == "${createLink(uri: '/')}" ? ' class="active"' : '' %>><a
					href="${createLink(uri: '/')}">Accueil</a></li>
				<li id="menu1"
					class="<%= request.forwardURI.contains("${createLink(uri: '/patient/')}") ? ' active dropdown' : 'dropdown' %>">
					<!-- TODO gérer les liens actifs --> <a class="dropdown-toggle"
					data-toggle="dropdown" href="#menu1">Patients<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><g:link url="[action:'search',controller:'patient']">Recherche </g:link>
						</li>
						<li><g:link url="[action:'create',controller:'patient']">Nouveau </g:link>
						</li>
						<li><g:link url="[action:'list',controller:'patient']">Liste </g:link>
						</li>
					</ul>
				</li>
				<sec:ifAnyGranted roles="ROLE_ADMIN">
					<li id="menu2"
						class="<%= request.forwardURI.contains("${createLink(uri: '/utilisateur/')}") ? ' active dropdown' : 'dropdown' %>">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#menu2">Utilisateurs<b
							class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><g:link url="[action:'create',controller:'utilisateur']">Nouveau </g:link>
							</li>
							<li><g:link url="[action:'list',controller:'utilisateur']">Liste </g:link>
							</li>
						</ul>
					</li>
				</sec:ifAnyGranted>
				<%--<li><a href="#">Contact</a></li>
				<li class="dropdown" id="menu2"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#menu2">Todo<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="#"> Todo </a></li>
					</ul></li>
				--%>
				<li
					<%= request.forwardURI == "${createLink(uri: '/about')}" ? ' class="active"' : '' %>>
					<a href="${createLink(uri: '/about')}">À propos</a>
				</li>
			</ul>
			<ul class="nav pull-right">
				<sec:ifLoggedIn>

					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"> <sec:username /> <b class="caret"></b>
					</a>
						<ul class="dropdown-menu">

							<li><g:link
									url="[action:'preferences',controller:'utilisateur']">Preferences </g:link></li>
							<li><g:link controller="logout">Déconnexion </g:link></li>
						</ul></li>

				</sec:ifLoggedIn>
				<sec:ifNotLoggedIn>
					<li><g:link url="[action:'auth',controller:'Login']">Connexion </g:link></li>
				</sec:ifNotLoggedIn>
			</ul>
		</div>
	</div>
</div>
