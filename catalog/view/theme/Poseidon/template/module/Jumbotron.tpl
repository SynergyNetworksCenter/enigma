<!-- <div id="banner<?php //echo $module; ?>" class="banner"> -->
  <?php foreach ($banners as $banner) { ?>
  <?php if ($banner['link']) { ?>
<div>
  <div class="<?php echo $banner['name']; ?>"><a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /></a></div>
</div>
  <?php } else { ?>
<div>
  <div class="<?php echo $banner['name']; ?>"><img class="<?php echo $banner['title']; ?>" src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /></div>
</div>  
  <?php } ?>
  <?php } ?>
<!-- </div> -->


