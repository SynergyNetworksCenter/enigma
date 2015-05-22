<div id="wrap">
	<div class="row">
		<div class="navbar navbar-default navbar-fixed-top mm-fixed-top" role="navigation" id="navbar" style="background-color: rgba(41, 158, 179, 0.99);">
			<!-- Branding -->

				<a class="navbar-brand" href="<?php echo $home; ?>"><?php echo $portal; ?></a>

				<!-- <div class="sidebar-collapse">
					<a href="#"><i class="fa fa-bars"></i></a>
				</div> -->

 			<!-- Branding end -->

			<!-- .nav-collapse -->
			<div class="navbar-collapse">
				<!-- Page refresh -->
				<!-- <ul class="nav navbar-nav refresh">
					<li class="divided">
						<a href="#" class="page-refresh"><i class="fa fa-refresh"></i></a>
					</li>
				</ul> -->
				<!-- /Page refresh -->

				<!-- Search -->
				<!-- <div class="search" id="main-search">
					<i class="fa fa-search"></i> <input type="text" placeholder="Search...">
				</div> -->
				<!-- Search end -->

				<!-- Quick Actions -->
				<ul class="nav navbar-nav quick-actions">

					<!-- New Tasks -->
					<!-- <li class="dropdown divided">
						<a class="dropdown-toggle button" data-toggle="dropdown" href="#">
							<i class="fa fa-tasks"></i>
							<span class="label label-transparent-black">2</span>
						</a>

						<ul class="dropdown-menu wide arrow nopadding bordered">
							<li><h1>You have <strong>2</strong> new tasks</h1></li>
							<li>...</li>
							<li>...</li>
						</ul>
					</li> -->
					<!-- New Tasks -->

		 			<!-- New Messages -->
					<!-- <li class="dropdown divided">
						<a class="dropdown-toggle button" data-toggle="dropdown" href="#">
							<i class="fa fa-envelope"></i>
							<span class="label label-transparent-black">1</span>
						</a>

						<ul class="dropdown-menu wider arrow nopadding messages">
							<li><h1>You have <strong>1</strong> new message</h1></li>
							<li>...</li>
							<li>...</li>
						</ul>
					</li> -->
					<!-- New Messages -->

		 			<!-- Notifications -->
					<!-- <li class="dropdown divided">
						<a class="dropdown-toggle button" data-toggle="dropdown" href="#">
							<i class="fa fa-bell"></i>
							<span class="label label-transparent-black">3</span>
						</a>

						<ul class="dropdown-menu wide arrow nopadding bordered">
							<li><h1>You have <strong>3</strong> new notifications</h1></li>
							<li>...</li>
							<li>...</li>
						</ul>
					</li> -->
		 			<!-- Notifications -->

		 			<!-- Member account -->
					<li class="dropdown divided user" id="current-user">
						<div class="profile-photo" hidden>
							<!-- <img src="assets/images/profile-photo.jpg" alt /> -->
							<!-- <i class="fa fa-user"></i> -->
						</div>
						<a class="dropdown-toggle options" data-toggle="dropdown" href="#">
							<i class="fa fa-user"></i> <?php echo $member_name; ?> <i class="fa fa-caret-down"></i>
						</a>

						<ul class="dropdown-menu arrow settings">
							<li><a href="<?php echo $home; ?>">Home</a></li>
							<li><a href="<?php echo $password; ?>">Password</a></li>
							<li><a href="<?php echo $analytics; ?>">Analytics</a></li>
							<li><a href="<?php echo $marketing; ?>">Marketing</a></li>
							<!-- <li><a href="<?php //echo $bing; ?>">Bing</a></li> -->
							<li><a href="<?php echo $logout; ?>">Logout</a></li>
						</ul>
					</li>
		 			<!-- Member account -->

		 			<!-- Comments -->
					<!-- <li>
						<a href="#mmenu"><i class="fa fa-comments"></i></a>
					</li> -->
					<!-- Comments -->
				</ul>
				<!-- /Quick Actions -->
			</div>
			<!--/.nav-collapse -->
		</div>
		<!-- Fixed navbar end -->
