<?php echo $header; ?>
<div class="container-fluid">
  
  <div class="row">
    <div class="col-md-12 col-sm-12 col-lg-12 col-xs-12">
	    <div class="pageTitle transbg-shadow">
		    <?php echo $heading_title; ?>
	    </div>
    </div> <!-- end of col -->
  </div> <!-- end of row -->
  
  <div class="row">
    <div class="col-md-8 col-sm-8 col-xs-12">
      <div class="reviews">
        <?php if ($reviews) { ?>
          <?php foreach($reviews as $review) { ?>
            <div class="transbg-shadow testimonial">
              <blockquote class="blockquote-reverse">
                <div class="row">
                  <div class="col-md-12">
                    <p class="text-left"><?php echo $review['text']; ?></p>
                  </div> <!-- end of col -->
                </div> <!-- end of row -->
                <div class="row rating">
                  <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">        
                    <img class="" src="catalog/view/theme/default/image/stars-<?php echo $review['rating']; ?>.png" alt="rating stars" />
                  </div> <!-- end of col -->
                </div> <!-- end of row -->
                <div class="row">
                  <div class="col-md-12">
                    <footer>
                      <?php echo $review['author']; ?>
                    </footer>
                  </div> <!-- end of col -->
                </div><!-- end of row -->
              </blockquote>
            </div> <!-- end of testimonial -->
          <?php } ?>
        <?php } else { ?>
          <div class="content no-posts"><?php echo "No Testimonials available"; ?></div>
        <?php } ?>      
      </div> <!-- end of reviews -->
    </div> <!-- end of col -->

    <div class="col-md-4 col-sm-4 col-xs-12">
      <div id="testForm" class="transbg-shadow clearfix">
        <h4>Submit A New Testimonial</h4>
        <hr>  
        <form>
          <div class="form-group">
            <label for="name"><?php echo $entry_name; ?></label>
            <input type="text" name="name" id="name" class="form-control"  placeholder="Enter Full Name">
          </div>

          <!-- <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" name="email" id="email" class="form-control" placeholder="Enter Email Address">
          </div> -->

          <div class="form-group">
            <label for="text"><?php echo $entry_review; ?></label>
            <textarea name="text" id="text" class="form-control" rows="3"></textarea>
            <span style="font-size: 11px;"><?php echo $text_note; ?></span><br />
          </div>

          <div class="form-group">
            
            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <label><?php echo $entry_rating; ?> &nbsp;</label>
                <span><?php echo $entry_bad; ?></span> 
                <label class="radio-space">
                  <input type="radio" name="rating" value="1" />
                </label>
                <label class="radio-space">  
                  <input type="radio" name="rating" value="2" />
                </label>
                <label class="radio-space"> 
                  <input type="radio" name="rating" value="3" />
                </label>
                <label class="radio-space">  
                  <input type="radio" name="rating" value="4" />
                </label>
                <label class="radio-space">  
                  <input type="radio" name="rating" value="5" />
                </label>
                <span><?php echo $entry_good; ?></span>
              </div> <!-- end of col -->
            </div> <!-- end of row -->
          </div>
          
              <a id="button-testimonial" class="btn btn-warning pull-right">Submit</a>
           
        </form> <!-- end of form -->
      </div> <!-- end of testForm -->
    </div> <!-- end of col -->
  </div> <!-- end of row -->

</div> <!-- end of container-fluid -->

<?php echo $footer; ?>
<script><!--
  $('#button-testimonial').bind('click', function() {
  $.ajax({
    url: 'index.php?route=information/testimonial/write',
    type: 'post',
    dataType: 'json',
    data: '&name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : ''),
    beforeSend: function() {
      $('.alert-danger').remove();
      $('#button-testimonial').attr('disabled', true);
      $('.pageTitle').after('<div class="alert alert-info"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
    },
    complete: function() {
      $('#button-testimonial').attr('disabled', false);
      $('.alert-info').remove();
    },
    success: function(data) {
      if (data['error']) {
        $('.pageTitle').after('<div class="alert alert-danger attention">' + data['error'] + '</div>');
      }
      
      if (data['success']) {
        $('.pageTitle').after('<div class="alert alert-success attention">' + data['success'] + '</div>');
                
        $('input[name=\'name\']').val('');
        $('textarea[name=\'text\']').val('');
        $('input[name=\'rating\']:checked').attr('checked', '');
      }
    }
  });
});
--></script> 

