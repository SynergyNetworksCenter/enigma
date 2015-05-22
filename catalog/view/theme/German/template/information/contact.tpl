<?php echo $header; ?>

<div id="contact-container" class="container-fluid">
    
    <?php echo $content_top; ?>

    <!-- English Heading Title: Not Being Used Right Now -->
    <div class="row" style="display:none;">
        <div class="col-lg-12 col-md-12 col-sm-12 col-lg-12">
            <div class="pageTitle transbg-shadow">
                <?php echo $heading_title; ?>
            </div> 
        </div> <!-- end of col -->
    </div> <!-- end of row -->
    <!-- English Heading Title: Not Being Used Right Now -->


    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-lg-12">
            <div class="pageTitle transbg-shadow">
                <?php echo "Kopntakt"; ?>
            </div> 
        </div> <!-- end of col -->
    </div> <!-- end of row -->

    
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-6 xxsm">
            <div id="address" class="transbg-shadow">
                <div class="content">
                    <div class="row">
                        <div class="col-xs-4 col-sm-12">
                            <div id="contact-address">
                                <?php echo $site; ?>
                                <p><?php echo $address; ?></p>
                            </div> <!-- end of contact-address -->
                        </div> <!-- end of col -->        
                        <div class="col-xs-8 col-sm-12">    
                            <div class="phone">
                                <?php if ($telephone) { ?>
                                    <div id="contact-phone">
                                        <?php echo $text_telephone; ?>
                                        <p><?php echo $telephone; ?></p>
                                    </div> <!-- end of contact-phone -->
                                <?php } ?>
                                <?php if ($fax) { ?>
                                    <div id="contact-fax">
                                        <?php echo $text_fax; ?>
                                        <p><?php echo $fax; ?></p>
                                    </div> <!-- end of contact-fax -->
                                <?php } ?>
                            </div> <!-- end of phone -->
                        </div> <!-- end of col -->
                    </div> <!-- end of row -->
                    <div class="row">
                        <div class="col-xs-12 col-md-12 col-sm-12">
                            <div class="license-number">
                                Licensed and Insured Building Contractor CBC1259879
                            </div>   
                        </div> <!-- end of col -->
                    </div> <!-- end of row -->       
                </div> <!-- end of content -->
            </div> <!-- end of address -->
        </div> <!-- end of col -->
        <div class="col-xs-12 col-sm-12 col-md-6">
            <div id="contactForm">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="fname"><?php echo $entry_name; ?></label>
                        <input type="text" name="name" id="name" class="form-control" value="<?php echo $name; ?>" placeholder="Enter Full Name">
                        <?php if ($error_name) { ?>
                            <span class="text-danger"><?php echo $error_name; ?></span>
                        <?php } ?>
                    </div>

                    <div class="form-group">
                        <label for="email"><?php echo $entry_email; ?></label>
                        <input type="text" name="email" id="email" value="<?php echo $email; ?>" class="form-control" placeholder="Enter Email Address">
                        <?php if ($error_email) { ?>
                            <span class="text-danger"><?php echo $error_email; ?></span>
                        <?php } ?>
                    </div>

                    <div class="form-group">
                        <label for="enquiry"><?php echo $entry_enquiry; ?></label>
                        <textarea name="enquiry" id="enquiry" class="form-control" rows="3"><?php echo $enquiry; ?></textarea>
                        <?php if ($error_enquiry) { ?>
                            <span class="text-danger"><?php echo $error_enquiry; ?></span>
                        <?php } ?>
                    </div>

                    <div class="form-group">
                        <label for="captcha"><?php echo $entry_captcha; ?></label>
                        <input type="text" name="captcha" class="form-control" value="<?php echo $captcha; ?>" placeholder="Enter Captcha"> 
                        <?php if ($error_captcha) { ?>
                            <span class="text-danger"><?php echo $error_captcha; ?></span><br />
                        <?php } ?>
                        <img id="captcha" src="index.php?route=information/contact/captcha" alt="" />
                    </div>
            
                    <div class="pull-right">
                        <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-warning" />
                    </div>            
                </form> <!-- end of form -->
            </div> <!-- end of contactForm -->
        </div> <!-- end of col -->
    </div> <!-- end of row -->
    
    <div class="row">

                
    </div> <!-- end of row -->

    <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>