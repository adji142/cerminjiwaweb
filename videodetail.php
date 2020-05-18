<?php
	$videoURL = $_GET['url'];
	var_dump($videoURL);
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
?>