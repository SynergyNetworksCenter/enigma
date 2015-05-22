<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />

<!-- Head Title -->
<title><?php echo $title; ?></title>

<!-- Sets the root url for non absolute path links -->
<base href="<?php echo $base; ?>" />

<!-- Meta Description -->
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>

<!-- Meta Keywords -->
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>

<!-- Favicon -->
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>

<!-- Link to other files such as fonts -->
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>

<!-- CSS Stylesheets -->
<link rel="stylesheet" href="catalog/view/theme/default/css/vendor/bootstrap/bootstrap.min.css" >
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css" />
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<link rel="stylesheet" href="catalog/view/theme/default/css/vendor/animate/animate.css">
<link rel="stylesheet" href="catalog/view/theme/default/js/vendor/mmenu/css/jquery.mmenu.all.css">
<link rel="stylesheet" href="catalog/view/theme/default/js/vendor/videobackground/css/jquery.videobackground.css">
<link rel="stylesheet" href="catalog/view/theme/default/css/vendor/bootstrap/bootstrap-dropdown-multilevel.css">


<?php foreach ($styles as $style) { ?>
  <link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="" />
<?php } ?>

<!-- <link rel="stylesheet" href="catalog/view/theme/default/css/minimal-update.css" > -->
<!-- <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/css/stylesheet.css" /> -->

<!-- Javascript -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
<script type="text/javascript" src="catalog/view/theme/default/js/vendor/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" src="catalog/view/theme/default/js/vendor/bootstrap/bootstrap-dropdown-multilevel.js"></script>
<script type="text/javascript" src="https://google-code-prettify.googlecode.com/svn/loader/run_prettify.js?lang=css&amp;skin=sons-of-obsidian"></script>
<script type="text/javascript" src="catalog/view/theme/default/js/vendor/mmenu/js/jquery.mmenu.min.js"></script>
<script type="text/javascript" src="catalog/view/theme/default/js/vendor/sparkline/jquery.sparkline.min.js"></script>
<script type="text/javascript" src="catalog/view/theme/default/js/vendor/nicescroll/jquery.nicescroll.min.js"></script>
<script type="text/javascript" src="catalog/view/theme/default/js/vendor/animate-numbers/jquery.animateNumbers.js"></script>
<script type="text/javascript" src="catalog/view/theme/default/js/vendor/videobackground/jquery.videobackground.js"></script>
<script type="text/javascript" src="catalog/view/theme/default/js/vendor/blockui/jquery.blockUI.js"></script>

<?php foreach ($scripts as $script) { ?>
  <script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>

<script type="text/javascript" src="catalog/view/theme/default/js/minimal.min.js"></script>

<!--[if IE 7]> 
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie7.css" />
<![endif]-->
<!--[if lt IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie6.css" />
<script type="text/javascript" src="catalog/view/javascript/DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript">
DD_belatedPNG.fix('#logo img');
</script>
<![endif]-->

</head>
<body class="bg-synergy">




