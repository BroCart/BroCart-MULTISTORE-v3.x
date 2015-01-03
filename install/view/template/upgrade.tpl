<?php echo $header; ?>
<h1>Обновление</h1>
<div id="column-right">
  <ul>
    <li><b>Обновление</b></li>
    <li>Финал</li>
  </ul>
</div>
<div id="content">
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
    <fieldset>
    <p><b>Следуйте по шагам в инструкции ниже!</b></p>
    <ol>
      <li>Сообщить об ошибках обновления на форуме</li>
      <li>После обновления, очистите cookies в Вашем браузере что б убрать ошибки.</li>
      <li>Зайдите в админ. панель и нажмите Ctrl+F5 дважды, что б обновить стили каскадных таблиц стилей.</li>
      <li>Перейдите в Admin -> Users -> User Groups и нажмите Edit напротив группы Top Adminstrator. Отметьте все ячейки.</li>
      <li>Перейдите в Admin и нажмите Edit на вкладке System Settings. Обновите все данные согласно данным Вашего магазина и сохраните изменения.</li>
      <li>Перейдите в магазин и нажмите Ctrl+F5 дважды, что б обновить стили каскадных таблиц стилей.</li>
    </ol>
    </fieldset>
    <div class="buttons">
	  <div class="right">
        <input type="submit" value="Продолжить" class="button" />
      </div>
	</div>
  </form>
</div>
<?php echo $footer; ?> 