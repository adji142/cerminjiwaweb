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
						COALESCE(b.DeviceID,'') DeviceID,COALESCE(b.KodeUser)UserID 
					FROM post a 
					LEFT JOIN (
						SELECT 
							DISTINCT
							a.id,
							a.DeviceID,
							a.KodeUser
						FROM playlistheader a
						INNER JOIN playlistdetail b on a.id = b.headerid
						WHERE CONCAT(a.deviceID,a.KodeUser) = '".$DeviceID.$UserID."'
					)b on a.id = b.id
		 			where a.active = 1 and Source ='".$source."'";

		$rs = $this->db->query($query);

		$data['success'] = true;
		$data['count'] = $rs->num_rows();
		$data['data'] = $rs->result();

		echo json_encode($rs->result());
	}
	public function ReadAbout()
	{
		$data = array('success' => false ,'message'=>array(),'count'=>0,'data'=>array());
		$query = "SELECT * FROM tabout where id = 1";

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
		// var_dump($query);
		$data['success'] = true;
		$data['count'] = $rs->num_rows();
		$data['data'] = $rs->result();

		echo json_encode($rs->result());
	}
	public function RemoveDaftarPutar()
	{
		$data = array('success' => false ,'message'=>array(),'count'=>0,'data'=>array());
		$id = $this->input->post('id');

		$where = array(
			'id'	=> $id
		);

		$rs = $this->ModelsExecuteMaster->DeleteData($where,'playlist');

		if ($rs) {
			$data['success'] = true;
		}
		else{
			$data['success'] = false;
		}
		echo json_encode($data);
	}
	public function LogView()
	{
		$data = array('success' => false ,'message'=>array(),'count'=>0,'data'=>array());

		$deviceid = $this->input->post('deviceid');
		$PostID = $this->input->post('PostID');
		$table = $this->input->post('table');

		$param = array(
			'deviceid' 		=> $deviceid,
			'PostID'		=> $PostID,
			'viewDate'		=> date("Y-m-d h:i:sa")
		);
		$rs = $this->ModelsExecuteMaster->ExecInsert($param,$table);
		if ($rs) {
			$data['success'] = true;
		}
		else{
			$data['success'] = false;
			$data['message'] = 'Error';
		}
		echo json_encode($data);
	}
	public function GetVideoStream()
	{
		$videoURL = $this->input->post('AltVid');
		$curl = curl_init();

		curl_setopt_array($curl, array(
			CURLOPT_URL => "https://getvideo.p.rapidapi.com/?url=".$videoURL."",
			CURLOPT_RETURNTRANSFER => true,
			CURLOPT_FOLLOWLOCATION => true,
			CURLOPT_ENCODING => "",
			CURLOPT_MAXREDIRS => 10,
			CURLOPT_TIMEOUT => 30,
			CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
			CURLOPT_CUSTOMREQUEST => "GET",
			CURLOPT_HTTPHEADER => array(
				"x-rapidapi-host: getvideo.p.rapidapi.com",
				"x-rapidapi-key: b168fc15c2msh1035122c11f09c2p199e16jsna8d5d3121d0f"
			),
		));

		$response = curl_exec($curl);
		$err = curl_error($curl);

		curl_close($curl);

		if ($err) {
			echo "cURL Error #:" . $err;
		} else {
			echo $response;
		}
	}
}