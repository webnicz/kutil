<? 
$umisteni = explode( 'wp-content', $_SERVER['SCRIPT_FILENAME'] );
require_once( $umisteni[0] . 'wp-load.php' );

function get_ip()
{
    $client  = @$_SERVER['HTTP_CLIENT_IP'];
    $forward = @$_SERVER['HTTP_X_FORWARDED_FOR'];
    $remote  = $_SERVER['REMOTE_ADDR'];

    if(filter_var($client, FILTER_VALIDATE_IP))
    {
        $ip = $client;
    }
    elseif(filter_var($forward, FILTER_VALIDATE_IP))
    {
        $ip = $forward;
    }
    else
    {
        $ip = $remote;
    }

    return $ip;
}

function exit_status($str, $type = "status"){
	echo $str;//json_encode(array($type=>$str));
	exit;
}

if(is_user_logged_in())
{
	$produkt_id = $_GET['pid'];
	$user_id 	= get_current_user_id();
	
	$args = array(
    	'ID'        =>  $produkt_id, 
    );
	$pos = get_posts( $args );

	if($post->post_author != $user_id)
	{

		$posledni = $wpdb->get_var("SELECT time FROM bk_like WHERE user_id='".$user_id."' ORDER BY time DESC");

		if($posledni < time()-2)
		{
			if(is_null($wpdb->get_var("SELECT time FROM bk_like WHERE user_id='".$user_id."' AND produkt_id='".$produkt_id."'")))
			{
				$wpdb->insert('bk_like', 
			        array(  
			            'user_id' 		=> $user_id, 
			            'produkt_id' 	=> $produkt_id,
			            'time' 			=> time(),
			            'ip' 			=> get_ip()
			        )
			    );

			    exit_status('liked');
			}
			else
			{
				$wpdb->delete( 'bk_like', array( 'produkt_id' => $produkt_id, 'user_id' => $user_id  ) );

				exit_status('annulled');
			}
		}
		else
		{
			exit_status('Small time interval');
		}
	}
	else
	{
		exit_status('Author');
	}
}
else
{
	exit_status('Loged');
}
?>