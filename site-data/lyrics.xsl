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
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="moore_xslt-06.css"/>
                <title>Songs</title>
            </head>
            <body>
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