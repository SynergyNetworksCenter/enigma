<?php echo $header; ?>
<div class="transbg steps">
  <div class="row bs-wizard" style="border-bottom:0;"> 
    <div class="col-xs-3 bs-wizard-step active">
      <div class="text-center bs-wizard-stepnum-active">Step 1</div>
      <div class="progress"><div class="progress-bar"></div></div>
      <a href="#" class="bs-wizard-dot"></a>
      <div class="bs-wizard-info-active text-center">License</div>
    </div>
      
    <div class="col-xs-3 bs-wizard-step disabled"><!-- complete -->
      <div class="text-center bs-wizard-stepnum">Step 2</div>
      <div class="progress"><div class="progress-bar"></div></div>
      <a href="#" class="bs-wizard-dot"></a>
      <div class="bs-wizard-info text-center">Pre-Installation</div>
    </div>
                
    <div class="col-xs-3 bs-wizard-step disabled"><!-- complete -->
      <div class="text-center bs-wizard-stepnum">Step 3</div>
      <div class="progress"><div class="progress-bar"></div></div>
      <a href="#" class="bs-wizard-dot"></a>
      <div class="bs-wizard-info text-center">Configuration</div>
    </div>
                
    <div class="col-xs-3 bs-wizard-step disabled"><!-- active -->
      <div class="text-center bs-wizard-stepnum">Step 4</div>
      <div class="progress"><div class="progress-bar"></div></div>
      <a href="#" class="bs-wizard-dot"></a>
      <div class="bs-wizard-info text-center">Finished</div>
    </div>
  </div>
</div>
<div id="content">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
    <?php require 'license.php'; ?>
    <div class="buttons transbg">
      <div class="right">
        <input type="submit" value="Continue" class="btn btn-success" />
      </div>
    </div>
  </form>
</div>
<?php echo $footer; ?>