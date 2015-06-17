<?php echo $header; ?>

<div class="jumbotron-bg">
  <?php echo $navigation; ?>
  <div class="jumbotron container">
      <h1><?php echo $intro; ?></h1>
      <p><?php echo $tagline; ?></p>
      <p><a href="<?php echo $marketing; ?>" class="btn btn-primary" role="button">View Google Marketing</a></p>
  </div>
</div><!-- end of jumbotron-bg -->

<div class="container-fluid">
    <div id="split-divider" class="row">
      <div class="col-md-6 text-left">
        <form id="site-choose" class="form-inline" action="<?php echo $action_site_select; ?>" method="POST">
          <div class="form-group">
            <label for="bing_select">Site: </label>
             <select name="bing_id" id="bing-select">
              <?php foreach ($websites as $site){ ?>
                <?php if($site['bing_id'] == $bing_id) {?>
                  <option value="<?php echo $site['bing_id']; ?>" selected><?php echo $site['site_name']; ?></option>
                <?php } else {?>
                  <option value="<?php echo $site['bing_id']; ?>"><?php echo $site['site_name']; ?></option>
                <?php } ?>
              <?php } ?>
             </select>
          </div>
          <button type="submit" class="btn btn-default btn-xs">Submit</button>
        </form>
      </div>
      <div class="col-md-6 text-right">
        <form id="date-range" class="form-inline" action="<?php echo $action_date_select; ?>" method="POST">
          <div class="form-group">
            <label for="datepicker">Month:  </label>
            <select name="startDate" id="startDate">
            <?php if($avail_report_months) { ?>
              <?php foreach ($avail_report_months as $date) { ?>
                <?php if($date['month'] == $startDate) {?>
                  <option value="<?php echo $date['month']; ?>" selected><?php echo $date['month']; ?></option>
                <?php } else { ?>
                  <option value="<?php echo $date['month']; ?>" ><?php echo $date['month']; ?></option>
                <?php } ?>
              <?php } ?>
            <?php } else { ?>
              <option value="#">No Reports Available</option>
            <?php } ?>
            </select>

             <!-- <input type="text" name="startDate" class="form-control input-sm" placeholder="<?php echo date('F Y',strtotime($startDate)); ?>" id="datepicker"/> -->
          </div>
          <input type="hidden" name="bing_id" value="<?php echo $bing_id; ?>"/>
          <button type="submit" class="btn btn-default btn-xs">Submit</button>
        </form>
      </div>
    </div> <!-- row -->
  </div>




<div class="container-fluid" style="margin-top:15px;">
  <div class="row">
    <?php if($startDate) { ?>
      <div id="displaying" class="col-md-12 displayDate text-left">
        Showing Results For: <?php echo date('F Y',strtotime($startDate)); ?>
      </div>
    <?php } else { ?>
      <div id="displaying" class="col-md-12 displayDate text-left">
        Showing Results For:
      </div>
    <?php } ?>
  </div>

  <?php if(!isset($empty)) { ?>

  	<div class="row">
  		<!-- Clicks -->
  		<div class="card-container col-md-4 col-sm-4">
  		  <div class="card card-redbrown hover">
  		    <div class="front">
  		      <div class="media">
  		        <span class="pull-left">
  		          <i class="fa fa-search media-object"></i>
  		        </span>

  		        <div class="media-body">
  		          <small>Clicks</small>
  		          <h2 class="media-heading animate-number" data-value="<?php echo $clicks; ?>" data-animation-duration="1500">0</h2>
  		        </div>
  		      </div>
  		    </div> <!-- end of front -->
  		  </div> <!-- end of card-redbrown hover -->
  		</div> <!-- end of card-container -->
  		<!-- Clicks -->

  		<!-- Impressions -->
  		<div class="card-container col-md-4 col-sm-4">
  		  <div class="card card-redbrown hover">
  		    <div class="front">
  		      <div class="media">
  		        <span class="pull-left">
  		          <i class="fa fa-search media-object"></i>
  		        </span>

  		        <div class="media-body">
  		          <small>Impressions</small>
  		          <h2 class="media-heading animate-number" data-value="<?php echo $impressions; ?>" data-animation-duration="1500">0</h2>
  		        </div>
  		      </div>
  		    </div> <!-- end of front -->
  		  </div> <!-- end of card-redbrown hover -->
  		</div> <!-- end of card-container -->
  		<!-- Impressions -->

      <!-- CTR -->
  		<div class="card-container col-md-4 col-sm-4">
  		  <div class="card card-redbrown hover">
  		    <div class="front">
  		      <div class="media">
  		        <span class="pull-left">
  		          <i class="fa fa-search media-object"></i>
  		        </span>
  		        <div class="media-body">
  		          <small>CTR</small>
  		          <h2 class="media-heading animate-number" data-value="<?php echo round($ctr,2)."%"; ?>" data-animation-duration="1500">%</h2>
  		        </div>
  		      </div>
  		    </div> <!-- end of front -->
  		  </div> <!-- end of card-redbrown hover -->
  		</div> <!-- end of card-container -->
  		<!-- CTR -->
    </div>

    <div class="row">
  		<!-- Keywords -->
  		<div class="col-md-12 col-sm-12 col-x-12">
  			<section class="tile color transparent-black btop-green">
  			  <div class="tile-header">
  			    <h4 class="underline"><i class="fa fa-globe"></i> Keywords</h4>
  			  </div> <!-- end of tile-header -->

  			  <div class="tile-body">
  			    <div class="">
  			      <table class="table table-datatable table-custom table-striped" id="keywords">
  			        <thead>
  			          <tr>
  			            <th class="sort-alpha">Keyword</th>
  			            <th class="sort-numeric">Clicks</th>
  			            <th class="sort-numeric">Impressions</th>
  			          </tr>
  			        </thead>
  			        <tbody>
  			          <?php if ($keywords) { ?>
  			            <?php foreach ($keywords as $keyword) { ?>
  			              <tr>
  			                <td><?php echo $keyword['keyword']; ?></td>
                        <td><?php echo $keyword['clicks']; ?></td>
                        <td><?php echo $keyword['impressions']; ?></td>
  			              </tr>
  			            <?php } ?>
  			          <?php } else { ?>
  			            <tr>
  			              <td class="text-center" colspan="3"><?php echo $text_no_results; ?></td>
  			            </tr>
  			          <?php } ?>
  			        </tbody>
  			      </table>
  			    </div> <!-- end of table-responsive -->
  			  </div> <!-- end of tile-body -->
  			</section> <!-- end of section -->
  		</div><!-- end of Keywords -->
  	</div><!-- end of Tables -->
  <?php } else { ?>
    <div class="row">
      <div class="col-md-12 text-center">
        <p><?php echo $empty; ?></p>
      </div>
    </div>
  <?php } ?>


</div><!-- end of container -->

<?php echo $footer; ?>

<script>
  $(function(){

      // Add custom class to pagination div
      $.fn.dataTableExt.oStdClasses.sPaging = 'dataTables_paginate paging_bootstrap paging_custom';

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
      var oTable01 = $('#keywords').dataTable({
      	'bFilter': false,

        "sDom":
          "R<'row'<'col-md-6'l><'col-md-6'f>r>"+
          "t"+
          "<'row'<'col-md-4 sm-center'i><'col-md-4'><'col-md-4 text-right sm-center'p>>",
        "oLanguage": {
          "sSearch": ""
        },
        "aaSorting": [ [1,'desc'] ],
        "aoColumns": [
          null,
          null,
          null
        ],
        "fnInitComplete": function(oSettings, json) {
          console.log('complete');
        }
      });

      //initialize chosen
      $('.dataTables_length select').chosen({disable_search_threshold: 10});

      // $('div.dataTables_filter input').addClass('form-control');
      $('div.dataTables_length select').addClass('form-control');
      $('div.dataTables_length select').addClass('chosen-select');
      $('div.dataTables_length select').addClass('chosen-transparent');

  });
   $(function() {
        $( "#datepicker" ).datepicker();
        $( "#datepicker2" ).datepicker();
      });
</script>
