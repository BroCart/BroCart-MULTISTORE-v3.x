<?php

    $listlanguages = scandir(DIR_CATALOG . 'language/');
    unset($listlanguages[0]); //Deletes the .
    unset($listlanguages[1]); //Deletes the ..

    if (isset($this->request->get['file']) && substr($this->request->get['file'], 0, 1) != "."){
        $title = explode('/', $this->request->get['file']);
        $selectedfile  = ucfirst($name_language).' :: ';
        $selectedfile .= ucwords(str_replace('_', ' ', $title[0])).' :: ';
        $selectedfile .= ucwords(str_replace('_', ' ', $title[1]));
        $selectedfile .= ' <span>('.$title[1].'.php)</span>';
    }else{
        $selectedfile = ucfirst($name_language).' :: '.ucfirst($name_language).' <span>('.$name_language.'.php)</span>';
    };

?>
<?php echo $header; ?>
<div id="content">
    <div class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
        <?php } ?>
    </div>
    <div class="box">
        <div class="heading">
            <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
        </div>
        <div class="content">
            <?PHP
            if(isset($showmsg)){
                if($showmsg == "success"){
                    ?>
                    <div class="success"><?PHP echo $msg_success; ?></div>
                    <?PHP
                }
            
                if($showmsg == "error"){
                    ?>
                    <div class="warning"><?PHP echo $msg_error; ?></div>
                    <?PHP
                }
            }
            ?>
            <div class="headinglanguageEditor">
                <h3 class="languageEditorTitle">
                    <?php echo $selectedfile ?>
                </h3>
            </div>
            <table width = "100%" cellpadding = "0" cellspacing = "0" border = "0" style = "border:collapse;">
                <tr>
                    <td align = "left" valign = "top">
                        <table width = "100%" cellpadding = "0" cellspacing = "0" border = "1" bordercolor = "#DDDDDD" style = "border-collapse:collapse;" class="list">
                         <thead>
                          <tr>
                           <td class="left" height = "20" width = "200"><?PHP echo $menu_variable; ?></td>
                            <td class="left"><?PHP echo $menu_value; ?></td>
                            <?PHP
                            if(!isset($string)){
                                ?>
                                <td align = "center" width = "100"><?PHP echo $menu_edit; ?></td>
                                <?PHP
                            }else{
                                ?>
                                <td align = "center" width = "200"><?PHP echo $menu_action; ?></td>
                                <?PHP
                            }
                            ?>
                           </tr>
                          </thead>
                         <tbody>
                          <?PHP
                            if($file_vars){
                            
                                if(!isset($string)){
                            
                                    foreach($file_vars as $key => $val){
                                    ?>
                                        <tr>
                                         <td class="left"><?PHP echo $key; ?></td>
                                         <td class="left"><?PHP echo $val; ?></td>
                                         <td align = "center">[<a href = "<?PHP echo $action_edit.$key; ?>"><?PHP echo $entry_edit; ?></a>]</td>
                                        </tr>
                                    <?PHP
                                    }

                                }else{
                                    ?>
                                        <tr>
                                         <td align = "left" valign = "top"><?PHP echo $string; ?></td>
                                         <td class="left">
                                          <form id = "updateform" action = "<?PHP echo $viewing_file_link; ?>" method = "POST">
                                           <textarea name = "strvalue" cols = "75" rows = "20"><?PHP echo $file_vars[$string]; ?></textarea>
                                           <input type = "hidden" name = "poststr" value = "<?PHP echo $string; ?>">
                                          </form>
                                         </td>
                                         <td align = "center" valign = "top"><a class="button" onclick = "$('#updateform').submit()"><span><?php echo $btn_save; ?></span> <a class="button" href = "<?PHP echo $viewing_file_link; ?>"><span><?php echo $btn_back; ?></span></td>
                                        </tr>
                                    <?PHP
                                }
                           
                            }else{
                            ?>
                                <tr>
                                 <td class="left" colspan = "3"><?PHP echo $msg_nofile; ?></td>
                                </tr>
                            <?PHP
                            }
                                
                            ?>
                         </tbody>
                        </table>
                    </td>
                    <td width = "400" align = "right" valign = "top">
                        <table width = "390" cellpadding = "0" cellspacing = "0" border = "0" style = "border:collapse;">
                            <tr>
                                <td align = "center" valign = "top">
                                 <form action = "<?php echo $action_select; ?>" method = "POST" id="form">
                                  <?php echo $entry_selectSection;
                                  $selected_back_end = null;
                                  $selected_front_end = null;
                                  if($section == $menu_frontend){
                                    $selected_front_end = ' selected="selected"';
                                  }else{
                                    $selected_back_end = ' selected="selected"';
                                  }
                                  ?>
                                    <select name="sectionlist">
                                        <option value="catalog"<?PHP echo $selected_front_end; ?>><?php echo ucwords($menu_frontend); ?></option>
                                        <option value="admin"<?PHP echo $selected_back_end; ?>><?php echo ucwords($menu_backend); ?></option>
                                     </select><br>
                                  <?php echo $entry_selectLang; ?>
                                    <select name="listlanguages">
                                        <?php foreach ($listlanguages as $language){

                                            if (isset($name_language) && $name_language == $language){
                                                ?><option value="<?php echo $language; ?>" selected="selected"><?php echo ucwords($language); ?></option><?PHP
                                            }else{
                                                ?><option value="<?php echo $language; ?>"><?php echo ucwords($language); ?></option><?PHP
                                            }

                                        }
                                        ?>
                                     </select><br>
                                     <a class="button" onclick = "$('#form').submit()"><span><?php echo $btn_select; ?></span></a>
                                    </form><br></td>
                            </tr>
                            <tr>
                                <td align = "left" valign = "top">
                                     <?PHP

                                        if(file_exists(DIR_CATALOG."language/".$name_language."/".$name_language.".php")){
                                        
                                            ?>
                                            <table width = "100%" cellpadding = "0" cellspacing = "0" border = "1" style = "border:collapse;" bordercolor = "#DDDDDD" class="list">
                                                 <thead>
                                                  <tr>
                                                   <td colspan = "3" align = "center"><b>Core Language File</b></td>
                                                  </tr>
                                                 </thead>
                                                <tbody>
                                                <tr>
                                                 <td width = "33%"><a href = "<?PHP echo $file_link.'./'.$name_language; ?>" style = "text-decoration:none"><font color = "#207DC1"><?PHP echo $name_language; ?></font></a></td>
                                                 <td></td>
                                                 <td></td>
                                                </tr>
                                               </tbody>
                                              </table>
                                              <br>
                                            <?PHP
                                        
                                        }
                                     
                                        foreach($files as $key => $value){
                                    
                                            foreach($value as $dir => $filenames){
                                                if($dir == "."){
                                                    continue;
                                                }
                                                ?>
                                                <table width = "100%" cellpadding = "0" cellspacing = "0" border = "1" style = "border:collapse;" bordercolor = "#DDDDDD" class="list">
                                                 <thead>
                                                  <tr>
                                                   <td colspan = "3" align = "center"><b><?PHP echo ucfirst($dir); ?></b></td>
                                                  </tr>
                                                 </thead>
                                                <tbody>
                                                <tr>
                                                <?PHP

                                                $i = 0;
                                                $passes = 0;
                                                foreach($filenames as $filename){
                                                    ?>
                                                        <td width = "33%"><a href = "<?PHP echo $file_link.$dir.'/'.$filename; ?>" style = "text-decoration:none"><font color = "#207DC1"><?PHP echo $filename; ?></font></a></td>
                                                    <?PHP
                                                   $i++;
                                                   $passes++;
                                                   if($i%3 == 0 && $passes < count($filenames)){
                                                        echo "</tr><tr>";
                                                        $i=0;
                                                   }else{
                                                        if($passes == count($filenames) && $i%3 == 2){
                                                            echo "<td></td>";
                                                        }
                                                        

                                                        if($passes == count($filenames) && $i%3 == 1){
                                                            echo "<td></td><td></td>";
                                                        }
                                                   }
                                                }
                                                ?>
                                                </tr>
                                               </tbody>
                                              </table>
                                              <br>
                                             <?PHP
                                        
                                            }
                                    
                                        }
                                        
                                     ?>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
    </div> <!-- END BOX -->
</div> <!-- END ID CONTENT -->
<?php
echo $footer;
?>
