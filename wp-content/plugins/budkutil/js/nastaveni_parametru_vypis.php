<?
$parametry = $wpdb->get_results("SELECT * FROM bk_hodnoty WHERE parametr_id='".$sada_id."'");
foreach ($parametry as $parametr) {
	$selected = "";
	if($parametr_id == $parametr->hodnota_id)
		$selected = 'selected="selected"';

	$parametry_options .= '<option '.$selected.' value="'.$parametr->hodnota_id.'">'.$parametr->hodnota_nazev.'</option>';
}

$sada = $wpdb->get_row("SELECT * FROM bk_parametry WHERE parametr_id='".$sada_id."'");
echo '<div class="nazev_sady" id="'.$sada_id.'">'.$sada->parametr_nazev.' <a onclick="odebrat_sadu('.$sada_id.')">Odebrat</a></div>';

if(!empty($parametry_options))
{
	echo '<div>
		<select name="parametry">
			<option> Vyberte hodnotu </option>
			'.$parametry_options.'
		</select>
	</div>';
}
else{
	echo '<i>Tato sada nemá žádné parametry</i>';
}
?>