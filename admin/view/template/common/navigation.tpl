<!-- Preloader -->
 <!--  <div class="mask">
    <div id="loader"></div>
  </div> -->
<!--/Preloader -->

<!-- Wrap all page content here -->
<div id="wrap">
  <div class="row">
    <div class="navbar navbar-default navbar-fixed-top navbar-transparent-black mm-fixed-top" role="navigation" id="navbar">
      <!-- Branding -->
      <div class="navbar-header col-md-2">
        <a class="navbar-brand" href="<?php echo $home; ?>"><strong>Synergy</strong> Admin Portal</a>
        <div class="sidebar-collapse"><a type="button"><i class="fa fa-bars"></i></a></div>
      </div><!-- Branding end -->

      <!-- .nav-collapse -->
      <div class="navbar-collapse">
        <!-- Page refresh -->
        <ul class="nav navbar-nav refresh">
          <li class="divided">
            <a href="<?php echo $home; ?>" class="page-refresh"><i class="fa fa-refresh"></i></a>
          </li>
        </ul>
        <!-- /Page refresh -->

        <!-- Quick Actions -->
        <ul class="nav navbar-nav quick-actions">
          <li class="dropdown divided"> <!-- Tasks -->
            <a class="dropdown-toggle button" data-toggle="dropdown" href="#">
              <i class="fa fa-tasks"></i>
              <span class="label label-transparent-black">2</span>
            </a>
            <ul class="dropdown-menu wide arrow nopadding bordered">
              <li><h1>You have <strong>2</strong> new tasks</h1></li>
              <li>
                <a href="#">
                  <div class="task-info">
                    <div class="desc">Layout</div>
                    <div class="percent">80%</div>
                  </div>
                  <div class="progress progress-striped progress-thin">
                    <div class="progress-bar progress-bar-green" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                      <span class="sr-only">40% Complete (success)</span>
                    </div>
                  </div>
                </a>
              </li>
              <li>
                <a href="#">
                  <div class="task-info">
                    <div class="desc">Schemes</div>
                    <div class="percent">15%</div>
                  </div>
                  <div class="progress progress-striped active progress-thin">
                    <div class="progress-bar progress-bar-cyan" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 15%">
                      <span class="sr-only">45% Complete</span>
                    </div>
                  </div>
                </a>
              </li>
              <li>
                <a href="#">
                  <div class="task-info">
                    <div class="desc">Forms</div>
                    <div class="percent">5%</div>
                  </div>
                  <div class="progress progress-striped progress-thin">
                    <div class="progress-bar progress-bar-orange" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 5%">
                      <span class="sr-only">5% Complete (warning)</span>
                    </div>
                  </div>
                </a>
              </li>
              <li>
                <a href="#">
                  <div class="task-info">
                    <div class="desc">JavaScript</div>
                    <div class="percent">30%</div>
                  </div>
                  <div class="progress progress-striped progress-thin">
                    <div class="progress-bar progress-bar-red" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 30%">
                      <span class="sr-only">30% Complete (danger)</span>
                    </div>
                  </div>
                </a>
              </li>
              <li>
                <a href="#">
                  <div class="task-info">
                    <div class="desc">Dropdowns</div>
                    <div class="percent">60%</div>
                  </div>
                  <div class="progress progress-striped progress-thin">
                    <div class="progress-bar progress-bar-amethyst" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                      <span class="sr-only">60% Complete</span>
                    </div>
                  </div>
                </a>
              </li>
              <li><a href="#">Check all tasks <i class="fa fa-angle-right"></i></a></li>
            </ul>
          </li>
          <li class="dropdown divided"> <!-- Messages -->
            <a class="dropdown-toggle button" data-toggle="dropdown" href="#">
              <i class="fa fa-envelope"></i>
              <span class="label label-transparent-black">1</span>
            </a>
            <ul class="dropdown-menu wider arrow nopadding messages">
              <li><h1>You have <strong>1</strong> new message</h1></li>
              <li>
                <a class="cyan" href="#">
                  <div class="profile-photo">
                    <img src="view/images/ici-avatar.jpg" alt />
                  </div>
                  <div class="message-info">
                    <span class="sender">Ing. Imrich Kamarel</span>
                    <span class="time">12 mins</span>
                    <div class="message-content">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum</div>
                  </div>
                </a>
              </li>
              <li>
                <a class="green" href="#">
                  <div class="profile-photo">
                    <img src="view/images/arnold-avatar.jpg" alt />
                  </div>
                  <div class="message-info">
                    <span class="sender">Arnold Karlsberg</span>
                    <span class="time">1 hour</span>
                    <div class="message-content">Lorem ipsum dolor sit amet, consectetur adipisicing elit</div>
                  </div>
                </a>
              </li>
              <li>
                <a href="#">
                  <div class="profile-photo">
                    <img src="view/images/profile-photo.jpg" alt />
                  </div>
                  <div class="message-info">
                    <span class="sender">John Douey</span>
                    <span class="time">3 hours</span>
                    <div class="message-content">Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia</div>
                  </div>
                </a>
              </li>
              <li>
                <a class="red" href="#">
                  <div class="profile-photo">
                    <img src="view/images/peter-avatar.jpg" alt />
                  </div>
                  <div class="message-info">
                    <span class="sender">Peter Kay</span>
                    <span class="time">5 hours</span>
                    <div class="message-content">Ut enim ad minim veniam, quis nostrud exercitation</div>
                  </div>
                </a>
              </li>
              <li>
                <a class="orange" href="#">
                  <div class="profile-photo">
                    <img src="view/images/george-avatar.jpg" alt />
                  </div>
                  <div class="message-info">
                    <span class="sender">George McCain</span>
                    <span class="time">6 hours</span>
                    <div class="message-content">Lorem ipsum dolor sit amet, consectetur adipisicing elit</div>
                  </div>
                </a>
              </li>
              <li class="topborder"><a href="#">Check all messages <i class="fa fa-angle-right"></i></a></li>
            </ul>
          </li>
          <li class="dropdown divided"> <!-- Notifications -->
            <a class="dropdown-toggle button" data-toggle="dropdown" href="#">
              <i class="fa fa-bell"></i>
              <span class="label label-transparent-black">3</span>
            </a>
            <ul class="dropdown-menu wide arrow nopadding bordered">
              <li><h1>You have <strong>3</strong> new notifications</h1></li>
              <li>
                <a href="#">
                  <span class="label label-green"><i class="fa fa-user"></i></span>
                  New user registered.
                  <span class="small">18 mins</span>
                </a>
              </li>
              <li>
                <a href="#">
                  <span class="label label-red"><i class="fa fa-power-off"></i></span>
                  Server down.
                  <span class="small">27 mins</span>
                </a>
              </li>
              <li>
                <a href="#">
                  <span class="label label-orange"><i class="fa fa-plus"></i></span>
                  New order.
                  <span class="small">36 mins</span>
                </a>
              </li>
              <li>
                <a href="#">
                  <span class="label label-cyan"><i class="fa fa-power-off"></i></span>
                  Server restared.
                  <span class="small">45 mins</span>
                </a>
              </li>
              <li>
                <a href="#">
                  <span class="label label-amethyst"><i class="fa fa-power-off"></i></span>
                  Server started.
                  <span class="small">50 mins</span>
                </a>
              </li>
              <li><a href="#">Check all notifications <i class="fa fa-angle-right"></i></a></li>
            </ul>
          </li>
          <li class="dropdown divided"> <!-- Warnings Dropdown -->
            <a class="dropdown-toggle button" data-toggle="dropdown" href="#">
              <i class="fa fa-exclamation-triangle"></i>
              <span class="label label-transparent-black"><?php echo count($warning); ?></span>
            </a>
            <ul class="dropdown-menu wide arrow nopadding bordered">
              <li><h1>You have <strong><?php echo count($warning); ?></strong> New Warning(s)</h1></li>
              <?php foreach ($warning as $warn) { ?>
                <li>
                  <a type="button">
                    <span class="label label-warning"><i class="fa fa-exclamation-circle"></i></span>
                    <?php echo $warn; ?>
                    <span class="small">18 mins</span>
                  </a>
                </li>
              <?php } ?>
              <li><a type="button">Please Fix All Warnings</a></li>
            </ul>
          </li>
          <!-- Logged in user options -->
          <li class="dropdown divided user" id="current-user">
            <div class="profile-photo">
              <img src="view/images/profile-photo.jpg" alt />
            </div>
            <a class="dropdown-toggle options" data-toggle="dropdown" href="#">
              <?php echo $current_user; ?> <i class="fa fa-caret-down"></i>
            </a>
            <ul class="dropdown-menu arrow settings">
              <li> <!-- Backgrounds -->
                <h3>Backgrounds:</h3>
                <ul id="color-schemes">
                  <li><a type="button" class="bg-synergy"></a></li>
                  <li><a type="button" class="bg-1"></a></li>
                  <li><a type="button" class="bg-2"></a></li>
                  <li><a type="button" class="bg-3"></a></li>
                  <li><a type="button" class="bg-4"></a></li>
                  <li><a type="button" class="bg-5"></a></li>
                  <li><a type="button" class="bg-6"></a></li>
                  <li class="title">Solid Backgrounds:</li>
                  <li><a type="button" class="solid-bg-1"></a></li>
                  <li><a type="button" class="solid-bg-2"></a></li>
                  <li><a type="button" class="solid-bg-3"></a></li>
                  <li><a type="button" class="solid-bg-4"></a></li>
                  <li><a type="button" class="solid-bg-5"></a></li>
                  <li><a type="button" class="solid-bg-6"></a></li>
                </ul>
              </li>
              <li class="divider"></li>
              <li> <!-- Video Backgrounds -->
                <div class="form-group videobg-check">
                  <label class="col-xs-8 control-label">Video BG</label>
                  <div class="col-xs-4 control-label">
                    <div class="onoffswitch greensea small">
                      <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="videobg-check">
                      <label class="onoffswitch-label" for="videobg-check">
                        <span class="onoffswitch-inner"></span>
                        <span class="onoffswitch-switch"></span>
                      </label>
                    </div>
                  </div>
                </div>
                <ul id="videobackgrounds">
                  <li class="title">Choose type:</li>
                  <li><a href="#" class="video-bg-1"></a></li>
                  <li><a href="#" class="video-bg-2"></a></li>
                  <li><a href="#" class="video-bg-3"></a></li>
                  <li><a href="#" class="video-bg-4"></a></li>
                  <li><a href="#" class="video-bg-5"></a></li>
                  <li><a href="#" class="video-bg-6"></a></li>
                  <li><a href="#" class="video-bg-7"></a></li>
                  <li><a href="#" class="video-bg-8"></a></li>
                  <li><a href="#" class="video-bg-9"></a></li>
                  <li><a href="#" class="video-bg-10"></a></li>
                </ul>
              </li>
              <li class="divider"></li>
              <li>
                <a href="#"><i class="fa fa-user"></i> Profile</a>
              </li>
              <!-- <li>
                <a href="#"><i class="fa fa-calendar"></i> Calendar</a>
              </li> -->
              <li>
                <a href="#"><i class="fa fa-envelope"></i> Inbox - NC <span class="badge badge-red" id="user-inbox">3</span></a>
              </li>
              <li class="divider"></li>
              <li>
                <a href="<?php echo $logout; ?>"><i class="fa fa-power-off"></i> Logout</a>
              </li>
            </ul>
          </li>
          <li>
            <a href="#mmenu"><i class="fa fa-comments"></i></a>
          </li>
        </ul> <!-- /Quick Actions -->

        <!-- Sidebar -->
        <ul class="nav navbar-nav side-nav" id="sidebar">
          <li class="navigation" id="navigation">
            <a type="button" class="sidebar-toggle" data-toggle="#navigation">Navigation <i class="fa fa-angle-up"></i></a>
            <ul class="menu">
              <li class="active">
                <a href="<?php echo $home; ?>">
                  <i class="fa fa-tachometer"></i> Dashboard
                  <!-- <span class="badge badge-red">1</span> -->
                </a>
              </li>
              <li class="dropdown"> <!-- Administrator Tab -->
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="fa fa-graduation-cap"></i> Administrators <b class="fa fa-plus dropdown-plus"></b>
                </a>
                <ul class="dropdown-menu">
                  <li>
                    <a href="<?php echo $user; ?>">
                      <i class="fa fa-caret-right"></i> Admin List
                    </a>
                  </li>
                  <li>
                    <a href="<?php echo $user_group; ?>">
                      <i class="fa fa-caret-right"></i> Admin Groups
                    </a>
                  </li>
                </ul>
              </li>
              <li class="dropdown"> <!-- Cients Tab -->
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="fa fa-users"></i> Clients <b class="fa fa-plus dropdown-plus"></b>
                </a>
                <ul class="dropdown-menu">
                  <li>
                    <a href="<?php echo $member; ?>">
                      <i class="fa fa-caret-right"></i> Client List
                    </a>
                  </li>
                  <li hidden>
                    <a href="<?php echo $member_group; ?>">
                      <i class="fa fa-caret-right"></i> Client Groups
                    </a>
                  </li>
                  <li>
                    <a href="<?php echo $report_member_online; ?>">
                      <i class="fa fa-caret-right"></i> Clients Online
                    </a>
                  </li>
                </ul>
              </li>
              <li> <!-- Websites Tab -->
                <a href="<?php echo $website; ?>">
                  <i class="fa fa-globe"></i> Websites
                </a>
              </li>
              <li class="dropdown"> <!-- Seo & Marketing Tab -->
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="fa fa-bar-chart"></i> Seo &amp; Marketing <b class="fa fa-plus dropdown-plus"></b>
                </a>
                <ul class="dropdown-menu">
                  <li>
                    <a href="<?php echo $g_analytics; ?>">
                      <i class="fa fa-caret-right"></i> Google Analytics
                    </a>
                  </li>
                  <li>
                    <a href="<?php echo $g_adwords; ?>">
                      <i class="fa fa-caret-right"></i> Google Adwords
                    </a>
                  </li>
                  <li>
                    <a href="<?php echo $b_marketing; ?>">
                      <i class="fa fa-caret-right"></i> Bing Marketing
                    </a>
                  </li>
                  <li>
                    <a href="<?php echo $m_upload; ?>">
                      <i class="fa fa-caret-right"></i> Uploads
                    </a>
                  </li>
                </ul>
              </li>
              <li> <!-- Mail Tab -->
                <a href="<?php echo $contact; ?>">
                  <i class="fa fa-envelope"></i> Emails
                </a>
              </li>
              <li> <!-- Extentions Tab -->
                <a href="<?php echo $manager; ?>">
                  <i class="fa fa-th"></i> Extensions
                </a>
              </li>
              <li hidden> <!-- Download Data Tab -->
                <a href="<?php echo $download; ?>">
                  <i class="fa fa-download"></i> Downloads - NC
                </a>
              </li>
              <li class="dropdown" hidden> <!-- Design Tab -->
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="fa fa-desktop"></i> Designs - NC <b class="fa fa-plus dropdown-plus"></b>
                </a>
                <ul class="dropdown-menu">
                  <li>
                    <a href="<?php echo $layout; ?>">
                      <i class="fa fa-caret-right"></i> Layouts
                    </a>
                  </li>
                  <li>
                    <a href="<?php echo $banner; ?>">
                      <i class="fa fa-caret-right"></i> Banners
                    </a>
                  </li>
                </ul>
              </li>
              <li class="dropdown"> <!-- Log Tab -->
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="fa fa-exclamation-circle"></i> Logs <b class="fa fa-plus dropdown-plus"></b>
                </a>
                <ul class="dropdown-menu">
                  <li>
                    <a href="<?php echo $error_log; ?>">
                      <i class="fa fa-caret-right"></i> Error Logs
                    </a>
                  </li>
                  <li hidden>
                    <a href="<?php echo $home; ?>">
                      <i class="fa fa-caret-right"></i> Admin Logs - NC
                    </a>
                  </li>
                  <li hidden>
                    <a href="<?php echo $home; ?>">
                      <i class="fa fa-caret-right"></i> Clients Logs - NC
                    </a>
                  </li>
                </ul>
              </li>
              <li class="dropdown"> <!-- Settings -->
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="fa fa-gears"></i> System <b class="fa fa-plus dropdown-plus"></b>
                </a>
                <ul class="dropdown-menu">
                  <li>
                    <a href="<?php echo $setting; ?>">
                      <i class="fa fa-caret-right"></i> Settings
                    </a>
                  </li>
                  <li>
                    <a href="<?php echo $backup; ?>">
                      <i class="fa fa-caret-right"></i> Backup & Restore
                    </a>
                  </li>
                </ul>
              </li>
            </ul>
          </li>
          <li class="summary" id="order-summary">
            <a href="#" class="sidebar-toggle underline" data-toggle="#order-summary">Orders Summary <i class="fa fa-angle-up"></i></a>
            <div class="media">
              <a class="pull-right" href="#">
                <span id="sales-chart"></span>
              </a>
              <div class="media-body">
                This week sales
                <h3 class="media-heading">26, 149</h3>
              </div>
            </div>
            <div class="media">
              <a class="pull-right" href="#">
                <span id="balance-chart"></span>
              </a>
              <div class="media-body">
                This week balance
                <h3 class="media-heading">318, 651</h3>
              </div>
            </div>
          </li>
          <li class="settings" id="general-settings">
            <a href="#" class="sidebar-toggle underline" data-toggle="#general-settings">General Settings <i class="fa fa-angle-up"></i></a>
            <div class="form-group">
              <label class="col-xs-8 control-label">Switch ON</label>
              <div class="col-xs-4 control-label">
                <div class="onoffswitch greensea">
                  <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="switch-on" checked="">
                  <label class="onoffswitch-label" for="switch-on">
                    <span class="onoffswitch-inner"></span>
                    <span class="onoffswitch-switch"></span>
                  </label>
                </div>
              </div>
            </div>
            <div class="form-group">
              <label class="col-xs-8 control-label">Switch OFF</label>
              <div class="col-xs-4 control-label">
                <div class="onoffswitch greensea">
                  <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="switch-off">
                  <label class="onoffswitch-label" for="switch-off">
                    <span class="onoffswitch-inner"></span>
                    <span class="onoffswitch-switch"></span>
                  </label>
                </div>
              </div>
            </div>
          </li>
        </ul> <!-- Sidebar end -->
      </div> <!--/.nav-collapse -->
    </div> <!-- Fixed navbar end -->
  <!-- </div> --> <!-- end of row -->
<!-- </div> -->  <!-- end of wrap -->
