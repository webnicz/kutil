<? 
$umisteni = explode( 'wp-content', $_SERVER['SCRIPT_FILENAME'] );
require_once( $umisteni[0] . 'wp-load.php' );

if(is_user_logged_in())
{
	$kategorie = $_GET['cid'];

	echo "<span>Sady parametrů</span>";

	$sady = $wpdb->get_results("SELECT * FROM bk_parametry WHERE neaktivni_v NOT REGEXP '".$kategorie."='");
	foreach ($sady as $sada) 
	{
		echo "<dvi class=\"sada\">
			<span>".$sada->parametr_nazev."</span><ul>";

		$parametry = $wpdb->get_results("SELECT * FROM bk_hodnoty WHERE parametr_id='".$sada->parametr_id."'");
		foreach ($parametry as $parametr) 
		{
			echo '<li>
            		<img src="/wp-content/plugins/budkutil/up_img/'.$parametr->hodnota_img.'" alt="testovaci obrazek" />
            		<label for="sada'.$parametr->hodnota_id.'"><input type="checkbox" class="parametr_input" name="sada'.$sada->parametr_id.'" value="'.$parametr->hodnota_id.'" id="sada'.$parametr->hodnota_id.'" />'.$parametr->hodnota_nazev.'</label>
            	</li>';
		}

		echo "</ul>
		</div>";
	}
}
?>