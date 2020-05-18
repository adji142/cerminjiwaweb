<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class C_post extends CI_Controller {

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

		$query = "SELECT *,(SELECT COUNT(*) FROM tempview b WHERE b.PostID = a.id) Viewed,(SELECT COUNT(*) FROM tempshare b WHERE b.PostID = a.id)Shared FROM post a WHERE active = 1";

		$rs = $this->db->query($query);

		$data['success'] = true;
		$data['count'] = $rs->num_rows();
		$data['data'] = $rs->result();

		echo json_encode($data);
	}
	public function add()
	{
		$data = array('success' => false ,'message'=>array(),'count'=>0,'data'=>array());

		$api 		= $this->input->post('api');
		$vidurl		= $this->input->post('vidurl');
		$thumburl	= $this->input->post('thumburl');
		$judul		= $this->input->post('judul');
		$Desc		= $this->input->post('Desc');
		$ref		= $this->input->post('ref');
		$source		= $this->input->post('source');
		$altvideo	= $this->input->post('altvideo');
		$PostLink	= $this->input->post('PostLink');

		$id  		= $this->input->post('id');
		$formtype	= $this->input->post('formtype');
		$NamaUser = $this->session->userdata('NamaUser');

		$param = array(
			'APILink'			=> $api,
			'Thumb'				=> $thumburl,
			'VideoLink'			=> $vidurl,
			'title'				=> $judul,
			'Description'		=> $Desc,
			'Reflection'		=> $ref,
			'Liked'				=> 0,
			'Shared'			=> 0,
			'LastUpdatedBy'		=> $NamaUser,
			'LastUpdatedOn'		=> date("Y-m-d h:i:sa"),
			'active'			=> 1,
			'Source'			=> $source,
			'AltVideo'			=> $altvideo,
			'PostLink'			=> $PostLink
		);

		if ($formtype == 'add') {
			$rs = $this->ModelsExecuteMaster->ExecInsert($param,'post');
			if ($rs) {
				$data['success'] = true;
			}
			else{
				$data['success'] = false;
				$data['message'] = 'Gagal Menyimpan Data';	
			}
		}
		elseif ($formtype == 'edit') {
			$rs = $this->ModelsExecuteMaster->ExecUpdate($param,array('id'=> $id),'post');
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
	public function find()
	{
		$data = array('success' => false ,'message'=>array(),'count'=>0,'data'=>array());
		$id = $this->input->post('id');

		$query = "SELECT * FROM post where active = 1 AND id = ".$id;

		$rs = $this->db->query($query);

		$data['success'] = true;
		$data['count'] = $rs->num_rows();
		$data['data'] = $rs->result();

		echo json_encode($data);
	}
	public function remove()
	{
		$data = array('success' => false ,'message'=>array(),'count'=>0,'data'=>array());
		
		$id  		= $this->input->post('id');
		$NamaUser 	= $this->session->userdata('NamaUser');

		$param = array(
			'active' 		=> 0,
			'LastUpdatedBy'	=> $NamaUser,
			'LastUpdatedOn'	=> date("Y-m-d h:i:sa")
		);

		$rs = $this->ModelsExecuteMaster->ExecUpdate($param,array('id'=> $id),'post');
		if ($rs) {
			$data['success'] = true;
		}
		else{
			$data['success'] = false;
			$data['message'] = 'Gagal Menghapus Data';	
		}
		echo json_encode($data);
	}
}