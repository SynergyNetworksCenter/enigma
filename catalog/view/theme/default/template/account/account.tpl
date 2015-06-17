<?php echo $header; ?>

<div class="jumbotron-bg">
  <?php echo $navigation; ?>
  <div class="jumbotron container">
      <h1><?php echo $welcome; ?></h1>
      <p>To Your Personal SNWebDM Client Portal. Here you can review your sites Marketing Campains, View Site Statistics, Monitor your Adwords and Analytics data for Google and Bing, and More. All in one place!</p>
      <!-- <p><a class="btn btn-primary btn-lg" role="button">Learn more</a></p> -->
  </div>
</div><!-- end of jumbotron-bg -->

<div class="container">
  <div class="row">
    <div class="col-md-4">
      <img src="http://www.snworks.com/images/web-analytics-banner.jpg" class="img-rounded center-block" width="100%" alt="placeholder+image">
      <div class="caption">
        <h3>Analytics</h3>
        <p>As the volume of the customer information collected on your website continues to grow, you need powerful and flexible tools to uncover visitor preferences and share this data throughout your organization. More than ever, you need Web Analytics.</p>

        <p>Our Web Analytics allow you to measure all aspects of your organization's online presence. Enhanced support for open standards lets you connect aggregate online data with purchasing, sales and other enterprise systems to get one view of your customers and data.</p>

        <p><a href="<?php echo $analytics; ?>" class="btn btn-primary" role="button">View Analytics</a></p>
      </div>
    </div>
    <div class="col-md-4">
      <img src="http://dummyimage.com/360x106/4d494d/686a82.gif&text=placeholder+image" class="img-rounded center-block" alt="placeholder+image">
      <div class="caption">
        <h3>Marketing</h3>
        <p>Take advantage of a marketing plan that will not only generate website traffic, but will also strive to ensure that the right kind of customer reaches your website. With an eye-catching ad and accurate, focused keywords, Synergy Networks can put your advertising dollars to work for you.</p>

        <p>Our team will generate reports and email them to you, giving you an idea of how effective your ad has been. Each month, we can work with you to further develop your ad - changing keywords, refining ad text, removing keywords that are not bringing in the desired type of traffic, and more.</p>
        <p><a href="<?php echo $marketing; ?>" class="btn btn-primary" role="button">View Google Marketing</a>
          <a href="<?php echo $bing; ?>" class="btn btn-primary" role="button">View Bing Marketing</a></p>

      </div>
    </div>
    <div class="col-md-4">
      <img src="http://dummyimage.com/360x106/4d494d/686a82.gif&text=placeholder+image" class="img-rounded center-block" alt="placeholder+image">
      <div class="caption">
        <h3>New Features Coming Soon</h3>
        <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
        <!-- <p><a href="#" class="btn btn-primary" role="button">View Statistics</a></p> -->
      </div>
    </div>
  </div>
</div>



<?php echo $footer; ?>
