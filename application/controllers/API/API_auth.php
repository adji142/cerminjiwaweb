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
	public function ChangeImage()
	{
		$data = array('success' => false ,'message'=>array(),'imageurl'=>array());
		$usr = $this->input->post('username');
		$image = $this->input->post('baseimage');
		$imagename = $this->input->post('imagename');

		// var_dump($image.' ; '.$imagename);
		$temp = base64_decode($image);
		$link = 'storeimage/'.$imagename;
		try {
			file_put_contents($link, $temp);	
		} catch (Exception $e) {
			$data['message'] = $e->getMessage();
		}

		$fulllink = base_url().$link;

		$rs = $this->ModelsExecuteMaster->ExecUpdate(array('ImageProfile'=>$fulllink),array('username'=> $usr),'users');
		if ($rs) {
			$data['success'] = true;
			$data['imageurl'] = $fulllink;
		}
		else{
			$data['message'] = 'Gagal Update Password';
		}
		echo json_encode($data);
	}
	public function GetUserInfo()
	{
		$data = array('success' => false ,'message'=>array(),'username'=>'','email'=>'','phone'=>'','ImageProfile'=>'');
		$usr = $this->input->post('username');

		$sql = "SELECT username,email,phone,ImageProfile FROM users where username = '".$usr."'";
		$rs = $this->db->query($sql);

		if ($rs->num_rows() > 0) {
			$data['success'] = true;
			$data['username'] = $rs->row()->username;
			$data['email'] = $rs->row()->email;
			$data['phone'] = $rs->row()->phone;
			$data['ImageProfile'] = $rs->row()->ImageProfile;
		}
		else{
			$data['success'] = false;
			$data['message'] = 'Fail to generate data';
		}
		echo json_encode($data);
	}
	function send_email(){
		$data = array('success' => false ,'message'=>array());
        $param = $this->input->post('email');
        $Cek_Already = $this->ModelsExecuteMaster->FindData(array('email'=>$param),'users');
        $this->load->library('email');

        // run random

        $chars = array(
	        'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
	        'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
	        'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
	        'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
	        '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'
	    );

	    shuffle($chars);

	    $num_chars = count($chars) - 1;
	    $token = '';

	    for ($i = 0; $i < $num_chars; $i++){ // <-- $num_chars instead of $len
	        $token .= $chars[mt_rand(0, $num_chars)];
	    }

        if ($Cek_Already->num_rows() > 0) {
        	$this->load->library('encrypt');
        	$username = $Cek_Already->row()->username;
        	$password = $token;

        	if ($password <> '') {
        		$cript_pass = '';
        		$rs = $this->ModelsExecuteMaster->ExecUpdate(array('password'=>$this->encryption->encrypt(substr($password, 0,6))),array('email'=> $param),'users');
				if ($rs) {
					$data['success'] = true;
				}
				else{
					$data['message'] = 'Gagal Update Password';
				}
        	}


        	$config = array(
			    'protocol' => 'smtp', // 'mail', 'sendmail', or 'smtp'
			    'smtp_host' => 'mail.aistrick.com', 
			    'smtp_port' => 465,
			    'smtp_user' => 'noreply@aistrick.com',
			    'smtp_pass' => 'lagis3nt0s4',
			    'smtp_crypto' => 'ssl', //can be 'ssl' or 'tls' for example
			    'mailtype' => 'html', //plaintext 'text' mails or 'html'
			    'smtp_timeout' => '4', //in seconds
			    'charset' => 'iso-8859-1',
			    'wordwrap' => TRUE
			);
	        $this->email->initialize($config);

	        $from = 'noreply@aistrick.com';
	        $to = $param;
	        $subject = '[No-Replay]Rahasia !!! Reset password Cerminjiwa Apps[No-Replay]';
	        $message = '
	        	<h3><center><b>CerminJiwa</b></center></h3><br>
	            <p>
	            Berikut detaik akun anda di <a href="cerminjiwa.com">cerminjiwa.com</a><br>
	            <b>Jangan berikan email ini ke siapapun termasuk staff dari pengelola aplikasi</b>
	            <br>
	            </p>
	            <pre>
	            	Email 		: '.$param.' <br>
	            	Username 	: '.$username.'<br>
	            	Password 	: '.substr($password, 0,6).'
	            <p>
	            <br>
	            Best Regards<br><br>

	            <a href="cerminjiwa.com">cerminjiwa.com</a>
	            </p>
	        ';

	        $this->email->set_newline("\r\n");
	        $this->email->from($from);
	        $this->email->to($to);
	        $this->email->subject($subject);
	        $this->email->message($message);

	        if($this->email->send()){
	            $data['success']=true;
	        }
	        else{
	            $data['message']=show_error($this->email->print_debugger());
	        }
        }
        else{
        	$data['message'] = 'Email tidak ditemukan';
        }
        echo json_encode($data);
    }
    public function run_key() {

	    $chars = array(
	        'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
	        'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
	        'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
	        'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
	        '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '?', '!', '@', '#',
	        '$', '%', '^', '&', '*', '(', ')', '[', ']', '{', '}', '|', ';', '/', '=', '+'
	    );

	    shuffle($chars);

	    $num_chars = count($chars) - 1;
	    $token = '';

	    for ($i = 0; $i < $num_chars; $i++){ // <-- $num_chars instead of $len
	        $token .= $chars[mt_rand(0, $num_chars)];
	    }

	    return $token;
	}
}