<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >

    <xsl:template match="/">

        <HTML> <BODY>
          <H2>Featured Animals</H2>
          <TABLE BORDER="2"> <TR> <TD>Animal</TD> <TD>Age</TD> <TD>Description</TD> <TD>ImageURL</TD>
        </TR>

        <xsl:for-each select="NewDataSet/Table">

        <TR>

            <TD>

            <xsl:value-of select="AnimalName"/>

            </TD>

            <TD>

            <xsl:value-of select="AnimalAge"/>

            </TD>

            <TD>

            <xsl:value-of select="AnimalDescription"/>

            </TD>
	    
	          <TD>
	          <img alt="">
            <xsl:attribute name="src">
            <xsl:value-of select="AnimalImageURL"/>
            </xsl:attribute>
            </img>
            </TD>

        </TR>

        </xsl:for-each>

        </TABLE> </BODY> </HTML>

    </xsl:template>

</xsl:stylesheet>