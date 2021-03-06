<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" 
                xmlns:math="http://exslt.org/math"
                extension-element-prefixes="math">
  
  <xsl:template match="div[contains(@class, 'section')]//p[not(contains(@class, 'description'))]">
    <xsl:variable name="pos"><xsl:number level="any"/></xsl:variable>
    <xsl:variable name="rand"><xsl:value-of select="(floor(math:random()*3) mod 3) + 1" /></xsl:variable>
    <xsl:copy>
      <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
    <xsl:if test="($pos mod 5) = 1">
      <div class="list"><ul class="ad" var="cms-server">
        <li class="list--ico-single"><span class="fab fa-fw fa-book-medical">i</span>
        <xsl:choose>
          <xsl:when test="$rand = 1">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</xsl:when>
          <xsl:when test="$rand = 2">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</xsl:when>
          <xsl:when test="$rand = 3">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</xsl:when>
        </xsl:choose></li>
        <li><a href="#ebook" class="button">Nová elektronická kniha</a></li>
      </ul></div>
    </xsl:if>
  </xsl:template>
  
  <xsl:template match="node()|@*">
    <xsl:copy>
      <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
