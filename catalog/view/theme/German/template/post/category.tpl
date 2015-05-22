<?php echo $header; ?>
<div class="container-fluid">

  <!-- #### CATEGORY THUMB & DESCRIPTION HEADER #### -->
  <!-- Displays a Category Header at Top of Category Page 
  if the Viewed Category has a Thumbnail or Description assigned -->
  <!-- Tip: Do not assign an Image or Description to Parent Category if displaying assigned subcategories -->
  <?php if ($thumb && $description) { ?>
    <?php if ($post_images == false) {?>
      <div class="category-info">
      <?php if ($thumb) { ?>
        <div class="image pull-left"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" /></div>
      <?php } ?>
      <?php if ($description) { ?>
      <div class="project-head">
        <div>
          <h3><?php echo $heading_title; ?></h3>
          <hr>
          <?php echo $description; ?>
        </div>  
      </div>
      <?php } ?>
      </div>
      <hr class="page-divide">
    <?php } else { ?>
      <div class="category-info">
      <?php if ($thumb) { ?>
        <div class="image pull-left"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" /></div>
      <?php } ?>
      <?php if ($description) { ?>
        <div class="project-head">
          <div>
            <h3><?php echo $heading_title; ?></h3>
            <hr>
            <?php echo $description; ?>
          </div>  
        </div>
      <?php } ?>
      </div>
      <hr class="page-divide">
    <?php } ?>    
  <?php } else { ?>
  <div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
      <div class="pageTitle transbg-shadow">
        <?php echo $heading_title; ?>
      </div>
    </div> <!-- end of col -->
  </div> <!-- end of row -->    
   <?php } ?> 
  <!-- #### CATEGORY THUMB & DESCRIPTION HEADER #### -->

  <?php echo $content_top; ?>


  <!-- #### SUBCATEGORY VIEWS #### -->
  <!-- Displays Grid / List View of Subcategories assigned to Parent Category -->
  <?php if ($categories) { ?>
    <!-- Set class="category-grid" for grid style layout -->
    <!-- Set class="category-list" for list style layout -->

    <div class="category-grid">
    <?php foreach ($categories as $category) { ?>
      <div>
        <?php if ($category['thumb']) { ?>
          <div class="image">
            <a href="<?php echo $category['href']; ?>">
              <img src="<?php echo $category['thumb']; ?>" title="<?php echo $category['name']; ?>" alt="<?php echo $category['name']; ?>" />
            </a>
          </div>
        <?php } ?>

        <div class="name">
          <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>    
        </div>

      </div>
    <?php } ?>
    </div>
  <?php } ?>
  <!-- #### SUBCATEGORY GRID #### -->

  <!-- #### ASSIGNED POST VIEW #### -->
  <?php if ($posts) { ?>
  
  <!-- #### POST GRID #### -->
  <!-- Displays Posts if assigned to Viewed Category -->
  <!-- Class Options: post-list, post-grid -->
  <div class="post-grid">
    <?php foreach ($posts as $post) { ?>
      <div>
        <?php if ($post['thumb']) { ?>
          <div class="image">
            <a href="<?php echo $post['href']; ?>">
              <img src="<?php echo $post['thumb']; ?>" title="<?php echo $post['title']; ?>" alt="<?php echo $post['title']; ?>" />
            </a>
          </div>
        <?php } ?>

        <?php if (!isset($post_images)) { ?>
          <div class="name">
            <a href="<?php echo $post['href']; ?>"><?php echo $post['title']; ?></a>
          </div>
        <?php } ?>
      </div>
    <?php } ?>
  </div>
  <!-- #### POST GRID #### -->
  <!-- #### ASSIGNED POST VIEW #### -->

  <?php if ($post_images) { ?>
    <!-- <hr class="page-divide"> -->
    <div class="post-grid">
        <?php foreach ($posts as $post) { ?>
          <div class="pageTitle transbg-shadow">
            <!-- <p><?php echo $post['title']; ?></p> -->
            Images
          </div>
        <?php } ?>
    </div>

    <div class="category-grid">
      <?php foreach ($post_images as $img) { ?>
        <a href="<?php echo $img['popup']; ?>">
          <img class="project-gallery-img img-responsive" src="<?php echo $img['thumb']; ?>" title="" alt="gallery Image" />
        </a>
      <?php } ?>  
    </div>
    
  <?php } ?>


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