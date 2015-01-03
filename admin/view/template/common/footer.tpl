</div>
<div id="footer"><?php echo $text_footer; ?></div>
<script type="text/javascript"><!--
              function dqis_image_manager(token) {
	                $('#dialog').remove();	
	                $('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/elmanager&token=' + token + '&field=imagemanager" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');
	
	                $('#dialog').dialog({
		                title: 'Multi Image Manager',
		                close: function (event, ui) {			
		                },	
		                bgiframe: false,
		                width: 800,
		                height: 600,
		                resizable: false,
		                modal: false
	                });
                };

//--></script>
</body></html>