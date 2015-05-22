<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />

<!-- For Favicon Set in the backend -->
<?php foreach ($links as $link) { ?>
  <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>

<!-- Remove this line when you have access to set it in the settings -->
<!-- <link rel="icon" type="image/ico" href="view/images/favicon.ico" /> -->

<!-- Css Styles -->
<link rel="stylesheet" href="view/css/vendor/bootstrap/bootstrap.min.css" >
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<link rel="stylesheet" href="view/css/vendor/animate/animate.css">
<link rel="stylesheet" href="view/js/vendor/mmenu/css/jquery.mmenu.all.css">
<link rel="stylesheet" href="view/js/vendor/videobackground/css/jquery.videobackground.css">
<link rel="stylesheet" href="view/css/vendor/bootstrap/bootstrap-dropdown-multilevel.css">
<!-- <link rel="stylesheet" href="view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css"> -->
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css" />

<!-- For Stylesheets Set in the Controller File -->
<?php foreach ($styles as $style) { ?>
  <link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>

<link rel="stylesheet" href="view/css/minimal-update.css" >
<link rel="stylesheet" href="view/css/stylesheet.css" >


<!-- Javascript -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- <script type="text/javascript" src="view/javascript/jquery/jquery-1.7.1.min.js"></script> -->
<!-- <script type="text/javascript" src="https://code.jquery.com/jquery.js"></script> -->
<!-- <script type="text/javascript" src="view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
<script type="text/javascript" src="view/js/vendor/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" src="view/js/vendor/bootstrap/bootstrap-dropdown-multilevel.js"></script>
<script type="text/javascript" src="https://google-code-prettify.googlecode.com/svn/loader/run_prettify.js?lang=css&amp;skin=sons-of-obsidian"></script>
<script type="text/javascript" src="view/js/vendor/mmenu/js/jquery.mmenu.min.js"></script>
<script type="text/javascript" src="view/js/vendor/sparkline/jquery.sparkline.min.js"></script>
<script type="text/javascript" src="view/js/vendor/nicescroll/jquery.nicescroll.min.js"></script>
<script type="text/javascript" src="view/js/vendor/animate-numbers/jquery.animateNumbers.js"></script>
<script type="text/javascript" src="view/js/vendor/videobackground/jquery.videobackground.js"></script>
<script type="text/javascript" src="view/js/vendor/blockui/jquery.blockUI.js"></script>


<!-- For Javascript Set in Controller File -->
<?php foreach ($scripts as $script) { ?>
  <script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>

<script type="text/javascript" src="view/js/minimal.min.js"></script>

<script type="text/javascript">
//-----------------------------------------
// Confirm Actions (delete, uninstall)
//-----------------------------------------
$(document).ready(function(){
    // Confirm Delete
    $('#form').submit(function(){
        if ($(this).attr('action').indexOf('delete',1) != -1) {
            if (!confirm('<?php echo $text_confirm; ?>')) {
                return false;
            }
        }
    });
    // Confirm Uninstall
    $('a').click(function(){
        if ($(this).attr('href') != null && $(this).attr('href').indexOf('uninstall', 1) != -1) {
            if (!confirm('<?php echo $text_confirm; ?>')) {
                return false;
            }
        }
    });

    //initialize datepicker
      $('#datepicker').datetimepicker({
        icons: {
          time: "fa fa-clock-o",
          date: "fa fa-calendar",
          up: "fa fa-arrow-up",
          down: "fa fa-arrow-down"
        },
        pickTime: false
      });

      $("#datepicker").on("dp.show",function (e) {
        var newtop = $('.bootstrap-datetimepicker-widget').position().top - 45;      
        $('.bootstrap-datetimepicker-widget').css('top', newtop + 'px');
      });

      //initialize chosen
      $(".chosen-select").chosen({disable_search_threshold: 10});
});
    </script>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]> 
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    [endif]-->
</head> <!-- end of Html Head -->
<body class="bg-synergy">
  