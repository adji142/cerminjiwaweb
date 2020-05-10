<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Apps extends CI_Controller {

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

		$query = "SELECT * FROM tabout where id = 1";

		$rs = $this->db->query($query);

		$data['success'] = true;
		$data['count'] = $rs->num_rows();
		$data['data'] = $rs->result();

		echo json_encode($data);
	}
	public function add()
	{
		$data = array('success' => false ,'message'=>array(),'count'=>0,'data'=>array());

		$About 			= $this->input->post('About');
		$Youtube		= $this->input->post('Youtube');
		$Instagram		= $this->input->post('Instagram');
		$Twitter		= $this->input->post('Twitter');
		$Facebook		= $this->input->post('Facebook');
		$Likedin		= $this->input->post('Likedin');
		$Thumbler		= $this->input->post('Thumbler');

		$id  		= $this->input->post('id');
		$formtype	= $this->input->post('formtype');

		$param = array(
			'About'			=> $About,
			'Youtube'		=> $Youtube,
			'Instagram'		=> $Instagram,
			'Twitter'		=> $Twitter,
			'Facebook'		=> $Facebook,
			'Likedin'		=> $Likedin,
			'Thumbler'		=> $Thumbler
		);

		if ($formtype == 'add') {
			$rs = $this->ModelsExecuteMaster->ExecInsert($param,'tabout');
			if ($rs) {
				$data['success'] = true;
			}
			else{
				$data['success'] = false;
				$data['message'] = 'Gagal Menyimpan Data';	
			}
		}
		elseif ($formtype == 'edit') {
			$rs = $this->ModelsExecuteMaster->ExecUpdate($param,array('id'=> $id),'tabout');
			if ($rs) {
				$data['success'] = true;
			}
			else{
				$data['success'] = false;
				$data['message'] = 'Gagal Menyimpan Data';	
			}
		}
		else{
			$data['success'] = false;
			$data['message'] = 'Undefined Form Type';	
		}

		echo json_encode($data);
	}
	public function UserList()
	{
		$data = array('success' => false ,'message'=>array(),'count'=>0,'data'=>array());

		$query = "select * from users";

		$rs = $this->db->query($query);

		if ($rs->num_rows() > 0) {
			$data['success'] = true;
			$data['data'] = $rs->result();
		}
		echo json_encode($data);
	}
	public function UserChat()
	{
		# code...
	}
}