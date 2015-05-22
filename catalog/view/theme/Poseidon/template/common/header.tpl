<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<?php if ($title == "Poseidon Homes") { ?>
<title><?php echo $title; ?></title>
<?php } else { ?>
  <title><?php echo $title . " | Poseidon Homes"; ?></title>
<?php } ?>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<link href='http://fonts.googleapis.com/css?family=Oswald:400,300,700' rel='stylesheet' type='text/css'>
<!-- <link rel="stylesheet" type="text/css" href="catalog/view/theme/Poseidon/stylesheet/bootstrap.min.css" /> -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="catalog/view/theme/Poseidon/stylesheet/main.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/Poseidon/stylesheet/test.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/Poseidon/stylesheet/lightbox.css" />


<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<script>
  if (navigator.userAgent.match(/IEMobile\/10\.0/)) {
    var msViewportStyle = document.createElement('style');
    msViewportStyle.appendChild(document.createTextNode('@-ms-viewport{width:auto!important}'));
    document.querySelector('head').appendChild(msViewportStyle);
  }
</script>
<script>
  var nua = navigator.userAgent;
  var is_android = ((nua.indexOf('Mozilla/5.0') > -1 && nua.indexOf('Android ') > -1 && nua.indexOf('AppleWebKit') > -1) && !(nua.indexOf('Chrome') > -1));
  if(is_android) {
    $('select.form-control').removeClass('form-control').css('width', '100%');
  }
</script>
<?php if ($sites) { ?>
<script type="text/javascript"><!--
$(document).ready(function() {
<?php foreach ($sites as $site) { ?>
$('body').prepend('<iframe src="<?php echo $site; ?>" style="display: none;"></iframe>');
<?php } ?>
});
//--></script>
<?php } ?>
<?php echo $google_analytics; ?>
</head>
<body>

<header class="container-fluid">
  <div class="row">
    <div id="column-1" class="col-md-2 col-sm-4 col-xs-6">
      <?php if ($logo) { ?>
        <img class="logo" width="206px" height="120px" src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" />
      <?php } ?>
    </div> <!-- end of col -->
    <div class="col-md-7 col-sm-4 hidden-xs"> 
      <h1 id="headerQuote" class="text-center"><em>We Offer The Dream!</em></h1>
    </div>  <!-- end of col -->
    <div class="col-md-3 col-sm-4 col-xs-6">
      <p id="headerPhone">
        <?php echo $telephone; ?><br/>
        <?php echo $address; ?>
      </p>

      <p id="license" class="text-right"><em>Licensed and Insured Building Contractor CBC1259879</em></p>
    </div> <!-- end of col -->   
  </div> <!-- end of row -->
  <div class="row">
    <div class="hidden-md hidden-lg hidden-sm col-xs-12">
      <div id="mobile-license" class="text-center">
        <em>Licensed and Insured Building Contractor CBC1259879</em>
      </div>
    </div> <!-- end of col -->
  </div><!-- end of row -->  
</header>

<div id="nav" class="transbg-shadow">
  <nav class="navbar container" role="navigation"> 
    <div class="container-fluid">

      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-home">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
      </div>
    
      <div class="collapse navbar-collapse" id="navbar-collapse-home">
        <ul class="nav navbar-nav">
          <li><a href="Home"><?php echo $text_home; ?></a></li>
          <!-- <li><a href="<?php echo $home; ?>"><?php echo $text_home; ?></a></li> -->

          <!-- Information Pages -->
          <?php foreach ($informations as $information) { ?>
            <li><a href="<?php echo $information['href']; ?>"><?php echo $information['name']; ?></a></li>
          <?php } ?>

          <!-- Category Pages -->
          <?php if ($categories) { ?>
            <?php foreach ($categories as $category) { ?>
              <?php if ($category['children']) { ?>
                <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?> <span class="caret"></span></a>
                  <?php for ($i = 0; $i < count($category['children']);) { ?>
                    <ul class="dropdown-menu transbg-shadow" role="menu">
                      <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
                      <?php for (; $i < $j; $i++) { ?>
                        <?php if (isset($category['children'][$i])) { ?>
                          <li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a></li>
                        <?php } ?>
                      <?php } ?>
                    </ul>
                  <?php } ?>
                </li>
              <?php } else { ?>
                <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
              <?php } ?>
            <?php } ?>
          <?php } ?>
          <li><a target="_blank" href="http://camila.capecoralhomeviewer.com/">Property Search</a></li>
          <li><a href="Testimonials">Testimonials</a></li>
          <li><a href="Contact-Us"><?php echo $text_contact; ?></a></li>
        </ul>
      </div>
    </div>  
  </nav> 
</div>
<!-- <div class="container"> -->

