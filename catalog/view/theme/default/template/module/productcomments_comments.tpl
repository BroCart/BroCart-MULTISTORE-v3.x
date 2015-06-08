<?php if (!empty($pcComments)) {
	foreach ($pcComments as $q) { ?>
	<div class="content">
		<div class="comment-header">
	    	<span class="comment-name"><?php echo htmlspecialchars($q['name']); ?></span>
	    	<span class="comment-date"><?php echo date('d/m/Y',$q['create_time']); ?></span>
	    </div>
	    <div class="comment-content">
		    <?php echo nl2br($q['comment']); ?>
	    </div>
	</div>
	<?php }  ?>
	<div class="pagination"><?php echo $pagination; ?></div>	
<?php } else { ?>
	<div class="content"><?php echo $pc_no_comments_yet; ?></div>
<?php } ?>