<?php echo $header; ?>
<div class="transbg steps">
  <div class="row bs-wizard" style="border-bottom:0;"> 
    <div class="col-xs-3 bs-wizard-step complete">
      <div class="text-center bs-wizard-stepnum">Step 1</div>
      <div class="progress"><div class="progress-bar"></div></div>
      <a href="#" class="bs-wizard-dot"></a>
      <div class="bs-wizard-info text-center">License</div>
    </div>
      
    <div class="col-xs-3 bs-wizard-step complete"><!-- complete -->
      <div class="text-center bs-wizard-stepnum">Step 2</div>
      <div class="progress"><div class="progress-bar"></div></div>
      <a href="#" class="bs-wizard-dot"></a>
      <div class="bs-wizard-info text-center">Pre-Installation</div>
    </div>
                
    <div class="col-xs-3 bs-wizard-step complete"><!-- complete -->
      <div class="text-center bs-wizard-stepnum">Step 3</div>
      <div class="progress"><div class="progress-bar"></div></div>
      <a href="#" class="bs-wizard-dot"></a>
      <div class="bs-wizard-info text-center">Configuration</div>
    </div>
                
    <div class="col-xs-3 bs-wizard-step active"><!-- active -->
      <div class="text-center bs-wizard-stepnum">Step 4</div>
      <div class="progress"><div class="progress-bar"></div></div>
      <a href="#" class="bs-wizard-dot"></a>
      <div class="bs-wizard-info text-center">Finished</div>
    </div>
  </div>
</div>

<div id="content">
  <div class="warning">Don't forget to delete your installation directory!</div>
  <div class="alert alert-success">Congratulations! You have successfully installed SynergyCMS.</div>
  <div class="success">
    <div><a href="../"><img src="view/image/screenshot_1.png" alt="" /></a><br /><br />
      <a href="../">Go to your Site</a></div>
    <div><a href="../admin/"><img src="view/image/screenshot_2.png" alt="" /></a><br /><br />
      <a href="../admin/">Login to your Administration</a></div>
  </div>
</div>
<?php echo $footer; ?>