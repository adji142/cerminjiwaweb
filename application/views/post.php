<?php
    require_once(APPPATH."views/parts/Header.php");
    require_once(APPPATH."views/parts/Sidebar.php");
    $active = 'daftarmesin';
?>
	<div id="content">
		<div id="content-header">
			<div id="breadcrumb"> <a href="<?php echo base_url(); ?>" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a> <a href="#" class="current">Post</a> </div>
		</div>
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="widget-box">
					<div class="widget-title"> 
			            <h5>Post</h5>
			        </div>
			        <div class="widget-content">
			        	<!-- <button type="button" class="btn btn-mini btn-info" data-toggle="modal" data-target="#modal_">
							  Tambah Pelayan
						</button> -->
						<div class="dx-viewport demo-container">
				        	<div id="data-grid-demo">
				        		<div id="gridContainer">
				        		</div>
				        	</div>
				        </div>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- Modal -->
<div class="modal hide" id="modal_" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog-scrollable" role="document">
  	<div class="modal-content">
  		<div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">
	        	<div id="title_modal">Tambah Post
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
	        	</div>
	        </h5>
	    </div>
	    <div class="modal-body">
	    	<form class="form-horizontal" enctype='application/json' id="post_">
	    		<div class="control-group">
	    			<label class="control-label">Image API Link</label>
	    			<div class="controls">
	    				<input type="text" name="api" id="api" required="" placeholder="API Link">
	    				<input type="hidden" name="id" id="id">
	    				<input type="hidden" name="formtype" id="formtype" value="add">
	    			</div>
	    		</div>
	    		<div class="control-group">
	    			<label class="control-label">Video URL</label>
	    			<div class="controls">
	    				<input type="text" name="vidurl" id="vidurl" required="" placeholder="Video URL" readonly="">
	    			</div>
	    		</div>
	    		<div class="control-group">
	    			<label class="control-label">Thumbnail URL</label>
	    			<div class="controls">
	    				<input type="text" name="thumburl" id="thumburl" required="" placeholder="Thumbnail URL" readonly="">
	    			</div>
	    		</div>
	    		<div class="control-group">
    			<label class="control-label">Alternative Video URL</label>
    			<div class="controls">
    				<input type="text" name="altvideo" id="altvideo" required="" placeholder="Alternative Video URL">
    			</div>
	    		</div>
	    		<div class="control-group">
	    			<label class="control-label">Judul</label>
	    			<div class="controls">
	    				<input type="text" name="judul" id="judul" required="" placeholder="Judul">
	    			</div>
	    		</div>
	    		<div class="control-group">
	              <label class="control-label">Description</label>
	              <div class="controls">
	                <textarea class="span3" id="Desc" name="Desc" placeholder="Description"></textarea>
	              </div>
	            </div>
	            <div class="control-group">
	              <label class="control-label">Refleksi</label>
	              <div class="controls">
	                <textarea class="span3" id="ref" name="ref" placeholder="Refleksi"></textarea>
	              </div>
	            </div>
	            <div class="control-group">
	              <label class="control-label">Source</label>
	              <div class="controls">
	                <select id="source" name="source">
	                	<option value="CJ">Cermin Jiwa</option>
	                	<option value="SI">Siapa ISA</option>
	                </select>
	              </div>
	            </div>
	            <button class="btn btn-primary" id="btn_Save">Save</button>
	    	</form>
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
        	// initialize desc
        	$('.Desc').wysihtml5();

        	var where_field = '';
        	var where_value = '';
        	var table = 'mstr_pelanggan';

	        $.ajax({
	          type: "post",
	          url: "<?=base_url()?>c_post/read",
	          data: {where_field:where_field},
	          dataType: "json",
	          success: function (response) {
	          	bindGrid(response.data);
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
		        url     : '<?=base_url()?>c_post/add',
		        data    : me.serialize(),
		        dataType: 'json',
		        success : function (response) {
		          if(response.success == true){
		            $('#modal_').modal('toggle');
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
		            $('#modal_').modal('toggle');
		            Swal.fire({
		              type: 'error',
		              title: 'Woops...',
		              text: response.message,
		              // footer: '<a href>Why do I have this issue?</a>'
		            }).then((result)=>{
		            	$('#modal_').modal('show');
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
        $('#api').change(function() {
        // 	$.ajax({
        // 		type    :'get',
		      //   url     : $('#api').val(),
		      //   dataType: 'json',
		      //   success : function (response) {
		      //     // $('#vidurl').text(response.custom);
		      //     // console.log(response['custom_fields']);
		      //   }
		      // });
		      var getJSON = function(url, callback) {
				    var xhr = new XMLHttpRequest();
				    xhr.open('GET', url, true);
				    xhr.responseType = 'json';
				    xhr.onload = function() {
				      var status = xhr.status;
				      if (status === 200) {
				        callback(null, xhr.response);
				      } else {
				        callback(status, xhr.response);
				      }
				    };
				    xhr.send();
				};

				getJSON($('#api').val(),
				function(err, data) {
				  if (err !== null) {
				  	$('#modal_').modal('toggle');
				  	Swal.fire({
		              type: 'error',
		              title: 'Woops...',
		              text: 'Something went wrong: ' + err,
		              // footer: '<a href>Why do I have this issue?</a>'
		            }).then((result)=>{
		            	$('#modal_').modal('show');
			            $('#btn_Save').text('Save');
			            $('#btn_Save').attr('disabled',false);
		            });
				  } else {
				    // alert('Your query count: ' + data.custom_fields);
				    $('#vidurl').val(data.custom_fields.masterasseturl);
				    $('#thumburl').val(data.poster);
				    $('#judul').val(data.name);
				    $('#Desc').val(data.description);
				    $('#ref').val(data.long_description);
				  }
				});
        });
		function GetData(id) {
			$.ajax({
	          type: "post",
	          url: "<?=base_url()?>c_post/find",
	          data: {'id':id},
	          dataType: "json",
	          success: function (response) {
          		$.each(response.data,function (k,v) {
          			console.log(v.KelompokUsaha);
		            $('#nmpelanggan').val(v.NmCustomer);
		            $('#jarak').val(v.Jarak);
		            $('#interval').val(v.intervalbeli).change();
					$('#kelompok').val(v.KelompokUsaha).change();
					// $('#jns').val(v.Tipe).change();
					$('#target').val(v.target).change();
					$('#id').val(v.id).change();
					$('#formtype').val("edit");

					$('#api').val(v.APILink);
					$('#vidurl').val(v.VideoLink);
				    $('#thumburl').val(v.Thumb);
				    $('#judul').val(v.title);
				    $('#Desc').val(v.Description);
				    $('#ref').val(v.Reflection);
				    $('#source').val(v.Source).change();
				    $('#altvideo').val(v.AltVideo);

					$('#modal_').modal('show');
		          });
	          }
	        });
		}
		function bindGrid(data) {

			$("#gridContainer").dxDataGrid({
				allowColumnResizing: true,
		        dataSource: data,
		        keyExpr: "id",
		        showBorders: true,
		        allowColumnReordering: true,
		        allowColumnResizing: true,
		        columnAutoWidth: true,
		        showBorders: true,
		        paging: {
		            enabled: true
		        },
		        editing: {
		            mode: "row",
		            allowAdding:true,
		            allowUpdating: true,
		            allowDeleting: true,
		            texts: {
		                confirmDeleteMessage: ''  
		            }
		        },
		        searchPanel: {
		            visible: true,
		            width: 240,
		            placeholder: "Search..."
		        },
		        export: {
		            enabled: true,
		            fileName: "Daftar Pelayan"
		        },
		        columns: [
		            {
		                dataField: "id",
		                caption: "id",
		                allowEditing:false,
		                visible : false
		            },
		            {
		                dataField: "title",
		                caption: "Judul",
		                allowEditing:false
		            },
		            {
		                dataField: "Viewed",
		                caption: "View",
		                allowEditing:false
		            },
		            {
		                dataField: "Shared",
		                caption: "Share",
		                allowEditing:false
		            },
		            {
		                dataField: "LastUpdatedOn",
		                caption: "Updated Date",
		                allowEditing:false
		            },
		            {
		                dataField: "active",
		                caption: "Active",
		                allowEditing:false
		            }
		            
		        ],
		        onEditingStart: function(e) {
		            GetData(e.data.id);
		        },
		        onInitNewRow: function(e) {
		            // logEvent("InitNewRow");
		            $('#modal_').modal('show');
		        },
		        onRowInserting: function(e) {
		            // logEvent("RowInserting");
		        },
		        onRowInserted: function(e) {
		            // logEvent("RowInserted");
		            // alert('');
		            // console.log(e.data.onhand);
		            // var index = e.row.rowIndex;
		        },
		        onRowUpdating: function(e) {
		            // logEvent("RowUpdating");
		            
		        },
		        onRowUpdated: function(e) {
		            // logEvent(e);
		        },
		        onRowRemoving: function(e) {
		        	id = e.data.id;
		        	Swal.fire({
					  title: 'Apakah anda yakin?',
					  text: "anda akan menghapus data di baris ini !",
					  icon: 'warning',
					  showCancelButton: true,
					  confirmButtonColor: '#3085d6',
					  cancelButtonColor: '#d33',
					  confirmButtonText: 'Yes, delete it!'
					}).then((result) => {
					  if (result.value) {
					  	var table = 'mstr_pelanggan';
					  	var field = 'id';
					  	var value = id;

					  	$.ajax({
					        type    :'post',
					        url     : '<?=base_url()?>c_post/remove',
					        data    : {'id':value},
					        dataType: 'json',
					        success : function (response) {
					          if(response.success == true){
					            Swal.fire(
							      'Deleted!',
							      'Your file has been deleted.',
							      'success'
							    ).then((result)=>{
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
					            	location.reload();
					            });
					          }
					        }
					      });
					    
					  }
					  else{
					  	location.reload();
					  }
					})
		        },
		        onRowRemoved: function(e) {
		        	// console.log(e);
		        },
				onEditorPrepared: function (e) {
					// console.log(e);
				}
		    });

		    // add dx-toolbar-after
		    // $('.dx-toolbar-after').append('Tambah Alat untuk di pinjam ');
		}
	});
</script>
