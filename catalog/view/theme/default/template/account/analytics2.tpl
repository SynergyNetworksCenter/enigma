<?php echo $header; ?>
<?php echo $navigation; ?>


	<?php //var_dump($timeline); ?>
	<?php //var_dump($test); ?>


<div class="jumbotron-bg">
  <div class="jumbotron container" style="margin-bottom:0px;">
      <h1><?php echo $intro; ?></h1>
      <p>Check out Your Google Analytics Below</p>
  </div>
</div><!-- end of jumbotron-bg -->

<!-- Date Range Row -->
		<div id="date-range" class="row">
			<div class="col-md-12">
				<div class="container">

					<form id="date-range" class="form-inline" action="<?php echo $action; ?>" method="POST">
					  <div class="form-group">
					    <label for="datepicker">Start Date: </label>
					     <input type="text" name="startDate" class="form-control" id="datepicker"/>
					  </div>
					  <div class="form-group">
					    <label for="datepicker2">End Date: </label>
					     <input type="text" name="endDate" class="form-control" id="datepicker2"/>
					  </div>
					  <button type="submit" class="btn btn-default">Submit</button>
					</form>

				</div>
			</div>
		</div> <!-- row -->

<div class="container-fluid" style="margin-top:15px;">
<!-- Sessions vs Pageviews Timeline Row -->
	<div class="row">
		<div class="col-lg-12">
			<section class="tile transparent">
        <!-- tile header -->
        <div class="tile-header color transparent-black textured rounded-top-corners">
          <h1><strong>Sessions Vs</strong> Page Views</h1>
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
      </section>
		</div>
	</div>

<!-- Metrics Cards Row -->
	<div class="row cards">
	<!-- Sessions -->
		<div class="card-container col-lg-2 col-sm-4 col-sm-6">
	    <div class="card card-redbrown hover">
	      <div class="front">
	        <div class="media">
	          <span class="pull-left">
	            <i class="fa fa-users media-object"></i>
	          </span>

	          <div class="media-body">
	            <small>Sessions</small>
	            <h2 class="media-heading animate-number" data-value="<?php echo $flip_cards['ga:sessions']; ?>" data-animation-duration="1500">0</h2>
	          </div>
	        </div>

	        <!-- <div class="progress-list">
	          <div class="details">
	            <div class="title">Precentage Over Previous Period</div>
	          </div>
	          <div class="status pull-right bg-transparent-black-1">
	            <span class="animate-number" data-value="83" data-animation-duration="1500">0</span>%
	          </div>
	          <div class="clearfix"></div>
	          <div class="progress progress-little progress-transparent-black">
	            <div class="progress-bar animate-progress-bar" data-percentage="83%"></div>
	          </div>
	        </div> -->
	      </div> <!-- end of front -->
	      <div class="back">
	        <a href="#">
	          <i class="fa fa-bar-chart-o fa-4x"></i>
	          <span>Check Summary</span>
	        </a>
	      </div> <!-- end of back -->
	    </div> <!-- end of card-redbrown hover -->
	  </div> <!-- end of card-container -->
	<!-- Sessions Per User -->
	  <div class="card-container col-lg-2 col-sm-4 col-sm-6">
	    <div class="card card-blue hover">
	      <div class="front">
	        <div class="media">
	          <span class="pull-left">
	            <i class="fa fa-users media-object"></i>
	          </span>

	          <div class="media-body">
	            <small>Sessions Per User</small>
	            <h2 class="media-heading animate-number" data-value="<?php echo round($flip_cards['ga:sessionsPerUser'],2); ?>" data-animation-duration="1500">0</h2>
	          </div>
	        </div>

	        <!-- <div class="progress-list">
	          <div class="details">
	            <div class="title">This month plan %</div>
	          </div>
	          <div class="status pull-right bg-transparent-black-1">
	            <span class="animate-number" data-value="83" data-animation-duration="1500">0</span>%
	          </div>
	          <div class="clearfix"></div>
	          <div class="progress progress-little progress-transparent-black">
	            <div class="progress-bar animate-progress-bar" data-percentage="83%"></div>
	          </div>
	        </div> -->
	      </div> <!-- end of front -->
	      <div class="back">
	        <a href="#">
	          <i class="fa fa-bar-chart-o fa-4x"></i>
	          <span>Check Summary</span>
	        </a>
	      </div> <!-- end of back -->
	    </div> <!-- end of card-redbrown hover -->
	  </div> <!-- end of card-container -->
	<!-- Pageviews -->
		<div class="card-container col-lg-2 col-sm-4 col-sm-6">
	    <div class="card card-greensea hover">
	      <div class="front">
	        <div class="media">
	          <span class="pull-left">
	            <i class="fa fa-eye media-object"></i>
	          </span>

	          <div class="media-body">
	            <small>Page Views</small>
	            <h2 class="media-heading animate-number" data-value="<?php echo $flip_cards['ga:pageviews']; ?>" data-animation-duration="1500">0</h2>
	          </div>
	        </div>

	        <!-- <div class="progress-list">
	          <div class="details">
	            <div class="title">This month plan %</div>
	          </div>
	          <div class="status pull-right bg-transparent-black-1">
	            <span class="animate-number" data-value="83" data-animation-duration="1500">0</span>%
	          </div>
	          <div class="clearfix"></div>
	          <div class="progress progress-little progress-transparent-black">
	            <div class="progress-bar animate-progress-bar" data-percentage="83%"></div>
	          </div>
	        </div> -->
	      </div> <!-- end of front -->
	      <div class="back">
	        <a href="#">
	          <i class="fa fa-bar-chart-o fa-4x"></i>
	          <span>Check Summary</span>
	        </a>
	      </div> <!-- end of back -->
	    </div> <!-- end of card-redbrown hover -->
	  </div> <!-- end of card-container -->
	<!-- Avg. Time on Page -->
	  <div class="card-container col-lg-2 col-sm-4 col-sm-6">
	    <div class="card card-slategray hover">
	      <div class="front">
	        <div class="media">
	          <span class="pull-left">
	            <i class="fa fa-clock-o media-object"></i>
	          </span>

	          <div class="media-body">
	            <small>Avg. Time On Page</small>
	            <h2 class="media-heading animate-number" data-value="<?php echo gmdate("H:i:s", $flip_cards['ga:avgTimeOnPage']); ?>" data-animation-duration="1500">0</h2>
	          </div>
	        </div>

	        <!-- <div class="progress-list">
	          <div class="details">
	            <div class="title">This month plan %</div>
	          </div>
	          <div class="status pull-right bg-transparent-black-1">
	            <span class="animate-number" data-value="83" data-animation-duration="1500">0</span>%
	          </div>
	          <div class="clearfix"></div>
	          <div class="progress progress-little progress-transparent-black">
	            <div class="progress-bar animate-progress-bar" data-percentage="83%"></div>
	          </div>
	        </div> -->
	      </div> <!-- end of front -->
	      <div class="back">
	        <a href="#">
	          <i class="fa fa-bar-chart-o fa-4x"></i>
	          <span>Check Summary</span>
	        </a>
	      </div> <!-- end of back -->
	    </div> <!-- end of card-redbrown hover -->
	  </div> <!-- end of card-container -->
	<!-- Organic Searches -->
		<div class="card-container col-lg-2 col-sm-4 col-sm-6">
	    <div class="card card-greensea hover">
	      <div class="front">
	        <div class="media">
	          <span class="pull-left">
	            <i class="fa fa-search media-object"></i>
	          </span>

	          <div class="media-body">
	            <small>Organic Searches</small>
	            <h2 class="media-heading animate-number" data-value="<?php echo $flip_cards2['ga:organicSearches']; ?>" data-animation-duration="1500">0</h2>
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
	<!-- Total Events -->
	  <!-- <div class="card-container col-lg-2 col-sm-4 col-sm-6">
	    <div class="card card-slategray hover">
	      <div class="front">
	        <div class="media">
	          <span class="pull-left">
	            <i class="fa fa-search media-object"></i>
	          </span>
//space	          <div class="media-body">
	            <small>Total Events</small>
	            <h2 class="media-heading animate-number" data-value="<?php //echo $flip_cards2['ga:totalEvents']; ?>" data-animation-duration="1500">0</h2>
	          </div>
	        </div>
	      </div>
	      <div class="back">
	        <a href="#">
	          <i class="fa fa-bar-chart-o fa-4x"></i>
	          <span>Check Summary</span>
	        </a>
	      </div>
	    </div>
	  </div> -->

	<!-- Bounces -->
	  <!-- <div class="card-container col-lg-2 col-sm-4 col-sm-6">
	    <div class="card card-blue hover">
	      <div class="front">
	        <div class="media">
	          <span class="pull-left">
	            <i class="fa fa-search media-object"></i>
	          </span>
//space	          <div class="media-body">
	            <small>Bounces</small>
	            <h2 class="media-heading animate-number" data-value="<?php //echo $flip_cards2['ga:bounces']; ?>" data-animation-duration="1500">0</h2>
	          </div>
	        </div>
	      </div>
	      <div class="back">
	        <a href="#">
	          <i class="fa fa-bar-chart-o fa-4x"></i>
	          <span>Check Summary</span>
	        </a>
	      </div>
	    </div>
	  </div>  -->

	<!-- Unique Pageviews -->
	  <div class="card-container col-lg-2 col-sm-4 col-sm-6">
	    <div class="card card-redbrown hover">
	      <div class="front">
	        <div class="media">
	          <span class="pull-left">
	            <i class="fa fa-search media-object"></i>
	          </span>

	          <div class="media-body">
	            <small>Unique Page Views</small>
	            <h2 class="media-heading animate-number" data-value="<?php echo $flip_cards2['ga:uniquePageviews']; ?>" data-animation-duration="1500">0</h2>
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
	</div> <!-- end card row -->

<!-- Actual Statistics Row -->
	<div class="row">
		<div class="col-lg-12 col-sm-12 col-sm-12">
			<section class="tile transparent">
        <!-- tile body -->
        <div class="tile-body color transparent-white rounded-bottom-corners">
          <div class="row">
	          <ul class="inline">

	            <li class="col-md-8 col-sm-12 col-xs-12 text-center">

	              <h4 class="underline text-left"><strong>Actual</strong> Statistics</h4>

		            <div class="inner-container inline">
		              <div data-percent="100" data-size="140" class="pie-chart inline" data-scale-color="false" data-track-color="rgba(0,0,0,0)" data-bar-color="#ffffff" data-line-width="5">
		                <div class="text-center">
		                  <i class="fa fa-user fa-4x"></i>
		                </div>
		              </div>
		              <p class="chart-overall text-center medium-thin uppercase"><span class="big-medium animate-number" data-value="<?php echo $visitor_stats['ga:users']; ?>" data-animation-duration="2500">0</span> Users</p>
		            </div>

		            <div class="inner-container inline">
		              <div data-percent="85" data-size="140" class="pie-chart inline" data-scale-color="false" data-track-color="rgba(0,0,0,0)" data-bar-color="rgba(0,0,0,.4)" data-line-width="5">
		                <div class="text-center">
		                  <span><i class="fa fa-users fa-4x color-transparent-black"></i></span>
		                </div>
		              </div>
		              <p class="chart-overall text-center medium-thin uppercase color-transparent-black"><span class="big-medium animate-number" data-value="<?php echo $visitor_stats['ga:newUsers']; ?>" data-animation-duration="2500">0</span> New Users</p>
		            </div>
	            </li>

	            <li class="col-md-4 col-sm-12 col-xs-12">
	              <h4 class="underline"><i class="fa fa-users"></i> <strong>Visitors</strong> Statistics</h4>
	              <ul class="progress-list">
	              	<?php foreach ($geo_stats as $stats) { ?>
			              <li>
			                <div class="details">
			                  <div class="title"><?php echo $stats[0]; ?> - <?php echo $stats[1]; ?></div>
			                 	<div class="description">% of Total Users From <?php echo $stats[0]; ?></div>
			               	</div>
			               	<div class="status pull-right">
			                 	<span class="animate-number" data-value="<?php echo round(($stats[1]/$visitor_stats['ga:users'])*100); ?>" data-animation-duration="1500">0</span>%
			               	</div>
			               	<div class="clearfix"></div>
			                <div class="progress progress-little">
			                  <div class="progress-bar animate-progress-bar" style="background-color: <?php printf( "#%06X\n", mt_rand( 0, 0xFFFFFF )); ?>;" data-percentage="<?php echo ($stats[1]/$visitor_stats['ga:users'])*100; ?>%" style="width: 0%;"></div>
			                </div>
			              </li>
			            <?php } ?>
	              </ul>
	            </li>
	          </ul>
          </div>
       	</div>
        <!-- /tile body -->
      </section>
		</div>
	</div>

<!-- Pie Charts Row -->
	<div class="row">
	<!-- Visits By Traffic Type Pie -->
		<div class="col-lg-4 col-sm-4 col-sm-12">
			<!-- tile -->
			<section class="tile color transparent-black">
        <!-- tile header -->
        <div class="tile-header">
          <h4 class="underline"><strong>Visits</strong> By Traffic Type</h4>
          <div class="controls">
            <a href="#" class="minimize"><i class="fa fa-chevron-down"></i></a>
            <a href="#" class="remove"><i class="fa fa-times"></i></a>
          </div>
        </div>
        <!-- /tile header -->

        <!-- tile body -->
        <div class="tile-body">
          <div id="visits-by-traffic" style="height: 230px;" class="morris-chart"></div>
          <ul class="inline text-center chart-legend">
						<?php $color_count = 0; ?>
          	<?php foreach ($visitsByTraffic_stats['visits'] as $visit) { ?>
							<li><span class="badge badge-outline" style="border-color: <?php echo $visitsByTraffic_stats['colors'][$color_count]; ?>"></span> <?php echo $visit[0]; ?> <small><?php echo round(($visit[1]/$totalSessions)*100); ?>%</small></li>
							<?php $color_count++; ?>
						<?php } ?>
          </ul>
        </div>
        <!-- /tile body -->
      </section>
      <!-- /tile -->
		</div>
<!-- New vs Returning Visitors -->
		<div class="col-lg-4 col-sm-4 col-sm-12">
			<section class="tile color transparent-black">
        <!-- tile header -->
        <div class="tile-header">
          <h4 class="underline"><strong>New Vs Returning</strong> Visitors</h4>
          <div class="controls">
            <a href="#" class="minimize"><i class="fa fa-chevron-down"></i></a>
            <a href="#" class="refresh"><i class="fa fa-refresh"></i></a>
            <a href="#" class="remove"><i class="fa fa-times"></i></a>
          </div>
        </div>
        <!-- /tile header -->

        <!-- tile body -->
        <div class="tile-body">
          <div id="visits-by-visitor" style="height: 230px;" class="morris-chart"></div>
          <ul class="inline text-center chart-legend">

							<?php $color_count = 0; ?>
          		<?php foreach ($visitsByVisitor_stats['visits'] as $visit) { ?>
								<li><span class="badge badge-outline" style="border-color: <?php echo $visitsByVisitor_stats['colors'][$color_count]; ?>"></span> <?php echo $visit[0]; ?> <small><?php echo round(($visit[1]/$totalSessions)*100); ?>%</small></li>
								<?php $color_count++; ?>
							<?php } ?>


          </ul>
        </div>
        <!-- /tile body -->
      </section>
		</div>

		<div class="col-md-4">
			<section class="tile color transparent-black">
        <!-- tile header -->
        <div class="tile-header">
          <h4 class="underline"><strong>Sessions By</strong> Browser</h4>
          <div class="controls">
            <a href="#" class="minimize"><i class="fa fa-chevron-down"></i></a>
            <a href="#" class="refresh"><i class="fa fa-refresh"></i></a>
            <a href="#" class="remove"><i class="fa fa-times"></i></a>
          </div>
        </div>
        <!-- /tile header -->

        <!-- tile body -->
        <div class="tile-body">
          <div id="browser-usage" style="height: 230px;" class="morris-chart"></div>
          <ul class="inline text-center chart-legend">
          	<?php $color_count = 0; ?>
          	<?php foreach ($browser_stats['browsers'] as $browser) { ?>
							<li><span class="badge badge-outline" style="border-color: <?php echo $browser_stats['colors'][$color_count]; ?>"></span> <?php echo $browser[0]; ?> <small><?php echo round(($browser[1]/$totalSessions)*100); ?>%</small></li>
						<?php $color_count++; ?>
          	<?php } ?>
          		<li><span class="badge badge-outline" style="border-color: #1693A5"></span> Other <small><?php echo $browser_stats['others']; ?>%</small></li>

            <!-- <li><span class="badge badge-outline" style="border-color: #1693A5"></span> Other <small>25%</small></li>
            <li><span class="badge badge-outline" style="border-color: #2fbbe8"></span> Safari <small>20%</small></li>
            <li><span class="badge badge-outline" style="border-color: #72cae7"></span> Firefox <small>15%</small></li>
            <li><span class="badge badge-outline" style="border-color: #ffc100"></span> Internet Explorer <small>10%</small></li>
            <li><span class="badge badge-outline" style="border-color: #d9544f"></span> Opera <small>5%</small></li> -->
          </ul>
        </div>
        <!-- /tile body -->
      </section>
		</div>

		<div class="col-md-4">
			<section class="tile color transparent-black">
        <!-- tile header -->
        <div class="tile-header">
          <h4 class="underline"><strong>Device</strong> Categories</h4>
        </div>
        <!-- /tile header -->

        <!-- tile body -->
        <div class="tile-body">
          <div id="device-categories" style="height: 230px;" class="morris-chart"></div>
          <ul class="inline text-center chart-legend">
						<?php $color_count = 0; ?>
          	<?php foreach ($device_stats['device'] as $device) { ?>
							<li><span class="badge badge-outline" style="border-color: <?php echo $device_stats['colors'][$color_count]; ?>"></span> <?php echo $device[0]; ?> <small><?php echo round(($device[1]/$totalSessions)*100); ?>%</small></li>
							<?php $color_count++; ?>
						<?php } ?>
						<!-- <li><span class="badge badge-outline" style="border-color: #1693A5"></span> Other <small><?php //echo $device_stats['others']; ?>%</small></li> -->
          </ul>
        </div>
        <!-- /tile body -->
      </section>
		</div>
	</div> <!-- end of row -->

  <!-- <div class="row cards">
		<div class="card-container col-lg-3 col-sm-6 col-sm-12">
	    <div class="card card-greensea hover">
	      <div class="front">
	        <div class="media">
	          <span class="pull-left">
	            <i class="fa fa-search media-object"></i>
	          </span>

	          <div class="media-body">
	            <small>Bounce Rate</small>
	            <h2 class="media-heading animate-number" data-value="<?php //echo round($flip_cards3['ga:bounceRate']); ?>%" data-animation-duration="1500">0</h2>
	          </div>
	        </div>
	      </div> <!-- end of front -->
	      <!-- <div class="back">
	        <a href="#">
	          <i class="fa fa-bar-chart-o fa-4x"></i>
	          <span>Check Summary</span>
	        </a>
	      </div> <!-- end of back -->
	    <!-- </div>  --><!-- end of card-redbrown hover -->
	  <!-- </div> --> <!-- end of card-container -->

	  <!-- <div class="card-container col-lg-3 col-sm-6 col-sm-12">
	    <div class="card card-slategray hover">
	      <div class="front">
	        <div class="media">
	          <span class="pull-left">
	            <i class="fa fa-search media-object"></i>
	          </span>

	          <div class="media-body">
	            <small class="underline">Sessions Per User</small>
	            <h2 class="media-heading animate-number" data-value="<?php //echo round($flip_cards3['ga:sessionsPerUser'],1); ?>" data-animation-duration="1500">0</h2>
	          </div>
	        </div>
	      </div>
	      <div class="back">
	        <a href="#">
	          <i class="fa fa-bar-chart-o fa-4x"></i>
	          <span>Check Summary</span>
	        </a>
	      </div> <!-- end of back -->
	    <!-- </div> --> <!-- end of card-redbrown hover -->
	  <!-- </div> --> <!-- end of card-container -->
	<!-- </div>  -->

	<div class="row data_tables">
		<div class="col-lg-6 col-sm-12">
			<section class="tile color transparent-black btop-green">
			  <div class="tile-header">
			    <h4 class="underline"><i class="fa fa-globe"></i> Top Pages</h4>
			  </div> <!-- end of tile-header -->

			  <div class="tile-body">
			    <div class="table-responsive">
			      <table class="table table-datatable table-custom table-striped" id="top-pages">
			        <thead>
			          <tr>
			            <th class="sort-alpha">Page Title</th>
			            <th class="sort-numeric">Sessions</th>
			            <th class="sort-numeric">Page Views</th>
			          </tr>
			        </thead>
			        <tbody>
			          <?php if ($topPages) { ?>
			            <?php foreach ($topPages as $page) { ?>
			              <tr>
			                <td><?php echo $page[0]; ?></td>
			                <td><?php echo $page[1]; ?></td>
			                <td><?php echo $page[2]; ?></td>
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

		<div class="col-lg-6 col-sm-12">
			<section class="tile color transparent-black btop-green">
			  <div class="tile-header">
			    <h4 class="underline"><i class="fa fa-globe"></i> Visits by City</h4>
			  </div> <!-- end of tile-header -->

			  <div class="tile-body">
			    <div class="table-responsive">
			      <table class="table table-datatable table-custom table-striped" id="city-visits">
			        <thead>
			          <tr>
			            <th class="sort-alpha">City</th>
			            <th class="sort-alpha">Region</th>
			            <th class="sort-alpha">Country</th>
			            <th class="sort-numeric">Sessions</th>
			          </tr>
			        </thead>
			        <tbody>
			          <?php if ($cityStats) { ?>
			            <?php foreach ($cityStats as $city) { ?>
			              <tr>
			                <td><?php echo $city[0]; ?></td>
			                <td><?php echo $city[1]; ?></td>
			                <td><?php echo $city[2]; ?></td>
			                <td><?php echo $city[3]; ?></td>
			              </tr>
			            <?php } ?>
			          <?php } else { ?>
			            <tr>
			              <td class="text-center" colspan="4"><?php echo $text_no_results; ?></td>
			            </tr>
			          <?php } ?>
			        </tbody>
			      </table>
			    </div> <!-- end of table-responsive -->
			  </div> <!-- end of tile-body -->
			</section> <!-- end of section -->
		</div>
	</div>

	<div class="row data_tables">
		<div class="col-lg-6 col-sm-12">
			<section class="tile color transparent-black btop-green">
			  <div class="tile-header">
			    <h4 class="underline"><i class="fa fa-globe"></i> Top Organic Searches</h4>
			  </div> <!-- end of tile-header -->

			  <div class="tile-body">
			    <div class="table-responsive">
			      <table class="table table-datatable table-custom table-striped" id="organic-search">
			        <thead>
			          <tr>
			            <th class="sort-alpha">Keyword</th>
			            <th class="sort-numeric">Organic Searches</th>
			          </tr>
			        </thead>
			        <tbody>
			          <?php if ($organic) { ?>
			            <?php foreach ($organic as $search) { ?>
			              <tr>
			                <td><?php echo $search[0]; ?></td>
			                <td><?php echo $search[1]; ?></td>
			              </tr>
			            <?php } ?>
			          <?php } else { ?>
			            <tr>
			              <td class="text-center" colspan="2"><?php echo $text_no_results; ?></td>
			            </tr>
			          <?php } ?>
			        </tbody>
			      </table>
			    </div> <!-- end of table-responsive -->
			  </div> <!-- end of tile-body -->
			</section> <!-- end of section -->
		</div>

		<div class="col-lg-6 col-sm-12">
			<section class="tile color transparent-black btop-green">
			  <div class="tile-header">
			    <h4 class="underline"><i class="fa fa-globe"></i> Top Sources</h4>
			  </div> <!-- end of tile-header -->

			  <div class="tile-body">
			    <div class="table-responsive">
			      <table class="table table-datatable table-custom table-striped" id="sources">
			        <thead>
			          <tr>
			            <th class="sort-alpha">Source</th>
			            <th class="sort-numeric">Sessions</th>
			          </tr>
			        </thead>
			        <tbody>
			          <?php if ($sources) { ?>
			            <?php foreach ($sources as $source) { ?>
			              <tr>
			                <td><?php echo $source[0]; ?></td>
			                <td><?php echo $source[1]; ?></td>
			              </tr>
			            <?php } ?>
			          <?php } else { ?>
			            <tr>
			              <td class="text-center" colspan="2"><?php echo $text_no_results; ?></td>
			            </tr>
			          <?php } ?>
			        </tbody>
			      </table>
			    </div> <!-- end of table-responsive -->
			  </div> <!-- end of tile-body -->
			</section> <!-- end of section -->
		</div>
	</div> <!-- end of row -->

	<div class="row data_tables">
		<div class="col-lg-6 col-sm-12">
			<section class="tile color transparent-black btop-green">
			  <div class="tile-header">
			    <h4 class="underline"><i class="fa fa-globe"></i> Top Referrals</h4>
			  </div> <!-- end of tile-header -->

			  <div class="tile-body">
			    <div class="table-responsive">
			      <table class="table table-datatable table-custom table-striped" id="referrals">
			        <thead>
			          <tr>
			            <th class="sort-alpha">Source</th>
			            <th class="sort-numeric">Sessions</th>
			          </tr>
			        </thead>
			        <tbody>
			          <?php if ($referrals) { ?>
			            <?php foreach ($referrals as $referral) { ?>
			              <tr>
			                <td><?php echo $referral[0]; ?></td>
			                <td><?php echo $referral[1]; ?></td>
			              </tr>
			            <?php } ?>
			          <?php } else { ?>
			            <tr>
			              <td class="text-center" colspan="2"><?php echo $text_no_results; ?></td>
			            </tr>
			          <?php } ?>
			        </tbody>
			      </table>
			    </div> <!-- end of table-responsive -->
			  </div> <!-- end of tile-body -->
			</section> <!-- end of section -->
		</div>

		<div class="col-lg-6 col-sm-12">
			<section class="tile color transparent-black btop-green">
			  <div class="tile-header">
			    <h4 class="underline"><i class="fa fa-globe"></i> Devices Used</h4>
			  </div> <!-- end of tile-header -->

			  <div class="tile-body">
			    <div class="table-responsive">
			      <table class="table table-datatable table-custom table-striped" id="devices-used">
			        <thead>
			          <tr>
			            <th class="sort-alpha">Mobile Device</th>
			            <th class="sort-numeric">Sessions</th>
			          </tr>
			        </thead>
			        <tbody>
			          <?php if ($deviceUsage) { ?>
			            <?php foreach ($deviceUsage as $device) { ?>
			              <tr>
			                <td><?php echo $device[0]; ?></td>
			                <td><?php echo $device[1]; ?></td>
			              </tr>
			            <?php } ?>
			          <?php } else { ?>
			            <tr>
			              <td class="text-center" colspan="2"><?php echo $text_no_results; ?></td>
			            </tr>
			          <?php } ?>
			        </tbody>
			      </table>
			    </div> <!-- end of table-responsive -->
			  </div> <!-- end of tile-body -->
			</section> <!-- end of section -->
		</div>
	</div> <!-- end of row -->

	<div class="row data_tables">
		<div class="col-lg-6 col-sm-12">
			<section class="tile color transparent-black btop-green">
			  <div class="tile-header">
			    <h4 class="underline"><i class="fa fa-globe"></i> Organic Searches By Referrer</h4>
			  </div> <!-- end of tile-header -->

			  <div class="tile-body">
			    <div class="table-responsive">
			      <table class="table table-datatable table-custom table-striped" id="organic-referrer">
			        <thead>
			          <tr>
			            <th class="sort-alpha">Referrer</th>
			            <th class="sort-numeric">Organic Searches</th>
			          </tr>
			        </thead>
			        <tbody>
			          <?php if ($organicReferrer) { ?>
			            <?php foreach ($organicReferrer as $referrer) { ?>
			              <tr>
			                <td><?php echo $referrer[0]; ?></td>
			                <td><?php echo $referrer[1]; ?></td>
			              </tr>
			            <?php } ?>
			          <?php } else { ?>
			            <tr>
			              <td class="text-center" colspan="2"><?php echo $text_no_results; ?></td>
			            </tr>
			          <?php } ?>
			        </tbody>
			      </table>
			    </div> <!-- end of table-responsive -->
			  </div> <!-- end of tile-body -->
			</section> <!-- end of section -->
		</div>
	</div>

</div> <!-- end of container -->

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
      var oTable01 = $('#top-pages').dataTable({
      	'bFilter': false,
      	"iDisplayLength": 5,
        "sDom":
          "R<'row'<'col-md-6'l><'col-md-6'f>r>"+
          "t"+
          "<'row'<'col-md-4 sm-center'i><'col-md-4'><'col-md-4 text-right sm-center'p>>",
        "oLanguage": {
          "sSearch": ""
        },
        "aaSorting": [ [0,'desc'] ],
        "aoColumns": [
          null,
          null,
          null,
        ],
        "fnInitComplete": function(oSettings, json) {
          console.log('complete');
        }
      });

      var oTable02 = $('#city-visits').dataTable({
      	'bFilter': false,
      	"iDisplayLength": 5,
        "sDom":
          "R<'row'<'col-md-6'l><'col-md-6'f>r>"+
          "t"+
          "<'row'<'col-md-4 sm-center'i><'col-md-4'><'col-md-4 text-right sm-center'p>>",
        "oLanguage": {
          "sSearch": ""
        },
        "aaSorting": [ [3,'desc'] ],
        "aoColumns": [
          null,
          null,
          null,
          null
        ],
        "fnInitComplete": function(oSettings, json) {
          console.log('complete');
        }
      });

      var oTable03 = $('#organic-search').dataTable({
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

<script>
      // Initialize card flip
      // $('.card.hover').hover(function(){
      //   $(this).addClass('flip');
      // },function(){
      //   $(this).removeClass('flip');
      // });

      // Make card front & back side same
      $('.card').each(function() {
        var front = $('.card .front');
        var back = $('.card .back');
        var frontH = front.height();
        var backH = back.height();



        if (backH > frontH) {
          front.height(backH - 8);
        }
      });

           // Initialize flot chart
      var d1 =[
      			[1, 715],
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
            label: 'Sessions',
            data: d1,
            lines: {lineWidth:3},
            shadowSize:0,
            color: '#ffffff'
          },
          { label: "Page Views",
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

      $('#mmenu').on(
        "opened.mm",
        function()
        {
          // redraw the graph in the correctly sized div
          plot.resize();
          plot.setupGrid();
          plot.draw();
        }
      );

      $('#mmenu').on(
        "closed.mm",
        function()
        {
          // redraw the graph in the correctly sized div
          plot.resize();
          plot.setupGrid();
          plot.draw();
        }
      );

      // tooltips showing
      $("#statistics-chart").bind("plothover", function (event, pos, item) {
        if (item) {
          var x = item.datapoint[0],
              y = item.datapoint[1];

          $("#tooltip").html('<h1 style="color: #418bca">' + months[x - 1] + '</h1>' + '<strong>' + y + '</strong>' + ' ' + item.series.label)
            .css({top: item.pageY-30, left: item.pageX+5})
            .fadeIn(200);
        } else {
          $("#tooltip").hide();
        }
      });


      //tooltips options
      $("<div id='tooltip'></div>").css({
        position: "absolute",
        //display: "none",
        padding: "10px 20px",
        "background-color": "#ffffff",
        "z-index":"99999"
      }).appendTo("body");

      //generate actual pie charts
      $('.pie-chart').easyPieChart();

      $(function() {
    		$( "#datepicker" ).datepicker();
    		$( "#datepicker2" ).datepicker();
  		});
</script>

<?php echo "<script>"; ?>
  // Morris donut chart
     Morris.Donut({
      element: 'browser-usage',
       data: [

<?php foreach ($browser_stats['browsers'] as $browser) { ?>
  {label: "<?php echo $browser[0]; ?>", value: <?php echo round(($browser[1]/$totalSessions)*100); ?>},
<?php } ?>
  {label: "Others", value: <?php echo $browser_stats['others']; ?>}
        ],
        formatter: function (y) { return y + "%" },
        colors: ['#00a3d8', '#2fbbe8', '#72cae7', '#d9544f', '#ffc100', '#1693A5']
      });

      $('#browser-usage').find("path[stroke='#ffffff']").attr('stroke', 'rgba(0,0,0,0)');

<?php echo "</script>"; ?>

<?php echo "<script>"; ?>
  // Morris donut chart
     Morris.Donut({
      element: 'visits-by-visitor',
       data: [

<?php foreach ($visitsByVisitor_stats['visits'] as $visit) { ?>
  {label: "<?php echo $visit[0]; ?>", value: <?php echo round(($visit[1]/$totalSessions)*100); ?>},
<?php } ?>
        ],
        formatter: function (y) { return y + "%" },
        colors: ['#00a3d8', '#2fbbe8', '#72cae7', '#d9544f', '#ffc100', '#1693A5']
      });

      $('#visits-by-visitor').find("path[stroke='#ffffff']").attr('stroke', 'rgba(0,0,0,0)');

<?php echo "</script>"; ?>

<?php echo "<script>"; ?>
  // Morris donut chart
     Morris.Donut({
      element: 'visits-by-traffic',
       data: [

<?php foreach ($visitsByTraffic_stats['visits'] as $visit) { ?>
  {label: "<?php echo $visit[0]; ?>", value: <?php echo round(($visit[1]/$totalSessions)*100); ?>},
<?php } ?>
        ],
        formatter: function (y) { return y + "%" },
        colors: ['#00a3d8', '#2fbbe8', '#72cae7', '#d9544f', '#ffc100', '#1693A5']
      });

      $('#visits-by-traffic').find("path[stroke='#ffffff']").attr('stroke', 'rgba(0,0,0,0)');

<?php echo "</script>"; ?>

<?php echo "<script>"; ?>
  // Morris donut chart
     Morris.Donut({
      element: 'device-categories',
       data: [

<?php foreach ($device_stats['device'] as $device) { ?>
  {label: "<?php echo $device[0]; ?>", value: <?php echo round(($device[1]/$totalSessions)*100); ?>},
<?php } ?>
	//{label: "Others", value: <?php //echo $device_stats['others']; ?>}
        ],
        formatter: function (y) { return y + "%" },
        colors: ['#00a3d8', '#2fbbe8', '#72cae7', '#d9544f', '#1693A5']
      });

      $('#device-categories').find("path[stroke='#ffffff']").attr('stroke', 'rgba(0,0,0,0)');

<?php echo "</script>"; ?>


<?php echo $footer; ?>
