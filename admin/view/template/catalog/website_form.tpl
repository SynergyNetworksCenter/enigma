<?php echo $header; ?>
<?php echo $navigation; ?>
  <div id="content" class="col-md-12">
    <div class="pageheader">
      <h2><i class="fa fa-globe" style="line-height: 48px;"></i> <?php echo $page_title; ?></h2>
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

          <section class="tile color transparent-black btop-green">

            <div class="tile-header">
              <h1><i class="fa fa-globe"></i> <?php echo $section_title2; ?></h1>
              <div class="controls">
                <a href="#" class="minimize"><i class="fa fa-chevron-down"></i></a>
                <a href="#" class="refresh"><i class="fa fa-refresh"></i></a>
                <a href="#" class="remove"><i class="fa fa-times"></i></a>
              </div> <!-- end of controls -->
            </div> <!-- end of tile-header -->

            <div class="tile-body">
              <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" class="form-horizontal">

                <div class="form-group">
                  <label class="col-md-3 control-label">
                    <span class="required">*</span> <?php echo $entry_name; ?>
                  </label>
                  <div class="col-md-6">
                    <input class="form-control" type="text" name="sitename" value="<?php echo $sitename; ?>" />
                    <?php if ($error_sitename) { ?>
                      <span class="color-red"><?php echo $error_sitename; ?></span>
                    <?php } ?>
                  </div>
                </div>

                <div class="form-group">
                  <label class="col-md-3 control-label">
                    <span class="required">*</span> <?php echo $entry_url; ?>
                  </label>
                  <div class="col-md-6">
                    <input class="form-control" type="text" name="url" value="<?php echo $url; ?>" />
                    <?php if ($error_url) { ?>
                      <span class="color-red"><?php echo $error_url; ?></span>
                    <?php } ?>
                  </div>
                </div>

                <div class="form-group">
                  <label class="col-md-3 control-label">
                    <?php echo $entry_status; ?>
                  </label>
                  <div class="col-md-6">
                    <select class="chosen-select chosen-transparent form-control" name="status">
                      <?php if ($status) { ?>
                        <option value="1" selected="selected"><?php echo $text_active; ?></option>
                        <option value="0"><?php echo $text_disabled; ?></option>
                      <?php } else { ?>
                        <option value="1"><?php echo $text_active; ?></option>
                        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                      <?php } ?>
                    </select>
                  </div>
                </div>
              </form>
            </div>  

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