<?php echo $header; ?>
<?php echo $navigation; ?>
  <div id="content" class="col-md-12">
    <div class="pageheader">
      <h2><i class="fa fa-users" style="line-height: 48px;"></i> <?php echo $page_title; ?></h2>
      <div class="breadcrumbs">
        <ol class="breadcrumb">
          <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <li class="<?php echo $breadcrumb['class']; ?>"><?php echo $breadcrumb['text']; ?></li>
          <?php } ?>
        </ol>  
      </div>
    </div>

    <div id="notification-center">
      <?php if ($error_warning) { ?>
        <div class="alert alert-warning"><?php echo $error_warning; ?></div>
      <?php } ?>
    </div>

    
    <div class="main">  
      <div class="row">
        <div class="col-md-12">
          <section class="tile color transparent-white btop-green" style="background-color: rgba(33, 166, 224, 0.57);">
            <div class="tile-header rounded-top-corners" style="background: rgba(253, 253, 253, 0.31);">
              <h1><i class="fa fa-user"></i> <?php echo $section_title2; ?></h1>
              <div class="controls">
                <a href="#" class="minimize"><i class="fa fa-chevron-down"></i></a>
                <a href="#" class="remove"><i class="fa fa-times"></i></a>
              </div> <!-- end of controls -->
            </div> <!-- end of tile-header -->

            <div class="tile-body">
              <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" class="form-horizontal">
              
                      <div class="form-group">
                        <label class="col-md-3 control-label">
                          <span class="required color-red">*</span> <?php echo $entry_firstname; ?>
                        </label>
                        <div class="col-md-6">
                          <input class="form-control" type="text" name="firstname" value="<?php echo $firstname; ?>" />
                          <?php if ($error_firstname) { ?>
                            <span class="error color-red"><?php echo $error_firstname; ?></span>
                          <?php } ?>
                        </div>
                      </div>

                      <div class="form-group">
                        <label class="col-md-3 control-label">
                          <span class="required color-red"></span> <?php echo $entry_lastname; ?>
                        </label>
                        <div class="col-md-6">
                          <input class="form-control" type="text" name="lastname" value="<?php echo $lastname; ?>" />
                          <?php if ($error_lastname) { ?>
                            <span class="error color-red"><?php echo $error_lastname; ?></span>
                          <?php } ?>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-md-3 control-label">
                          <span class="required color-red">*</span> <?php echo $entry_email; ?>
                        </label>
                        <div class="col-md-6">
                          <input class="form-control" type="text" name="email" value="<?php echo $email; ?>" />
                          <?php if ($error_email) { ?>
                            <span class="error color-red"><?php echo $error_email; ?></span>
                          <?php  } ?>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-md-3 control-label">
                          <span class="required color-red"></span> <?php echo $entry_telephone; ?>
                        </label>
                        <div class="col-md-6">
                          <input class="form-control" type="text" name="telephone" value="<?php echo $telephone; ?>" />
                          <?php if ($error_telephone) { ?>
                            <span class="error color-red"><?php echo $error_telephone; ?></span>
                          <?php  } ?>
                        </div>
                      </div>
                      <div class="form-group" hidden>
                        <label class="col-md-3 control-label">
                          <?php echo $entry_fax; ?>
                        </label>
                        <div class="col-md-6">
                          <input class="form-control" type="text" name="fax" value="<?php echo $fax; ?>" />
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-md-3 control-label">
                         <span class="required color-red">*</span> <?php echo $entry_password; ?>
                        </label>
                        <div class="col-md-6">
                          <input class="form-control" type="password" name="password" value="<?php echo $password; ?>"  />
                          <?php if ($error_password) { ?>
                            <span class="error color-red"><?php echo $error_password; ?></span>
                          <?php  } ?>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-md-3 control-label">
                          <span class="required color-red">*</span> <?php echo $entry_confirm; ?>
                        </label>
                        <div class="col-md-6">
                          <input class="form-control" type="password" name="confirm" value="<?php echo $confirm; ?>" />
                          <?php if ($error_confirm) { ?>
                            <span class="error color-red"><?php echo $error_confirm; ?></span>
                          <?php  } ?>
                        </div>
                      </div>
                      <div class="form-group" hidden>
                        <label class="col-md-3 control-label">
                          <?php echo $entry_newsletter; ?>
                        </label>
                        <div class="col-md-6">
                          <select class="chosen-select chosen-transparent form-control" name="newsletter">
                            <?php if ($newsletter) { ?>
                            <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                            <option value="0"><?php echo $text_disabled; ?></option>
                            <?php } else { ?>
                            <option value="1"><?php echo $text_enabled; ?></option>
                            <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                            <?php } ?>
                          </select>
                        </div>
                      </div>
                      <div class="form-group" hidden>
                        <label class="col-md-3 control-label">
                          <?php echo $entry_member_group; ?>
                        </label>
                        <div class="col-md-6">
                          <select class="chosen-select chosen-transparent form-control" name="member_group_id">
                            <?php foreach ($member_groups as $member_group) { ?>
                            <?php if ($member_group['member_group_id'] == $member_group_id) { ?>
                            <option value="<?php echo $member_group['member_group_id']; ?>" selected="selected"><?php echo $member_group['name']; ?></option>
                            <?php } else { ?>
                            <option value="<?php echo $member_group['member_group_id']; ?>"><?php echo $member_group['name']; ?></option>
                            <?php } ?>
                            <?php } ?>
                          </select>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-md-3 control-label">
                          <?php echo $entry_status; ?>
                        </label>
                        <div class="col-md-6">
                          <select class="chosen-select chosen-transparent form-control" name="status">
                            <?php if ($status) { ?>
                            <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                            <option value="0"><?php echo $text_disabled; ?></option>
                            <?php } else { ?>
                            <option value="1"><?php echo $text_enabled; ?></option>
                            <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                            <?php } ?>
                          </select>
                        </div>
                      </div>
              </form>
            </div> <!-- end of tile-body -->

            <div class="tile-footer bg-transparent-white-2 rounded-bottom-corners" style="background: rgba(253, 253, 253, 0.31);">
              <div class="row">
                <div class="col-sm-4"></div>
                <div class="col-sm-4 text-center"></div>
                <div class="col-sm-4 text-right sm-center">
                  <div class="controls control-btns">
                    <a onclick="$('#form').submit();" class="btn btn-save"><?php echo $button_save; ?></a>
                    <a href="<?php echo $cancel; ?>" class="btn btn-cancel"><?php echo $button_cancel; ?></a>
                  </div> <!-- end of controls -->
                </div>
              </div> <!-- end of row -->
            </div> <!-- end of tile-footer -->

          </section> <!-- end of section -->
        </div> <!-- end of col -->
      </div> <!-- end of row -->
    </div> <!-- end of main -->
          
  </div> <!-- end of content -->
 

<?php echo $footer; ?>