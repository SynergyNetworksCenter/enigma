<?php echo $header; ?>

<div class="container">
    <div class="pageTitle transbg-shadow">
        <p><?php echo $heading_title; ?></p>
    </div>
  
  <div class="alert alert-success"><?php echo $text_message; ?></div>

  <?php if(isset($continue)) { ?>
    <div class="buttons">
      <div class="right">
        <a href="<?php echo $continue; ?>" class="btn btn-success"><?php echo $button_continue; ?></a>
      </div>
    </div>
  <?php } ?> 

  <?php echo $content_bottom; ?>
</div>
<?php echo $footer; ?>