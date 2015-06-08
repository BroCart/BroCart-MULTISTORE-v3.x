<style>
.dropdown-menu {
    background: <?php echo $config['color_Main'];?>;
}
.dropdown-menu a, .dropdown-menu a:link, .dropdown-menu a:visited {
    text-decoration: none;
    color: <?php echo $config['text_main'];?>;
    padding: 5px 9px;
}
.dropdown-menu-children a, .dropdown-menu-children a:link, .dropdown-menu-children a:visited {
    text-decoration: none;
    color: <?php echo $config['text_main'];?>;
    padding: 5px 9px;
	min-width: 150px;
}

.dropdown-menu-child a, .dropdown-menu-child a:link, .dropdown-menu-child a:visited {
    text-decoration: none;
    color: <?php echo $config['text_main'];?>;
    padding: 5px 9px;
	min-width: 150px;
}

.dropdown-menu a:hover, .dropdown-menu li.dropdown-menu-hover > a {
    background-color: <?php echo $config['color_sub'];?>;
	color: <?php echo $config['Text_sub'];?>;
}
.dropdown-menu li:hover,
.dropdown-menu li.dropdown-menu-hover {
    background: #e0e2e2;
}
.dropdown-menu ul {
    border: 1px solid #c4c7c8;
    background: <?php echo $config['color_Main'];?>;
}
.dropdown-menu ul li:hover,
.dropdown-menu ul li.dropdown-menu-hover {
    background: <?php echo $config['color_Main'];?>;
}

.dropdown-menu-shadow {
    -webkit-box-shadow: 3px 3px 2px rgba(0, 0, 0, 0.3);
    -moz-box-shadow: 3px 3px 2px rgba(0, 0, 0, 0.3);
    -ms-box-shadow: 3px 3px 2px rgba(0, 0, 0, 0.3);
    -o-box-shadow: 3px 3px 2px rgba(0, 0, 0, 0.3);
    box-shadow: 3px 3px 3px <?php echo $config['color_sub'];?>;
}

.dropdown-menu {
    white-space: nowrap;
    display: inline-block;
    /* IE7 inline-block fix */
    *display: inline;
    *zoom: 1;
}
.dropdown-menu,
.dropdown-menu ul {
    margin: 0;
    padding: 0;
    list-style: none;
}
.dropdown-menu ul {
    display: none;
    position: absolute;
    z-index: 1000000;
}
.dropdown-menu ul ul {
    top: 0;
    left: 100%;
}
.dropdown-menu li {
    margin: 0;
    padding: 0;
    display: inline-block;
    /* IE7 inline-block and padding fix */
    *display: inline;
    *zoom: 1;
    *vertical-align: bottom;
}
.dropdown-menu li a {
    display: block;
}
.dropdown-menu ul li {
    position: relative;
    display: block;
}

/* Optional submenu arrows */
span.dropdown-menu-sub-indicator {
    margin-left: .4em;
    display: inline-block;
    vertical-align: baseline;
    /* Image Replacement */
    /*background-color: <?php echo $config['color_Main'];?>;*/
    /*background-image: url('./catalog/view/javascript/jquery/dropmenu/arrows-000000.png');
    background-repeat: no-repeat;
    background-position: 0 -100px;*/
    width: 10px;
    height: 10px;
    border: 0;
	/*float:right;*/
    overflow: hidden;
    /* IE7 image replacement fix */
    *text-indent: -9999px;
    /* IE7 inline-block fix */
    *display: inline;
    *zoom: 1;
    *vertical-align: middle;
	
}

span.dropdown-menu-sub-indicator:before {
    /* Image replacement */
    content: "";
    display: block;
    width: 0;
    height: 100%;
}

#example4 a.active{
	/*background:;*/
	color:<?php echo $config['Active_cat'];?>;
}
/* Arrow hovers */
.dropdown-menu li:hover > a > span.dropdown-menu-sub-indicator,
.dropdown-menu li.dropdown-menu-hover > a > span.dropdown-menu-sub-indicator {
    background-position: -10px -100px;
}
/* Point arrows to the right for anchors in subs */
.dropdown-menu ul span.dropdown-menu-sub-indicator {
    background-position: 0 0;
}
.dropdown-menu ul li:hover > a > span.dropdown-menu-sub-indicator,
.dropdown-menu ul li.dropdown-menu-hover > a > span.dropdown-menu-sub-indicator {
    background-position: -10px 0;
}

/* Vertical-style menu with default width */
.dropdown-menu-vertical {
    width: 175px;
}
.dropdown-menu-vertical li {
    display: block;
    position: relative;
    /* IE7 fix */
    *float: left;
    *width: 100%;
}
.dropdown-menu-vertical span.dropdown-menu-sub-indicator {
    background-position: 0 0;
}
.dropdown-menu-vertical li:hover > a > span.dropdown-menu-sub-indicator,
.dropdown-menu-vertical li.dropdown-menu-hover > a > span.dropdown-menu-sub-indicator {
    background-position: -10px 0;
}
</style>
<script type="text/javascript" src="catalog/view/javascript/jquery/dropmenu/dropmenu.js"></script>
<div id="category">
  <h2><?php echo $heading_title; ?></h2>
  <div style="padding:2px;" class="box-content">
    <div class="">
      <ul id="example4" class="dropdown-menu">
        <?php foreach ($categories as $category) { ?>
        <li>  
          <?php if ($category['category_id'] == $category_id) { ?>
          <a href="<?php echo $category['href']; ?>" class="active"><?php echo $category['name']; ?></a>
          <?php } else { ?>
          <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
          <?php } ?>  
          <?php if ($category['children']) { ?>
          <ul>
            <?php foreach ($category['children'] as $child) { ?>
            <li class="dropdown-menu-children">
            <?php if ($child['category_id'] == $child_id) { ?>
            <a href="<?php echo $child['href']; ?>" class="active"><?php echo $child['name']; ?></a>
            <?php } else { ?>
            <a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
            <?php } ?>
            <?php if($child['child2_id']){ ?>
          <ul>
            <?php foreach ($child['child2_id'] as $child2) { ?>
            <li class="dropdown-menu-child">
            <?php if ($child2['category_id'] == $child2_id) { ?>  
            <a href="<?php echo $child2['href']; ?>" class="active"><?php echo $child2['name']; ?></a>
            <?php } else { ?>
            <a href="<?php echo $child2['href']; ?>"><?php echo $child2['name']; ?></a>
            <?php } ?>            
            <?php if($child2['child3_id']){ ?>
          <ul>
            <?php foreach ($child2['child3_id'] as $child3) { ?>
            <li >
            <?php if ($child3['category_id'] == $child3_id) { ?>
            <a href="<?php echo $child3['href']; ?>" class="active"><?php echo $child3['name']; ?></a>
            <?php } else { ?>
            <a href="<?php echo $child3['href']; ?>"><?php echo $child3['name']; ?></a>
            <?php } ?>
            </li>
            <?php } ?>
          </ul>
            <?php } ?>              
            </li>
            <?php } ?>
            </ul>
            <?php } ?>
            </li>
            <?php } ?>
           </ul>
          <?php } ?>
         </li>
        <?php } ?>
      </ul>
    </div>
  </div>
</div>
<script type="text/javascript">
$(function() {
    $('#example4').dropdown_menu({
        sub_indicators : true,
		drop_shadows : true, 
        vertical : true
    });
});
</script>
