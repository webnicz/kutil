<form enctype="multipart/form-data">
    <input type="file" name="pic" id="one-specific-file" style="display: none"/>
</form>

<form method="post" id="novy_produkt_form">
    <table>
        <tr>
            <td>Název:</td>
            <td>
                <input type="text" value="" name="novy_produkt_nazev" />
            </td>
        </tr>
        <tr>
            <td>Popis:</td>
            <td>
                {editor}
            </td>
        </tr>
        <tr>
            <td>Klíčové slova:</td>
            <td>
                <input id="tagy" name="tagy" style="width:300px" />
                <div class="napoveda">Napište klíčové slovo a potvrďte klávesou enter.</div>
            </td>
        </tr>
        <tr>
            <td>Kategorie:</td>
            <td>
                <div class="miller-container" data-source="html">               
                    {strom}
                </div>
            </td>
        </tr>
        <tr>
            <td>Cena:</td>
            <td>
                <input type="text" value="" name="novy_produkt_cena" size="5" /> Kč
            </td>
        </tr>
        <tr>
            <td>Provize:</td>
            <td>
                <span id="vypocet_provize">0</span> Kč
            </td>
        </tr>
        <tr>
            <td>Výsledná cena:</td>
            <td>
                <span id="vypocet_koncove_ceny">0</span> Kč
            </td>
        </tr>
        <tr>
            <td>Kusů:</td>
            <td>
                <div class="numbers-row">
                    <input type="text" name="novy_produkt_ks" value="1" size="2" /> Ks
                </div>
            </td>
        </tr>
        <tr>
            <td>Veřejný:</td>
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
            <td colspan="2">
                <div class="attr_row">
                    <select name="sada[]" class="attribute_taxonomy">
                        <option value="">Vyberte parametr</option>
                        {sady_parametru}
                    </select>
                </div>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <input type="submit" value="Vytvořit produkt" name="pridat_novy_produkt" />
            </td>
        </tr>
    </table>

    {apendix}
    <input name="poradi_attachs" type="hidden" />
    <input name="main_attach" type="hidden" />
    <input name="koeficient" value="{provize}" type="hidden" />                    
    <input id="edit_timestamp" type="hidden" name="edit_timestamp" value="{time}" />
</form>