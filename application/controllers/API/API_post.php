<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class API_post extends CI_Controller {

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
	}
	public function Read()
	{
		$data = array('success' => false ,'message'=>array(),'count'=>0,'data'=>array());
		$source = $this->input->post('source');
		$id = $this->input->post('id');

		// credential
		$DeviceID = $this->input->post('DeviceID');
		$UserID = $this->input->post('UserID');
		$query = "SELECT
						a.*,CASE WHEN b.id is not null then 1 else 0 end playlist,
						COALESCE(b.DeviceID,'') DeviceID,COALESCE(b.UserID)UserID 
					FROM post a 
					LEFT JOIN playlist b on a.id = b.postid and concat(b.DeviceID,b.UserID) = '".$DeviceID.$UserID."' 
		 			where a.active = 1 and Source ='".$source."'";

		$rs = $this->db->query($query);

		$data['success'] = true;
		$data['count'] = $rs->num_rows();
		$data['data'] = $rs->result();

		echo json_encode($rs->result());
	}
	public function LastLineNumb()
	{
		$data = array('count'=>0);
		$id = $this->input->post('id');
		$kodeuser = $this->input->post('kodeuser');
		$query = "select * from playlist where concat(DeviceID,UserID) = '".$id.$kodeuser."'";
		$rs = $this->db->query($query);
		if($rs->num_rows()>0){
			$data['count'] = $rs->num_rows(); 
		}
		else{
			$data['count'] = 0;
		}
		echo json_encode($rs->result());
	}
	public function AddPlaylist()
	{
		$data = array('success' => false ,'message'=>array(),'count'=>0,'data'=>array());
		$DeviceID	=$this->input->post("DeviceID");
		$UserID		=$this->input->post("UserID");
		$PostID		=$this->input->post("PostID");
		$LineNumb	=$this->input->post("LineNumb");

		$param = array(
			"DeviceID"	=> $DeviceID,
			"UserID"	=> $UserID,
			"PostID"	=> $PostID,
			"LineNumb"	=> $LineNumb
		);

		$sql = "select * from playlist where concat(DeviceID,UserID,PostID) = '".$DeviceID.$UserID.$PostID."'";
		$rs = $this->db->query($sql);
		if ($rs->num_rows() == 0) {
			try {
				$rs = $this->ModelsExecuteMaster->ExecInsert($param,'playlist');
				$data['success'] = true;
			} catch (Exception $e) {
				$data['success'] = false;
				$data['message'] = "Gagal memproses data ". $e->getMessage();
			}
		}
		else{
			$data['success'] = false;
			$data['message'] = "Playlist sudah ada";
		}
		echo json_encode($data);
	}
	public function ReadDaftarPutar()
	{
		$data = array('success' => false ,'message'=>array(),'count'=>0,'data'=>array());
		$id = $this->input->post('id');
		$kodeuser = $this->input->post('kodeuser');

		$query = "SELECT a.*,b.id playlistid FROM post a inner join playlist b on a.id = b.postid where a.active = 1 and concat(b.DeviceID,b.UserID) ='".$id.$kodeuser."'";

		$rs = $this->db->query($query);

		$data['success'] = true;
		$data['count'] = $rs->num_rows();
		$data['data'] = $rs->result();

		echo json_encode($rs->result());
	}
}