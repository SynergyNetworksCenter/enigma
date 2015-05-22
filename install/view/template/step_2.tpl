<?php echo $header; ?>
<div class="transbg steps">
  <div class="row bs-wizard" style="border-bottom:0;"> 
    <div class="col-xs-3 bs-wizard-step complete">
      <div class="text-center bs-wizard-stepnum">Step 1</div>
      <div class="progress"><div class="progress-bar"></div></div>
      <a href="#" class="bs-wizard-dot"></a>
      <div class="bs-wizard-info text-center">License</div>
    </div>
      
    <div class="col-xs-3 bs-wizard-step active"><!-- complete -->
      <div class="text-center bs-wizard-stepnum-active">Step 2</div>
      <div class="progress"><div class="progress-bar"></div></div>
      <a href="#" class="bs-wizard-dot"></a>
      <div class="bs-wizard-info-active text-center">Pre-Installation</div>
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
<div id="column-right" class="transbg">
  <ul>
    <li style="font-weight:bold; background:none;">Config Files</li>
    <?php if (file_exists($config_catalog)) { ?>
    <li class="text-success">
    <?php } else { ?>
    <li class="bad">
    <?php } ?> Rename config-dist.php to config.php</li>

    <?php if (file_exists($config_admin)) { ?>
    <li class="text-success">
    <?php } else { ?>
    <li class="bad">
    <?php } ?> Rename admin/config-dist.php to config.php</li>

    <li style="font-weight:bold; background:none;">Permissions</li>

    <?php if (is_writable($config_catalog)) { ?>
    <li class="text-success">
    <?php } else { ?>
    <li class="bad">
    <?php } ?> 0755 or 0777 config.php</li>

    <?php if (is_writable($config_admin)) { ?>
    <li class="text-success">
    <?php } else { ?>
    <li class="bad">
    <?php } ?> 0755 or 0777 admin/config.php</li>

    <?php if (is_writable($cache)) { ?>
    <li class="text-success">
    <?php } else { ?>
    <li class="bad">
    <?php } ?> 0755 or 0777 system/cache/</li>

    <?php if (is_writable($logs)) { ?>
    <li class="text-success">
    <?php } else { ?>
    <li class="bad">
    <?php } ?> 0755 or 0777 system/logs/</li>

    <?php if (is_writable($image)) { ?>
    <li class="text-success">
    <?php } else { ?>
    <li class="bad">
    <?php } ?> 0755 or 0777 image/</li>

    <?php if (is_writable($image_cache)) { ?>
    <li class="text-success">
    <?php } else { ?>
    <li class="bad">
    <?php } ?> 0755 or 0777 image/cache/</li>

    <?php if (is_writable($image_data)) { ?>
    <li class="text-success">
    <?php } else { ?>
    <li class="bad">
    <?php } ?> 0755 or 0777 image/data/</li>

    <?php if (is_writable($download)) { ?>
    <li class="text-success">
    <?php } else { ?>
    <li class="bad">
    <?php } ?> 0755 or 0777 download/</li>
  </ul>
</div>
<div id="content">
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
    <p>1. Please configure your PHP settings to match requirements listed below.</p>
    <fieldset class="transbg">
      <table class="table table-bordered">
        <tr>
          <th width="35%" align="left"><b>PHP Settings</b></th>
          <th width="25%" align="left"><b>Current Settings</b></th>
          <th width="25%" align="left"><b>Required Settings</b></th>
          <th width="15%" style="text-align:center;"><b>Status</b></th>
        </tr>

        <tr>
          <td>PHP Version:</td>
          <td><?php echo phpversion(); ?></td>
          <td>5.0+</td>
          <td align="center"><?php echo (phpversion() >= '5.0') ? '<img src="view/image/good.png" alt="Good" />' : '<img src="view/image/bad.png" alt="Bad" />'; ?></td>
        </tr>

        <tr>
          <td>Register Globals:</td>
          <td><?php echo (ini_get('register_globals')) ? 'On' : 'Off'; ?></td>
          <td>Off</td>
          <td align="center"><?php echo (!ini_get('register_globals')) ? '<img src="view/image/good.png" alt="Good" />' : '<img src="view/image/bad.png" alt="Bad" />'; ?></td>
        </tr>

        <tr>
          <td>Magic Quotes GPC:</td>
          <td><?php echo (ini_get('magic_quotes_gpc')) ? 'On' : 'Off'; ?></td>
          <td>Off</td>
          <td align="center"><?php echo (!ini_get('magic_quotes_gpc')) ? '<img src="view/image/good.png" alt="Good" />' : '<img src="view/image/bad.png" alt="Bad" />'; ?></td>
        </tr>

        <tr>
          <td>File Uploads:</td>
          <td><?php echo (ini_get('file_uploads')) ? 'On' : 'Off'; ?></td>
          <td>On</td>
          <td align="center"><?php echo (ini_get('file_uploads')) ? '<img src="view/image/good.png" alt="Good" />' : '<img src="view/image/bad.png" alt="Bad" />'; ?></td>
        </tr>

        <tr>
          <td>Session Auto Start:</td>
          <td><?php echo (ini_get('session_auto_start')) ? 'On' : 'Off'; ?></td>
          <td>Off</td>
          <td align="center"><?php echo (!ini_get('session_auto_start')) ? '<img src="view/image/good.png" alt="Good" />' : '<img src="view/image/bad.png" alt="Bad" />'; ?></td>
        </tr>

      </table>
    </fieldset>

    <p>2. Please make sure the PHP extensions listed below are installed.</p>
    <fieldset class="transbg">
      <table class="table table-bordered">
        <tr>
          <th width="35%" align="left"><b>Extension</b></th>
          <th width="25%" align="left"><b>Current Settings</b></th>
          <th width="25%" align="left"><b>Required Settings</b></th>
          <th width="15%" style="text-align:center;"><b>Status</b></th>
        </tr>

        <tr>
          <td>MySQL:</td>
          <td><?php echo extension_loaded('mysql') ? 'On' : 'Off'; ?></td>
          <td>On</td>
          <td align="center"><?php echo extension_loaded('mysql') ? '<img src="view/image/good.png" alt="Good" />' : '<img src="view/image/bad.png" alt="Bad" />'; ?></td>
        </tr>

        <tr>
          <td>GD:</td>
          <td><?php echo extension_loaded('gd') ? 'On' : 'Off'; ?></td>
          <td>On</td>
          <td align="center"><?php echo extension_loaded('gd') ? '<img src="view/image/good.png" alt="Good" />' : '<img src="view/image/bad.png" alt="Bad" />'; ?></td>
        </tr>

        <tr>
          <td>cURL:</td>
          <td><?php echo extension_loaded('curl') ? 'On' : 'Off'; ?></td>
          <td>On</td>
          <td align="center"><?php echo extension_loaded('curl') ? '<img src="view/image/good.png" alt="Good" />' : '<img src="view/image/bad.png" alt="Bad" />'; ?></td>
        </tr>

        <tr>
          <td>mCrypt:</td>
          <td><?php echo function_exists('mcrypt_encrypt') ? 'On' : 'Off'; ?></td>
          <td>On</td>
          <td align="center"><?php echo function_exists('mcrypt_encrypt') ? '<img src="view/image/good.png" alt="Good" />' : '<img src="view/image/bad.png" alt="Bad" />'; ?></td>
        </tr>
        
        <tr>
          <td>ZIP:</td>
          <td><?php echo extension_loaded('zlib') ? 'On' : 'Off'; ?></td>
          <td>On</td>
          <td align="center"><?php echo extension_loaded('zlib') ? '<img src="view/image/good.png" alt="Good" />' : '<img src="view/image/bad.png" alt="Bad" />'; ?></td>
        </tr>
        
        <?php if (!function_exists('iconv')) { ?>
        <tr>
          <td>mbstring:</td>
          <td><?php echo extension_loaded('mbstring') ? 'On' : 'Off'; ?></td>
          <td>On</td>
          <td align="center"><?php echo extension_loaded('mbstring') ? '<img src="view/image/good.png" alt="Good" />' : '<img src="view/image/bad.png" alt="Bad" />'; ?></td>
        </tr>
        <?php } ?>
      
      </table>
    </fieldset>

    <p>3. Please make sure you have set the correct permissions on the files list below.</p>
    <fieldset class="transbg">
      <table class="table table-bordered">
        <tr>
          <th align="left"><b>Files</b></th>
          <th align="left"><b>Status</b></th>
        </tr>

        <tr>
          <td><?php echo $config_catalog; ?></td>
          <td><?php if (!file_exists($config_catalog)) { ?>
            <span class="bad">Missing</span>
            <?php } elseif (!is_writable($config_catalog)) { ?>
            <span class="bad">Unwritable</span>
          <?php } else { ?>
            <span class="good">Writable</span>
          <?php } ?>
          </td>
        </tr>

        <tr>
          <td><?php echo $config_admin; ?></td>
          <td><?php if (!file_exists($config_admin)) { ?>
            <span class="bad">Missing</span>
            <?php } elseif (!is_writable($config_admin)) { ?>
            <span class="bad">Unwritable</span>
          <?php } else { ?>
          <span class="good">Writable</span>
          <?php } ?>
             </td>
        </tr>
      </table>
    </fieldset>

    <p>4. Please make sure you have set the correct permissions on the directories list below.</p>
    <fieldset class="transbg">
      <table class="table table-bordered">
        <tr>
          <th align="left"><b>Directories</b></th>
          <th align="left"><b>Status</b></th>
        </tr>

        <tr>
          <td><?php echo $cache . '/'; ?></td>
          <td><?php echo is_writable($cache) ? '<span class="good">Writable</span>' : '<span class="bad">Unwritable</span>'; ?></td>
        </tr>

        <tr>
          <td><?php echo $logs . '/'; ?></td>
          <td><?php echo is_writable($logs) ? '<span class="good">Writable</span>' : '<span class="bad">Unwritable</span>'; ?></td>
        </tr>

        <tr>
          <td><?php echo $image . '/'; ?></td>
          <td><?php echo is_writable($image) ? '<span class="good">Writable</span>' : '<span class="bad">Unwritable</span>'; ?></td>
        </tr>

        <tr>
          <td><?php echo $image_cache . '/'; ?></td>
          <td><?php echo is_writable($image_cache) ? '<span class="good">Writable</span>' : '<span class="bad">Unwritable</span>'; ?></td>
        </tr>

        <tr>
          <td><?php echo $image_data . '/'; ?></td>
          <td><?php echo is_writable($image_data) ? '<span class="good">Writable</span>' : '<span class="bad">Unwritable</span>'; ?></td>
        </tr>

        <tr>
          <td><?php echo $download . '/'; ?></td>
          <td><?php echo is_writable($download) ? '<span class="good">Writable</span>' : '<span class="bad">Unwritable</span>'; ?></td>
        </tr>

      </table>
    </fieldset>
    <div class="buttons transbg">
      <div class="left"><a href="<?php echo $back; ?>" style="color:white; text-decoration:none;" class="btn btn-success">Back</a></div>
      <div class="right">
        <input type="submit" value="Continue" class="btn btn-success" />
      </div>
    </div>
  </form>
</div>
<?php echo $footer; ?>
