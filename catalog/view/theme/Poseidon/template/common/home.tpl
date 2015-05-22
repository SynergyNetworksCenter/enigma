<?php echo $header; ?>
<div class="jumbotron">
	<div class="container-fluid">
		<?php echo $column_left; ?>
	</div> <!-- end of container-fluid -->
</div> <!-- end of jumbotron -->

<div class="container-fluid">
	
	<div class="row">
		<div class="col-md-12">
			<?php echo $content_top; ?>
		</div> <!-- end of col -->
	</div> <!-- end of row -->

	<!-- <div class="row">
		<div class="col-md-4"><div class="col-title pageTitle transbg-shadow">Poseidon Models</div></div>
		<div class="col-md-4"><div class="col-title pageTitle transbg-shadow">Project Pictures</div></div>
		<div class="col-md-4"><div class="col-title pageTitle transbg-shadow">Poseidon Floor Plans</div></div>
	</div> --> <!-- end of row -->

	<div id="col-3" class="row">
		<?php echo $content_bottom; ?>
	</div> <!-- end of row -->	
</div> <!-- end of container-fluid -->

<?php echo $footer; ?>

<script>
	$('.slider').addClass("col-md-6");
	$('.hp-box-3').parent().addClass("col-md-7");
	$('.hp-box-3').parent().addClass("col-sm-7");
</script>