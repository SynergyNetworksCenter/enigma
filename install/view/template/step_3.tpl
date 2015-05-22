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
                
    <div class="col-xs-3 bs-wizard-step active"><!-- complete -->
      <div class="text-center bs-wizard-stepnum-active">Step 3</div>
      <div class="progress"><div class="progress-bar"></div></div>
      <a href="#" class="bs-wizard-dot"></a>
      <div class="bs-wizard-info-active text-center">Configuration</div>
    </div>
                
    <div class="col-xs-3 bs-wizard-step disabled"><!-- active -->
      <div class="text-center bs-wizard-stepnum">Step 4</div>
      <div class="progress"><div class="progress-bar"></div></div>
      <a href="#" class="bs-wizard-dot"></a>
      <div class="bs-wizard-info text-center">Finished</div>
    </div>
  </div>
</div>
<div class="column-right-db transbg">
  <ul>
    <li>Choose MySQLi or MySQL</li>
    <li>Dev: Localhost || Live: 172.16.1.119</li>
    <li>Username for Database</li>
    <li>Password for Database</li>
    <li>Name of Database Created</li>
    <li>DB Table Prefix</li>
  </ul>
</div>
<div style="clear:right;" class="column-right-db transbg adminInfo">
  <ul>
    <li>Admin Username for Backend</li>
    <li>Admin Password for Backend</li>
    <li>Admin Email for Email Notices</li>
  </ul>
</div>
<div id="content">
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>

  <form class="form-horizontal" role="form" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
    <p>1. Please enter your database connection details.</p>
    <fieldset class="transbg">
      <div class="form-group">
        <label for="db-driver" class="col-sm-4 control-label">Database Driver:</label>
        <div class="col-sm-6">
          <select name="db_driver">
            <option value="mysqli">MySQLi</option>
            <option value="mysql">MySQL</option>
          </select> 
          <br />
          <?php if ($error_db_driver) { ?>
            <span class="required"><?php echo $error_db_driver; ?></span>
          <?php } ?>
        </div>
      </div>

      <div class="form-group">
        <label for="db_host" class="col-sm-4 control-label"><span class="required">*</span> Database Host:</label>
        <div class="col-sm-6">
          <input type="text" name="db_host" value="<?php echo $db_host; ?>" />
          <br/>
          <?php if ($error_db_host) { ?>
            <span class="required"><?php echo $error_db_host; ?></span>
          <?php } ?>
        </div>
      </div>

      <div class="form-group">
        <label for="db_user" class="col-sm-4 control-label"><span class="required">*</span> User:</label>
        <div class="col-sm-6">
          <input type="text" name="db_user" value="<?php echo $db_user; ?>" />
          <br/>
          <?php if ($error_db_user) { ?>
            <span class="required"><?php echo $error_db_user; ?></span>
          <?php } ?>
        </div>
      </div>

      <div class="form-group">
        <label for="db_password" class="col-sm-4 control-label">Password:</label>
        <div class="col-sm-6">
          <input type="text" name="db_password" value="<?php echo $db_password; ?>" />
        </div>
      </div>

      <div class="form-group">
        <label for="db_name" class="col-sm-4 control-label"><span class="required">*</span> Database Name:</label>
        <div class="col-sm-6">
          <input type="text" name="db_name" value="<?php echo $db_name; ?>" />
          <br/>
          <?php if ($error_db_name) { ?>
            <span class="required"><?php echo $error_db_name; ?></span>
          <?php } ?>
        </div>
      </div>

      <div class="form-group">
        <label for="db_prefix" class="col-sm-4 control-label"><span class="required">*</span> Database Prefix:</label>
        <div class="col-sm-6">
          <input type="text" name="db_prefix" value="<?php echo $db_prefix; ?>" />
          <br/>
          <?php if ($error_db_prefix) { ?>
            <span class="required"><?php echo $error_db_prefix; ?></span>
          <?php } ?>
        </div>
      </div>
    </fieldset>

    <p>2. Please enter a username and password for the administration.</p>
    <fieldset class="transbg">
      <div class="form-group">
        <label for="username" class="col-sm-4 control-label"><span class="required">*</span> Username:</label>
        <div class="col-sm-6">
          <input type="text" name="username" value="<?php echo $username; ?>" />
          <br/>
          <?php if ($error_username) { ?>
            <span class="required"><?php echo $error_username; ?></span>
          <?php } ?>
        </div>
      </div>

      <div class="form-group">
        <label for="password" class="col-sm-4 control-label"><span class="required">*</span> Password:</label>
        <div class="col-sm-6">
          <input type="text" name="password" value="<?php echo $password; ?>" />
          <br/>
          <?php if ($error_password) { ?>
            <span class="required"><?php echo $error_password; ?></span>
          <?php } ?>
        </div>
      </div>

      <div class="form-group">
        <label for="email" class="col-sm-4 control-label"><span class="required">*</span> Email:</label>
        <div class="col-sm-6">
          <input type="text" name="email" value="<?php echo $email; ?>" />
          <br/>
          <?php if ($error_email) { ?>
            <span class="required"><?php echo $error_email; ?></span>
          <?php } ?>
        </div>
      </div>

    </fieldset>
    <div class="buttons transbg" >
      <div class="left"><a href="<?php echo $back; ?>" style="color:white;text-decoration:none;" class="btn btn-success">Back</a></div>
      <div class="right">
        <input type="submit" value="Continue" class="btn btn-success" />
      </div>
    </div>
  </form>
</div>
<?php echo $footer; ?>