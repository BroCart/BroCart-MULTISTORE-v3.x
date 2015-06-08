<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN"
   "http://www.w3.org/TR/html4/strict.dtd">

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

	<script type="text/javascript" src="view/javascript/jquery/jquery-1.7.1.min.js"></script>
	<script src="../admin/elfinder/jquery/jquery-ui-1.8.18.custom.min.js" type="text/javascript" charset="utf-8"></script>
	<link rel="stylesheet" href="../admin/elfinder/jquery/ui-themes/smoothness/jquery-ui-1.8.18.custom.css" type="text/css" media="screen" title="no title" charset="utf-8">

	<link rel="stylesheet" href="../admin/elfinder/css/common.css"      type="text/css" media="screen" charset="utf-8">
	<link rel="stylesheet" href="../admin/elfinder/css/dialog.css"      type="text/css" media="screen" charset="utf-8">
	<link rel="stylesheet" href="../admin/elfinder/css/toolbar.css"     type="text/css" media="screen" charset="utf-8">
	<link rel="stylesheet" href="../admin/elfinder/css/navbar.css"      type="text/css" media="screen" charset="utf-8">
	<link rel="stylesheet" href="../admin/elfinder/css/statusbar.css"   type="text/css" media="screen" charset="utf-8">
	<link rel="stylesheet" href="../admin/elfinder/css/contextmenu.css" type="text/css" media="screen" charset="utf-8">
	<link rel="stylesheet" href="../admin/elfinder/css/cwd.css"         type="text/css" media="screen" charset="utf-8">
	<link rel="stylesheet" href="../admin/elfinder/css/quicklook.css"   type="text/css" media="screen" charset="utf-8">
	<link rel="stylesheet" href="../admin/elfinder/css/commands.css"    type="text/css" media="screen" charset="utf-8">
	
	<link rel="stylesheet" href="../admin/elfinder/css/theme.css"       type="text/css" media="screen" charset="utf-8">
	
	<!-- elfinder core -->
	<script src="../admin/elfinder/js/elFinder.js" type="text/javascript" charset="utf-8"></script>
	<script src="../admin/elfinder/js/elFinder.version.js"   type="text/javascript" charset="utf-8"></script>
	<script src="../admin/elfinder/js/jquery.elfinder.js"    type="text/javascript" charset="utf-8"></script>
	<script src="../admin/elfinder/js/elFinder.resources.js" type="text/javascript" charset="utf-8"></script>
	<script src="../admin/elfinder/js/elFinder.options.js"   type="text/javascript" charset="utf-8"></script>
	<script src="../admin/elfinder/js/elFinder.history.js"   type="text/javascript" charset="utf-8"></script>
	<script src="../admin/elfinder/js/elFinder.command.js"   type="text/javascript" charset="utf-8"></script>
	
	<!-- elfinder ui -->
	<script src="../admin/elfinder/js/ui/overlay.js"       type="text/javascript" charset="utf-8"></script>
	<script src="../admin/elfinder/js/ui/workzone.js"      type="text/javascript" charset="utf-8"></script>
	<script src="../admin/elfinder/js/ui/navbar.js"        type="text/javascript" charset="utf-8"></script>
	<script src="../admin/elfinder/js/ui/dialog.js"        type="text/javascript" charset="utf-8"></script>
	<script src="../admin/elfinder/js/ui/tree.js"          type="text/javascript" charset="utf-8"></script>
	<script src="../admin/elfinder/js/ui/cwd.js"           type="text/javascript" charset="utf-8"></script>
	<script src="../admin/elfinder/js/ui/toolbar.js"       type="text/javascript" charset="utf-8"></script>
	<script src="../admin/elfinder/js/ui/button.js"        type="text/javascript" charset="utf-8"></script>
	<script src="../admin/elfinder/js/ui/uploadButton.js"  type="text/javascript" charset="utf-8"></script>
	<script src="../admin/elfinder/js/ui/viewbutton.js"    type="text/javascript" charset="utf-8"></script>
	<script src="../admin/elfinder/js/ui/searchbutton.js"  type="text/javascript" charset="utf-8"></script>
	<script src="../admin/elfinder/js/ui/sortbutton.js"    type="text/javascript" charset="utf-8"></script>
	<script src="../admin/elfinder/js/ui/panel.js"         type="text/javascript" charset="utf-8"></script>
	<script src="../admin/elfinder/js/ui/contextmenu.js"   type="text/javascript" charset="utf-8"></script>
	<script src="../admin/elfinder/js/ui/path.js"          type="text/javascript" charset="utf-8"></script>
	<script src="../admin/elfinder/js/ui/stat.js"          type="text/javascript" charset="utf-8"></script>
	<script src="../admin/elfinder/js/ui/places.js"        type="text/javascript" charset="utf-8"></script>
	
	<!-- elfinder commands -->
	<script src="../admin/elfinder/js/commands/back.js"      type="text/javascript" charset="utf-8"></script>
	<script src="../admin/elfinder/js/commands/forward.js"   type="text/javascript" charset="utf-8"></script>
	<script src="../admin/elfinder/js/commands/reload.js"    type="text/javascript" charset="utf-8"></script>
	<script src="../admin/elfinder/js/commands/up.js"        type="text/javascript" charset="utf-8"></script>
	<script src="../admin/elfinder/js/commands/home.js"      type="text/javascript" charset="utf-8"></script>
	<script src="../admin/elfinder/js/commands/copy.js"      type="text/javascript" charset="utf-8"></script>
	<script src="../admin/elfinder/js/commands/cut.js"       type="text/javascript" charset="utf-8"></script>
	<script src="../admin/elfinder/js/commands/paste.js"     type="text/javascript" charset="utf-8"></script>
	<script src="../admin/elfinder/js/commands/open.js"      type="text/javascript" charset="utf-8"></script>
	<script src="../admin/elfinder/js/commands/rm.js"        type="text/javascript" charset="utf-8"></script>
	<script src="../admin/elfinder/js/commands/info.js"      type="text/javascript" charset="utf-8"></script>
	<script src="../admin/elfinder/js/commands/duplicate.js" type="text/javascript" charset="utf-8"></script>
	<script src="../admin/elfinder/js/commands/rename.js"    type="text/javascript" charset="utf-8"></script>
	<script src="../admin/elfinder/js/commands/help.js"      type="text/javascript" charset="utf-8"></script>
	<script src="../admin/elfinder/js/commands/getfile.js"   type="text/javascript" charset="utf-8"></script>
	<script src="../admin/elfinder/js/commands/mkdir.js"     type="text/javascript" charset="utf-8"></script>
	<script src="../admin/elfinder/js/commands/mkfile.js"    type="text/javascript" charset="utf-8"></script>
	<script src="../admin/elfinder/js/commands/upload.js"    type="text/javascript" charset="utf-8"></script>
	<script src="../admin/elfinder/js/commands/download.js"  type="text/javascript" charset="utf-8"></script>
	<script src="../admin/elfinder/js/commands/edit.js"      type="text/javascript" charset="utf-8"></script>
	<script src="../admin/elfinder/js/commands/quicklook.js" type="text/javascript" charset="utf-8"></script>
	<script src="../admin/elfinder/js/commands/quicklook.plugins.js" type="text/javascript" charset="utf-8"></script>
	<script src="../admin/elfinder/js/commands/extract.js"   type="text/javascript" charset="utf-8"></script>
	<script src="../admin/elfinder/js/commands/archive.js"   type="text/javascript" charset="utf-8"></script>
	<script src="../admin/elfinder/js/commands/search.js"    type="text/javascript" charset="utf-8"></script>
	<script src="../admin/elfinder/js/commands/view.js"      type="text/javascript" charset="utf-8"></script>
	<script src="../admin/elfinder/js/commands/resize.js"    type="text/javascript" charset="utf-8"></script>
	<script src="../admin/elfinder/js/commands/sort.js"      type="text/javascript" charset="utf-8"></script>		
    <script src="../admin/elfinder/js/commands/selectforproduct.js"      type="text/javascript" charset="utf-8"></script>		

	<!-- elfinder languages -->
	<script src="../admin/elfinder/js/i18n/elfinder.en.js"    type="text/javascript" charset="utf-8"></script>	

	<!-- elfinder dialog -->
	<script src="../admin/elfinder/js/jquery.dialogelfinder.js"     type="text/javascript" charset="utf-8"></script>

	<!-- elfinder 1.x connector API support -->
	<script src="../admin/elfinder/js/proxy/elFinderSupportVer1.js" type="text/javascript" charset="utf-8"></script>

	<!-- elfinder custom extenstions -->
	<!--<script src="../admin/elfinder/extensions/jplayer/elfinder.quicklook.jplayer.js" type="text/javascript" charset="utf-8"></script>-->
	
	<!-- elfinder common javascript -->
	
	<script type="text/javascript" src="view/javascript/common2.js"></script>
	<style type="text/css">
		body { font-family:arial, verdana, sans-serif;}
		.button {
			width: 100px;
			position:relative;
			display: -moz-inline-stack;
			display: inline-block;
			vertical-align: top;
			zoom: 1;
			*display: inline;
			margin:0 3px 3px 0;
			padding:1px 0;
			text-align:center;
			border:1px solid #ccc;
			background-color:#eee;
			margin:1em .5em;
			padding:.3em .7em;
			border-radius:5px; 
			-moz-border-radius:5px; 
			-webkit-border-radius:5px;
			cursor:pointer;
		}
		
/*		#dialog {
			position:absolute;
			left:50%;
			top:1000px;
		}
*/		
	</style>

	<script type="text/javascript" charset="utf-8">
     $().ready(function() {
         var keyField = "field";
         var valueField = getQuerystring(keyField, null);

         if(valueField == "imagemanager") {
             $('#finder').elfinder({
                 url: '../admin/elfinder/php/connector.php?field=imagemanager',
                 lang: 'en',
                 resizable: 'false',
                 commands: [
          	                                'open', 'reload', 'home', 'up', 'back', 'forward', 'getfile', 'quicklook',
          	                                'download', 'rm', 'duplicate', 'rename', 'mkdir', 'mkfile', 'upload', 'copy',
          	                                'cut', 'paste', 'edit', 'extract', 'archive', 'search', 'info', 'view', 'help',
          	                                'resize', 'sort'
                              ],
                 contextmenu: {
                     // navbarfolder menu
                     navbar: ['open', '|', 'copy', 'cut', 'paste', 'duplicate', '|', 'rm', '|', 'info'],

                     // current directory menu
                     cwd: ['reload', 'back', '|', 'upload', 'mkdir', 'mkfile', 'paste', '|', 'info'],

                     // current directory file menu
                     files: [
          		                    'getfile', '|', 'open', 'quicklook', '|', 'download', '|', 'copy', 'cut', 'paste', 'duplicate', '|',
          		                    'rm', '|', 'edit', 'rename', 'resize', '|', 'archive', 'extract', '|', 'info'
          	                    ]
                 },
                });
            } else {
             $('#finder').elfinder({
                 url: '../admin/elfinder/php/connector.php',
                 lang: 'ru',
                 resizable: 'false',
                 commands: [
          	                                'open', 'reload', 'home', 'up', 'back', 'forward', 'getfile', 'quicklook',
          	                                'download', 'rm', 'duplicate', 'rename', 'mkdir', 'mkfile', 'upload', 'copy',
          	                                'cut', 'paste', 'edit', 'extract', 'archive', 'search', 'info', 'view', 'help',
          	                                'resize', 'sort', 'selectforproduct'
                              ],
                 contextmenu: {
                     // navbarfolder menu
                     navbar: ['open', '|', 'copy', 'cut', 'paste', 'duplicate', '|', 'rm', '|', 'info'],

                     // current directory menu
                     cwd: ['reload', 'back', '|', 'upload', 'mkdir', 'mkfile', 'paste', '|', 'info'],

                     // current directory file menu
                     files: [
          		                    'getfile', '|', 'open', 'quicklook', '|', 'download', '|', 'copy', 'cut', 'paste', 'duplicate', '|',
          		                    'rm', '|', 'edit', 'rename', 'resize', '|', 'archive', 'extract', '|', 'info', '|', 'selectforproduct'
          	                    ]
                 },
                });
             }

         })
		
		

		
	</script>
<script type="text/javascript">
    <?php
		require_once('../admin/config.php');
		echo "var imageDir = \"".DIR_IMAGE."\"";
    ?>
</script>

</head>
<body>	
		<div id="finder"></div>	
</body>
</html>
