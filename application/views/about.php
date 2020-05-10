<?php
    require_once(APPPATH."views/parts/Header.php");
    require_once(APPPATH."views/parts/Sidebar.php");
    $active = 'daftarmesin';
?>
	<div id="content">
		<div id="content-header">
			<div id="breadcrumb"> <a href="<?php echo base_url(); ?>" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a> <a href="#" class="current">Setting	</a> </div>
		</div>
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="widget-box">
					<div class="widget-title"> 
			            <h5>About</h5>
			        </div>
			        <div class="widget-content">
			        	<form class="form-horizontal" enctype='application/json' id="post_">
			        		<div class="control-group">
				              <label class="control-label">About</label>
				              <div class="controls">
				                <textarea class="span3" id="About" name="About" placeholder="Description"></textarea>
				                <input type="hidden" name="id" id="id">
				    			<input type="hidden" name="formtype" id="formtype" value="add">
				              </div>
				            </div>
				    		<div class="control-group">
				    			<label class="control-label">Youtube</label>
				    			<div class="controls">
				    				<input type="text" name="Youtube" id="Youtube" required="" placeholder="Youtube URL" >
				    			</div>
				    		</div>
				    		<div class="control-group">
				    			<label class="control-label">Instagram</label>
				    			<div class="controls">
				    				<input type="text" name="Instagram" id="Instagram" required="" placeholder="Instagram URL" >
				    			</div>
				    		</div>
				    		<div class="control-group">
				    			<label class="control-label">Twitter</label>
				    			<div class="controls">
				    				<input type="text" name="Twitter" id="Twitter" required="" placeholder="Twitter URL" >
				    			</div>
				    		</div>
				    		<div class="control-group">
				    			<label class="control-label">Facebook</label>
				    			<div class="controls">
				    				<input type="text" name="Facebook" id="Facebook" required="" placeholder="Facebook URL" >
				    			</div>
				    		</div>
				    		<div class="control-group">
				    			<label class="control-label">Likedin</label>
				    			<div class="controls">
				    				<input type="text" name="Likedin" id="Likedin" required="" placeholder="Likedin URL" >
				    			</div>
				    		</div>
				    		<div class="control-group">
				    			<label class="control-label">Thumbler</label>
				    			<div class="controls">
				    				<input type="text" name="Thumbler" id="Thumbler" required="" placeholder="Thumbler URL" >
				    			</div>
				    		</div>
				            <button class="btn btn-primary" id="btn_Save">Save</button>
				    	</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<?php
    require_once(APPPATH."views/parts/Footer.php");
?>

<script type="text/javascript">
	$(function () {
		$.ajaxSetup({
            beforeSend:function(jqXHR, Obj){
                var value = "; " + document.cookie;
                var parts = value.split("; csrf_cookie_token=");
                if(parts.length == 2)
                Obj.data += '&csrf_token='+parts.pop().split(";").shift();
            }
        });
        $(document).ready(function () {
        	// initialize descs
        	var where_field = '';
        	var where_value = '';
        	var table = 'mstr_pelanggan';

	        $.ajax({
	          type: "post",
	          url: "<?=base_url()?>Apps/read",
	          data: {where_field:where_field},
	          dataType: "json",
	          success: function (response) {
	          	// bindGrid(response.data);
	          	$.each(response.data,function (k,v) {
	          		$('#id').val(v.id);
	          		$('#About').val(v.About);
	          		$('#Youtube').val(v.Youtube);
	          		$('#Instagram').val(v.Instagram);
	          		$('#Twitter').val(v.Twitter);
	          		$('#Facebook').val(v.Facebook);
	          		$('#Likedin').val(v.Likedin);
	          		$('#Thumbler').val(v.Thumbler);
	          		$('#formtype').val("edit");
	          	});
	          }
	        });
        });
        $('#post_').submit(function (e) {
        	$('#btn_Save').text('Tunggu Sebentar.....');
		    $('#btn_Save').attr('disabled',true);

		    e.preventDefault();
			var me = $(this);

			$.ajax({
		        type    :'post',
		        url     : '<?=base_url()?>Apps/add',
		        data    : me.serialize(),
		        dataType: 'json',
		        success : function (response) {
		          if(response.success == true){
		            Swal.fire({
		              type: 'success',
		              title: 'Horay..',
		              text: 'Data Berhasil disimpan!',
		              // footer: '<a href>Why do I have this issue?</a>'
		            }).then((result)=>{
		              location.reload();
		            });
		          }
		          else{
		            Swal.fire({
		              type: 'error',
		              title: 'Woops...',
		              text: response.message,
		              // footer: '<a href>Why do I have this issue?</a>'
		            }).then((result)=>{
			            $('#btn_Save').text('Save');
			            $('#btn_Save').attr('disabled',false);
		            });
		          }
		        }
		      });
        });
        $('.close').click(function() {
        	location.reload();
        });
	});
</script>
