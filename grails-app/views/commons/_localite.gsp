<g:hiddenField name="localiteId" id="localiteId" value="${localiteInstance?.id}"></g:hiddenField>

<div class="control-group">
	<div>
		<label class="control-label" for="ville"> <g:message
				code="localite.ville.label" default="Ville" />

		</label>
		<div class="controls">
			<input type="text" data-provide="typeahead" name="ville" id="ville"
				autocomplete='off' value="${localiteInstance?.ville}" >
		</div>
	</div>
</div>

<div class="control-group">
	<div>
		<label class="control-label" for="cp"> <g:message
				code="localite.cp.label" default="CP" />
		</label>
		<div class="controls">
			<input class="uneditable-input" type="text"
				data-provide="typeahead" name="cp" id="cp" autocomplete='off' value="${localiteInstance?.cp}">
		</div>
	</div>
</div>

<script>
	$('#ville').typeahead({
		minLength: 3,
		source: function (query, process) {
		    localites = [];
		    map = {};

		    ${remoteFunction(controller:'localite',action:'complist', 
				params:'\'ville=\'+document.getElementById(\'ville\').value'
				, onSuccess: 'update(data)'
				)};

			function update(e) {
				// The response comes back as a bunch-o-JSON

				$.each(e, function (i, localite) {
			        map[localite.ville] = localite;
			        localites.push(localite.ville);	

			        process(localites);
			    });
			}	
		},
		updater: function (item) {
			$('input[name=localiteId]').val(map[item].id);
			$('input[name=cp]').val(map[item].cp);

			  return item;
		}
	});

</script>