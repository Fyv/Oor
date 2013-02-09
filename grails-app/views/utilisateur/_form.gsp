<%@ page import="com.oor.security.Utilisateur"%>


<div
	class="fieldcontain ${hasErrors(bean: utilisateurInstance, field: 'username', 'error')} required">
	<label for="username"> <g:message
			code="utilisateur.username.label" default="Username" /> <span
		class="required-indicator">*</span>
	</label>
	<g:textField name="username" required=""
		value="${utilisateurInstance?.username}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: utilisateurInstance, field: 'nom', 'error')} ">
	<label for="nom"> <g:message
			code="utilisateur.nom.label" default="Nom" />

	</label>
	<g:textField name="nom" value="${utilisateurInstance?.nom}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: utilisateurInstance, field: 'prenom', 'error')} ">
	<label for="prenom"> <g:message code="utilisateur.prenom.label"
			default="Prenom" />

	</label>
	<g:textField name="prenom" value="${utilisateurInstance?.prenom}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: utilisateurInstance, field: 'email', 'error')} required">
	<label for="email"> <g:message code="utilisateur.email.label"
			default="Email" /> <span class="required-indicator">*</span>
	</label>
	<g:textField name="email" required=""
		value="${utilisateurInstance?.email}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: utilisateurInstance, field: 'password', 'error')} required">
	<label for="password"> <g:message
			code="utilisateur.password.label" default="Password" /> <span
		class="required-indicator">*</span>
	</label>
	<g:textField name="password" required=""
		value="${utilisateurInstance?.password}" />
</div>
<div
	class="fieldcontain ${hasErrors(bean: utilisateurInstance, field: 'accountExpired', 'error')} ">
	<label for="accountExpired" class="checkbox"> <g:checkBox
			name="accountExpired" value="${utilisateurInstance?.accountExpired}" /> <g:message
			code="user.accountExpired.label" default="Account Expired" />
	</label>
</div>

<div
	class="fieldcontain ${hasErrors(bean: utilisateurInstance, field: 'accountLocked', 'error')} ">

	<label for="accountLocked" class="checkbox"> <g:checkBox
			name="accountLocked" value="${utilisateurInstance?.accountLocked}" /> <g:message
			code="user.accountLocked.labe" default="Account Locked" />
	</label>
</div>

<div
	class="fieldcontain ${hasErrors(bean: utilisateurInstance, field: 'enabled', 'error')} ">
	<label for="enabled" class="checkbox"> <g:checkBox
			name="enabled" value="${utilisateurInstance?.enabled}" /> <g:message
			code="user.enabled.label" default="Enabled" />
	</label>
</div>

<div
	class="fieldcontain ${hasErrors(bean: utilisateurInstance, field: 'passwordExpired', 'error')} ">

	<label for="passwordExpired" class="checkbox"> <g:checkBox
			name="passwordExpired" value="${utilisateurInstance?.passwordExpired}" /> <g:message
			code="user.passwordExpired.label" default="Password Expired" />
	</label>
</div>

<div>
	<label for="authority"> <g:message code="role.authority.label"
			default="Authority" /> <span class="required-indicator">*</span></label>
	<g:select name="authority" required="" from="${roleInstanceList}"
		optionKey="id" optionValue="authority" />
</div>
<hr />