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
              <h1><i class="fa fa-globe"></i> <?php echo $form_title; ?></h1>
              <div class="controls">
                <a href="#" class="minimize"><i class="fa fa-chevron-down"></i></a>
                <a href="#" class="refresh"><i class="fa fa-refresh"></i></a>
                <a href="#" class="remove"><i class="fa fa-times"></i></a>
              </div> <!-- end of controls -->
            </div> <!-- end of tile-header -->

            <div class="tile-body">
              <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" class="form-horizontal">

                <div class="form-group">
                  <label for="client" class="col-sm-2 control-label">Client</label>
                  <div class="col-sm-10">
                    <input type="text" class="" style="color:black;" name='members' value="">
                  </div>
                </div>

                <div class="form-group">
                  <label for="website-clients" class="col-sm-2 control-label"></label>
                  <div class="col-sm-10">
                    <div id="member" class="scrollbox">
                      <?php foreach ($clients as $client) { ?>
                        <div id="client<?php echo $client['member_id']; ?>">
                          <?php echo $client['name']; ?><img src="view/image/delete.png" alt="" />
                          <input type="hidden" name="client[]" value="<?php echo $client['member_id']; ?>">
                        </div>
                      <?php } ?>
                    </div>
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

  <script type="text/javascript"><!--
  $.widget('custom.catcomplete', $.ui.autocomplete, {
  _renderMenu: function(ul, items) {
    var self = this, currentCategory = '';
    
    $.each(items, function(index, item) {
      if (item.category != currentCategory) {
        // ul.append('<li class="ui-autocomplete-category">' + item.category + '</li>');
        
        currentCategory = item.category;
      }
      
      self._renderItemData(ul, item);
    });
  }
});

// Memebers
$('input[name=\'members\']').catcomplete({
  delay: 500,
  source: function(request, response) {
    $.ajax({
      url: 'index.php?route=members/member/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
      dataType: 'json',
      success: function(json) {   
        response($.map(json, function(item) {
          return {
            category: item.member_group,
            label: item.name,
            value: item.member_id
          }
        }));
      }
    });
  }, 
  select: function(event, ui) {
    $('#member' + ui.item.value).remove();
    
    $('#member').append('<div id="member' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" alt="" /><input type="hidden" name="client[]" value="' + ui.item.value + '" /></div>');

     $('#member div:odd').attr('class', 'odd');
     $('#member div:even').attr('class', 'even');
        
    return false;
  },
  focus: function(event, ui) {
      return false;
   }
});

$('#member').on('click','img', function() {
  $(this).parent().remove();
  
  $('#member div:odd').attr('class', 'odd');
  $('#member div:even').attr('class', 'even');  
});
//--></script> 

  <?php echo $footer; ?>   

