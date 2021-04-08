<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" 
    exclude-result-prefixes="#all"
    version="3.0">
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="no" 
        include-content-type="no" indent="yes"/>
    
    <xsl:template match = "/">
        <xsl:variable name="documents" select="collection('xml-files')"/>
        <xsl:variable name="albums" select="concat($documents//album=>distinct-values(),'.xhtml')"/>
        <xsl:result-document href = "{$albums}" indent = "yes">
            <xsl:copy-of select = "$documents//album=>distinct-values()"/> 
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="index.css"/>
                <title>
                    <xsl:if test = "meta/album = 'musas-01'">
                        <xsl:text>Musas Vol.1</xsl:text>
                    </xsl:if>
                    <xsl:if test = "meta/album = 'musas-02'">
                        <xsl:text>Musas Vol.2</xsl:text>
                    </xsl:if>
                    <xsl:if test = "meta/album = 'canto-01'">
                        <xsl:text>Un Canto por México Vol.1</xsl:text>
                    </xsl:if>
                </title>
            </head>
            <body>
                <h1><strong>Imágenes de Natalia</strong></h1>
                <h2><em>Natural Imagery and Identity in the Music of Natalia Lafourcade</em></h2>
                <section>
                    <xsl:comment>#include virtual="toc.xhtml"</xsl:comment>
                </section>
                    <xsl:comment>#include virtual="imagery-menu.xhtml"</xsl:comment>
                <h3> 
                    <xsl:if test = "/meta/album = 'musas-01'">
                    <xsl:text>Musas Vol.1</xsl:text>
                </xsl:if>
                    <xsl:if test = "/meta/album = 'musas-02'">
                        <xsl:text>Musas Vol.2</xsl:text>
                    </xsl:if>
                    <xsl:if test = "/meta/album = 'canto-01'">
                        <xsl:text>Un Canto por México Vol.1</xsl:text>
                    </xsl:if>
                </h3>
                <div class = "lyrics">
                    <xsl:apply-templates/>
                </div>
            </body>
        </html>
    </xsl:template>

   
    <xsl:template match = "meta">
        <p class = "meta"><strong><xsl:apply-templates select = "title"/></strong></p>
        <p class = "meta"><xsl:text>Written By:</xsl:text><xsl:apply-templates select = "writers"/></p>
        <p class = "meta"><xsl:text>Featuring:</xsl:text><xsl:apply-templates select = "features"/></p>
        <br/>
    </xsl:template>
    
    <xsl:template match = "instrumental | verse | chorus | bridge | pre-chorus | post-chorus | outro">
        <xsl:apply-templates/><br/>
    </xsl:template>
    
    <xsl:template match = "line">
        <xsl:apply-templates/><br/>
    </xsl:template>
    
    <xsl:template match = "assoc[@type = 'water']">
        <span class = "water">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match = "assoc[@type = 'earth']">
        <span class = "earth">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match = "assoc[@type = 'space']">
        <span class = "space">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match = "assoc[@type = 'spirit']">
        <span class = "water">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match = "assoc[@type = 'air']">
        <span class = "water">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match = "assoc[@type = 'fire']">
        <span class = "water">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
</xsl:stylesheet>