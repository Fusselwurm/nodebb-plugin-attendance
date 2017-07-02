<h1><i class="fa {faIcon}"></i> {name}</h1>

<form role="form" class="{nbbId}-settings">
	<fieldset>
		<div class="row">
			<div class="col-sm-12">
				<div class="form-group">
					<label for="allowed-categories">restrict to a number of category IDs. Comma separated integers pl0x!</label>
					<input placeholder="" type="text" class="form-control" id="allowed-categories" name="allowed-categories" />
				</div>
			</div>
		</div>
		<hr />
		<button class="btn btn-lg btn-primary" id="save" type="button">Save</button>
	</fieldset>
</form>

<script type="text/javascript">
    require(['settings'], function(Settings) {
        var nbbId = '{nbbId}',
            klass = nbbId + '-settings',
            wrapper = $('.' + klass);

        Settings.load(nbbId, wrapper);

        wrapper.find('#save').on('click', function(e) {
            e.preventDefault();
            Settings.save(nbbId, wrapper, function() {
                socket.emit('admin.restart');
            });
        });


    });
</script>
