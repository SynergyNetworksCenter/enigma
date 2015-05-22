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
      <?php if ($success) { ?>
        <div class="alert alert-success"><?php echo $success; ?></div>
      <?php } ?>
    </div>

    <div class="main">
      <div class="row">
        <div class="col-md-12">   

          <section class="tile color transparent-black btop-green">

            <div class="tile-header">
              <h1><i class="fa fa-globe"></i> <?php echo $section_title; ?></h1>
              <div class="controls">
                <a href="#" class="minimize"><i class="fa fa-chevron-down"></i></a>
                <a href="#" class="refresh"><i class="fa fa-refresh"></i></a>
                <a href="#" class="remove"><i class="fa fa-times"></i></a>
              </div> <!-- end of controls -->
            </div> <!-- end of tile-header -->

            <div class="tile-widget bg-transparent-black-2">
              <div class="row">    
                <div class="col-md-12 text-right">
                  <div class="controls control-btns">
                    <a href="<?php echo $insert; ?>" class="btn btn-insert"><?php echo $button_insert; ?></a>
                    <a onclick="$('form').attr('action', '<?php echo $delete; ?>'); $('form').submit();" class="btn btn-delete"><?php echo $button_delete; ?></a>
                  </div> <!-- end of controls -->
                </div> <!-- end of col -->
              </div> <!-- end of row -->
            </div> <!-- end of tile-widget -->
            
            <div class="tile-body">

              <div class="table-responsive"> 
                <form action="" method="post" enctype="multipart/form-data" id="form">   
                  <table class="table table-datatable table-custom table-striped" id="websiteDataTable">
                    <thead>
                      <tr>
                        <th style="width: 40px;">
                          <div class="checkbox check-transparent">
                            <input type="checkbox" value="1" id="allchck2">
                            <label for="allchck2"></label>
                          </div>  
                        </th>
                        <th class="sort-alpha"><?php echo $column_name; ?></th>
                        <th class="sort-alpha"><?php echo $column_url; ?></th>
                        <th class="sort-amount text-center"><?php echo $column_status; ?></th>
                        <th class="sort-numeric text-center"><?php echo $column_date_added; ?></th>
                        <th class="text-center"><?php echo $column_action; ?></th>
                      </tr>
                    </thead>
                    <tbody>
                      <?php if ($websites) { ?>
                        <?php $chck = 01; ?>
                        <?php foreach ($websites as $website) { ?>
                          <tr>
                            <td>
                              <div class="checkbox check-transparent">
                                <?php if ($website['selected']) { ?>
                                  <input type="checkbox" name="selected[]" value="<?php echo $website['website_id']; ?>" id="<?php echo 'chck'.$chck; ?>" checked="checked">
                                <?php } else { ?>
                                  <input type="checkbox" name="selected[]" value="<?php echo $website['website_id']; ?>" id="<?php echo 'chck'.$chck; ?>">
                                <?php } ?>  
                                <label for="<?php echo 'chck'.$chck; ?>"></label>
                              </div>
                            </td>

                            <td><?php echo $website['name']; ?></td>
                            <td><a class="table-url" target="_blank" href="<?php echo $website['url']; ?>"><?php echo $website['url']; ?></a></td>
                            <?php if ($website['status'] == 'Disabled') { ?>
                              <td class="color-red priority text-center">
                                <?php echo $website['status']; ?>
                              </td>  
                            <?php } else { ?>
                              <td class="color-green priority text-center">
                                <?php echo $website['status']; ?>
                              </td>  
                            <?php } ?>
                            <td class="text-center"><?php echo $website['date_added']; ?></td>
                            <td class="text-center">
                              <?php $i = 0; ?>
                              <?php foreach ($website['action'] as $action) { ?>
                                <?php if(++$i === count($website['action'])) { ?> 
                                  <a class="<?php echo $action['class']; ?>" href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> 
                                <?php } else { ?>
                                  <a class="<?php echo $action['class']; ?>" href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> <span class="action-separator"> | </span>
                                <?php } ?>
                              <?php } ?>
                            </td>
                          </tr>
                          <?php $chck++; ?>
                        <?php } ?>
                      <?php } else { ?>
                        <tr>
                          <td class="text-center" colspan="6"><?php echo $text_no_results; ?></td>
                        </tr> 
                      <?php } ?> 
                    </tbody>
                  </table>
                </form>  
              </div> <!-- end of table-responsive -->  
            </div> <!-- end of tile-body -->
            
          </section> <!-- end of section -->

        </div> <!-- end of col-md-12 -->
      </div> <!-- row -->
    </div> <!-- end of main -->
  </div> <!-- end of content -->

<script>
 $('table thead input[type="checkbox"]').change(function () {
    $(this).parents('table').find('tbody input[type="checkbox"]').prop('checked', $(this).prop('checked'));
  });
  $(function(){

      // Add custom class to pagination div
      $.fn.dataTableExt.oStdClasses.sPaging = 'dataTables_paginate paging_bootstrap paging_custom';

      $('div.dataTables_filter input').addClass('form-control');
      $('div.dataTables_length select').addClass('form-control');

      /*************************************************/
      /**************** BASIC DATATABLE ****************/
      /*************************************************/

      /* Define two custom functions (asc and desc) for string sorting */
      jQuery.fn.dataTableExt.oSort['string-case-asc']  = function(x,y) {
          return ((x < y) ? -1 : ((x > y) ?  1 : 0));
      };
       
      jQuery.fn.dataTableExt.oSort['string-case-desc'] = function(x,y) {
          return ((x < y) ?  1 : ((x > y) ? -1 : 0));
      };

      /* Add a click handler to the rows - this could be used as a callback */
      

      /* Build the DataTable with third column using our custom sort functions */
      var oTable01 = $('#websiteDataTable').dataTable({
        "sDom":
          "R<'row'<'col-md-6'l><'col-md-6'f>r>"+
          "t"+
          "<'row'<'col-md-4 sm-center'i><'col-md-4'><'col-md-4 text-right sm-center'p>>",
        "oLanguage": {
          "sSearch": ""
        },
        "aaSorting": [ [1,'asc'] ],
        "aoColumns": [
          null,
          null,
          null,
          null,
          null,
          null
        ],
        "fnInitComplete": function(oSettings, json) { 
          $('.dataTables_filter input').attr("placeholder", "Search");
        }
      });

      //initialize chosen
      $('.dataTables_length select').chosen({disable_search_threshold: 10});

      $('div.dataTables_filter input').addClass('form-control');
      $('div.dataTables_length select').addClass('form-control');
      $('div.dataTables_length select').addClass('chosen-select');
      $('div.dataTables_length select').addClass('chosen-transparent');

  }) 
</script>

<?php echo $footer; ?>