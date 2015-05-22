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
    </div> <!-- end of col -->
    
    <div class="col-md-5">
      <?php echo $description; ?>
    </div> <!-- end of col -->
  </div> <!-- end of row -->

  <div class="row">
    <div class="col-md-12">
      <div class="transbg-shadow" id="services">
        <p>Our Services Include:</p>
        <div id="servicesList">
          <ul>
            <li>Start to finish construction for new homes</li>
            <li>Structural additions to existing homes</li>
          </ul>
        </div> <!-- end of Services List -->
      </div> <!-- end of services -->
    </div> <!-- end of col -->
  </div> <!-- end of row -->

  <div class="row">
    <div class="col-md-12">
      <div class="pageTitle transbg-shadow">Employees</div>
    </div><!-- end of col -->
  </div><!-- end of row -->

  <?php echo $content_bottom; ?>

  <?php if(isset($continue)) { ?>
    <div class="buttons">
      <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
    </div>
  <?php } ?> 

</div> <!-- end of page container -->
<?php echo $footer; ?>
<script>
  $('.about-banner').parent().addClass("col-md-7");
  $('.about-carousel').parent().addClass("col-lg-7");
  $('.about-carousel').parent().addClass("hidden-xs");
  $('.about-carousel').parent().addClass("hidden-sm");
</script>