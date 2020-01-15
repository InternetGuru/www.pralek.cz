<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:param name="inputvar-articlemeta" select="''"/>
  <xsl:param name="inputvar-ghedit" select="''"/>
  <xsl:param name="link" select="''"/>

  <xsl:template match="/">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="//h1">
    <xsl:element name="div">
      <xsl:attribute name="class">
        <xsl:value-of select="@id"/>
        <xsl:text> hdesc</xsl:text>
      </xsl:attribute>
      <xsl:element name="div">
        <xsl:if test="/body[contains(@class, 'agregator')]">
          <xsl:value-of disable-output-escaping="yes" select="$inputvar-articlemeta"/>
        </xsl:if>
        <xsl:element name="{name()}">
          <xsl:copy-of select="@*"/>
          <xsl:element name="span">
            <xsl:value-of select="."/>
          </xsl:element>
        </xsl:element>
        <div>
          <xsl:copy-of select="following-sibling::*[1][name() = 'p'][contains(@class, 'description')]"/>
        </div>
        <!--<xsl:copy-of select="following-sibling::*[name() = 'ul'][contains(@class, 'docinfo')][contains(@class, 'global')]"/>-->
        <xsl:if test="/body[contains(@class, 'agregator')]">
          <div class="extra">
            <span class="hideable">
              <span class="eventable">Získat odkaz na článek</span>
              <span class="copyable" fn="inputvar-createlink">
                <xsl:value-of disable-output-escaping="yes" select="$link"/>
              </span>
              <span class="fb hideable-nohide">
              <xsl:element name="a">
                <xsl:attribute name="href">https://www.facebook.com/sharer/sharer.php?u=https://www.pralek.cz/<xsl:value-of disable-output-escaping="yes" select="$link"/></xsl:attribute>
                Sdílet na Facebooku
              </xsl:element>
              </span>
              <span class="twitter hideable-nohide">
              <xsl:element name="a">
                <xsl:attribute name="href">https://twitter.com/intent/tweet?text=www.pralek.cz/<xsl:value-of disable-output-escaping="yes" select="$link"/></xsl:attribute>
                Sdílet na Twitteru
              </xsl:element>              
              </span>
              <span class="edit hideable-nohide">
              <xsl:value-of disable-output-escaping="yes" select="$inputvar-ghedit"/>
              </span>
            </span>
          </div>
        </xsl:if>
      </xsl:element>
    </xsl:element>
    <xsl:element name="div">
      <xsl:call-template name="topdiv"/>
    </xsl:element>
  </xsl:template>

  <xsl:template name="topdiv">
    <xsl:param name="pos" select="1"/>
    <xsl:if test="following-sibling::*[$pos][not(contains(@class, 'section'))]">
      <xsl:if test="following-sibling::*[$pos][not(contains(@class, 'description'))]">
        <xsl:copy-of select="following-sibling::*[$pos]"/>
      </xsl:if>
      <xsl:call-template name="topdiv">
        <xsl:with-param name="pos" select="$pos+1"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
  

  <!-- ignore elements between h1 and div.section -->
  <xsl:template match="//*[preceding-sibling::h1 and (following-sibling::div[contains(@class, 'section')] or not(//div[contains(@class, 'section')]))]"/>
  <xsl:template match="p[contains(@class, 'description')][preceding-sibling::*[1][name() = 'h1']]"/>
  <!--<xsl:template match="ul[contains(@class, 'docinfo')][contains(@class, 'global')]"/>-->

  <xsl:template match="node()|@*">
    <xsl:copy>
      <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
