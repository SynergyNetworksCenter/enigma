<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
  <table class="form tile table table-bordered table-striped transbg">
    <tr>
      <td><span class="required">*</span> <?php echo $entry_name; ?></td>
      <td><?php foreach ($languages as $language) { ?>
        <input type="text" name="download_description[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($download_description[$language['language_id']]) ? $download_description[$language['language_id']]['name'] : ''; ?>" />
        <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
        <?php if (isset($error_name[$language['language_id']])) { ?>
        <span class="error"><?php echo $error_name[$language['language_id']]; ?></span><br />
        <?php } ?>
        <?php } ?></td>
    </tr>
    <tr>
      <td><?php echo $entry_filename; ?></td>
      <td><input type="text" name="filename" value="<?php echo $filename; ?>" /> <a id="button-upload" class="btn btn-warning btn-xs"><?php echo $button_upload; ?></a>
        <?php if ($error_filename) { ?>
        <span class="error"><?php echo $error_filename; ?></span>
        <?php } ?></td>
    </tr>
    <tr>
      <td><?php echo $entry_mask; ?></td>
      <td><input type="text" name="mask" value="<?php echo $mask; ?>" />
        <?php if ($error_mask) { ?>
        <span class="error"><?php echo $error_mask; ?></span>
        <?php } ?></td>
    </tr>
    <tr>
      <td><?php echo $entry_remaining; ?></td>
      <td><input type="text" name="remaining" value="<?php echo $remaining; ?>" size="6" /></td>
    </tr>
    <?php if ($download_id) { ?>
    <tr>
      <td><?php echo $entry_update; ?></td>
      <td><?php if ($update) { ?>
        <input type="checkbox" name="update" value="1" checked="checked" />
        <?php } else { ?>
        <input type="checkbox" name="update" value="1" />
        <?php } ?></td>
    </tr>
    <?php } ?>
  </table>
</form>


<script type="text/javascript" src="view/javascript/jquery/ajaxupload.js"></script>
<script type="text/javascript"><!--
new AjaxUpload('#button-upload', {
	action: 'index.php?route=catalog/download/upload&token=<?php echo $token; ?>',
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
			$('input[name=\'mask\']').attr('value', json['mask']);
		}

		if (json['error']) {
			alert(json['error']);
		}

		$('.loading').remove();
	}
});
//--></script>
<?php echo $footer; ?>