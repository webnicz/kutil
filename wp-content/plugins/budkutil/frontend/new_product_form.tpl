<form enctype="multipart/form-data">
    <input type="file" name="pic" id="one-specific-file" style="display: none"/>
</form>

<form method="post" id="novy_produkt_form">
    <table>
        <tr>
            <td colspan="2" class="name">
            	<span>Název</span>
                <input type="text" value="Jak se bude tvůj produkt jmenovat?" name="novy_produkt_nazev" onclick="if(this.value == 'Jak se bude tvůj produkt jmenovat?') { this.value = ''; }" value="<? echo $_POST['novy_produkt_nazev'];?>" />
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
            <td colspan="2" class="parametr" id="sady_parametru_wrapper">
                
                <!--
                <div class="attr_row">
                    <select name="sada[]" class="attribute_taxonomy">
                        <option value="">Vyberte parametr</option>
                        {sady_parametru}
                    </select>
                </div>
                -->
                
            </td>
        </tr>
        
        <tr>
        	<td colspan="2"><div class="separator"></div></td>
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
            	<span>Obrázky</span>
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
    
    <input name="vybrana_kategorie" type="hidden" value="<? echo $_POST['vybrana_kategorie'];?>" />
    <input name="poradi_attachs" type="hidden" value="<? echo $_POST['poradi_attachs'];?>" />
    <input name="main_attach" type="hidden" value="<? echo $_POST['main_attach'];?>" />
    <input name="koeficient" value="{provize}" type="hidden" />                    
    <input id="edit_timestamp" type="hidden" name="edit_timestamp" value="{time}" />
</form>