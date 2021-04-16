<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/1999/xhtml"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="#all"
    version="3.0">
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="no" include-content-type="no"
        indent="yes"/>
    <xsl:variable name="album-names" as="map(*)"
        select='map {
        "musas-01" : "Musas Vol.1",
        "musas-02" : "Musas Vol.2",
        "canto-01" : "Un Canto por México Vol.1"
        }'/>
    <xsl:variable name="all-songs" select="collection('../xml-files?select=*.xml')"
        as="document-node()+"/>
    <xsl:template name="xsl:initial-template">
        <xsl:for-each-group select="$all-songs" group-by="descendant::album">
            <xsl:result-document href="{current-grouping-key()}.xhtml" indent="yes" method="xhtml"
                html-version="5" omit-xml-declaration="no" include-content-type="no">
                <html>
                    <head>
                        <link rel="stylesheet" type="text/css" href="index.css"/>
                        <title>
                           <xsl:value-of select = "$album-names(current-grouping-key())"/>
                        </title>
                    </head>
                    <body>
                        <h1>
                            <strong>Imágenes de Natalia</strong>
                        </h1>
                        <h2>
                            <em>Natural Imagery and Identity in the Music of Natalia Lafourcade</em>
                        </h2>
                        <section>
                            <xsl:comment>#include virtual="toc.xhtml"</xsl:comment>
                        </section>
                        <div class = "imageryMenu">
                            <xsl:comment>#include virtual="imagery-menu.xhtml"</xsl:comment>
                        </div>
                        <h3 class = "album">
                            <xsl:value-of select = "$album-names(current-grouping-key())"/>
                        </h3>
                        <div class="lyrics">
                            <xsl:apply-templates select = "current-group()"/>
                        </div>
                    </body>
                </html>
            </xsl:result-document>
        </xsl:for-each-group>
    </xsl:template>

    <xsl:template match="meta">
        <p class="meta">
            <strong>
                <xsl:apply-templates select="title"/>
            </strong>
        </p>
        <xsl:if test = "child::writers">
        <p class="meta">
            <xsl:text>Written By: </xsl:text>
            <xsl:apply-templates select="writers"/>
        </p>
        </xsl:if>
      <xsl:if test = "child::features">
        <p class="meta">
            <xsl:text>Featuring: </xsl:text>
            <xsl:apply-templates select="features"/>
        </p>
      </xsl:if>
        <br/>
    </xsl:template>

    <xsl:template match="instrumental | verse | chorus | bridge | pre-chorus | post-chorus | outro">
        <div class="lyric">
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="line">
        <xsl:apply-templates/>
        <br/>
    </xsl:template>

    <xsl:template match="assoc[@type = 'water']">
        <span class="water">
            <span class="tooltip">
            <xsl:apply-templates/>
                <span class="tooltiptext">
                    <xsl:value-of select="@image"/>
                </span>
            </span>
        </span>
    </xsl:template>

    <xsl:template match="assoc[@type = 'earth']">
        <span class="earth">
            <span class="tooltip">
                <xsl:apply-templates/>
                <span class="tooltiptext">
                    <xsl:value-of select="@image"/>
                </span>
            </span>
        </span>
    </xsl:template>

    <xsl:template match="assoc[@type = 'space']">
        <span class="space">
            <span class="tooltip">
                <xsl:apply-templates/>
                <span class="tooltiptext">
                    <xsl:value-of select="@image"/>
                </span>
            </span>
        </span>
    </xsl:template>

    <xsl:template match="assoc[@type = 'spirit']">
        <span class="spirit">
            <span class="tooltip">
                <xsl:apply-templates/>
                <span class="tooltiptext">
                    <xsl:value-of select="@image"/>
                </span>
            </span>
        </span>
    </xsl:template>

    <xsl:template match="assoc[@type = 'air']">
        <span class="air">
            <span class="tooltip">
                <xsl:apply-templates/>
                <span class="tooltiptext">
                    <xsl:value-of select="@image"/>
                </span>
            </span>
        </span>
    </xsl:template>

    <xsl:template match="assoc[@type = 'fire']">
        <span class="fire">
            <span class="tooltip">
                <xsl:apply-templates/>
                <span class="tooltiptext">
                    <xsl:value-of select="@image"/>
                </span>
            </span>
        </span>
    </xsl:template>

</xsl:stylesheet>
