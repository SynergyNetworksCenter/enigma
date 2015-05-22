<?php foreach ($banners as $banner) { ?>
  <?php if ($banner['link']) { ?>
	<div id="<?php echo $banner_name; ?>-wrap" class="slider">
  		<div id="<?php echo $banner['name']; ?>" class="banner">
  			<a href="<?php echo $banner['link']; ?>">
  				<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="<?php echo $banner['title']; ?> img-responsive" title="<?php echo $banner['title']; ?>" />
  			</a>
  		</div>
	</div>
  <?php } else { ?>
	<div id="<?php echo $banner_name; ?>-wrap" class="slider">
  		<div id="<?php echo $banner_name; ?>" class="banner">
  			<img class="<?php echo $banner['title']; ?> img-responsive" src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" />
  		</div>
	</div>  
  <?php } ?>
  <?php } ?>
<!-- </div> -->


