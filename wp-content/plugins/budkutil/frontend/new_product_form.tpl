<form enctype="multipart/form-data">
    <input type="file" name="pic" id="one-specific-file" style="display: none"/>
</form>

<form method="post" id="novy_produkt_form">
    <table>
        <tr>
            <td><span>Jak se tvůj výrobek bude <span class="underline">jmenovat</span> ?</span></td>
            <td>
                <input type="text" value="" name="novy_produkt_nazev" />
            </td>
        </tr>

        <tr>
        	<td colspan="2">
        		<span>Popis výrobku</span>
				{editor}
        	</td>
        </tr>
        
        <tr>
            <td colspan="2">
        		<span>Vyber kategorii</span>
                <div class="miller-container" data-source="html">                               	
                    {strom}
                </div>
            </td>
        </tr>
        
        <tr>
            <td colspan="2" class="parametr">
                
                <!--
                <div class="attr_row">
                    <select name="sada[]" class="attribute_taxonomy">
                        <option value="">Vyberte parametr</option>
                        {sady_parametru}
                    </select>
                </div>
                -->
                
                <span>Barva</span>
                
                <ul>
                	<li>
                		<img src="/wp-content/plugins/budkutil/up_img/1390582278_modra.png" alt="testovaci obrazek" />
                		<label><input type="checkbox" name="" value="" /> Nazev parametru</label>
                	</li>
                	<li>
                		<img src="/wp-content/plugins/budkutil/up_img/1390582278_modra.png" alt="testovaci obrazek" />
                		<label><input type="checkbox" name="" value="" /> Nazev parametru</label>
                	</li>
                	<li>
                		<img src="/wp-content/plugins/budkutil/up_img/1390582278_modra.png" alt="testovaci obrazek" />
                		<label><input type="checkbox" name="" value="" /> Nazev parametru</label>
                	</li>
                	<li>
                		<img src="/wp-content/plugins/budkutil/up_img/1390582278_modra.png" alt="testovaci obrazek" />
                		<label><input type="checkbox" name="" value="" /> Nazev parametru</label>
                	</li>
                	<li>
                		<img src="/wp-content/plugins/budkutil/up_img/1390582278_modra.png" alt="testovaci obrazek" />
                		<label><input type="checkbox" name="" value="" /> Nazev parametru</label>
                	</li>
                </ul>
                
            </td>
        </tr>
        <tr>
            <td colspan="2" class="parametr">
                
                <span>Materiál</span>
                <ul>
                	<li>
                		<img src="/wp-content/plugins/budkutil/up_img/1390582278_modra.png" alt="testovaci obrazek" />
                		<label><input type="checkbox" name="" value="" /> Nazev parametru</label>
                	</li>
                	<li>
                		<img src="/wp-content/plugins/budkutil/up_img/1390582278_modra.png" alt="testovaci obrazek" />
                		<label><input type="checkbox" name="" value="" /> Nazev parametru</label>
                	</li>
                	<li>
                		<img src="/wp-content/plugins/budkutil/up_img/1390582278_modra.png" alt="testovaci obrazek" />
                		<label><input type="checkbox" name="" value="" /> Nazev parametru</label>
                	</li>
                	<li>
                		<img src="/wp-content/plugins/budkutil/up_img/1390582278_modra.png" alt="testovaci obrazek" />
                		<label><input type="checkbox" name="" value="" /> Nazev parametru</label>
                	</li>
                	<li>
                		<img src="/wp-content/plugins/budkutil/up_img/1390582278_modra.png" alt="testovaci obrazek" />
                		<label><input type="checkbox" name="" value="" /> Nazev parametru</label>
                	</li>
                </ul>
                
            </td>
        </tr>
        
        <tr>
            <td>Klíčové slova</td>
            <td>
                <input id="tagy" name="tagy" />
                <div class="napoveda">Napište klíčové slovo a potvrďte klávesou enter.</div>
            </td>
        </tr>

        <tr>
            <td>Cena</td>
            <td>
                <input type="text" value="" name="novy_produkt_cena" size="5" /> Kč
            </td>
        </tr>
        <tr>
            <td>Provize</td>
            <td>
                <span id="vypocet_provize">0</span> Kč
            </td>
        </tr>
        <tr>
            <td>Konečná cena</td>
            <td>
                <span id="vypocet_koncove_ceny">0</span> Kč
            </td>
        </tr>
        <tr>
            <td>Kusů</td>
            <td>
                <div class="numbers-row">
                    <input type="text" name="novy_produkt_ks" value="1" size="2" /> Ks
                </div>
            </td>
        </tr>
        <tr>
            <td>Veřejný</td>
            <td>
                <input type="checkbox" value="true" name="novy_produkt_viditelnost" checked="checked" /> Zboží okamžitě vystavit
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <div id="dropbox">
                    <span class="message"><noscript>Pro nahrávání obrázků je vyžadován povolený JavaScript.</noscript></span>

                    <ul id="list1"></ul>   

                    <div id="btn_vybrat_soubor">Vybrat soubor</div>
                </div>
            </td>
        </tr>
        
        <tr>
            <td></td>
            <td>
                <input type="submit" value="Vytvořit produkt" name="pridat_novy_produkt" class="btn btn-success" />
            </td>
        </tr>
    </table>

    {apendix}
    
    <input name="vybrana_kategorie" type="hidden" />
    <input name="poradi_attachs" type="hidden" />
    <input name="main_attach" type="hidden" />
    <input name="koeficient" value="{provize}" type="hidden" />                    
    <input id="edit_timestamp" type="hidden" name="edit_timestamp" value="{time}" />
</form>