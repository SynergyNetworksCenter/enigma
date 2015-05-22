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
      <?php if ($success) { ?>
        <div class="alert alert-success"><?php echo $success; ?></div>
      <?php } ?>
    </div>
    
    <div class="main">  
      <div class="row">
        <div class="col-md-12">
          <section class="tile color transparent-white btop-green" style="background-color: rgba(33, 166, 224, 0.57);">
            
            <div class="tile-header rounded-top-corners" style="background: rgba(253, 253, 253, 0.31);">
              <h1><i class="fa fa-user"></i> <?php echo $section_title; ?></h1>
              <div class="controls">
                <a href="#" class="minimize"><i class="fa fa-chevron-down"></i></a>
                <a href="#" class="remove"><i class="fa fa-times"></i></a>
              </div> <!-- end of controls -->
            </div> <!-- end of tile-header -->

            <div class="tile-widget bg-transparent-black-2">
              <div class="row">    
                <div class="col-sm-12 col-xs-12 text-right"> 
                  <div class="controls control-btns">
                    <a href="<?php echo $insert; ?>" class="btn btn-insert"><?php echo $button_insert; ?></a>
                    <a onclick="$('#form').submit();" class="btn btn-delete"><?php echo $button_delete; ?></a>
                  </div> <!-- end of controls -->
                </div> <!-- end of col -->
              </div> <!-- end of row -->
            </div> <!-- end of tile-widget -->

            <div class="tile-body nopadding">
              <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form" class="table-response">
                <table class="table table-bordered table-sortable">
                  <thead class="green-th">
                    <tr>
                      <th class="chk-center">
                        <input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" />
                      </th>
                      <th>
                        <?php if ($sort == 'cgd.name') { ?>
                          <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>">
                            <?php echo $column_name; ?>
                          </a>
                        <?php } else { ?>
                          <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                        <?php } ?>
                      </th>
                      <th>
                        <?php if ($sort == 'cg.sort_order') { ?>
                          <a href="<?php echo $sort_sort_order; ?>" class="<?php echo strtolower($order); ?>">
                            <?php echo $column_sort_order; ?>
                          </a>
                        <?php } else { ?>
                          <a href="<?php echo $sort_sort_order; ?>"><?php echo $column_sort_order; ?></a>
                        <?php } ?>
                      </th>                
                      <th><?php echo $column_action; ?></th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php if ($member_groups) { ?>
                      <?php foreach ($member_groups as $member_group) { ?>
                        <tr>
                          <td>
                            <?php if ($member_group['selected']) { ?>
                              <input type="checkbox" name="selected[]" value="<?php echo $member_group['member_group_id']; ?>" checked="checked" />
                            <?php } else { ?>
                              <input type="checkbox" name="selected[]" value="<?php echo $member_group['member_group_id']; ?>" />
                            <?php } ?>
                          </td>
                          <td><?php echo $member_group['name']; ?></td>
                          <td><?php echo $member_group['sort_order']; ?></td>
                          <td>
                            <?php foreach ($member_group['action'] as $action) { ?>
                              <a class="btn-edit" href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a>
                            <?php } ?>
                          </td>
                        </tr>
                      <?php } ?>
                    <?php } else { ?>
                      <tr>
                        <td class="text-center" colspan="4"><?php echo $text_no_results; ?></td>
                      </tr>
                    <?php } ?>
                  </tbody>
                </table>
              </form>
            </div>

            <div class="tile-footer bg-transparent-white-2 rounded-bottom-corners" style="background: rgba(253, 253, 253, 0.31);">
              <div class="row">
                <div class="col-sm-4"></div>
                <div class="col-sm-4 text-center">
                  <?php echo $pagination; ?>
                </div>
                <div class="col-sm-4 text-right sm-center">
                  <div class="controls control-btns">
                    
                  </div> <!-- end of controls -->
                </div>
              </div> <!-- end of row -->
            </div> <!-- end of tile-footer -->


          </section>
        </div> <!-- end of col -->  
      </div> <!-- end of row -->
    </div> <!-- end of main -->
  </div> <!-- end of content -->
