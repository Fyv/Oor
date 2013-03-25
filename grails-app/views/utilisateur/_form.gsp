<%@ page import="com.oor.security.Utilisateur"%>

<div class="control-group">
	<div
		class="fieldcontain ${hasErrors(bean: utilisateurInstance, field: 'username', 'error')} required">
		<label class="control-label" for="username"> <g:message
				code="utilisateur.username.label" default="Username" /> <span
			class="required-indicator">*</span>
		</label>
		<div class="controls">
			<g:textField name="username" required=""
				value="${utilisateurInstance?.username}" />
		</div>
	</div>
</div>
<div class="control-group">
	<div
		class="fieldcontain ${hasErrors(bean: utilisateurInstance, field: 'nom', 'error')} ">
		<label class="control-label" for="nom"> <g:message
				code="utilisateur.nom.label" default="Nom" />

		</label>
		<div class="controls">
			<g:textField name="nom" value="${utilisateurInstance?.nom}" />
		</div>
	</div>
</div>
<div class="control-group">

	<div
		class="fieldcontain ${hasErrors(bean: utilisateurInstance, field: 'prenom', 'error')} ">
		<label class="control-label" for="prenom"> <g:message
				code="utilisateur.prenom.label" default="Prenom" />

		</label>
		<div class="controls">
			<g:textField name="prenom" value="${utilisateurInstance?.prenom}" />
		</div>
	</div>
</div>
<div class="control-group">

	<div
		class="fieldcontain ${hasErrors(bean: utilisateurInstance, field: 'email', 'error')} required">
		<label class="control-label" for="email"> <g:message
				code="utilisateur.email.label" default="Email" /> <span
			class="required-indicator">*</span>
		</label>
		<div class="controls">
			<g:textField name="email" required=""
				value="${utilisateurInstance?.email}" />
		</div>
	</div>
</div>
<div class="control-group">

	<div
		class="fieldcontain ${hasErrors(bean: utilisateurInstance, field: 'password', 'error')} required">
		<label class="control-label" for="password"> <g:message
				code="utilisateur.password.label" default="Password" /> <span
			class="required-indicator">*</span>
		</label>
		<div class="controls">
			<g:passwordField name="password" required=""
				value="${utilisateurInstance?.password}" />
		</div>
	</div>
</div>
<sec:ifAllGranted roles="ROLE_ADMIN">
	<div class="control-group">
		<div
			class="fieldcontain ${hasErrors(bean: utilisateurInstance, field: 'accountExpired', 'error')} ">
			<div class="controls">
				<label for="accountExpired" class="checkbox"> <g:checkBox
						name="accountExpired"
						value="${utilisateurInstance?.accountExpired}" /> <g:message
						code="user.accountExpired.label" default="Account Expired" />
				</label>
			</div>
		</div>
	</div>
	<div class="control-group">
		<div
			class="fieldcontain ${hasErrors(bean: utilisateurInstance, field: 'accountLocked', 'error')} ">
			<div class="controls">
				<label for="accountLocked" class="checkbox"> <g:checkBox
						name="accountLocked" value="${utilisateurInstance?.accountLocked}" />
					<g:message code="user.accountLocked.labe" default="Account Locked" />
				</label>
			</div>
		</div>
	</div>
	<div class="control-group">

		<div
			class="fieldcontain ${hasErrors(bean: utilisateurInstance, field: 'enabled', 'error')} ">
			<div class="controls">
				<label for="enabled" class="checkbox"> <g:checkBox
						name="enabled" value="${utilisateurInstance?.enabled}" /> <g:message
						code="user.enabled.label" default="Enabled" />
				</label>
			</div>
		</div>
	</div>
	<div class="control-group">

		<div
			class="fieldcontain ${hasErrors(bean: utilisateurInstance, field: 'passwordExpired', 'error')} ">
			<div class="controls">
				<label for="passwordExpired" class="checkbox"> <g:checkBox
						name="passwordExpired"
						value="${utilisateurInstance?.passwordExpired}" /> <g:message
						code="user.passwordExpired.label" default="Password Expired" />
				</label>
			</div>
		</div>
	</div>
	<div class="control-group">

		<div class="controls">
			<label for="authority"> <g:message
					code="role.authority.label" default="Authority" /> <span
				class="required-indicator">*</span></label>
			<g:select name="authority" required="" from="${roleInstanceList}"
				optionKey="id" optionValue="authority" />
		</div>
	</div>
</sec:ifAllGranted>
<hr />