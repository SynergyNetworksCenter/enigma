<?php echo $header; ?>
<?php echo $navigation; ?>
<div id="content" class="col-md-12">
  <div class="pageheader">
    <h2><i class="fa fa-windows" style="line-height: 48px;"></i> <?php echo $page_title; ?></h2>
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

              <div class="form form-group">
                <label class="col-md-3 control-label">
                  <span class="required color-red">*</span> <?php echo $entry_title; ?>
                </label>
                <div class="col-md-6"><?php foreach ($languages as $language) { ?>
                  <input class="form-control" type="text" name="upload_description[<?php echo $language['language_id']; ?>][title]" value="<?php echo isset($upload_description[$language['language_id']]) ? $upload_description[$language['language_id']]['title'] : ''; ?>" />
                  <?php if (isset($error_title[$language['language_id']])) { ?>
                    <span class="error color-red"><?php echo $error_title[$language['language_id']]; ?></span>
                  <?php }} ?>
                </div>
              </div>

              <div class="form-group">
                <label class="col-md-3 control-label">
                  <span class="required color-red">*</span> <?php echo $entry_filename; ?>
                </label>
                <div class="col-md-6">
                  <input type="text" name="filename" value="<?php echo $filename; ?>" /> <a id="button-upload" class="btn btn-warning btn-xs"><?php echo $button_upload; ?></a>
                    <?php if ($error_filename) { ?>
                    <span class="error"><?php echo $error_filename; ?></span>
                    <?php } ?>
                </div>
              </div>

              <div class="form-group">
                <label class="col-md-3 control-label"><?php echo $entry_note; ?></label>
                <div class="col-md-6"><?php foreach ($languages as $language) { ?>
                  <input class="form-control" type="text" name="upload_description[<?php echo $language['language_id']; ?>][note]" value="<?php echo isset($upload_description[$language['language_id']]) ? $upload_description[$language['language_id']]['note'] : ''; ?>" />
                  <?php } ?>
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
<script type="text/javascript" src="view/javascript/jquery/ajaxupload.js"></script>
<script type="text/javascript"><!--
new AjaxUpload('#button-upload', {
	action: 'index.php?route=catalog/upload/upload&token=<?php echo $token; ?>',
	name: 'file',
	autoSubmit: true,
	responseType: 'json',
	onSubmit: function(file, extension) {
		$('#button-upload').after('<img src="view/image/loading.gif" class="loading" style="padding-left: 5px;" />');
		$('#button-upload').attr('disabled', true);
	},
	onComplete: function(file, json) {
		$('#button-upload').attr('disabled', false);

		if (json['success']) {
			alert(json['success']);

			$('input[name=\'filename\']').attr('value', json['filename']);
//  			$('input[name=\'mask\']').attr('value', json['mask']);
		}

		if (json['error']) {
			alert(json['error']);
		}

		$('.loading').remove();
	}
});
//--></script>
<?php echo $footer; ?>
