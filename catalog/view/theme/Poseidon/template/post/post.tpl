<?php echo $header; ?>
<?php echo $column_left; ?> <!-- not being used -->
<?php echo $column_right; ?> <!-- not being used -->
<?php echo $content_top; ?> <!-- not being used -->
<?php echo $content_bottom; ?> <!-- not being used -->

    <div class="container-fluid">
      <div class="row">
        <div class="col-md-12">
          <?php if ($thumb || $images) { ?>
            <div class="floorplan-header-image">
              <?php if ($thumb) { ?>
                <div class="image">
                  <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image" />
                </div> <!-- end of image -->
              <?php } ?> 
            </div> <!-- end of floorplan header image -->
          <?php } ?>
        </div> <!-- end of col -->
      </div> <!-- end of row -->

      <div class="row" style="margin-bottom:10px;">
        <div class="col-sm-12 col-md-12 col-lg-12">
          <div class="transbg-shadow">
            <div class="row">
              <div id="model-title" class="col-sm-2 col-xs-4">
                <div class="pageTitle" style="margin-bottom:0px;">
                  <?php echo $heading_title; ?>
                </div> <!-- end of pageTitle -->
              </div> <!-- end of nest col-sm-2 -->
              <div id="inner-tabs" class="col-sm-10 col-xs-8 pull-right">
                <ul class="nav nav-tabs pull-right" role="tablist" style="border-bottom:none;">
                  <?php if ($description) { ?>
                    <li role="presentation" class="hidden-sm hidden-lg hidden-xs hidden-md"><a href="#tab-description" role="tab" data-toggle="tab" class=" orange "><?php echo $tab_description; ?></a></li>
                  <?php } ?>

                  <?php if ($images) { ?>  
                    <li role="presentation" class="active"><a href="#tab-floorplan" class="orange" role="tab" data-toggle="tab"><?php echo "Floor Plan"; ?></a></li>
                  <?php } ?>

                  <?php if ($attribute_features) { ?>  
                    <li role="presentation"><a href="#tab-features" class="orange" role="tab" data-toggle="tab"><?php echo "Features"; ?></a></li>
                  <?php } ?>

                  <?php if ($attribute_options) { ?>
                    <li role="presentation"><a href="#tab-options" class="orange" role="tab" data-toggle="tab"><?php echo "Options"; ?></a></li>
                  <?php } ?>

                  <?php if ($attribute_allowances) { ?>
                    <li role="presentation"><a href="#tab-allowances" class="orange" role="tab" data-toggle="tab"><?php echo "Allowances"; ?></a></li>
                  <?php } ?>

                  <?php if (isset($included)) { ?>
                    <li role="presentation"><a href="#tab-included" class="orange" role="tab" data-toggle="tab"><?php echo "What's Included"; ?></a></li>
                  <?php } ?>

                  <?php if ($downloads) { ?>
                    <li role="presentation"><a href="#tab-downloads" class="orange" role="tab" data-toggle="tab"><?php echo "Downloads"; ?></a></li>
                  <?php } ?>
                </ul> <!-- end of tab-list -->
              </div> <!-- end of nested col-sm-10 -->
            </div> <!-- end of nested row -->  
          </div> <!-- end of transbg-shadow -->
        </div> <!-- end of col -->
      </div> <!-- end of row -->

      <div class="post-info">
        <div class="row">
          <div class="col-md-12">
            <div id="description-box" class="border-box-white">
              <div class="bg-white">
                <?php echo $description; ?>  
              </div> <!-- end of bg-white -->
            </div> <!-- end of description-box -->
          </div> <!-- end of col -->
        </div> <!-- end of row -->
      </div> <!-- end of post-info -->


      <ul id="outer-tabs" class="nav nav-tabs hidden-lg hidden-md hidden-sm hidden-xs" role="tablist">
        <?php //if ($description) { ?>
          <!-- <li role="presentation" class="hidden-sm hidden-lg hidden-xs hidden-md"><a href="#tab-description" role="tab" data-toggle="tab" class=" orange "><?php //echo $tab_description; ?></a></li> -->
        <?php //} ?>

        <?php if ($images) { ?>  
          <li role="presentation" class="active"><a href="#tab-floorplan" class="orange" role="tab" data-toggle="tab"><?php echo "Floor Plan"; ?></a></li>
        <?php } ?>

        <?php if ($attribute_features) { ?>  
          <li role="presentation"><a href="#tab-features" class="orange" role="tab" data-toggle="tab"><?php echo "Features"; ?></a></li>
        <?php } ?>

        <?php if ($attribute_options) { ?>
          <li role="presentation"><a href="#tab-options" class="orange" role="tab" data-toggle="tab"><?php echo "Standard Options"; ?></a></li>
        <?php } ?>

        <?php if ($attribute_allowances) { ?>
          <li role="presentation"><a href="#tab-allowances" class="orange" role="tab" data-toggle="tab"><?php echo "Allowances"; ?></a></li>
        <?php } ?>

        <?php if (isset($included)) { ?>
          <li role="presentation"><a href="#tab-included" class="orange" role="tab" data-toggle="tab"><?php echo "What's Included"; ?></a></li>
        <?php } ?>

        <?php if ($downloads) { ?>
          <li role="presentation"><a href="#tab-downloads" class="orange" role="tab" data-toggle="tab"><?php echo "Downloads"; ?></a></li>
        <?php } ?>
      </ul>
       
      <div class="tab-content">
        <?php //if ($description) { ?>  
          <div role="tabpanel" id="tab-description" class="tab-pane" style="display:none;"> 
            <div class="row">
              <div class="col-xs-12 col-sm-12">
                <div id="tab-description-box" class="border-box-white">
                  <div class="bg-white">
                    <?php echo $description; ?>  
                  </div> <!-- end of bg-white -->
                </div> <!-- end of description-box -->
              </div> <!-- end of col -->
            </div> <!-- end of row -->
          </div> <!-- end of tab-description -->
        <?php //} ?>

        <?php if ($images) { ?>
          <div role="tabpanel" id="tab-floorplan" class="tab-pane active"> 
            <div class="row">
              <div class="col-md-12">  
                <div class="image-additional border-box-white">
                  <div class="pageTitle">
                    <?php echo 'Floor Plan'; ?>
                  </div>
                  <?php foreach ($images as $image) { ?>
                    <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                  <?php } ?>
                </div> <!-- end of additional images -->
              </div> <!-- end of col -->
            </div> <!-- end of row -->
          </div> <!-- end of tab-floorplan -->
        <?php } ?>  

        <?php if ($attribute_features) { ?>
          <div role="tabpanel" id="tab-features" class="tab-pane table-responsive border-box-white">
            <div class="pageTitle">
              <?php echo $attribute_features['name']; ?>
            </div>
            <table class="attribute table table-bordered bg-white">    
              <tbody>
                <?php foreach ($attribute_features['attribute'] as $feature) { ?>
                  <tr>
                    <td><?php echo $feature['text']; ?></td>
                  </tr>
                <?php } ?>
              </tbody>
            </table>
          </div> <!-- end of tab features -->
        <?php } ?>
      
        <?php if ($attribute_options) { ?>
          <div role="tabpanel" id="tab-options" class="tab-pane table-responsive border-box-white">
            <div class="pageTitle">
              <?php echo $attribute_options['name']; ?>
            </div>
            <table class="attribute table table-bordered bg-white">    
              <tbody>
                <?php foreach ($attribute_options['attribute'] as $option) { ?>
                  <tr>
                    <td><?php echo $option['name']; ?></td>
                    <td><?php echo $option['text']; ?></td>
                  </tr>
                <?php } ?>
                  <tr>
                    <td colspan="2" class="red">* All prices subject to change at any time and are not guaranteed.</td>
                  </tr>
              </tbody>
            </table>
          </div> <!-- end of tab-options -->
        <?php } ?>

        <?php if ($attribute_allowances) { ?>
          <div role="tabpanel" id="tab-allowances" class="tab-pane table-responsive border-box-white">
            <div class="pageTitle">
              <?php echo $attribute_allowances['name']; ?>
            </div>
            <table class="attribute table table-bordered table-condensed bg-white">    
              <!-- <thead>
                <tr>
                  <td colspan="2"><strong class="orange"><?php //echo $attribute_allowances['name']; ?></strong></td>
                </tr>
              </thead> -->
              <tbody>
                <?php foreach ($attribute_allowances['attribute'] as $allowance) { ?>
                  <tr>
                    <td><?php echo $allowance['name']; ?></td>
                    <td><?php echo $allowance['text']; ?></td>
                  </tr>
                <?php } ?>
                  <tr>
                    <td colspan="2" class="red">
                      * All prices subject to change at any time and are not guaranteed. <br/>
                    </td>
                  </tr>
                  <tr>
                    <td colspan="2" class="red">
                      ** Extra charges apply to rocky property.
                    </td>
                  </tr>
              </tbody>
            </table>
          </div> <!-- end of tab allowances -->
        <?php } ?>

        <?php if (isset($included)) { ?>
          <div role="tabpanel" id="tab-included" class="tab-pane">
            
          </div> <!-- end of tab-included -->
        <?php } ?>

        <?php if ($downloads) { ?>
          <div role="tabpanel" id="tab-downloads" class="tab-pane border-box-white">
            <div class="pageTitle">
              <?php echo 'Downloads'; ?>
            </div>
            <ul class="bg-white">
              <?php foreach ($downloads as $download) { ?>
                <li>
                  <a type="application/pdf" href="<?php echo $download['href']; ?>" class="btn orange btn-link">
                    <?php echo $download['name']; ?>
                  </a>
                </li> <!-- download link -->
              <?php } ?>
            </ul> <!-- end of ul -->  
          </div> <!-- end of tab-downloads -->
        <?php } ?>
      </div> <!-- end of tab-content -->

    </div> <!-- end of of container-fluid -->  

<?php echo $footer; ?>


 
