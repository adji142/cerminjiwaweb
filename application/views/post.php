<?php
    require_once(APPPATH."views/parts/Header.php");
    require_once(APPPATH."views/parts/Sidebar.php");
    $active = 'daftarmesin';

?>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
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
	    <!-- enctype='application/json' -->
	    <div class="modal-body">
	    	<form class="form-horizontal" id="post_">
	    		<div class="control-group">
	    			<label class="control-label">Not Referance to API ?</label>
	    			<div class="controls">
	    				<input type="checkbox" name="notref" id="notref">
	    			</div>
	    		</div>
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
    			<label class="control-label">Post URL</label>
    			<div class="controls">
    				<input type="text" name="PostLink" id="PostLink" required="" placeholder="Post Page">
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
	                <textarea class="span3" id="Desc" name="Desc" placeholder="Description" rows="5"></textarea>
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
	            <div class="control-group">
	              <label class="control-label">Folder</label>
	              <div class="controls">
	                <select id="Folder" name="Folder" disabled="">
	                	<option value="1">Mujizat Isa</option>
	                	<option value="2">Pengajaran Isa</option>
	                	<option value="3">Kehidupan Isa</option>
	                </select>
	              </div>
	            </div>
	            <div class="control-group">
	              <label class="control-label">Ofline Video</label>
	              <div class="controls">
	                <input type="file" name="uservid" id="uservid">
	              </div>
	            </div>
	            <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>">
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
		// $.ajaxSetup({
  //           beforeSend:function(jqXHR, Obj){
  //               var value = "; " + document.cookie;
  //               var parts = value.split("; csrf_cookie_token=");
  //               if(parts.length == 2)
  //               Obj.data += '&csrf_token='+parts.pop().split(";").shift();
  //           }
  //       });
        $(document).ready(function () {
        	// initialize desc
        	$('#Desc').wysihtml5();
        	$('#ref').wysihtml5();

        	var where_field = '';
        	var where_value = '';
        	var table = 'mstr_pelanggan';

	        $.ajax({
	          type: "post",
	          url: "<?=base_url()?>c_post/Read",
	          data: {where_field:where_field},
	          dataType: "json",
	          success: function (response) {
	          	bindGrid(response.data);
	          }
	        });
        });
        $('#notref').change(function () {
        	// console.log();
        	if ($('#notref').prop('checked')) {
        		$('#api').val('-');
        		$('#api').prop('readonly',true);
        		$('#vidurl').prop('readonly',false);
        		$('#thumburl').prop('readonly',false);
        	}
        	else{
        		$('#api').val('');
        		$('#api').prop('readonly',false);
        		$('#vidurl').prop('readonly',true);
        		$('#thumburl').prop('readonly',true);
        		$('#thumburl').val('');
        		$('#vidurl').val();
        	}
        });
        $('#post_').submit(function (e) {
        	$('#btn_Save').text('Tunggu Sebentar.....');
		    $('#btn_Save').attr('disabled',true);

		    var api = $('#api').val();
		    var id = $('#id').val();
		    var formtype = $('#formtype').val();
		    var vidurl = $('#vidurl').val();
		    var thumburl = $('#thumburl').val();
		    var altvideo = $('#altvideo').val();
		    var PostLink = $('#PostLink').val();
		    var judul = $('#judul').val();
		    var Desc = $("#Desc").val();
		    var ref = $('#ref').val();
		    var source = $('#source').val();
		    var Folder = $('#Folder').val();
		    var uservid = $('#uservid').prop('files')[0];

		    // console.log(uservid);
		    e.preventDefault();
			// var me = $(this);
			// var file_data = $('#uservid').prop('files');
            var form_data = new FormData(this);
 
            // form_data.append('file', uservid);
			// api:api,id:id,formtype:formtype,vidurl:vidurl,thumburl:thumburl,altvideo:altvideo,PostLink:PostLink,judul:judul,Desc:Desc,ref:ref,source:source,Folder:Folder,uservid:uservid
			$.ajax({
		        type    :'post',
		        url     : '<?=base_url()?>c_post/add',
		        data    : form_data, //
		        dataType: 'json',
		        processData: false,
				contentType: false,
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
        $('#source').change(function () {
        	var source = $('#source').val();
        	console.log(source);
        	if (source == 'SI') {
        		$('#Folder').prop('disabled',false);
        	}
        	else{
        		$('#Folder').prop('disabled',true);	
        	}
        });
        $('#api').change(function() {
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
				    $('#Desc').data('wysihtml5').editor.setValue(data.description);
				    $('#ref').data('wysihtml5').editor.setValue(data.long_description);
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
					$('#Folder').val(v.Folder).change();
					$('#formtype').val("edit");

					$('#api').val(v.APILink);
					$('#vidurl').val(v.VideoLink);
				    $('#thumburl').val(v.Thumb);
				    $('#judul').val(v.title);
				    $('#Desc').data('wysihtml5').editor.setValue(v.Description);
				    $('#ref').data('wysihtml5').editor.setValue(v.Reflection);
				    $('#source').val(v.Source).change();
				    $('#altvideo').val(v.AltVideo);
				    $('#PostLink').val(v.PostLink);

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

		function xxx() {
			$.ajax({
	          type: "post",
	          url: "<?=base_url()?>c_post/find",
	          data: {'id':id},
	          dataType: "json",
	          success: function (response) {
          		$.each(response.data,function (k,v) {
          			console.log(v.KelompokUsaha);
		          });
	          }
	        });
		}
	});
</script>
