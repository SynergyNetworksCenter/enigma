<?php echo $header; ?>
<?php echo $navigation; ?>

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
 
      <div id="notification-center">
        <?php if ($error_warning) { ?>
          <div class="alert alert-warning"><?php echo $error_warning; ?></div>
        <?php } ?>
      </div>

      <div class="main">
        <div class="row">
          <div class="col-md-12">

            <section class="tile color transparent-black btop-orange">

              <div class="tile-header">
                <h1><i class="fa fa-users"></i> <?php echo $admin_group_title; ?></h1>
                <div class="controls">
                  <a href="#" class="minimize"><i class="fa fa-chevron-down"></i></a>
                  <a href="#" class="refresh"><i class="fa fa-refresh"></i></a>
                  <a href="#" class="remove"><i class="fa fa-times"></i></a>
                </div> <!-- end of controls -->
              </div> <!-- end of tile-header -->

              <div class="tile-widget bg-transparent-black-2">
                <div class="row">
                  <div class="col-sm-12 text-right"> 
                    <div class="controls control-btn">
                      <a onclick="$('#form').submit();" class="btn btn-save"><?php echo $button_save; ?></a>
                      <a href="<?php echo $cancel; ?>" class="btn btn-cancel"><?php echo $button_cancel; ?></a>
                    </div>
                  </div>
                </div>
              </div> <!-- tile-widget -->

              <div class="tile-body">
                <div class="table-responsive">
                  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
                    <table class="table">
                      <thead>
                        <tr>
                          <th><?php echo $entry_name; ?></th>
                          <th><input style="color:black;" type="text" name="name" value="<?php echo $name; ?>" />
                            <?php if ($error_name) { ?>
                              <span class="error"><?php echo $error_name; ?></span>
                            <?php  } ?>
                          </th>
                        </tr>
                      </thead>
                    
                      <tbody>  
                        <tr>
                          <td><?php echo $entry_access; ?></td>
                          <td>
                            <div class="scrollbox">
                              <?php $class = 'odd'; ?>
                              <?php foreach ($permissions as $permission) { ?>
                                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                                <div class="<?php echo $class; ?>">
                                  <?php if (in_array($permission, $access)) { ?>
                                    <input type="checkbox" name="permission[access][]" value="<?php echo $permission; ?>" checked="checked" />
                                    <?php echo $permission; ?>
                                  <?php } else { ?>
                                    <input type="checkbox" name="permission[access][]" value="<?php echo $permission; ?>" />
                                    <?php echo $permission; ?>
                                  <?php } ?>
                                </div>
                              <?php } ?>
                            </div>
                            <a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></a>
                          </td>
                        </tr>
                        <tr>
                          <td><?php echo $entry_modify; ?></td>
                          <td>
                            <div class="scrollbox">
                              <?php $class = 'odd'; ?>
                              <?php foreach ($permissions as $permission) { ?>
                                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                                <div class="<?php echo $class; ?>">
                                  <?php if (in_array($permission, $modify)) { ?>
                                    <input type="checkbox" name="permission[modify][]" value="<?php echo $permission; ?>" checked="checked" />
                                    <?php echo $permission; ?>
                                  <?php } else { ?>
                                    <input type="checkbox" name="permission[modify][]" value="<?php echo $permission; ?>" />
                                    <?php echo $permission; ?>
                                  <?php } ?>
                                </div>
                              <?php } ?>
                            </div>
                            <a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></a>
                          </td>
                        </tr>
                      </tbody>  
                    </table>
                  </form>
                </div>  
              </div> <!-- tile-body -->

            </section>  <!-- end of section -->
          </div> <!-- end of col -->
        </div> <!-- end of row -->
      </div> <!-- end of main -->

    </div> <!-- end of content -->
 <?php echo $footer; ?>