<?php
    require_once(APPPATH."views/parts/Header.php");
    require_once(APPPATH."views/parts/Sidebar.php");
    $active = 'daftarmesin';
?>
	<div id="content">
		<div id="content-header">
			<div id="breadcrumb"> <a href="<?php echo base_url(); ?>" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a><a href="#">Master</a> <a href="#" class="current">Permission</a> </div>
		</div>
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="widget-box">
					<div class="widget-title"> 
			            <h5>Permission List</h5>
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
        	var where_field = '';
        	var where_value = '';
        	var table = 'mstr_pelanggan';

	        $.ajax({
	          type: "post",
	          url: "<?=base_url()?>Master/C_Permission/Read",
	          data: {where_field:where_field},
	          dataType: "json",
	          success: function (response) {
	          	bindGrid(response.data);
	          }
	        });
        });
        $('.close').click(function() {
        	location.reload();
        });
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
		        },
		        searchPanel: {
		            visible: true,
		            width: 240,
		            placeholder: "Search..."
		        },
		        columns: [
		            {
		                dataField: "id",
		                caption: "ID",
		                allowEditing:false,
		                visible : false
		            },
		            {
		                dataField: "permissionname",
		                caption: "Permission Name",
		                allowEditing:false
		            },
		            {
		                dataField: "link",
		                caption: "Link",
		                allowEditing:false
		            },
		            {
		                dataField: "ico",
		                caption: "Icon",
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
