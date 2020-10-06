<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  
  <xsl:template match="div[contains(@class, 'section')]//p">
    <xsl:variable name="pos"><xsl:number level="any"/></xsl:variable>
    <xsl:if test="($pos mod 3) = 1">
      [3]
    </xsl:if>
    <xsl:copy>
      <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="node()|@*">
    <xsl:copy>
      <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
