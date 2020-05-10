<?php
    require_once(APPPATH."views/parts/Header.php");
    require_once(APPPATH."views/parts/Sidebar.php");
    $active = 'daftarmesin';
?>
	<div id="content">
		<div id="content-header">
			<div id="breadcrumb"> <a href="<?php echo base_url(); ?>" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a> <a href="#" class="current">User</a> </div>
		</div>
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="widget-box">
					<div class="widget-title"> 
			            <h5>Daftar Pengguna Aktif</h5>
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
	          url: "<?=base_url()?>Apps/UserList",
	          data: {where_field:where_field},
	          dataType: "json",
	          success: function (response) {
	          	bindGrid(response.data);
	          }
	        });
        });
        $('#post_').submit(function (e) {
   //      	$('#btn_Save').text('Tunggu Sebentar.....');
		 //    $('#btn_Save').attr('disabled',true);

		 //    e.preventDefault();
			// var me = $(this);

			// $.ajax({
		 //        type    :'post',
		 //        url     : '<?=base_url()?>c_post/add',
		 //        data    : me.serialize(),
		 //        dataType: 'json',
		 //        success : function (response) {
		 //          if(response.success == true){
		 //            $('#modal_').modal('toggle');
		 //            Swal.fire({
		 //              type: 'success',
		 //              title: 'Horay..',
		 //              text: 'Data Berhasil disimpan!',
		 //              // footer: '<a href>Why do I have this issue?</a>'
		 //            }).then((result)=>{
		 //              location.reload();
		 //            });
		 //          }
		 //          else{
		 //            $('#modal_').modal('toggle');
		 //            Swal.fire({
		 //              type: 'error',
		 //              title: 'Woops...',
		 //              text: response.message,
		 //              // footer: '<a href>Why do I have this issue?</a>'
		 //            }).then((result)=>{
		 //            	$('#modal_').modal('show');
			//             $('#btn_Save').text('Save');
			//             $('#btn_Save').attr('disabled',false);
		 //            });
		 //          }
		 //        }
		 //      });
        });
        $('.close').click(function() {
        	location.reload();
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
		            // allowAdding:true,
		            // allowUpdating: true,
		            // allowDeleting: true,
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
		                dataField: "username",
		                caption: "User Name",
		                allowEditing:false
		            },
		            {
		                dataField: "createdon",
		                caption: "Join Date",
		                allowEditing:false
		            },
		            {
		                dataField: "email",
		                caption: "Email",
		                allowEditing:false
		            },
		            {
		                dataField: "phone",
		                caption: "No. Tlp",
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
