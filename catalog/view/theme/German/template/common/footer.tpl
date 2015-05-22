<footer id="footer" class="transbg-shadow">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                <!-- Copyright Code Starts Here -->
                <div id="copy" class="text-left">
                    <?php echo $copyright; ?>
                </div> <!-- end of copy -->
            </div> <!-- end of col -->
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                <!-- Copyright Code Starts Here -->
                <div id="powered" class="text-right">
                    <?php echo $powered; ?>
                </div> <!-- end of powered -->
            </div> <!-- end of col  -->
        </div> <!-- end of row -->     
    </div> <!-- end of container-fluid -->
</footer> <!-- end of footer -->




<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<!-- <script src="catalog/view/javascript/bootstrap/bootstrap.min.js"></script> -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="catalog/view/javascript/jquery/lightbox.min.js"></script>

<!-- Footer Ends Here -->

<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>

</body>
</html>