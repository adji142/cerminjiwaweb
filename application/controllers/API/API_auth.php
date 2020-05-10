<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class API_auth extends CI_Controller {

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

	public function FindEmail()
	{
		$data = array('success' => false ,'message'=>array(),'count'=>0,'data'=>array());

		$email = $this->input->post('email');

		$query = "Select * from users where email = '".$email."'";

		$rs = $this->db->query($query);
		// var_dump(strpos($email, "@"));
		if (strpos($email, "@") == false) {
			$data['success'] = true;
			$data['message'] = "Email Tidak valid.";
		}
		else if ($rs->num_rows() > 0) {
			$data['success'] = true;
			$data['message'] = "Username ".$username." sudah ada.";
		}
		echo json_encode($data);
	}
	public function RegisterUser()
	{
		$data = array('success' => false ,'message'=>array(),'id' =>'');

		// parameter kode:kode,nama:nama,alamat:alamat,tlp:tlp,mail:mail,pj:pj,tgl:tgl,ket:ket}

		$username = $this->input->post('username');
		$email = $this->input->post('email');
		$phone = $this->input->post('phone');
		$pass = $this->input->post('pass');
		// $role = $this->input->post('role');
		$md_pass = $this->encryption->encrypt($pass);

		// 
		$insert = array(
			'username' 	=> $username,
			'email'		=> $email,
			'password'	=> $md_pass,
			'phone'		=> $phone,
			'createdon'	=> date("Y-m-d h:i:sa"),
		);

		$call = $this->ModelsExecuteMaster->ExecInsert($insert,'users');

		if ($call) {
			$data['success'] = true;
		}
		else{
			$data['message'] = 'Data Gagal di input';
		}
		echo json_encode($data);
	}
	function Log_Pro()
	{
		$data = array('success' => false ,'message'=>array(),'username'=>array(),'unique_id'=>array(),'email' => array());
        $usr = $this->input->post('username');
		$pwd =$this->input->post('pass');
		// var_dump($usr.' '.$pwd);
		$Validate_username = $this->LoginMod->Validate_username($usr);
		if($Validate_username->num_rows()>0){
			$userid = $Validate_username->row()->id;
			$pwd_decript =$Validate_username->row()->password;
			$pass_valid = $this->encryption->decrypt($Validate_username->row()->password);
			if($pass_valid == $pwd){
				$data['success'] = true;
				$data['username'] = $Validate_username->row()->username;
				$data['unique_id'] = $Validate_username->row()->id;
				$data['email'] = $Validate_username->row()->email;
			}
			else{
				$data['success'] = false;
				$data['message'] = 'User atau Password tidak valid'; // User password doesn't match
			}
		}
		else{
			$data['success'] = false;
			$data['message'] = 'Username Tidak ditemukan'; // Username not found
		}
		// var_dump($data);
		echo json_encode($data);
	}
	public function ChangePassword()
	{
		$data = array('success' => false ,'message'=>array());
		$usr = $this->input->post('username');
		$pwd =$this->input->post('pass');

		$Encrptpass = $this->encryption->encrypt($pwd);

		$row = array(
			'password'	=> $Encrptpass
		);

		$rs = $this->ModelsExecuteMaster->ExecUpdate($row,array('username'=> $usr),'users');
		if ($rs) {
			$data['success'] = true;
		}
		else{
			$data['message'] = 'Gagal Update Password';
		}
		echo json_encode($data);
	}
}