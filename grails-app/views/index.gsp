<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Asset List</title>
	</head>
	<body>
    <table id="asset-list" class="display" cellspacing="0" width="100%">
        <thead>
        <tr>
            <th>Code</th>
            <th>Name</th>
            <th>Type</th>
            <th>Status</th>
            <th>Location</th>
        </tr>
        </thead>

        <tfoot>
        <tr>
            <th>Code</th>
            <th>Name</th>
            <th>Type</th>
            <th>Status</th>
            <th>Location</th>
        </tr>
        </tfoot>
    </table>
    <script type="text/javascript" charset="utf-8">
        $(document).ready(function() {
            App.initTable($('#asset-list'), "asset");
        } );

        $('#asset-list').removeClass( 'display' ).addClass('table table-striped table-bordered');
    </script>
	</body>
</html>
