<?php echo $header; ?>
<div class="container-fluid">

  <div class="row">
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
      <div class="pageTitle transbg-shadow">
        <?php echo $heading_title; ?>
      </div>
    </div> <!-- end of col -->
  </div> <!-- end of row -->
   
  <?php echo $content_top; ?>    

  <!-- #### ASSIGNED POST VIEW #### -->
  <?php if ($posts) { ?>
    <div class="post-grid">
      <div class="row">
        <?php foreach ($posts as $post) { ?>
          <div class="col-xs-12 col-sm-4 col-md-4">
            <div class="listwrap">
              <div class="name"><?php echo $post['title']; ?></div> <!-- end of name -->
    
              <div class="image">
                <img src="<?php echo $post['thumb']; ?>" title="<?php echo $post['title']; ?>" alt="<?php echo $post['title']; ?>" />
              </div>
           
              <div id="attributes" class="features">
                <?php if($post['attributes']) {?>
                  <div class="row">
                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 text-center">
                      <?php if(isset($post['attributes']['sqft'])) { ?>
                        <?php echo $post['attributes']['sqft']; ?>
                      <?php } ?>
                    </div> <!-- end of col -->
                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 text-center">
                      <?php if(isset($post['attributes']['Bedrooms'])) { ?>
                        <?php echo $post['attributes']['Bedrooms']; ?>
                      <?php } ?>
                    </div> <!-- end of col -->
                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 text-center">
                      <?php if(isset($post['attributes']['Baths'])) { ?>
                        <?php echo $post['attributes']['Baths']; ?>
                      <?php } ?>
                    </div> <!-- end of col -->
                  </div> <!-- end of row -->
                <?php } else { ?>
                  <div class="row">
                    <div class="col-md-12 text-center">
                        Poseidon Homes &nbsp;&nbsp;  <?php echo $post['title']; ?> &nbsp;&nbsp; Coming Soon
                    </div> <!-- end of col -->
                  </div>  <!-- end of row -->
                <?php } ?>                 
              </div>  <!-- end of Attributes -->

              <div class="floor_plan_info">
                <?php if($post['download'] != '') { ?>
                  <a href="<?php echo $post['href']; ?>" class="btn btn-lg btn-primary">More Information</a>
                <?php } else { ?>
                  <button class="btn btn-lg btn-primary">Coming Soon</button>
                <?php } ?>
              </div> <!-- end of floor_plan_info -->
              
            </div> <!-- end of listwrap -->
          </div> <!-- end of col -->
        <?php } ?> <!-- end of foreach $posts -->
      </div> <!-- end of row -->
    </div> <!-- end of post-grid -->
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