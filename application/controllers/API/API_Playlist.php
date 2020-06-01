<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class API_Playlist extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
	function __construct()
	{
		parent::__construct();
		$this->load->model('ModelsExecuteMaster');
		$this->load->model('GlobalVar');
		$this->load->model('Apps_mod');
		$this->load->model('LoginMod');
	}
	public function AddPlaylistHeader()
	{
		$data = array('success' => false ,'message'=>array(),'count'=>0,'data'=>array());
		$PlaylistName = $this->input->post('PlaylistName');
		$CreatedDate = date("Y-m-d h:i:sa");
		$KodeUser = $this->input->post('KodeUser');
		$DeviceID = $this->input->post('DeviceID');

		$param = array(
			'PlaylistName'	=> $PlaylistName,
			'CreatedDate'	=> $CreatedDate,
			'KodeUser'		=> $KodeUser,
			'DeviceID'		=> $DeviceID
		);

		$rs = $this->ModelsExecuteMaster->ExecInsert($param,'playlistheader');

		if ($rs) {
			$data['success']= true;
		}
		else{
			$data['success'] = false;
			$data['message'] = 'Gagal Tambah Playlist';
		}
		echo json_encode($data);
	}
	public function AddPlaylistDetail()
	{
		$data = array('success' => false ,'message'=>array(),'count'=>0,'data'=>array());
		$headerID = $this->input->post('headerID');
		$postid = $this->input->post('postid');
		$lineNum = $this->input->post('lineNum');

		$param = array(
			'headerID'	=> $headerID,
			'postid'	=> $postid,
			'lineNum'	=> $lineNum
		);
		$rs = $this->ModelsExecuteMaster->ExecInsert($param,'playlistdetail');
		if ($rs) {
			$data['success'] = true;
			$query = "select * from playlistdetail where headerID = ".$headerID."";
			$rsCount = $this->db->query($query);
			$this->ModelsExecuteMaster->ExecUpdate(array('TotalPost'=>$rsCount->num_rows()),array('id'=> $headerID),'playlistheader');
		}
		else{
			$data['success'] = false;
			$data['message'] = "Gagal add Detail";
		}
		echo json_encode($data);
	}
	public function MultiappendPlaylist()
	{
		$data = array('success' => false ,'message'=>array(),'count'=>0,'data'=>array());

		$PlaylistName = $this->input->post('PlaylistName');
		$CreatedDate = date("Y-m-d h:i:sa");
		$KodeUser = $this->input->post('KodeUser');
		$DeviceID = $this->input->post('DeviceID');
		$headerID = 0;
		$postid = $this->input->post('postid');
		$lineNum = $this->input->post('lineNum');

		$paramHeader = array(
				'PlaylistName'	=> $PlaylistName,
				'CreatedDate'	=> $CreatedDate,
				'KodeUser'		=> $KodeUser,
				'DeviceID'		=> $DeviceID,
				'TotalPost'		=> 0
			);

		$rs = $this->ModelsExecuteMaster->ExecInsert($paramHeader,'playlistheader');
		if ($rs) {
			$query = "select Max(id) headerid from playlistheader where concat(KodeUser,DeviceID) = '".$KodeUser.$DeviceID."'";
			$rs_select = $this->db->query($query);
			if ($rs_select->num_rows() > 0) {
				$headerID = $rs_select->row()->headerid;
				$paramDetail = array(
						'headerID'		=> $headerID,
						'postid'		=> $postid,
						'lineNum'		=> 0
					);
				$rsdetail = $this->ModelsExecuteMaster->ExecInsert($paramDetail,'playlistdetail');
				if ($rsdetail) {
					$query = "select * from playlistdetail where headerID = ".$headerID."";
					$rsCount = $this->db->query($query);
					$rsupdate = $this->ModelsExecuteMaster->ExecUpdate(array('TotalPost'=>$rsCount->num_rows()),array('id'=> $headerID),'playlistheader');
					if ($rsupdate) {
						$data['success'] = true;
					}
					else{
						$data['success'] = false;
						$data['message'] = "Gagal updating data";
					}
				}
				else{
					$data['success'] = false;
					$data['message'] = "Gagal menambah playlist D";
				}
			}
			else{
				$data['success'] = false;
				$data['message'] = "Gagal menambah playlist H";
			}
		}

		echo json_encode($data);
	}
	public function ShowPlaylistHeader()
	{
		$data = array('success' => false ,'message'=>array(),'count'=>0,'data'=>array());
		$KodeUser = $this->input->post('KodeUser');
		$DeviceID = $this->input->post('DeviceID');

		if ($KodeUser == "") {
			$query = "select * from playlistheader where concat(KodeUser,DeviceID) = '".$KodeUser.$DeviceID."'";
		}
		else{
			$query = "select * from playlistheader where KodeUser = '".$KodeUser."'";
		}
		$rs = $this->db->query($query);

		if ($rs->num_rows() > 0) {
			$data['success'] = true;
			$data['data'] = $rs->result();
		}
		echo json_encode($rs->result());
	}
	public function ShowPlaylistDetail()
	{
		$data = array('success' => false ,'message'=>array(),'count'=>0,'data'=>array());
		$headerID = $this->input->post('headerID');

		$query = "SELECT b.* FROM playlistdetail a 
				INNER JOIN post b on a.PostID = b.id
				where a.headerID = ".$headerID."
			";
		$rs = $this->db->query($query);

		if ($rs->num_rows() > 0) {
			$data['success'] = true;
			$data['count'] = $rs->num_rows();
			$data['data'] = $rs->result();
		}
		echo json_encode($rs->result());
	}
	public function FindUserName()
	{
		$data = array('success' => false ,'message'=>array(),'count'=>0,'username'=>array(),'email'=>array(),'phone'=>array());

		$username = $this->input->post('username');

		$query = "Select * from users where username = '".$username."'";

		$rs = $this->db->query($query);

		if ($rs->num_rows() > 0) {
			$data['success'] = true;
			$data['message'] = "Username ".$username." sudah ada.";
			$data['username'] = $rs->row()->username;
			$data['email'] = $rs->row()->email;
			$data['phone'] = $rs->row()->phone;
		}

		echo json_encode($data);
	}
	public function RemovePlaylist()
	{
		$data = array('success' => false ,'message'=>array());
		
		$mode = $this->input->post("mode");// 1: detail, 2: header detail
		$postid = $this->input->post('postid');
		$headerid = $this->input->post('headerid');

		if ($mode == "1") {
			$rs = $this->ModelsExecuteMaster->DeleteData(array('postid'=>$postid,'headerID'=>$headerid),'playlistdetail');
			if ($rs) {
				$query = "select * from playlistdetail where headerID = ".$headerid."";
				$rsCount = $this->db->query($query);
				$rsupdate = $this->ModelsExecuteMaster->ExecUpdate(array('TotalPost'=>$rsCount->num_rows()),array('id'=> $headerid),'playlistheader');

				$data['success'] = true;
			}
			else{
				$data['message'] = "Gagal remove playlist";
				$data['success'] = false;
			}
		}
		elseif ($mode == "2") {
			$rs2 = $this->ModelsExecuteMaster->DeleteData(array('headerid'=>$headerid),'playlistdetail');
			if ($rs2) {
				$rs3 = $this->ModelsExecuteMaster->DeleteData(array('id'=>$headerid),'playlistheader');
				if ($rs3) {
					$data['success'] = true;
				}
				else{
					$data['message'] = "Gagal remove playlist";
					$data['success'] = false;
				}
			}
			else{
				$data['message'] = "Gagal remove playlist";
				$data['success'] = false;
			}
		}
		echo json_encode($data);
	}
	public function FindPlaylist()
	{
		$data = array('success' => false ,'message'=>array(),'count'=> 0);

		$KodeUser = $this->input->post('KodeUser');
		$DeviceID = $this->input->post('DeviceID');
		$postid = $this->input->post('postid');

		if ($KodeUser=="") {
			$SQL = "SELECT a.* FROM playlistheader a 
				LEFT JOIN playlistdetail b on a.id = b.headerid
				where CONCAT(a.KodeUser,a.DeviceID) = '".$KodeUser.$DeviceID."'
				AND b.PostID = ".$postid.";";
		}
		else{
			$SQL = "SELECT a.* FROM playlistheader a 
				LEFT JOIN playlistdetail b on a.id = b.headerid
				where a.KodeUser = '".$KodeUser."'
				AND b.PostID = ".$postid.";";
		}
		
		$rsCount = $this->db->query($SQL);

		if ($rsCount->num_rows() > 0) {
			$data['success'] = true;
			$data['count'] = $rsCount->num_rows();
		}
		echo json_encode($data);
	}
}