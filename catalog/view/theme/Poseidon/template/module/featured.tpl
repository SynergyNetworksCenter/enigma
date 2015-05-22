<div class="row" id="employeeInfo">
  <?php foreach ($posts as $post) { ?>
    <div class="col-md-4 col-lg-2 col-sm-4 col-xs-12 employee">
      <div class="transbg-shadow">
        <!-- <img src="<?php //echo $post['thumb']; ?>" alt="<?php //echo $post['title']; ?>" /> -->
        <div class="caption">
      	  <h4><?php echo $post['title']; ?></h4>
      	  <!-- <p><?php //echo $post['position']; ?></p> -->
      	  <hr>
      	  <?php echo $post['description']; ?>
        </div> <!-- end of caption -->
      </div> <!-- end of employee -->
    </div> <!-- end of col --> 
  <?php } ?> 
</div><!-- end of row -->

