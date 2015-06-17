<?php echo $header; ?>


<div class="jumbotron-bg">
<?php echo $navigation; ?>
  <div class="jumbotron container">
      <h1><?php echo $intro; ?></h1>
      <p><?php echo $tagline; ?></p>
      <p><a href="<?php echo $bing; ?>" class="btn btn-primary" role="button">View Bing Marketing</a></p>
  </div>
</div><!-- end of jumbotron-bg -->

<!-- Date Range Row -->
	<div class="container-fluid">
		<div id="split-divider" class="row">
			<div class="col-md-6 text-left">
        <form id="site-choose" class="form-inline" action="<?php echo $action_site_select; ?>" method="POST">
				  <div class="form-group">
				    <label for="analytics_select">Site: </label>
				     <select name="analytics_id" id="analytics-select">
				     	<?php foreach ($websites as $site){ ?>
				     		<?php if($site['analytics_id'] == $analytics_id) {?>
									<option value="<?php echo $site['analytics_id']; ?>" selected><?php echo $site['site_name']; ?></option>
								<?php } else {?>
									<option value="<?php echo $site['analytics_id']; ?>"><?php echo $site['site_name']; ?></option>
								<?php } ?>
				     	<?php } ?>
				     </select>
				  </div>
				  <button type="submit" class="btn btn-default btn-xs">Submit</button>
				</form>
      </div>
			<div class="col-md-6 text-right">
				<form id="date-choose" class="form-inline" action="<?php echo $action_date_select; ?>" method="POST">
				  <div class="form-group">
				    <label for="datepicker">Start Date: </label>
				     <input type="text" name="startDate" class="form-control input-sm" id="datepicker"/>
				  </div>
				  <div class="form-group">
				    <label for="datepicker2">End Date: </label>
				     <input type="text" name="endDate" class="form-control input-sm" id="datepicker2"/>
				  </div>
				  	<input type="hidden" name="analytics_id" value="<?php echo $analytics_id; ?>"/>
				  <button type="submit" class="btn btn-default btn-xs">Submit</button>
				</form>
			</div>
		</div> <!-- row -->
	</div>


<div class="container-fluid" style="margin-top:15px;">
	<div class="row">
		<div id="displaying" class="col-md-12 displayDate text-left">
      Showing Results For: <?php echo date('F j, Y',strtotime($startDate)); ?> - <?php echo date('F j, Y',strtotime($endDate)); ?>
     </div>
	</div>

  <!-- Metrics Cards -->
	<div class="row">
    <!-- Clicks -->
		<div class="card-container col-md-2 col-sm-2 col-xs-6">
		  <div class="card card-redbrown hover">
		    <div class="front">
		      <div class="media">
		        <span class="pull-left">
		          <i class="hidden-xs fa fa-search media-object"></i>
		        </span>

		        <div class="media-body">
		          <small>Clicks</small>
		          <h2 class="media-heading animate-number" data-value="<?php echo $clicks['ga:adclicks']; ?>" data-animation-duration="1500">0</h2>
		        </div>
		      </div>
		    </div> <!-- end of front -->
		  </div> <!-- end of card-redbrown hover -->
		</div> <!-- end of card-container -->
		<!-- Clicks -->

		<!-- Impressions -->
		<div class="card-container col-md-3 col-sm-3 col-xs-6">
		  <div class="card card-blue hover">
		    <div class="front">
		      <div class="media">
		        <span class="pull-left">
		          <i class="hidden-xs fa fa-search media-object"></i>
		        </span>

		        <div class="media-body">
		          <small>Impressions</small>
		          <h2 class="media-heading animate-number" data-value="<?php echo $impressions['ga:impressions']; ?>" data-animation-duration="1500">0</h2>
		        </div>
		      </div>
		    </div> <!-- end of front -->
		  </div> <!-- end of card-redbrown hover -->
		</div> <!-- end of card-container -->
		<!-- Impressions -->

		<!-- CTR -->
		<div class="card-container col-md-2 col-sm-2 col-xs-6">
		  <div class="card card-greensea hover">
		    <div class="front">
		      <div class="media">
		        <span class="pull-left">
		          <i class="hidden-xs fa fa-search media-object"></i>
		        </span>

		        <div class="media-body">
		          <small>CTR</small>
		          <h2 class="media-heading animate-number" data-value="<?php echo round($ctr['ga:CTR'],2); ?>%" data-animation-duration="1500">0</h2>
		        </div>
		      </div>
		    </div> <!-- end of front -->
		  </div> <!-- end of card-redbrown hover -->
		</div> <!-- end of card-container -->
		<!-- CTR -->

		<!-- Visits -->
		<div class="card-container col-md-3 col-sm-3 col-xs-6">
		  <div class="card card-slategray hover">
		    <div class="front">
		      <div class="media">
		        <span class="pull-left">
		          <i class="hidden-xs fa fa-search media-object"></i>
		        </span>

		        <div class="media-body">
		          <small>Visits</small>
		          <h2 class="media-heading animate-number" data-value="<?php echo $visits['ga:sessions']; ?>" data-animation-duration="1500">0</h2>
		        </div>
		      </div>
		    </div> <!-- end of front -->
		  </div> <!-- end of card-redbrown hover -->
		</div> <!-- end of card-container -->
		<!-- Visits -->

		<!-- Conversions -->
		<div class="card-container col-md-2 col-sm-2 col-xs-6">
		  <div class="card card-redbrown hover">
		    <div class="front">
		      <div class="media">
		        <span class="pull-left">
		          <i class="hidden-xs fa fa-search media-object"></i>
		        </span>

		        <div class="media-body">
		          <small>Conversions</small>
		          <h2 class="media-heading animate-number" data-value="<?php echo $conversions['ga:goalCompletionsAll']; ?>" data-animation-duration="1500">0</h2>
		        </div>
		      </div>
		    </div> <!-- end of front -->
		  </div> <!-- end of card-redbrown hover -->
		</div> <!-- end of card-container -->
		<!-- Conversions -->
	</div><!-- end of Metrics Cards -->

  <!-- Tables -->
	<div class="row">

    <!-- Keywords -->
		<div class="col-md-12">
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
			          	<?php $keyword_results = true; ?>
			            <?php foreach ($keywords as $keyword) { ?>
			              <tr>
			                <td><?php echo $keyword[1]; ?></td> <!-- Keyword -->
			                <td><?php echo $keyword[2]; ?></td> <!-- Clicks -->
			                <td><?php echo $keyword[3]; ?></td> <!-- Impressions -->
			              </tr>
			            <?php } ?>
			          <?php } else { ?>
			            <tr>
			              <td class="text-center" colspan="3"><?php echo $text_no_results; ?></td>
			              <?php $keyword_results = false; ?>
			            </tr>
			          <?php } ?>
			        </tbody>
			      </table>
			    </div> <!-- end of table-responsive -->
			  </div> <!-- end of tile-body -->
			</section> <!-- end of section -->
		</div><!-- end of Keywords -->

    <!-- Top Landing Pages -->
		<div class="col-md-12">
			<section class="tile color transparent-black btop-green">
			  <div class="tile-header">
			    <h4 class="underline"><i class="fa fa-globe"></i> Top Landing Pages</h4>
			  </div> <!-- end of tile-header -->

			  <div class="tile-body">
			    <div class="">
			      <table class="table table-datatable table-custom table-striped" id="destinations">
			        <thead>
			          <tr>
			            <th class="sort-alpha">Page URL</th>
			            <th class="sort-numeric">Pageviews</th>
			            <th class="sort-numeric">Bounce Rate</th>
			          </tr>
			        </thead>
			        <tbody>
			          <?php if ($destinations) { ?>
			          	<?php $destination_results = true; ?>
			            <?php foreach ($destinations as $destination) { ?>
			              <tr>
			                <td><a class="links" href="<?php echo $destination[1]; ?>" target="_blank"><?php echo $destination[1]; ?></a></td> <!-- Destination URLs -->
			                <td><?php echo $destination[2]; ?></td> <!-- Pageviews -->
			                <td><?php echo round($destination[3], 2); ?>%</td> <!-- Bounce Rates -->
			              </tr>
			            <?php } ?>
			          <?php } else { ?>
			            <tr>
			              <td class="text-center" colspan="3"><?php echo $text_no_results; ?></td>
			              <?php $destination_results = false; ?>
			            </tr>
			          <?php } ?>
			        </tbody>
			      </table>
			    </div> <!-- end of table-responsive -->
			  </div> <!-- end of tile-body -->
			</section> <!-- end of section -->
		</div><!-- end of Top Landing Pages -->

    <!-- Top Performing Keywords -->
		<!-- <div class="col-md-12"> -->
			<!-- <section class="tile color transparent-black btop-green"> -->
			  <!-- <div class="tile-header"> -->
			    <!-- <h4 class="underline"><i class="fa fa-globe"></i> Top Performing Keywords</h4> -->
			  <!-- </div> <!-- end of tile-header -->

			  <!-- <div class="tile-body"> -->
			    <!-- <div class="">
			      <table class="table table-datatable table-custom table-striped" id="bestkeywords">
			        <thead>
			          <tr>
			            <th class="sort-alpha">Keyword</th>
			            <th class="sort-numeric">Goal Completions</th>
			          </tr>
			        </thead>
			        <tbody>
			          <?php if ($best_keywords) { ?>
			          	<?php $best_results = true; ?>
			            <?php foreach ($best_keywords as $best_keyword) { ?>
			              <tr>
			                <td><?php echo $best_keyword[1]; ?></td> <!-- Keyword -->
			                <!-- <td><?php echo $best_keyword[2]; ?></td> <!-- Goal Completions -->
			              <!-- </tr> -->
			            <!-- <?php } ?> -->
			          <!-- <?php } else { ?> -->
			            <!-- <tr> -->
			              <!-- <td class="text-center" colspan="3"><?php echo $text_no_results; ?></td> -->
			              <!-- <?php $best_results = false; ?> -->
			            <!-- </tr> -->
			          <!-- <?php } ?> -->
			        <!-- </tbody> -->
			      <!-- </table> -->
			    <!-- </div> <!-- end of table-responsive -->
			  <!-- </div> <!-- end of tile-body -->
			<!-- </section> <!-- end of section -->
		<!-- </div><!-- end of Top Performing Keywords -->

    <!-- Display Advertising -->
    <div class="col-md-12">
      <section class="tile color transparent-black btop-green">
        <div class="tile-header">
          <h4 class="underline"><i class="fa fa-globe"></i> Display Advertising</h4>
        </div> <!-- end of tile-header -->

        <div class="tile-body">
          <div class="">
            <table class="table table-datatable table-custom table-striped" id="placements">
              <thead>
                <tr>
                  <th class="sort-alpha">Placement</th>
                  <th class="sort-numeric">Clicks</th>
                  <th class="sort-numeric">Impressions</th>
                </tr>
              </thead>
              <tbody>
                <?php if ($placements) { ?>
                  <?php $placement_results = true; ?>
                  <?php foreach ($placements as $placement) { ?>
                    <tr>
                      <td><?php echo $placement['placement']; ?></td>
                      <td><?php echo $placement['clicks']; ?></td>
                      <td><?php echo $placement['impressions']; ?></td>
                    </tr>
                  <?php } ?>
                <?php } else { ?>
                  <tr>
                    <td class="text-center" colspan="3"><?php echo $text_no_results; ?></td>
                    <?php $placement_results = false; ?>
                  </tr>
                <?php } ?>
              </tbody>
            </table>
          </div> <!-- end of table-responsive -->
        </div> <!-- end of tile-body -->
      </section> <!-- end of section -->
    </div><!-- end of Manual Placements -->

    <!-- Remarketing -->
    <div class="col-md-12 col-sm-12 col-x-12">
      <section class="tile color transparent-black btop-green">
        <div class="tile-header">
          <h4 class="underline"><i class="fa fa-globe"></i> Remarketing</h4>
        </div> <!-- end of tile-header -->

        <div class="tile-body">
          <div class="">
            <table class="table table-datatable table-custom table-striped" id="domains">
              <thead>
                <tr>
                  <th class="sort-alpha">Domain</th>
                  <th class="sort-numeric">Clicks</th>
                  <th class="sort-numeric">Impressions</th>
                </tr>
              </thead>
              <tbody>
                <?php if ($domains) { ?>
                  <?php $domain_results = true; ?>
                  <?php foreach ($domains as $domain) { ?>
                    <tr>
                      <td><?php echo $domain['domain']; ?></td>
                      <td><?php echo $domain['clicks']; ?></td>
                      <td><?php echo $domain['impressions']; ?></td>
                    </tr>
                  <?php } ?>
                <?php } else { ?>
                  <tr>
                    <td class="text-center" colspan="3"><?php echo $text_no_results; ?></td>
                    <?php $domain_results = false; ?>
                  </tr>
                <?php } ?>
              </tbody>
            </table>
          </div> <!-- end of table-responsive -->
        </div> <!-- end of tile-body -->
      </section> <!-- end of section -->
    </div><!-- end of Automatic Placements -->

    <!-- 12 Months Trend Chart -->
    <div class="tile-header color transparent-black textured rounded-top-corners">
      <h1><strong>Clicks vs. Impressions</strong> Chart</h1>
      <div class="controls">
        <a href="#" class="minimize"><i class="fa fa-chevron-down"></i></a>
        <a href="#" class="refresh"><i class="fa fa-refresh"></i></a>
        <a href="#" class="remove"><i class="fa fa-times"></i></a>
      </div>
    </div>
    <!-- /tile header -->


    <!-- tile widget -->
    <div class="tile-widget color transparent-black textured">
      <div id="statistics-chart" class="chart statistics" style="height: 250px;"></div>
    </div>
    <!-- /tile widget -->
    <!-- end of 12 Months Trend Chart -->

  </div><!-- end of Tables -->

</div><!-- end of container -->

<?php echo $footer; ?>

<script>
  $(function(){

    // Clicks & Impressions Trend Line Chart
    // Initialize flot chart
    var d1 =[ [1, 715],
          [2, 985],
          [3, 1525],
          [4, 1254],
          [5, 1861],
          [6, 2621],
          [7, 1987],
          [8, 2136],
          [9, 2364],
          [10, 2851],
          [11, 1546],
          [12, 2541]
    ];
    var d2 =[ [1, 463],
              [2, 578],
              [3, 327],
              [4, 984],
              [5, 1268],
              [6, 1684],
              [7, 1425],
              [8, 1233],
              [9, 1354],
              [10, 1200],
              [11, 1260],
              [12, 1320]
    ];
    var months = ["January", "February", "March", "April", "May", "Juny", "July", "August", "September", "October", "November", "December"];

    // flot chart generate
    var plot = $.plotAnimator($("#statistics-chart"),
      [
        {
          label: 'Clicks',
          data: d1,
          lines: {lineWidth:3},
          shadowSize:0,
          color: '#ffffff'
        },
        { label: "Impressions",
          data: d2,
          animator: {steps: 99, duration: 500, start:200, direction: "right"},
          lines: {
            fill: .15,
            lineWidth: 0
          },
          color:['#ffffff']
        },{
          label: 'Sales',
          data: d1,
          points: { show: true, fill: true, radius:6,fillColor:"rgba(0,0,0,.5)",lineWidth:2 },
          color: '#fff',
          shadowSize:0
        },
        { label: "Visits",
          data: d2,
          points: { show: true, fill: true, radius:6,fillColor:"rgba(255,255,255,.2)",lineWidth:2 },
          color: '#fff',
          shadowSize:0
        }
      ],{

      xaxis: {

        tickLength: 0,
        tickDecimals: 0,
        min:1,
        ticks: [[1,"JAN"], [2, "FEB"], [3, "MAR"], [4, "APR"], [5, "MAY"], [6, "JUN"], [7, "JUL"], [8, "AUG"], [9, "SEP"], [10, "OCT"], [11, "NOV"], [12, "DEC"]],

        font :{
          lineHeight: 24,
          weight: "300",
          color: "#ffffff",
          size: 14
        }
      },

      yaxis: {
        ticks: 4,
        tickDecimals: 0,
        tickColor: "rgba(255,255,255,.3)",

        font :{
          lineHeight: 13,
          weight: "300",
          color: "#ffffff"
        }
      },

      grid: {
        borderWidth: {
          top: 0,
          right: 0,
          bottom: 1,
          left: 1
        },
        borderColor: 'rgba(255,255,255,.3)',
        margin:0,
        minBorderMargin:0,
        labelMargin:20,
        hoverable: true,
        clickable: true,
        mouseActiveRadius:6
      },

      legend: { show: false}
    });

    $(window).resize(function() {
      // redraw the graph in the correctly sized div
      plot.resize();
      plot.setupGrid();
      plot.draw();
    });


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

      // Keywords
      <?php if($keyword_results == true){ ?>
      /* Build the DataTable with third column using our custom sort functions */
      var oTable01 = $('#keywords').dataTable({
      	'bFilter': false,
      	"iDisplayLength": 5,
      	"aLengthMenu": [5,10],
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
      <?php } ?>

      // Top Landing Pages
      <?php if($destination_results == true){ ?>
      var oTable02 = $('#destinations').dataTable({
      	'bFilter': false,
      	"iDisplayLength": 5,
      	"aLengthMenu": [5,10],
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
      <?php } ?>

      // // Top Performing Keywords
      // <?php if($best_results == true){ ?>
      // var oTable03 = $('#bestkeywords').dataTable({
      // 	'bFilter': false,
      // 	"iDisplayLength": 5,
      // 	"aLengthMenu": [5,10],
      //   "sDom":
      //     "R<'row'<'col-md-6'l><'col-md-6'f>r>"+
      //     "t"+
      //     "<'row'<'col-md-4 sm-center'i><'col-md-4'><'col-md-4 text-right sm-center'p>>",
      //   "oLanguage": {
      //     "sSearch": ""
      //   },
      //   "aaSorting": [ [1,'desc'] ],
      //   "aoColumns": [
      //     null,
      //     null
      //   ],
      //   "fnInitComplete": function(oSettings, json) {
      //     console.log('complete');
      //   }
      // });
      // <?php } ?>

      // Mandual Placements
      <?php if($placement_results == true){ ?>
      /* Build the DataTable with third column using our custom sort functions */
      var oTable04 = $('#placements').dataTable({
      	'bFilter': false,
      	"iDisplayLength": 5,
      	"aLengthMenu": [5,10],
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
      <?php } ?>

      // Automatic Domains (Placements)
      <?php if($domain_results == true){ ?>
      /* Build the DataTable with third column using our custom sort functions */
      var oTable05 = $('#domains').dataTable({
      	'bFilter': false,
      	"iDisplayLength": 5,
      	"aLengthMenu": [5,10],
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
      <?php } ?>

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
