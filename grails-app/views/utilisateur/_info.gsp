<dl>


	<g:if test="${utilisateurInstance?.username}">
		<dt id="username-label" class="property-label">
			<g:message code="user.username.label" default="Username" />
		</dt>
		<dd class="property-value" aria-labelledby="username-label">
			<g:fieldValue bean="${utilisateurInstance}" field="username" />
		</dd>
	</g:if>

	<g:if test="${utilisateurInstance?.nom}">
		<dt id="nom-label" class="property-label">
			<g:message code="utilisateur.nom.label" default="Nom" />
		</dt>
		<dd class="property-value" aria-labelledby="nom-label">
			<g:fieldValue bean="${utilisateurInstance}" field="nom" />
		</dd>
	</g:if>

	<g:if test="${utilisateurInstance?.prenom}">

		<dt id="prenom-label" class="property-label">
			<g:message code="utilisateur.prenom.label" default="Prenom" />
		</dt>
		<dd class="property-value" aria-labelledby="prenom-label">
			<g:fieldValue bean="${utilisateurInstance}" field="prenom" />
			</d>
	</g:if>
	<g:if test="${utilisateurInstance?.email}">
		<dt id="email-label" class="property-label">
			<g:message code="utilisateur.email.label" default="Email" />
		</dt>

		<dd class="property-value" aria-labelledby="email-label">
			<g:fieldValue bean="${utilisateurInstance}" field="email" />
		</dd>
	</g:if>

	<g:if test="${utilisateurInstance?.password}">
		<dt id="password-label" class="property-label">
			<g:message code="user.password.label" default="Password" />
		</dt>
		<dd class="property-value" aria-labelledby="password-label">
			<g:fieldValue bean="${utilisateurInstance}" field="password" />
		</dd>
	</g:if>

	<g:if test="${utilisateurInstance?.dateCreated}">
		<dt id="dateCreated-label" class="property-label">
			<g:message code="utilisateur.dateCreated.label"
				default="Date Created" />
		</dt>
		<dd class="property-value" aria-labelledby="dateCreated-label">
			<g:formatDate date="${utilisateurInstance?.dateCreated}" />
		</dd>
	</g:if>

	<g:if test="${utilisateurInstance?.lastUpdated}">
		<dt id="lastUpdated-label" class="property-label">
			<g:message code="utilisateur.lastUpdated.label"
				default="Last Updated" />
		</dt>
		<dd class="property-value" aria-labelledby="lastUpdated-label">
			<g:formatDate date="${utilisateurInstance?.lastUpdated}" />
		</dd>
	</g:if>

	<g:if test="${utilisateurInstance?.accountExpired}">
		<dt id="accountExpired-label" class="property-label">
			<g:message code="user.accountExpired.label" default="Account Expired" />
		</dt>
		<dd class="property-value" aria-labelledby="accountExpired-label">
			<g:formatBoolean boolean="${utilisateurInstance?.accountExpired}" />
		</dd>
	</g:if>

	<g:if test="${utilisateurInstance?.accountLocked}">
		<dt id="accountLocked-label" class="property-label">
			<g:message code="user.accountLocked.label" default="Account Locked" />
		</dt>
		<dd class="property-value" aria-labelledby="accountLocked-label">
			<g:formatBoolean boolean="${utilisateurInstance?.accountLocked}" />
		</dd>
	</g:if>

	<g:if test="${utilisateurInstance?.enabled}">
		<dt id="enabled-label" class="property-label">
			<g:message code="user.enabled.label" default="Enabled" />
		</dt>
		<dd class="property-value" aria-labelledby="enabled-label">
			<g:formatBoolean boolean="${utilisateurInstance?.enabled}" />
		</dd>
	</g:if>

	<g:if test="${utilisateurInstance?.passwordExpired}">
		<dt id="passwordExpired-label" class="property-label">
			<g:message code="user.passwordExpired.label"
				default="Password Expired" />
		</dt>

		<dd class="property-value" aria-labelledby="passwordExpired-label">
			<g:formatBoolean boolean="${utilisateurInstance?.passwordExpired}" />
		</dd>
	</g:if>


	<g:if test="${utilisateurInstance?.authorities }">
		<dt>Role</dt>
		<dd>
			${utilisateurInstance?.authorities.authority }
		</dd>
	</g:if>

</dl>