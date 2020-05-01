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
	public function GetCount()
	{
		$data = array('success' => false ,'message'=>array(),'count'=>0);

		$table = $this->input->post('table');

		$rs = $this->ModelsExecuteMaster->GetData($table);
		$data['success'] = true;
		if ($rs->num_rows() > 0) {
			$data['count'] = $rs->num_rows();
		}
		else{
			$data['count'] = 0;	
		}

		echo json_encode($data);
	}
	public function GetPositionList()
	{
		$data = array('success' => false ,'message'=>array(),'data' =>array());

		$id = $this->input->get('id');
		$where = array();
		if ($id == ""){
			// $rs = $this->ModelsExecuteMaster->FindData($xwhare,$table);
			$where = array(
				'position_remove_date' => null
			);
		}
		else{
			$where = array(
				'position_remove_date' => null,
				'position_code' => $id
			);	
		}
		$rs = $this->ModelsExecuteMaster->FindData($where,'mstr_departement');

		if ($rs){
			$data['success'] = true;
			$data['data'] = $rs->result();
		}
		else{
			$data['success'] = false;
			$data['message'] = 'Gagal Mengambil data';
		}
		echo json_encode($data);
	}
	public function appendPosition()
	{
		$data = array('success' => false ,'message'=>array(),'data' =>array());

		$kd_pos 	= $this->input->post('kd_pos');
		$formtype 	= $this->input->post('formtype');
		$nm_pos		= $this->input->post('nm_pos');
		// $klp 		= $this->input->post('klp');

		if ($formtype == 'add') {
			$param = array(
				'position_code'		=> $kd_pos,
				'position_name'		=> $nm_pos,
				'position_category'	=> '',
				'position_since'	=> date("Y-m-d")
			);
			try {
				$rs = $this->ModelsExecuteMaster->ExecInsert($param,'mstr_departement');
				$data['success'] = true;
			} catch (Exception $e) {
				$data['success'] = false;
				$data['message'] = "Gagal memproses data ". $e->getMessage();
			}
		}
		elseif ($formtype == 'edit') {
			$param = array(
				'position_name'		=> $nm_pos,
			);
			try {
				$rs = $this->ModelsExecuteMaster->ExecUpdate($param,array('position_code'=> $kd_pos),'mstr_departement');
				$data['success'] = true;
			} catch (Exception $e) {
				$data['success'] = false;
				$data['message'] = "Gagal memproses data ". $e->getMessage();
			}
		}
		else{
			$data['success'] = false;
			$data['message'] = "Invalid Form Type ";
		}
		echo json_encode($data);
	}
	
	// =========================== BATAS =========================== 

	public function appendPelanggan()
	{
		$data = array('success' => false ,'message'=>array(),'data' =>array());

		$nmpelanggan 	= $this->input->post('nmpelanggan');
		$jarak 			= $this->input->post('jarak');
		$interval 		= $this->input->post('interval');
		$kelompok 		= $this->input->post('kelompok');
		$target 		= $this->input->post('target');
		$DL 			= $this->input->post('DL');
		$DU 			= $this->input->post('DU');

		$formtype 	= $this->input->post('formtype');
		$id 	= $this->input->post('id');

		if ($formtype == 'add') {
			$param = array(
				'NmCustomer'	=> $nmpelanggan,
				'Jarak'			=> $jarak,
				'intervalbeli'	=> $interval,
				'target'		=> $target,
				'KelompokUsaha'	=> $kelompok,
				'Tipe'			=> '',
				'DL'			=> $DL,
				'DU'			=> $DU
			);
			try {
				$rs = $this->ModelsExecuteMaster->ExecInsert($param,'mstr_pelanggan');
				$data['success'] = true;
			} catch (Exception $e) {
				$data['success'] = false;
				$data['message'] = "Gagal memproses data ". $e->getMessage();
			}
		}
		elseif ($formtype == 'edit') {
			$param = array(
				'NmCustomer'	=> $nmpelanggan,
				'Jarak'			=> $jarak,
				'intervalbeli'	=> $interval,
				'target'		=> $target,
				'KelompokUsaha'	=> $kelompok,
				'Tipe'			=> '',
				'DL'			=> $DL,
				'DU'			=> $DU
			);
			try {
				$rs = $this->ModelsExecuteMaster->ExecUpdate($param,array('id'=> $id),'mstr_pelanggan');
				$data['success'] = true;
			} catch (Exception $e) {
				$data['success'] = false;
				$data['message'] = "Gagal memproses data ". $e->getMessage();
			}
		}
		else{
			$data['success'] = false;
			$data['message'] = "Invalid Form Type ";
		}
		echo json_encode($data);
	}

	public function FindData()
	{
		$data = array('success' => false ,'message'=>array(),'data' =>array());

		$where_field = $this->input->post('where_field');
		$where_value = $this->input->post('where_value');
		$table 		 = $this->input->post('table');
		
		if ($where_field == '') {
			$rs = $this->ModelsExecuteMaster->GetData($table);
		}
		else{
			$where = array(
				$where_field => $where_value
			);
			$rs = $this->ModelsExecuteMaster->FindData($where,$table);
		}

		if ($rs){
			$data['success'] = true;
			$data['data'] = $rs->result();
		}
		else{
			$data['success'] = false;
			$data['message'] = 'Gagal Mengambil data';
		}
		echo json_encode($data);
	}
	public function FindData_XXX()
	{
		$data = array('success' => false ,'message'=>array(),'data' =>array());
		
		$rs = $this->db->query("SELECT a.*,sum(b.Jumlah) Jumlah FROM mstr_pelanggan a
			LEFT JOIN transaksi b on a.id = b.KdPelanggan
			GROUP BY a.id, a.NmCustomer
			");
		if ($rs){
			$data['success'] = true;
			$data['data'] = $rs->result();
		}
		else{
			$data['success'] = false;
			$data['message'] = 'Gagal Mengambil data';
		}
		echo json_encode($data);
	}
	public function remove()
	{
		$data = array('success' => false ,'message'=>array(),'data' =>array());
		
		$table = $this->input->post('table');
		$field = $this->input->post('field');
		$value = $this->input->post('value');
		
		try {
			$where = array(
				$field	=> $value
			);
			$rs = $this->ModelsExecuteMaster->DeleteData($where,$table);
			$data['success'] = true;
		} catch (Exception $e) {
			$data['success'] = false;
			$data['message'] = "Gagal memproses data ". $e->getMessage();
		}
		echo json_encode($data);
	}

	public function appendTransaksi()
	{
		$data = array('success' => false ,'message'=>array(),'data' =>array());

		$tgltransaksi 	= $this->input->post('tgltransaksi');
		$kdpelanggan 	= $this->input->post('kdpelanggan');
		$nama 			= $this->input->post('nama');
		$jml 			= $this->input->post('jml');

		$formtype 		= $this->input->post('formtype');
		$id 			= $this->input->post('id');

		if ($formtype == 'add') {
			$param = array(
				'TglTransaksi'	=> $tgltransaksi,
				'KdPelanggan'	=> $kdpelanggan,
				'NamaPelanggan'	=> $nama,
				'Jumlah'		=> $jml
			);
			try {
				$rs = $this->ModelsExecuteMaster->ExecInsert($param,'transaksi');
				$data['success'] = true;
			} catch (Exception $e) {
				$data['success'] = false;
				$data['message'] = "Gagal memproses data ". $e->getMessage();
			}
		}
		elseif ($formtype == 'edit') {
			$param = array(
				'TglTransaksi'	=> $tgltransaksi,
				'KdPelanggan'	=> $kdpelanggan,
				'NamaPelanggan'	=> $nama,
				'Jumlah'		=> $jml
			);
			try {
				$rs = $this->ModelsExecuteMaster->ExecUpdate($param,array('id'=> $id),'transaksi');
				$data['success'] = true;
			} catch (Exception $e) {
				$data['success'] = false;
				$data['message'] = "Gagal memproses data ". $e->getMessage();
			}
		}
		else{
			$data['success'] = false;
			$data['message'] = "Invalid Form Type ";
		}
		echo json_encode($data);
	}
	public function appendsetting()
	{
		$data = array('success' => false ,'message'=>array(),'data' =>array());

		$min 		= $this->input->post('min');
		$max 		= $this->input->post('max');
		$ket 		= $this->input->post('ket');

		$formtype 	= $this->input->post('formtype');
		$id 		= $this->input->post('id');

		if ($formtype == 'add') {
			$param = array(
				'Min'			=> $min,
				'Max'			=> $max,
				'Keterangan'	=> $ket
			);
			try {
				$rs = $this->ModelsExecuteMaster->ExecInsert($param,'app_setting');
				$data['success'] = true;
			} catch (Exception $e) {
				$data['success'] = false;
				$data['message'] = "Gagal memproses data ". $e->getMessage();
			}
		}
		elseif ($formtype == 'edit') {
			$param = array(
				'Min'			=> $min,
				'Max'			=> $max,
				'Keterangan'	=> $ket
			);
			try {
				$rs = $this->ModelsExecuteMaster->ExecUpdate($param,array('id'=> $id),'app_setting');
				$data['success'] = true;
			} catch (Exception $e) {
				$data['success'] = false;
				$data['message'] = "Gagal memproses data ". $e->getMessage();
			}
		}
		else{
			$data['success'] = false;
			$data['message'] = "Invalid Form Type ";
		}
		echo json_encode($data);
	}
	public function initialData()
	{
		$data = array('success' => false ,'message'=>array());

		$rs = $this->db->query("call EXEC_DATATESTING();");

		if ($rs){
			$data['success'] = true;
		}
		else{
			$data['message']='Gagal Proses Initial Data testing';
		}
		echo json_encode($data);
	}
	public function GetDataTest()
	{
		$data = array('success' => false ,'message'=>array(),'data'=>array(),'testcount'=>0,'berpotensi'=>0,'tdkberpotensi'=>0);

		$rs = $this->db->query("SELECT * FROM tmpdatatesting where kelompok = 'DL';");

		if ($rs){
			$data['success'] = true;
			$data['data']= $rs->result();
			$data['testcount'] = $rs->num_rows();

			$rs = $this->db->query("SELECT * FROM tmpdatatesting where LOWER(target) = 'berpotensi' AND kelompok = 'DL';");
			$data['berpotensi'] = $rs->num_rows();

			$rs = $this->db->query("SELECT * FROM tmpdatatesting where LOWER(target) = 'tidak berpotensi' AND kelompok = 'DL';");
			$data['tdkberpotensi'] = $rs->num_rows();
		}
		else{
			$data['message']='Gagal Get Data testing';
		}
		echo json_encode($data);
	}
	public function appendhistory()
	{
		$data = array('success' => false ,'message'=>array(),'data' =>array());

		$KodeUji 		= $this->input->post('KodeUji');
		$NamaPelanggan 	= $this->input->post('NamaPelanggan');
		$JmlPembelian 	= $this->input->post('JmlPembelian');
		$Interval 		= $this->input->post('Interval');
		$Lokasi 		= $this->input->post('Lokasi');
		$Target 		= $this->input->post('Target');
		$Perhitungan 	= $this->input->post('Perhitungan');
		$jnsusaha 		= $this->input->post('jnsusaha');
		$kdcust			= $this->input->post('kdcust');

		$param = array(
			'KodeUji'			=> $KodeUji,
			'NamaPelanggan'		=> $NamaPelanggan,
			'JmlPembelian'		=> $JmlPembelian,
			'Interval'			=> $Interval,
			'Lokasi'			=> $Lokasi,
			'Target'			=> $Target,
			'Perhitungan'		=> $Perhitungan,
			'JenisUsaha'		=> $jnsusaha,
			'kdcust'			=> $kdcust
		);
		try {
			$rs = $this->ModelsExecuteMaster->ExecInsert($param,'data_uji');
			$data['success'] = true;
		} catch (Exception $e) {
			$data['success'] = false;
			$data['message'] = "Gagal memproses data ". $e->getMessage();
		}
		echo json_encode($data);
	}

	public function RemoveRow()
	{
		$this->db->query('truncate data_uji');
	}
	// data latih

	public function GetDataLatih()
	{
		$data = array('success' => false ,'message'=>array(),'data'=>array(),'testcount'=>0,'berpotensi'=>0,'tdkberpotensi'=>0);

		$tglawal = $this->input->post('tglawal_a').'-01';
		$tglakhir = $this->input->post('tglakhir_a').'-'.date('t',strtotime($this->input->post('tglakhir_a').'-01'));

		$x = $this->db->query("CALL EXEC_DATATESTING(?,?,?)",array('tglawal'=>$tglawal,'tglakhir'=>$tglakhir,'tipe'=>'DL'));

		$rs = $this->db->query("SELECT a.*,b.KelompokUsaha FROM tmpdatatesting a 
			LEFT JOIN mstr_pelanggan b on a.kdcust = b.id where a.kelompok = 'DL';");

		if ($rs){
			$data['success'] = true;
			$data['data']= $rs->result();
			$data['testcount'] = $rs->num_rows();

			$rs = $this->db->query("SELECT * FROM tmpdatatesting where LOWER(target) = 'berpotensi' AND kelompok = 'DL';");
			$data['berpotensi'] = $rs->num_rows();

			$rs = $this->db->query("SELECT * FROM tmpdatatesting where LOWER(target) = 'tidak berpotensi' AND kelompok = 'DL';");
			$data['tdkberpotensi'] = $rs->num_rows();
		}
		else{
			$data['message']='Gagal Get Data testing';
		}
		echo json_encode($data);
	}

	public function GetDataUji()
	{
		$data = array('success' => false ,'message'=>array(),'data'=>array(),'testcount'=>0,'berpotensi'=>0,'tdkberpotensi'=>0);

		$tglawal = $this->input->post('tglawal_b').'-01';
		$tglakhir = $this->input->post('tglakhir_b').'-'.date('t',strtotime($this->input->post('tglakhir_b').'-01'));

		$x = $this->db->query("CALL EXEC_DATAUJI(?,?,?)",array('tglawal'=>$tglawal,'tglakhir'=>$tglakhir,'tipe'=>'DU'));

		$rs = $this->db->query("
			SELECT a.*,b.KelompokUsaha FROM tmpdatatesting a 
			LEFT JOIN mstr_pelanggan b on a.kdcust = b.id
			where a.kelompok = 'DU';
			");

		if ($rs){
			$data['success'] = true;
			$data['data']= $rs->result();
			$data['testcount'] = $rs->num_rows();

			$rs = $this->db->query("SELECT * FROM tmpdatatesting where LOWER(target) = 'berpotensi' AND kelompok = 'DU';");
			$data['berpotensi'] = $rs->num_rows();

			$rs = $this->db->query("SELECT * FROM tmpdatatesting where LOWER(target) = 'tidak berpotensi' AND kelompok = 'DU';");
			$data['tdkberpotensi'] = $rs->num_rows();
		}
		else{
			$data['message']='Gagal Get Data testing';
		}
		echo json_encode($data);
	}

	public function GetDataUji_final()
	{
		$data = array('success' => false ,'message'=>array(),'data'=>array());

		// $id = $this->input->post('uuid');

		$query = "select id,NamaPelanggan as nmcust,target,JmlPembelian as pembelian,`interval`,lokasi,Perhitungan,JenisUsaha KelompokUsaha from data_uji order by kdcust";
		$rs = $this->db->query($query);

		if ($rs){
			$data['success'] = true;
			$data['data']= $rs->result();
		}
		else{
			$data['message']='Gagal Get Data testing';
		}
		echo json_encode($data);
	}
}