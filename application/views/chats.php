<?php
    require_once(APPPATH."views/parts/Header.php");
    require_once(APPPATH."views/parts/Sidebar.php");
    $active = 'daftarmesin';

?>
<input type="hidden" id="userid" value="<?php echo $NamaUser; ?>">
	<div id="content">
		<div id="content-header">
			<div id="breadcrumb"> <a href="<?php echo base_url(); ?>" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a> <a href="#" class="current">User</a> </div>
		</div>
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="widget-content nopadding">
            <div class="chat-users panel-right2">
              <div class="panel-title">
                <h5>Online Users</h5>
              </div>
              <div class="panel-content nopadding">
                  <ul class="contact-list">
                  	<?php
                  		$query = "select userid, (select count(*) from inbox b where b.read = 0 and b.userid = a.userid) jumlah from inbox a group by userid";
                  		$rs = $this->db->query($query);
                  		foreach ($rs->result() as $key) {
                  			echo "
                  				<li id='".$key->userid."'>
                  					<a id = '".$key->userid."' class='listuser'><img alt='' src='".base_url()."Assets/img/demo/av1.jpg' /> 
                  						<span>".$key->userid."</span>
                  					</a>
                  					<span class='msg-count badge badge-info'>".$key->jumlah."</span>
                  				</li>";
                  		}
                  	?>
                  <!-- <li id="user-Linda"><a href=""><img alt="" src="img/demo/av2.jpg" /> <span>Linda</span></a></li>
                  <li id="user-John" class="online new"><a href=""><img alt="" src="img/demo/av3.jpg" /> <span>John</span></a><span class="msg-count badge badge-info">3</span></li>
                  <li id="user-Mark" class="online"><a href=""><img alt="" src="img/demo/av4.jpg" /> <span>Mark</span></a></li>
                  <li id="user-Maxi" class="online"><a href=""><img alt="" src="img/demo/av5.jpg" /> <span>Maxi</span></a></li> -->
                </ul>
              </div>
            </div>
            <div class="chat-content panel-left2">
              <div class="chat-messages" id="chat-messages">
                <div id="chat-messages-inner">
                	<div id = "chatdong">
                		
                	</div>
                	<!-- <p>
                		<span class="msg-block" style="background-color: rgb(140, 245, 168);">
                			<strong>Test</strong>
                			<span class="time">2020-01-01</span>
                			<span class="msg">Hay</span>
                		</span>
                	</p> -->
                </div>
              </div>
              <div class="chat-message well">
                <button class="btn btn-success" id="sendmessage">Send</button>
                <span class="input-box">
                <input type="text" name="msg-box" id="msg-box" />
                </span> </div>
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
	var idofuser = "";
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
        $(".listuser").click(function () {
        	var id = $(this).attr("id");
        	idofuser = id;
        	$.ajax({
        		type: "post",
	          	url: "<?=base_url()?>API/API_Message/UpdateFlagread",
	          	data: {'username':id,'table':'inbox'},
	          	dataType: "json",
	          	success: function (response) {
	          		$.ajax({
			          type: "post",
			          url: "<?=base_url()?>API/API_Message/ReadMessage",
			          data: {'kodeuser':id},
			          dataType: "json",
			          success: function (response) {
			          	var html = '';
				        var i;
				        var j = 1;
			          	for (i = 0; i < response.data.length; i++) {
			          		if (response.data[i].tipe == "outbox") {
			          			html += '<p>' +
				                  '<span class="msg-block">' +
				                  '<strong>'+response.data[i].userid+'</strong>' +
				                  '<span class="time">'+response.data[i].MessageDate+'</span>' +
				                  '<span class="msg">'+response.data[i].Message+'</span>' +
				                  '</span>' +
				                  '<p>';		
			          		}
			          		else{
			          			html += '<p>' +
				                  '<span class="msg-block" style="background-color: rgb(140, 245, 168);">' +
				                  '<strong>You</strong>' +
				                  '<span class="time">'+response.data[i].MessageDate+'</span>' +
				                  '<span class="msg">'+response.data[i].Message+'</span>' +
				                  '</span>' +
				                  '<p>';
			          		}
				           j++;
				        }
				        $('#chatdong').html(html);
			          }
			        });
	          	}
        	});
        });
        $('#sendmessage').click(function () {
        	var meessage = $('#msg-box').val();
        	var userid = $('#userid').val();
        	var DeviceID = "XX";
        	console.log(idofuser);
        	$.ajax({
	          type: "post",
	          url: "<?=base_url()?>API/API_Message/SendOutbox",
	          data: {'userid':idofuser,'DeviceID':DeviceID,'Message':meessage,'Replyby': userid},
	          dataType: "json",
	          success: function (response) {
	          	$.ajax({
		          type: "post",
		          url: "<?=base_url()?>API/API_Message/ReadMessage",
		          data: {'kodeuser':idofuser},
		          dataType: "json",
		          success: function (response) {
		          	var html = '';
			        var i;
			        var j = 1;
		          	for (i = 0; i < response.data.length; i++) {
		          		if (response.data[i].tipe == "outbox") {
		          			html += '<p>' +
			                  '<span class="msg-block">' +
			                  '<strong>'+response.data[i].userid+'</strong>' +
			                  '<span class="time">'+response.data[i].MessageDate+'</span>' +
			                  '<span class="msg">'+response.data[i].Message+'</span>' +
			                  '</span>' +
			                  '<p>';		
		          		}
		          		else{
		          			html += '<p>' +
			                  '<span class="msg-block" style="background-color: rgb(140, 245, 168);">' +
			                  '<strong>You</strong>' +
			                  '<span class="time">'+response.data[i].MessageDate+'</span>' +
			                  '<span class="msg">'+response.data[i].Message+'</span>' +
			                  '</span>' +
			                  '<p>';
		          		}
			           j++;
			        }
			        $('#chatdong').html(html);
			        var meessage = $('#msg-box').val('');
		          }
		        });
	          }
	        });
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
