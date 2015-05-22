<?php echo $header; ?>
<?php echo $navigation; ?>

    <!-- Page Content -->
    <div id="content" class="col-md-12">
      <div class="pageheader">
        <h2><i class="fa fa-graduation-cap" style="line-height: 48px;"></i> <?php echo $heading; ?></h2>
        <div class="breadcrumbs">
          <ol class="breadcrumb">
            <?php foreach ($breadcrumbs as $breadcrumb) { ?>
              <li class="<?php echo $breadcrumb['class']; ?>"><?php echo $breadcrumb['text']; ?></li>
            <?php } ?>
          </ol>
        </div> <!-- end of breadcrumbs -->
      </div> <!-- end of pageheader -->

        <?php if ($error_warning) { ?>
          <div class="alert alert-warning"><?php echo $error_warning; ?></div>
        <?php } ?>
        
        <?php if ($error_username) { ?>
          <span class="error"><?php echo $error_username; ?></span>
        <?php } ?>

        <?php if ($error_firstname) { ?>
          <span class="error"><?php echo $error_firstname; ?></span>
        <?php } ?> 

        <?php if ($error_lastname) { ?>
          <span class="error"><?php echo $error_lastname; ?></span>
        <?php } ?>

        <?php if ($error_password) { ?>
          <span class="error"><?php echo $error_password; ?></span>
        <?php  } ?>
        
        <?php if ($error_confirm) { ?>
          <span class="error"><?php echo $error_confirm; ?></span>
        <?php  } ?>  

      <div class="main">
        <div class="row">
          <div class="col-md-12">
            <section class="tile color transparent-black btop-green">
              <div class="tile-header" style="background: rgba(253, 253, 253, 0.31);">
                <h1><i class="fa fa-users"></i> <?php echo $admin_new; ?></h1>
                <div class="controls">
                  <a href="#" class="minimize"><i class="fa fa-chevron-down"></i></a>
                  <a href="#" class="remove"><i class="fa fa-times"></i></a>
                </div>
              </div>
              <div class="tile-body">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" class="form-horizontal">
                  <div class="row">
                    <div class="form-group col-md-4">
                      <label class="col-sm-4 control-label" for="username"><?php echo $entry_username; ?></label>
                      <div class="col-sm-8">
                        <input type="text" class="form-control" id="username" name="username" value="<?php echo $username; ?>" />
                      </div> <!-- end of col -->
                    </div> <!-- end of form-group -->
                    <div class="form-group col-md-4">
                      <label class="col-sm-4 control-label" for="firstname"><?php echo $entry_firstname; ?></label>
                      <div class="col-sm-8">
                        <input type="text" class="form-control" id="firstname" name="firstname" value="<?php echo $firstname; ?>" />
                      </div> <!-- end of col -->
                    </div> <!-- end of form-group -->
                    <div class="form-group col-md-4">
                      <label class="col-sm-4 control-label" for="lastname"><?php echo $entry_lastname; ?></label>
                      <div class="col-sm-8">
                        <input type="text" class="form-control" id="lastname" name="lastname" value="<?php echo $lastname; ?>" />
                      </div> <!-- end of col -->
                    </div> <!-- end of form-group -->
                  </div> <!-- end of row -->                  
        
                  <div class="row">
                    <div class="form-group col-md-4">
                      <label class="col-sm-4 control-label" for="email"><?php echo $entry_email; ?></label>
                      <div class="col-sm-8">
                        <input type="email" class="form-control" id="email" name="email" value="<?php echo $email; ?>" />
                      </div> <!-- end of col -->
                    </div> <!-- end of form-group -->
                    <div class="form-group col-md-4">
                      <label class="col-sm-4 control-label" for="user_group"><?php echo $entry_user_group; ?></label>
                      <div class="col-sm-8">
                        <select class="chosen-select chosen-transparent form-control" name="user_group_id" id="user_group">
                          <?php foreach ($user_groups as $user_group) { ?>
                            <?php if ($user_group['user_group_id'] == $user_group_id) { ?>
                              <option value="<?php echo $user_group['user_group_id']; ?>" selected="selected"><?php echo $user_group['name']; ?></option>
                            <?php } else { ?>
                              <option value="<?php echo $user_group['user_group_id']; ?>"><?php echo $user_group['name']; ?></option>
                            <?php } ?>
                          <?php } ?>      
                        </select>
                      </div> <!-- end of col -->
                    </div> <!-- end of form-group -->
                    <div class="form-group col-md-4">
                      <label class="col-sm-4 control-label" for="status"><?php echo $entry_status; ?></label>
                      <div class="col-sm-8">
                        <select class="chosen-select chosen-transparent form-control" id="status" name="status">
                          <?php if ($status) { ?>
                            <option value="0"><?php echo $text_disabled; ?></option>
                            <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                          <?php } else { ?>
                            <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                            <option value="1"><?php echo $text_enabled; ?></option>
                          <?php } ?>
                        </select>
                      </div> <!-- end of col -->
                    </div> <!-- end of form-group -->
                  </div> <!-- end of row -->

                  <div class="row">
                    <div class="form-group col-md-4">
                      <label class="col-sm-4 control-label" for="password"><?php echo $entry_password; ?></label>
                      <div class="col-sm-8">
                        <input type="password" class="form-control" id="password" name="password" value="<?php echo $password; ?>" />
                      </div> <!-- end of col -->
                    </div> <!-- end of form-group -->
                    <div class="form-group col-md-4">
                      <label class="col-sm-4 control-label" for="pass_confirm"><?php echo $entry_confirm; ?></label>
                      <div class="col-sm-8">
                        <input type="password" class="form-control" id="pass_confirm" name="confirm" value="<?php echo $confirm; ?>" />
                      </div> <!-- end of col -->
                    </div> <!-- end of form-group -->                
                  </div> <!-- end of row -->
                  
                  <div class="row">
                    <div class="form-group form-footer footer-white" style="margin-left:0px; margin-right:0px;">
                      <div class="col-md-12 text-right">
                        <a onclick="$('#form').submit();" class="btn btn-save"><?php echo $button_save; ?></a>
                        <a href="<?php echo $cancel; ?>" class="btn btn-cancel"><?php echo $button_cancel; ?></a>
                      </div> <!-- end of offset col  -->
                    </div> <!-- end of form-footer -->
                  </div> <!-- end of row -->

                </form> <!-- end of form -->
              </div> <!-- end of tile-body -->
            </section>

          </div> <!-- end of col -->
        </div> <!-- end of row -->
      </div> <!-- end of main -->

    </div> <!-- end of content -->
<?php echo $footer; ?>
