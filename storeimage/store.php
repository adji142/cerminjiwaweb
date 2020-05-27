<?php
function url(){
  return sprintf(
    "%s://%s%s",
    isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off' ? 'https' : 'http',
    $_SERVER['SERVER_NAME'],
    $_SERVER['REQUEST_URI']
  );
}

	$image = $_POST['baseimage'];

	// list($type, $image) = explode(';', $image);
	// list(, $image)      = explode(',', $image);
	$temp = base64_decode($image);

	// file_put_contents('http://' . $_SERVER['SERVER_NAME'] . $_SERVER['REQUEST_URI'].'/storeimage/'.md5($image).'.png', $temp);
  file_put_contents('./'.md5($image).'.png', $temp);
?>