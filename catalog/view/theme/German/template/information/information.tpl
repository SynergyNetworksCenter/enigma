<?php echo $header; ?>
<div class="container-fluid">
  <div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12 col-lg-12">
      <div class="pageTitle transbg-shadow">
        <?php echo $heading_title; ?>
      </div>
    </div>
  </div> <!-- end of row -->   
  
  <div class="row">
      <div class="col-md-7 hidden-xs hidden-sm">
        <?php echo $content_top; ?>
      </div>  
    
 
    <?php echo $description; ?>
  

  <?php if(isset($continue)) { ?>
    <div class="buttons">
      <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
    </div>
  <?php } ?> 

  <?php echo $content_bottom; ?>

</div> <!-- end of page container -->
<?php echo $footer; ?>
<script>
  $('.about-banner').parent().addClass("col-md-7");
  $('.about-carousel').parent().addClass("col-lg-7");
  $('.about-carousel').parent().addClass("hidden-xs");
  $('.about-carousel').parent().addClass("hidden-sm");
</script>