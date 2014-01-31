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
			echo '<li class="sada'.$sada->parametr_id.'">
            		<img src="/wp-content/plugins/budkutil/up_img/'.$parametr->hodnota_img.'" alt="testovaci obrazek" />
            		<label><input type="checkbox" class="parametr_input" name="sada[]" value="'.$parametr->hodnota_id.'" />'.$parametr->hodnota_nazev.'</label>
            	</li>';// for="sada'.$sada->parametr_id.'"
		}

		echo "</ul>
		</div>";
	}
}
?>
<script type="text/javascript">
jQuery('.parametr_input').on('click', function() {
    var sada = jQuery(this).parent().parent().attr('class');
	
   if(jQuery('.'+sada).find('input:checked').length >= 3)
        jQuery('.'+sada).find('input:not(:checked)').attr("disabled", true);
    else
    {
        jQuery('.'+sada).find('input').removeAttr("disabled");
    }
});
</script>