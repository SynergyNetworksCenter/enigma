<?php echo $header; ?>
<?php echo $navigation; ?>

 <!-- Page Content -->
    <div id="content" class="col-md-12">
      <div class="pageheader">
        <!-- <h2><i class="fa fa-graduation-cap" style="line-height: 48px;"></i> <?php //echo $heading_title; ?></h2> -->
        <div class="breadcrumbs">
          <ol class="breadcrumb">
            <?php foreach ($breadcrumbs as $breadcrumb) { ?>
              <li class="<?php echo $breadcrumb['class']; ?>"><?php echo $breadcrumb['text']; ?></li>
            <?php } ?>
          </ol>
        </div> <!-- end of breadcrumbs -->
      </div> <!-- end of pageheader -->

      <div id="notification-center">
        <?php if ($success) { ?>
          <div class="alert alert-success"><?php echo $success; ?></div>
        <?php } ?>
      </div>
  
      <div class="main">
        <div class="row">
          <div class="col-md-12">

            <section class="tile color transparent-black btop-green" style="margin-top:20px;">
              <div class="tile-header">
                <h1><i class="fa fa-user"> </i> <?php echo $heading_title; ?></h1>
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
                      <a href="<?php echo $clear; ?>" class="btn btn-delete"><?php echo $button_clear; ?></a>
                    </div> <!-- end of controls -->
                  </div> <!-- end of col -->
                </div> <!-- end of row -->
              </div> <!-- end of tile-widget -->

              <div class="tile-body">  
                <div class="table-responsive">
                    <table class="table table-datatable table-custom table-striped">
                      <thead>
                        <tr>
                          <th>Date:</th>
                          <th>Time:</th>
                          <th>Error:</th>
                          <th>File Location:</th>
                          <th>Line:</th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php foreach($lines as $line) { ?>
                        <?php $split = explode(" - ",$line); ?>
                        <?php $split1 = explode(" ", $split[0]); ?>
                        <?php $split2 = explode(" in ",$split[1]); ?>
                        <?php $split3 = explode(" on line ", $split2[1]); ?>
                        <tr>
                          <td id="date"><?php echo $split1[0]; ?></td>
                          <td id="time"><?php echo $split1[1]; ?></td>
                          <td id="error"><?php echo $split2[0]; ?></td>
                          <td id="file_location"><?php echo $split3[0]; ?></td>
                          <td style="text-align: center;" id="line"><?php echo $split3[1]; ?></td>
                        </tr>
                        <?php } ?>
                      </tbody>
                    </table>           
                </div> <!-- end of table responsive -->
              </div>  <!-- end of tile-body -->

            </section> <!-- end of section -->
          </div> <!-- end of col -->
        </div> <!-- end of row -->
      </div> <!-- end of main -->

    </div> <!-- end of content -->

<?php echo $footer; ?>