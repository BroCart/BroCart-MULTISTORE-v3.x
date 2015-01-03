<div id="informations">
  <h2><?php echo $heading_title; ?></h2>
					<div class="content">
					<?php foreach ($informations as $information) { ?>
					 <?php if ($information['image']) { ?>
						<img src="<?php echo $information['image']; ?>" alt="<?php echo $information['title']; ?>" title="<?php echo $information['title']; ?>"/>
					<?php } ?>
						<div class="caption">
							<a href="<?php echo $information['href']; ?>" title="<?php echo $information['href']; ?>"><h3><?php echo $information['title']; ?></h3></a>
							<p><?php echo $information['description']; ?></p>
						</div>
						<?php } ?>
						<!--p><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></p-->
                        <!--p><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></p-->
					</div>
  </div>

