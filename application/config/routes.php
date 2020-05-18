<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
| This file lets you re-map URI requests to specific controller functions.
|
| Typically there is a one-to-one relationship between a URL string
| and its corresponding controller class/method. The segments in a
| URL normally follow this pattern:
|
|	example.com/class/method/id/
|
| In some instances, however, you may want to remap this relationship
| so that a different class/function is called than the one
| corresponding to the URL.
|
| Please see the user guide for complete details:
|
|	https://codeigniter.com/user_guide/general/routing.html
|
| -------------------------------------------------------------------------
| RESERVED ROUTES
| -------------------------------------------------------------------------
|
| There are three reserved routes:
|
|	$route['default_controller'] = 'welcome';
|
| This route indicates which controller class should be loaded if the
| URI contains no data. In the above example, the "welcome" class
| would be loaded.
|
|	$route['404_override'] = 'errors/page_missing';
|
| This route will tell the Router which controller/method to use if those
| provided in the URL cannot be matched to a valid route.
|
|	$route['translate_uri_dashes'] = FALSE;
|
| This is not exactly a route, but allows you to automatically route
| controller and method names that contain dashes. '-' isn't a valid
| class or method name character, so it requires translation.
| When you set this option to TRUE, it will replace ALL dashes in the
| controller and method URI segments.
|
| Examples:	my-controller/index	-> my_controller/index
|		my-controller/my-method	-> my_controller/my_method
*/
$route['default_controller'] = 'welcome';
$route['404_override'] = '';
$route['translate_uri_dashes'] = FALSE;

// ============================== API ==============================
$route['APIpost'] = 'API/API_post/read';
$route['APIpostplaylist'] = 'API/API_post/ReadDaftarPutar';
$route['APIlastlineplaylist'] = 'API/API_post/LastLineNumb';
$route['APIAddPlaylist'] = 'API/API_post/AddPlaylist';
// $route['APIRemovePlaylist'] = 'API/API_post/RemoveDaftarPutar';
$route['APIAbout'] = 'API/API_post/ReadAbout';
$route['APILog'] = 'API/API_post/LogView';
$route['APIVideo'] = 'API/API_post/GetVideoStream';

// API AUTH
$route['APIAUTHUname'] = 'API/API_auth/FindUserName';
$route['APIAUTHEmail'] = 'API/API_auth/FindEmail';
$route['APIAUTHReg'] = 'API/API_auth/RegisterUser';
$route['APIAUTHLogin'] = 'API/API_auth/Log_Pro';
$route['APIAUTHChangePass'] = 'API/API_auth/ChangePassword';

// API Message
$route['APIMessageInbox'] = 'API/API_Message/SendInbox';
$route['APIShowMessage'] = 'API/API_Message/ReadMessage';
$route['APICountMesssage'] = 'API/API_Message/ReadCountMessage';
$route['APIUpdateFlag'] = 'API/API_Message/UpdateFlagread';

// API Playlist
$route['APIAddPlaylistHeader'] = 'API/API_Playlist/AddPlaylistHeader';
$route['APIAddPlaylistDetail'] = 'API/API_Playlist/AddPlaylistDetail';
$route['APIShowPlaylistHeader'] = 'API/API_Playlist/ShowPlaylistHeader';
$route['APIShowPlaylistDetail'] = 'API/API_Playlist/ShowPlaylistDetail';
$route['APIAddPlaylistMulti'] = 'API/API_Playlist/MultiappendPlaylist';
$route['APIRemovePlaylist'] = 'API/API_Playlist/RemovePlaylist';
// ============================== API ==============================

$route['post'] = 'Home/Post';
$route['about'] = 'Home/About';
$route['users'] = 'Home/Users';
$route['chat'] = 'Home/Chats';