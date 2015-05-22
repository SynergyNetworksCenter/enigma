<?php echo $header; ?>
<div class="container-fluid">
  <div class="row">
    <div class="col-lg-3 col-md-4 col-sm-5 col-lg-offset-0 col-md-offset-0 col-sm-offset-0 prj-img">
      <div class="image">
        <img class="img-responsive prj-cat-thumb" src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" />
      </div>
    </div><!-- end of col --> 

    <div class="col-lg-9 col-md-8 col-sm-7 col-lg-offset-0 col-sm-offset-0 col-md-offset-0 prj-description">
      <div class="category-info">
        
          <div>
            <h3><?php echo $heading_title; ?></h3>
            <hr>
            <?php echo $description; ?>
          </div>  
        
      </div> <!-- end of category-info -->
    </div> <!-- end of col -->
  </div> <!-- end of row -->
  
  <hr class="page-divide">    


  <?php if ($posts) { ?>
    <div class="row">
      <div class="col-md-12 col-sm-12 col-lg-12">
        <div class="pageTitle transbg-shadow">
          <?php echo $posts[0]['title']; ?> Images
        </div>
      </div> <!-- end of col -->
    </div> <!-- end of row -->
    

    <div class="category-grid">
      <div class="row">
        <?php $i = count($post_images); ?>
        <?php $k = 0; ?>
        <?php foreach ($post_images as $img) { ?>
          <?php if($k < 6) { ?>
            <div class="col-md-2 col-lg-2 col-sm-4 col-xs-6 col-md-offset-0 col-lg-offset-0 col-sm-offset-0">
              <a data-lightbox="project" href="<?php echo $img['popup']; ?>">
                <img class="project-gallery-img img-responsive" src="<?php echo $img['thumb']; ?>" title="" alt="gallery Image" />
              </a>
            </div>
            <?php if ($k == 5) { ?>
              </div> <!-- end of row -->
              <?php $k = 0; ?>
              <div class="row">
            <?php } else { ?>  
              <?php $k++; ?>
            <?php } ?>  
          <?php } ?>
        <?php } ?>
      </div> <!-- end of row -->    
    </div> <!-- end of category-grid -->

    <div class="pagination">
      <?php echo $pagination; ?>
    </div>

  <?php } ?> <!-- end of if $posts -->

  <?php if (!$categories && !$posts) { ?>
    <div class="content no-posts">
      <?php echo $text_empty; ?>
    </div>
    
    <div class="buttons">
      <div class="pull-right">
        <a href="<?php echo $continue; ?>" class="btn btn-info">
          <?php echo $button_continue; ?>
        </a>
      </div>
    </div>
  <?php } ?>

  <?php echo $content_bottom; ?>
</div>


<?php echo $footer; ?>