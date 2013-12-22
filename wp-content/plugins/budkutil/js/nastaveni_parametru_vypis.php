<?
$parametry = $wpdb->get_results("SELECT * FROM bk_hodnoty WHERE parametr_id='".$sada_id."'");
foreach ($parametry as $parametr) {
	$selected = "";
	if($parametr_id == $parametr->hodnota_id)
		$selected = 'selected="selected"';

	$parametry_options .= '<option '.$selected.' value="'.$parametr->hodnota_id.'" alt="'.$parametr->hodnota_img.'">'.$parametr->hodnota_nazev.'</option>';
}

$sada = $wpdb->get_row("SELECT * FROM bk_parametry WHERE parametr_id='".$sada_id."'");
if($key != "fU7i2m")
	echo '<div class="nazev_sady" id="'.$sada_id.'">'.$sada->parametr_nazev.' <a onclick="odebrat_sadu('.$sada_id.')">Odebrat</a></div>';

if(!empty($parametry_options))
{
	echo '<div>
		<select name="parametry" class="vyber_hodnoty">
			<option> Vyberte hodnotu parametru </option>
			'.$parametry_options.'
		</select>
	</div>';
}
else{
	echo '<i>Tento parametr nemá žádné hodnoty</i>';
}

if($key == "fU7i2m")
	echo '<div class="delete_sada" id="'.$sada_id.'"><a>Odebrat</a></div>';
?>