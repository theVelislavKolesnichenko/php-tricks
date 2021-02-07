<xsl:stylesheet version='1.0' xmlns:xsl='http://www.w3.org/1999/XSL/Transform' xmlns:g='http://base.google.com/ns/1.0'
xmlns:date="http://exslt.org/dates-and-times" extension-element-prefixes="date">
    
    <xsl:template match='/rss/channel'>
        <SHOP>
            <DATE_CREATED>
                <xsl:text disable-output-escaping='yes'>&lt;![CDATA[</xsl:text>
                
                <xsl:text disable-output-escaping='yes'>]]&gt;</xsl:text>
            </DATE_CREATED>
            <xsl:for-each select='item'>
                <xsl:variable name='id' select='g:item_group_id'/>
                <xsl:if test='not(preceding-sibling::item[g:item_group_id=$id])'>
                    <xsl:variable name='price' select='substring-before(g:price, " ")'/>
                    <SHOPITEM>
                        <PRODUCT_ID>
                            <xsl:text disable-output-escaping='yes'>&lt;![CDATA[</xsl:text>
                            <xsl:value-of select='g:gtin'/> 
                            <xsl:text disable-output-escaping='yes'>]]&gt;</xsl:text>
                        </PRODUCT_ID>
                        <NAME>
                            <xsl:text disable-output-escaping='yes'>&lt;![CDATA[</xsl:text>
                            <xsl:value-of select='substring-before(title, g:size)'/>
                            <xsl:text disable-output-escaping='yes'>]]&gt;</xsl:text>
                        </NAME>
                        <CATEGORIES>
                            <CATEGORY>
                                <xsl:text disable-output-escaping='yes'>&lt;![CDATA[</xsl:text> <xsl:value-of select='g:category'/> <xsl:text disable-output-escaping='yes'>]]&gt;</xsl:text>
                            </CATEGORY>
                        </CATEGORIES>
                        <MODEL>
                            <xsl:text disable-output-escaping='yes'>&lt;![CDATA[</xsl:text> <xsl:value-of select='g:gtin'/> <xsl:text disable-output-escaping='yes'>]]&gt;</xsl:text>
                        </MODEL>
                        <DESCRIPTION> 
                            <xsl:text disable-output-escaping='yes'>&lt;![CDATA[</xsl:text> <xsl:value-of select='g:description'/> 
                            <xsl:text>&#xd;</xsl:text>
                            <xsl:value-of select='g:custom_label_1'/> <xsl:text disable-output-escaping='yes'>]]&gt;</xsl:text>
                        </DESCRIPTION>
                        <MANUFACTURER><xsl:text disable-output-escaping='yes'>&lt;![CDATA[</xsl:text> NONE <xsl:text disable-output-escaping='yes'>]]&gt;</xsl:text></MANUFACTURER>
                        <PRICE> 
                            <xsl:value-of select='g:price'/>
                        </PRICE>
                        <IMAGES>
                            <IMAGE_1>
                                <xsl:value-of select='g:image_link'/>
                            </IMAGE_1>
                            <IMAGE_2> 
                                <xsl:value-of select='g:additional_image_link'/>
                            </IMAGE_2>
                        </IMAGES>
                        <PRODUCT_OPTIONS>
                            <OPTIONS>
                                <xsl:for-each select='/rss/channel/item[g:item_group_id=$id]'>
                                <xsl:variable name='price2' select='substring-before(g:price, " ")'/>
                                <xsl:variable name='valut' select='substring-after(g:price, " ")'/>
                                    <ITEMS>
                                        <NAME>
                                            <xsl:text disable-output-escaping='yes'>&lt;![CDATA[</xsl:text> Размер <xsl:text disable-output-escaping='yes'>]]&gt;</xsl:text>
                                        </NAME>
                                        <VALUE>
                                            <xsl:text disable-output-escaping='yes'>&lt;![CDATA[</xsl:text>
                                            <xsl:value-of select='g:size'/>
                                            <xsl:text disable-output-escaping='yes'>]]&gt;</xsl:text>
                                        </VALUE>
                                        <PRICE>
                                            <xsl:value-of select='concat($price - $price2," ",$valut) '/>
                                        </PRICE>
                                        <QUANTITY>5</QUANTITY>
                                    </ITEMS>
                                </xsl:for-each>
                            </OPTIONS>
                            <ATTRIBUTES>
                                <ATTRIBUTE>
                                    <GROUP><xsl:text disable-output-escaping='yes'>&lt;![CDATA[</xsl:text> Цвят <xsl:text disable-output-escaping='yes'>]]&gt;</xsl:text></GROUP>
                                    <NAME><xsl:text disable-output-escaping='yes'>&lt;![CDATA[</xsl:text> Цвят <xsl:text disable-output-escaping='yes'>]]&gt;</xsl:text></NAME>
                                <VALUE>
                                    <xsl:text disable-output-escaping='yes'>&lt;![CDATA[</xsl:text> <xsl:value-of select='g:color'/> <xsl:text disable-output-escaping='yes'>]]&gt;</xsl:text>
                                </VALUE>
                                </ATTRIBUTE>
                            </ATTRIBUTES>
                        </PRODUCT_OPTIONS>
                        <LINK>
                            <xsl:value-of select='link'/> 
                        </LINK>
                    </SHOPITEM>
                </xsl:if>
            </xsl:for-each>            
        </SHOP>
    </xsl:template>
</xsl:stylesheet>