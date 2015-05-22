<?php echo $header; ?>
<?php echo $navigation; ?>

    <div id="content" class="col-md-12">
      <div class="pageheader">
        <h2><i class="fa fa-graduation-cap" style="line-height: 48px;"></i> <?php echo $heading_title; ?></h2>
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
        <?php if ($success) { ?>
          <div class="alert alert-success"><?php echo $success; ?></div>
        <?php } ?>
      </div>

      <div class="main">
        <div class="row">
          <div class="col-md-12">

            <section class="tile color transparent-black btop-green">
              <div class="tile-header">
                <h1><i class="fa fa-user"> </i> Restore</h1>
                <div class="controls">
                  <a href="#" class="minimize"><i class="fa fa-chevron-down"></i></a>
                  <a href="#" class="refresh"><i class="fa fa-refresh"></i></a>
                  <a href="#" class="remove"><i class="fa fa-times"></i></a>
                </div>
              </div>
 
              <div class="tile-body">
                <form action="<?php echo $restore; ?>" method="post" enctype="multipart/form-data" id="restore" class="form-horizontal">
                  <div class="row">
                    <div class="form-group col-md-12">
                      <!-- <label class="col-sm-4 control-label" for="restore"><?php //echo $entry_restore; ?></label> -->
                      <div class="col-sm-4">
                        <div class="input-group">
                          <span class="input-group-btn">
                            <span class="btn btn-primary btn-file">
                              <i class="fa fa-upload"></i>
                              <input type="file" multiple>
                            </span>
                          </span>
                          <input class="form-control" type="text" readonly/>
                        </div>
                      </div> <!-- end of col -->
                      <div class="col-sm-4">
                        <a onclick="$('#restore').submit();" class="btn btn-save"><?php echo $button_restore; ?></a>
                      </div>
                    </div> <!-- end of form-group -->
                  </div> <!-- end of row -->        
                </form>
              </div>
            </section> <!-- end of section -->

            <section class="tile color transparent-black btop-green" style="margin-top:20px;">
              <div class="tile-header">
                <h1><i class="fa fa-user"> </i> Backup</h1>
                <div class="controls">
                  <a href="#" class="minimize"><i class="fa fa-chevron-down"></i></a>
                  <a href="#" class="refresh"><i class="fa fa-refresh"></i></a>
                  <a href="#" class="remove"><i class="fa fa-times"></i></a>
                </div>
              </div>

              <div class="tile-widget bg-transparent-black-2">
                <div class="row">    
                  <div class="col-md-12 text-right">
                    <div class="controls control-btns">
                      <a onclick="$('#backup').submit();" class="btn btn-save"><?php echo $button_backup; ?></a>
                    </div> <!-- end of controls -->
                  </div> <!-- end of col -->
                </div> <!-- end of row -->
              </div> <!-- end of tile-widget -->

              <div class="tile-body">
                <div class="table-responsive">
                  <form action="<?php echo $backup; ?>" method="post" enctype="multipart/form-data" id="backup">
                    <table class="table table-datatable table-custom table-striped">
                      <tr>
                        <td><?php echo $entry_backup; ?></td>
                        <td><div class="scrollbox" style="margin-bottom: 5px;">
                            <?php $class = 'odd'; ?>
                            <?php foreach ($tables as $table) { ?>
                            <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                            <div class="<?php echo $class; ?>">
                              <input type="checkbox" name="backup[]" value="<?php echo $table; ?>" checked="checked" />
                              <?php echo $table; ?></div>
                            <?php } ?>
                          </div>
                          <a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></a>
                        </td>
                      </tr>
                    </table>
                  </form>
                </div>
              </div>

            </section> <!-- end of section -->
          </div> <!-- end of col -->
        </div> <!-- end of row -->
      </div> <!-- end of main -->

    </div> <!-- end of content -->

<?php echo $footer; ?>