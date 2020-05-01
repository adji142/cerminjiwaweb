<?php
    require_once(APPPATH."views/parts/Header.php");
    require_once(APPPATH."views/parts/Sidebar.php");
    $active = 'daftarmesin';
?>
	<div id="content">
		<div id="content-header">
			<div id="breadcrumb"> <a href="<?php echo base_url(); ?>" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a><a href="#">Master</a> <a href="#" class="current">Company Profile</a> </div>
		</div>
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="widget-box">
					<div class="widget-title"> 
			            <h5>Company Profile</h5>
			        </div>
			        <div class="widget-content">
			        	<form class="form-horizontal" enctype='application/json' id="post_">
			        		<div class="control-group">
				    			<label class="control-label">Company ID</label>
				    			<div class="controls">
				    				<input type="Text" name="ComID" id="ComID" required="" readonly="" placeholder="Company ID">
				    			</div>
				    		</div>
				    		<div class="control-group">
				    			<label class="control-label">Company Name</label>
				    			<div class="controls">
				    				<input type="Text" name="ComName" id="ComName" required="" placeholder="Company Name" class="span8">
				    			</div>
				    		</div>
				    		<div class="control-group">
				    			<label class="control-label">Company Email</label>
				    			<div class="controls">
				    				<input type="email" name="ComEmail" id="ComEmail" required="" placeholder="Company Email">
				    			</div>
				    		</div>
				    		<div class="control-group">
				    			<label class="control-label">Company Phone</label>
				    			<div class="controls controls-row">
				    				<input type="number" name="ComPhone" id="ComPhone" required="" placeholder="(021)111-1111" class="span2 m-wrap">
				    				<div class="input-prepend span6 m-wrap"> <span class="add-on">+62</span>
					                  <input type="number" name="CellPhone" id="CellPhone" required="" placeholder="813-2505-0858">
					                </div>
				    			</div>
				    		</div>
				    		<div class="control-group">
				              <label class="control-label">Select input</label>
				              <div class="controls">
				                <select id="sel" class="span2">
				                  <option>First option</option>
				                  <option>Second option</option>
				                  <option>Third option</option>
				                  <option>Fourth option</option>
				                  <option>Fifth option</option>
				                  <option>Sixth option</option>
				                  <option>Seventh option</option>
				                  <option>Eighth option</option>
				                </select>
				              </div>
				            </div>
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
        	// $("#sel").select2();
        	$('#sel').selectize({
			    create: true,
			    sortField: 'text'
			});
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
