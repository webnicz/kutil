<? 
$umisteni = explode( 'wp-content', $_SERVER['SCRIPT_FILENAME'] );
require_once( $umisteni[0] . 'wp-load.php' );

if(is_user_logged_in())
{
	$kategorie = $_GET['cid'];
	$vybrane_sady = explode(',', $_GET['sady']);

	echo "<span>Sady parametrů</span>";

	$sady = $wpdb->get_results("SELECT * FROM bk_parametry WHERE neaktivni_v NOT REGEXP '".$kategorie."='");
	foreach ($sady as $sada) 
	{

		$parametry_html = "";
		$parametry = $wpdb->get_results("SELECT * FROM bk_hodnoty WHERE parametr_id='".$sada->parametr_id."'");
		foreach ($parametry as $parametr) 
		{
			if(in_array($parametr->hodnota_id, $vybrane_sady))
				$checked = 'checked="checked"'; 
			else
				$checked = ''; 

			$parametry_html .= '<li class="sada'.$sada->parametr_id.'">
            		<img src="/wp-content/plugins/budkutil/up_img/'.$parametr->hodnota_img.'" alt="testovaci obrazek" />
            		<label><input type="checkbox" class="parametr_input" name="sada[]" value="'.$parametr->hodnota_id.'" '.$checked.' />'.$parametr->hodnota_nazev.'</label>
            	</li>';// for="sada'.$sada->parametr_id.'"
		}

		if(sizeof($parametry) > 0)
		{
			echo "<div class=\"sada\">
				<span>".$sada->parametr_nazev."</span>
				<ul>
					$parametry_html
				</ul>
			</div>";
		}
	}
}
?>
<script type="text/javascript">
jQuery(function() {
  jQuery('.sada').each( function() {
  	if(jQuery(this).find('.parametr_input:checked').length > 2)
  		jQuery(this).find('input:not(:checked)').attr("disabled", true);
  });
});

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