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
                <textarea rows="5" cols="30" name="novy_produkt_popis"></textarea>
            </td>
        </tr>
        <tr>
            <td>Kategorie:</td>
            <td>
                <div id="pocet_vybranych">Počet vygraných kategorií: <span>0</span></div>
                {strom}
            </td>
        </tr>
        <tr>
            <td>Cena:</td>
            <td>
                <input type="text" value="" name="novy_produkt_cena" size="5" /> Kč
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
                <input type="checkbox" value="true" name="novy_produkt_viditelnost" checked="checked" /> Produkt mohou vidět všichni uživatelé 
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

    <input name="poradi_attachs" type="text" />
    <input name="main_attach" type="text" />                  
    <input id="edit_timestamp" type="text" name="edit_timestamp" value="{time}" />
</form>