<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">
        <table class="table table-hover">
            <tr>
              <th>Число</th>
              <th>Палиндром</th>
            </tr>
            <xsl:for-each select="objects/object">
            <tr>
              <td>
                <xsl:value-of select="number"></xsl:value-of>
              </td>
              <td>
                <xsl:value-of select="palindrom"></xsl:value-of>
              </td>
            </tr>
             </xsl:for-each>
            <tr>
              <th>Количество:</th>
              <th><xsl:value-of select="count(//object)"/></th>
            </tr>
        </table>
  </xsl:template>
</xsl:stylesheet>
