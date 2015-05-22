<div id="<?php echo $banner_name; ?>-wrap" class="slider">
  <div id="<?php echo $banner_name; ?>" class="carousel slide" data-ride="carousel">
	 <!-- Indicators -->
  	 <?php $indicator = 1; ?>
  	 <?php $slideTo = 0; ?>
  	 <ol class="carousel-indicators">
  	 <?php foreach ($banners as $banner) { ?>
  		  <?php if ($indicator === 1) { ?>
    		  <li data-target="#<?php echo $banner_name; ?>" data-slide-to="<?php echo $slideTo; ?>" class="active"></li>
    		  <?php $indicator++; ?>
    		  <?php $slideTo++; ?>
  		  <?php } else { ?>
    		  <li data-target="#<?php echo $banner_name; ?>" data-slide-to="<?php echo $slideTo; ?>"></li>
    		  <?php $slideTo++; ?>
  		  <?php } ?>
  	 <?php } ?>
  	 </ol>

  	<!-- Wrapper for slides -->
  	<div class="carousel-inner">
  		<?php $item = 1; ?>
  		<?php foreach ($banners as $banner) { ?>
  			<?php if($item === 1) { ?>
    			<div class="item active">
      				<a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
    			</div>
    			<?php $item++; ?>
    		<?php } else { ?>
				  <div class="item">
      		  <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
    		  </div>
    		<?php } ?>
  		<?php } ?>
  	</div>

  	<!-- Controls -->
  	<a class="left carousel-control" href="#<?php echo $banner_name; ?>" role="button" data-slide="prev">
    	<span class="glyphicon glyphicon-chevron-left"></span>
  	</a>
  	<a class="right carousel-control" href="#<?php echo $banner_name; ?>" role="button" data-slide="next">
    	<span class="glyphicon glyphicon-chevron-right"></span>
  	</a>
  </div>
</div>