<?php echo $header; ?>
<?php echo $navigation; ?>

<div class="jumbotron-bg">
  <div class="jumbotron container" style="margin-bottom:0px;">
      <h1><?php echo $intro; ?></h1>
      <p><?php echo $tagline; ?></p>
      <p><a href="<?php echo $bing; ?>" class="btn btn-primary" role="button">View Bing Marketing</a></p>
  </div>
</div><!-- end of jumbotron-bg -->

<?php //var_dump($impressions); ?>

<div class="container">
	<div class="row">
		<div class="col-md-4">
			<div class="row">

        <!-- Clicks -->
				<div class="card-container col-md-12">
				  <div class="card card-redbrown hover">
				    <div class="front">
				      <div class="media">
				        <span class="pull-left">
				          <i class="fa fa-search media-object"></i>
				        </span>

				        <div class="media-body">
				          <small>Clicks</small>
				          <h2 class="media-heading animate-number" data-value="<?php echo $clicks['ga:adclicks']; ?>" data-animation-duration="1500">0</h2>
				        </div>
				      </div>
				    </div> <!-- end of front -->
				    <div class="back">
				      <a href="#">
				        <i class="fa fa-bar-chart-o fa-4x"></i>
				        <span>Check Summary</span>
				      </a>
				    </div> <!-- end of back -->
				  </div> <!-- end of card-redbrown hover -->
				</div> <!-- end of card-container -->
				<!-- Clicks -->

				<!-- Impressions -->
				<div class="card-container col-md-12">
				  <div class="card card-redbrown hover">
				    <div class="front">
				      <div class="media">
				        <span class="pull-left">
				          <i class="fa fa-search media-object"></i>
				        </span>

				        <div class="media-body">
				          <small>Impressions</small>
				          <h2 class="media-heading animate-number" data-value="<?php echo $impressions['ga:impressions']; ?>" data-animation-duration="1500">0</h2>
				        </div>
				      </div>
				    </div> <!-- end of front -->
				    <div class="back">
				      <a href="#">
				        <i class="fa fa-bar-chart-o fa-4x"></i>
				        <span>Check Summary</span>
				      </a>
				    </div> <!-- end of back -->
				  </div> <!-- end of card-redbrown hover -->
				</div> <!-- end of card-container -->
				<!-- Impressions -->

				<!-- CTR -->
				<div class="card-container col-md-12">
				  <div class="card card-redbrown hover">
				    <div class="front">
				      <div class="media">
				        <span class="pull-left">
				          <i class="fa fa-search media-object"></i>
				        </span>

				        <div class="media-body">
				          <small>CTR</small>
				          <h2 class="media-heading animate-number" data-value="<?php echo round($ctr['ga:CTR'],2); ?>%" data-animation-duration="1500">0</h2>
				        </div>
				      </div>
				    </div> <!-- end of front -->
				    <div class="back">
				      <a href="#">
				        <i class="fa fa-bar-chart-o fa-4x"></i>
				        <span>Check Summary</span>
				      </a>
				    </div> <!-- end of back -->
				  </div> <!-- end of card-redbrown hover -->
				</div> <!-- end of card-container -->
				<!-- CTR -->

				<!-- Visits -->
				<div class="card-container col-md-12">
				  <div class="card card-redbrown hover">
				    <div class="front">
				      <div class="media">
				        <span class="pull-left">
				          <i class="fa fa-search media-object"></i>
				        </span>

				        <div class="media-body">
				          <small>Visits</small>
				          <h2 class="media-heading animate-number" data-value="<?php echo $visits['ga:sessions']; ?>" data-animation-duration="1500">0</h2>
				        </div>
				      </div>
				    </div> <!-- end of front -->
				    <div class="back">
				      <a href="#">
				        <i class="fa fa-bar-chart-o fa-4x"></i>
				        <span>Check Summary</span>
				      </a>
				    </div> <!-- end of back -->
				  </div> <!-- end of card-redbrown hover -->
				</div> <!-- end of card-container -->
				<!-- Visits -->

				<!-- Conversions -->
				<div class="card-container col-md-12">
				  <div class="card card-redbrown hover">
				    <div class="front">
				      <div class="media">
				        <span class="pull-left">
				          <i class="fa fa-search media-object"></i>
				        </span>

				        <div class="media-body">
				          <small>Conversions</small>
				          <h2 class="media-heading animate-number" data-value="<?php echo $conversions['ga:goalCompletionsAll']; ?>" data-animation-duration="1500">0</h2>
				        </div>
				      </div>
				    </div> <!-- end of front -->
				    <div class="back">
				      <a href="#">
				        <i class="fa fa-bar-chart-o fa-4x"></i>
				        <span>Check Summary</span>
				      </a>
				    </div> <!-- end of back -->
				  </div> <!-- end of card-redbrown hover -->
				</div> <!-- end of card-container -->
				<!-- Conversions -->
			</div>
		</div>
		<div class="col-md-8">
			<div class="row">
				<div class="col-md-12">
					<section class="tile color transparent-black btop-green">
					  <div class="tile-header">
					    <h4 class="underline"><i class="fa fa-globe"></i> Keywords</h4>
					  </div> <!-- end of tile-header -->

					  <div class="tile-body">
					    <div class="table-responsive">
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
					                <td><?php echo $keyword[1]; ?></td>
					                <td><?php echo $keyword[2]; ?></td>
					                <td><?php echo $keyword[3]; ?></td>
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
				</div>

				<div class="col-md-12">
					<section class="tile color transparent-black btop-green">
					  <div class="tile-header">
					    <h4 class="underline"><i class="fa fa-globe"></i> Destination URLs</h4>
					  </div> <!-- end of tile-header -->

					  <div class="tile-body">
					    <div class="table-responsive">
					      <table class="table table-datatable table-custom table-striped" id="destinations">
					        <thead>
					          <tr>
					            <th class="sort-alpha">Destination URL</th>
					            <th class="sort-numeric">Page Views</th>
					            <th class="sort-numeric">Bounce Rate</th>
					          </tr>
					        </thead>
					        <tbody>
					          <?php if ($destinations) { ?>
					            <?php foreach ($destinations as $destination) { ?>
					              <tr>
					                <td><?php echo $destination[1]; ?></td>
					                <td><?php echo $destination[2]; ?></td>
					                <td><?php echo round($destination[3], 2); ?>%</td>
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
				</div>

				<div class="col-md-12">
					<section class="tile color transparent-black btop-green">
					  <div class="tile-header">
					    <h4 class="underline"><i class="fa fa-globe"></i> Best Keywords</h4>
					  </div> <!-- end of tile-header -->

					  <div class="tile-body">
					    <div class="table-responsive">
					      <table class="table table-datatable table-custom table-striped" id="bestkeywords">
					        <thead>
					          <tr>
					            <th class="sort-alpha">Keyword</th>
					            <th class="sort-numeric">Goal Completions</th>
					          </tr>
					        </thead>
					        <tbody>
					          <?php if ($best_keywords) { ?>
					            <?php foreach ($best_keywords as $best_keyword) { ?>
					              <tr>
					                <td><?php echo $best_keyword[1]; ?></td>
					                <td><?php echo $best_keyword[2]; ?></td>
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
				</div>


			</div>
		</div>
	</div> <!-- end of row -->






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

      var oTable02 = $('#destinations').dataTable({
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

      var oTable03 = $('#bestkeywords').dataTable({
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
          null
        ],
        "fnInitComplete": function(oSettings, json) {
          console.log('complete');
        }
      });

      var oTable04 = $('#sources').dataTable({
      	'bFilter': false,
      	"iDisplayLength": 5,
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
          null
        ],
        "fnInitComplete": function(oSettings, json) {
          console.log('complete');
        }
      });

      var oTable05 = $('#referrals').dataTable({
      	'bFilter': false,
      	"iDisplayLength": 5,
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
          null
        ],
        "fnInitComplete": function(oSettings, json) {
          console.log('complete');
        }
      });

      var oTable06 = $('#devices-used').dataTable({
      	'bFilter': false,
      	"iDisplayLength": 5,
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
          null
        ],
        "fnInitComplete": function(oSettings, json) {
          console.log('complete');
        }
      });

      var oTable07 = $('#organic-referrer').dataTable({
      	'bFilter': false,
      	"iDisplayLength": 5,
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

  })
</script>
