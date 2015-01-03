<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>  
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/seo.jpg" alt="" /> <?php echo $heading_title; ?></h1>
    </div>
    <div class="content">
      <div class="overview" style="width: 100%;">
        <div class="dashboard-heading"></div>
        <!--div class="dashboard-content"--> 
        <table class="list" style="width: 49%;float: left;">
		<thead style="border: 1px solid #003A88;">
		<tr>
		<td colspan="3"><?php echo $heading_products; ?></td>
		</tr>
		</thead>
			<tbody style="border: 1px solid #003A88;">
			<?php foreach ($languages as $language) { ?>
				<tr>
					<td><?php echo $text_title; ?></td>
					<td><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" style="float: left;" />
						<input style="width: 340px;" type="text" id="category<?php echo $language['language_id']; ?>" name="categories" value="">
					</td>
					<td>
						<a onclick="category('<?php echo $language['language_id']; ?>');" class="button"><?php echo $text_generate; ?></a>
					</td>
				</tr>
			<?php } ?>
			<?php foreach ($languages as $language) { ?>
				<tr>
					<td><?php echo $text_h1; ?></td>
					<td><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" style="float: left;" />
						<input style="width: 340px;" type="text" id="categoryh1<?php echo $language['language_id']; ?>" name="categoriesh1" value="">
					</td>
					<td>
						<a onclick="categoryh1('<?php echo $language['language_id']; ?>');" class="button"><?php echo $text_generate; ?></a>
					</td>
				</tr>
			<?php } ?>
			<?php foreach ($languages as $language) { ?>
				<tr>
					<td><?php echo $text_meta_kw; ?></td>
					<td><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" style="float: left;" />
						<input style="width: 340px;" type="text" id="categorykey<?php echo $language['language_id']; ?>" name="categorieskey" value="">
					</td>
					<td>
						<a onclick="categorykey('<?php echo $language['language_id']; ?>');" class="button"><?php echo $text_generate; ?></a>
					</td>
				</tr>
			<?php } ?>
			<?php foreach ($languages as $language) { ?>
				<tr>
					<td><?php echo $text_meta_desc; ?></td>
					<td><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" style="float: left;" />
						<input style="width: 340px;" type="text" id="categorydesc<?php echo $language['language_id']; ?>" name="categoriesdesc" value="">
					</td>
					<td>
						<a onclick="categorydesc('<?php echo $language['language_id']; ?>');" class="button"><?php echo $text_generate; ?></a>
					</td>
				</tr>
			<?php } ?>	
				<tr>
					<td colspan="3"><?php echo $text_pattern_pro; ?></td>
				</tr>
				<tr>
					<td>SEO-URL</td>
					<td>
						<?php echo $text_seo_rewr; ?><input id="seokeyw" type="checkbox" name="seo_rewrite" >
					</td>
					<td>
						<a onclick="seokeyw();" class="button"><?php echo $text_generate; ?></a>
					</td>
				</tr>
				<tr>
					<td colspan="3"><center><span style="color: red;"><?php echo $text_seo_warn; ?></span></center></td>
				</tr>
			</tbody>
		</table>
		<!--categories-->		
		<table class="list" style="width: 49%;float: right;">
		<thead style="border: 1px solid #003A88;">
		<tr>
		<td colspan="3"><?php echo $heading_categ; ?></td>
		</tr>
		</thead>
			<tbody style="border: 1px solid #003A88;">
			<?php foreach ($languages as $language) { ?>
				<tr>
					<td><?php echo $text_title; ?></td>
					<td><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" style="float: left;" />
						<input style="width: 340px;" type="text" id="product<?php echo $language['language_id']; ?>" name="product" value="">
					</td>
					<td>
						<a onclick="product('<?php echo $language['language_id']; ?>');" class="button"><?php echo $text_generate; ?></a>
					</td>
				</tr>
			<?php } ?>
			<?php foreach ($languages as $language) { ?>
				<tr>
					<td><?php echo $text_h1; ?></td>
					<td><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" style="float: left;" />
						<input style="width: 340px;" type="text" id="producth1<?php echo $language['language_id']; ?>" name="producth1" value="">
					</td>
					<td>
						<a onclick="producth1('<?php echo $language['language_id']; ?>');" class="button"><?php echo $text_generate; ?></a>
					</td>
				</tr>
			<?php } ?>
			<?php foreach ($languages as $language) { ?>
				<tr>
					<td><?php echo $text_meta_kw; ?></td>
					<td><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" style="float: left;" />
						<input style="width: 340px;" type="text" id="productkey<?php echo $language['language_id']; ?>" name="productkey" value="">
					</td>
					<td>
						<a onclick="productkey('<?php echo $language['language_id']; ?>');" class="button"><?php echo $text_generate; ?></a>
					</td>
				</tr>
			<?php } ?>
			<?php foreach ($languages as $language) { ?>
				<tr>
					<td><?php echo $text_meta_desc; ?></td>
					<td><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" style="float: left;" />
						<input style="width: 340px;" type="text" id="productdesc<?php echo $language['language_id']; ?>" name="productdesc" value="">
					</td>
					<td>
						<a onclick="productdesc('<?php echo $language['language_id']; ?>');" class="button"><?php echo $text_generate; ?></a>
					</td>
				</tr>
			<?php } ?>	
				<tr>
					<td colspan="3"><?php echo $text_pattern_cat; ?></td>
				</tr>
				<tr>
					<td>SEO-URL</td>
					<td>
						<?php echo $text_seo_rewr; ?><input id="seokeyp" type="checkbox" name="seo_rewrite" >
					</td>
					<td>
						<a onclick="seokeyp();" class="button"><?php echo $text_generate; ?></a>
					</td>
				</tr>
				<tr>
					<td colspan="3"><center><span style="color: red;"><?php echo $text_seo_warn; ?></span></center></td>
				</tr>
			</tbody>
		</table>
		<table class="list" style="width: 49%;float: left;">
		<thead style="border: 1px solid #003A88;">
		<tr>
		<td colspan="3"><?php echo $heading_manuf; ?></td>
		</tr>
		</thead>
			<tbody style="border: 1px solid #003A88;">
				<tr>
					<td>SEO-URL</td>
					<td>
						<?php echo $text_seo_rewr; ?><input id="seomanuf" type="checkbox" name="seo_rewrite" >
					</td>
					<td>
						<a onclick="seomanuf();" class="button"><?php echo $text_generate; ?></a>
					</td>
				</tr>
			</tbody>
		</table>
		<table class="list" style="width: 49%;float: right;">
		<thead style="border: 1px solid #003A88;">
		<tr>
		<td colspan="3"><?php echo $heading_info; ?></td>
		</tr>
		</thead>
			<tbody style="border: 1px solid #003A88;">
				<tr>
					<td>SEO-URL</td>
					<td>
						<?php echo $text_seo_rewr; ?><input id="seoinfo" type="checkbox" name="seo_rewrite" >
					</td>
					<td>
						<a onclick="seoinfo();" class="button"><?php echo $text_generate; ?></a>
					</td>
				</tr>
			</tbody>
		</table>
		<!--end_categories-->
       <!--/div-->
      </div>     
    </div>
  </div>
</div>
<!--[if IE]>
<script type="text/javascript" src="view/javascript/jquery/flot/excanvas.js"></script>
<![endif]--> 
<script type="text/javascript"><!--
function seomanuf() {
	var keyw = $("#seomanuf").is(':checked') ? 1 : 0;
	console.log(keyw)
	$.ajax({
		url: 'index.php?route=common/seogen/seomanuf&token=<?php echo $token; ?>',//		
		type: 'post',
		data: 'keyw_id=' + keyw,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning').remove();
			if (json['success']) {
				$('.dashboard-heading').before('<div class="success" style="display: none;">' + json['success'] + '</div>');
				$('.success').fadeIn('slow').delay(1500).fadeOut('fast');				
			}
			
		}
	});
};
function seoinfo() {
	var keyw = $("#seoinfo").is(':checked') ? 1 : 0;
	console.log(keyw)
	$.ajax({
		url: 'index.php?route=common/seogen/seoinfo&token=<?php echo $token; ?>',//		
		type: 'post',
		data: 'keyw_id=' + keyw,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning').remove();
			if (json['success']) {
				//$("#category").attr('value', '');
				$('.dashboard-heading').before('<div class="success" style="display: none;">' + json['success'] + '</div>');
				$('.success').fadeIn('slow').delay(1500).fadeOut('fast');				
			}
			
		}
	});
};
function category(lang) {
	$.ajax({
		url: 'index.php?route=common/seogen/cat&token=<?php echo $token; ?>',//		
		type: 'post',
		data: 'cat_id=' + $("#category" + lang).attr('value') + '&lang=' + lang,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning').remove();
			if (json['success']) {
				$("#category" + lang).attr('value', '');
				$('.dashboard-heading').before('<div class="success" style="display: none;">' + json['success'] + '</div>');
				$('.success').fadeIn('slow').delay(1500).fadeOut('fast');				
			}
			
		}
	});
};
function categoryh1(lang) {
	$.ajax({
		url: 'index.php?route=common/seogen/cat&token=<?php echo $token; ?>',//		
		type: 'post',
		data: 'cath1_id=' + $("#categoryh1" + lang).attr('value')  + '&lang=' + lang,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning').remove();
			if (json['success']) {
				$("#categoryh1" + lang).attr('value', '');
				$('.dashboard-heading').before('<div class="success" style="display: none;">' + json['success'] + '</div>');
				$('.success').fadeIn('slow').delay(1500).fadeOut('fast');				
			}
			
		}
	});
};
function categorykey(lang) {
	$.ajax({
		url: 'index.php?route=common/seogen/cat&token=<?php echo $token; ?>',//		
		type: 'post',
		data: 'catkey_id=' + $("#categorykey" + lang).attr('value') + '&lang=' + lang,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning').remove();
			if (json['success']) {
				$("#categorykey" + lang).attr('value', '');
				$('.dashboard-heading').before('<div class="success" style="display: none;">' + json['success'] + '</div>');
				$('.success').fadeIn('slow').delay(1500).fadeOut('fast');				
			}
			
		}
	});
};
function categorydesc(lang) {
	$.ajax({
		url: 'index.php?route=common/seogen/cat&token=<?php echo $token; ?>',//		
		type: 'post',
		data: 'catdesc_id=' + $("#categorydesc" + lang).attr('value') + '&lang=' + lang,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning').remove();
			if (json['success']) {
				$("#categorydesc" + lang).attr('value', '');
				$('.dashboard-heading').before('<div class="success" style="display: none;">' + json['success'] + '</div>');
				$('.success').fadeIn('slow').delay(1500).fadeOut('fast');				
			}
			
		}
	});
};
function seokeyw() {
	var keyw = $("#seokeyw").is(':checked') ? 1 : 0;
	console.log(keyw)
	$.ajax({
		url: 'index.php?route=common/seogen/keyw&token=<?php echo $token; ?>',//		
		type: 'post',
		data: 'keyw_id=' + keyw,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning').remove();
			if (json['success']) {
				//$("#category").attr('value', '');
				$('.dashboard-heading').before('<div class="success" style="display: none;">' + json['success'] + '</div>');
				$('.success').fadeIn('slow').delay(1500).fadeOut('fast');				
			}
			
		}
	});
};
//categ
function product(lang) {
	$.ajax({
		url: 'index.php?route=common/seogen/pro&token=<?php echo $token; ?>',//		
		type: 'post',
		data: 'pro_id=' + $("#product" + lang).attr('value') + '&lang=' + lang,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning').remove();
			if (json['success']) {
				$("#product" + lang).attr('value', '');
				$('.dashboard-heading').before('<div class="success" style="display: none;">' + json['success'] + '</div>');
				$('.success').fadeIn('slow').delay(1500).fadeOut('fast');				
			}
			
		}
	});
};
function producth1(lang) {
	$.ajax({
		url: 'index.php?route=common/seogen/pro&token=<?php echo $token; ?>',//		
		type: 'post',
		data: 'proh1_id=' + $("#producth1" + lang).attr('value')  + '&lang=' + lang,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning').remove();
			if (json['success']) {
				$("#producth1" + lang).attr('value', '');
				$('.dashboard-heading').before('<div class="success" style="display: none;">' + json['success'] + '</div>');
				$('.success').fadeIn('slow').delay(1500).fadeOut('fast');				
			}
			
		}
	});
};
function productkey(lang) {
	$.ajax({
		url: 'index.php?route=common/seogen/pro&token=<?php echo $token; ?>',//		
		type: 'post',
		data: 'prokey_id=' + $("#productkey" + lang).attr('value') + '&lang=' + lang,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning').remove();
			if (json['success']) {
				$("#productkey" + lang).attr('value', '');
				$('.dashboard-heading').before('<div class="success" style="display: none;">' + json['success'] + '</div>');
				$('.success').fadeIn('slow').delay(1500).fadeOut('fast');				
			}
			
		}
	});
};
function productdesc(lang) {
	$.ajax({
		url: 'index.php?route=common/seogen/pro&token=<?php echo $token; ?>',//		
		type: 'post',
		data: 'prodesc_id=' + $("#productdesc" + lang).attr('value') + '&lang=' + lang,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning').remove();
			if (json['success']) {
				$("#productdesc" + lang).attr('value', '');
				$('.dashboard-heading').before('<div class="success" style="display: none;">' + json['success'] + '</div>');
				$('.success').fadeIn('slow').delay(1500).fadeOut('fast');				
			}
			
		}
	});
};
function seokeyp() {
	var keyw = $("#seokeyp").is(':checked') ? 1 : 0;
	console.log(keyw)
	$.ajax({
		url: 'index.php?route=common/seogen/keyp&token=<?php echo $token; ?>',//		
		type: 'post',
		data: 'keyp_id=' + keyw,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning').remove();
			if (json['success']) {
				//$("#category").attr('value', '');
				$('.dashboard-heading').before('<div class="success" style="display: none;">' + json['success'] + '</div>');
				$('.success').fadeIn('slow').delay(1500).fadeOut('fast');				
			}
			
		}
	});
};
//--></script> 
<?php echo $footer; ?>