<?php echo $header; ?>

  <div id="wrap">
    <div class="row">
      <div id="content" class="col-md-12 full-page login">
        <div class="inside-block">

          <!-- Page Logo -->
          <img src="view/images/logo-big.png" alt="Diamond Logo" class="logo">

          <!-- Page Titles -->
          <h1><strong>Synergy</strong> Admin Portal</h1>
          <h5>Ad Marketing and Analytics Reports</h5>

          <!-- Error & Notification -->
          <?php if ($success) { ?>
            <div class="alert alert-success"><?php echo $success; ?></div>
          <?php } ?>
          <?php if ($error_warning) { ?>
            <div class="alert alert-warning alert-login"><?php echo $error_warning; ?></div>
          <?php } ?>

          <!-- Login Form -->
          <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form form-signin" class="form-signin">
            <section>
              <div class="input-group">
                <input type="text" class="form-control" name="username" value="<?php echo $username; ?>" placeholder="Username">
                <div class="input-group-addon"><i class="fa fa-user"></i></div>
              </div>
              <div class="input-group">
                <input type="password" class="form-control" name="password" value="<?php echo $password; ?>" placeholder="Password">
                <div class="input-group-addon"><i class="fa fa-key"></i></div>
              </div>
            </section>
            <section class="controls">
              <!-- <div class="checkbox check-transparent">
                <input type="checkbox" value="1" id="remember" checked>
                <label for="remember">Remember me</label>
              </div> -->

              <!-- Displays forgot password link if enabled in backend -->
              <?php if ($forgotten) { ?>
                <a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a>
              <?php } ?>
            </section>
            <section class="log-in">
              <button type="submit" class="btn btn-greensea"><?php echo $button_login; ?></button>

              <!-- Used for when your login times out to take you back -->
              <?php if ($redirect) { ?>
                <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
              <?php } ?>
            </section>
          </form>
        </div> <!-- end of inside-block -->
      </div> <!-- end of col #content --> 
    </div> <!-- end of row -->
  </div> <!-- end of wrap -->

<script type="text/javascript"><!--
$('#form input').keydown(function(e) {
	if (e.keyCode == 13) {
		$('#form').submit();
	}
});
//--></script> 
<?php echo $footer; ?>