<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/2000/svg"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="#all"
    version="3.0">
    <xsl:output method="xml" indent="yes"/>
        
        <xsl:variable name="all-songs" select="collection('../xml-files?select=*.xml')"
            as="document-node()+"/>
        
        <xsl:variable name="bar_width" as="xs:integer" select="30"/>
        <xsl:variable name="spacing" as="xs:double" select="$bar_width div 2"/>
        <xsl:variable name="max_width" as="xs:double" select="6 * ($bar_width + $spacing ) + $spacing"/>
        <xsl:variable name="max_height" as="xs:integer" select="100"/>
        <xsl:variable name="yscale" as="xs:integer" select="2"/>
        <xsl:variable name="interval" as="xs:double" select="$bar_width + $spacing"/>
        <xsl:variable name="album-names" as="map(*)"
            select='map {
            "musas-01" : "Musas Vol.1",
            "musas-02" : "Musas Vol.2",
            "canto-01" : "Un Canto por México Vol.1"
            }'/> 
        
        <xsl:template name="xsl:initial-template">
            <xsl:for-each-group select="$all-songs" group-by="descendant::album">
                <xsl:result-document href="{current-grouping-key()}.svg" indent="yes" method="xml">
                    <svg height = "350" width = "500">
                        <g transform = "translate(100,250)">
                            <!-- Labels -->
                            <text text-anchor = "end" transform = "rotate(-90)" x = "{-10}" y = "{$bar_width +5}" fill = "black">Earth</text>
                            <text text-anchor = "end" transform = "rotate(-90)" x = "{-10}" y = "{($bar_width *2) + $spacing +5}" fill = "black">Water</text>
                            <text text-anchor = "end" transform = "rotate(-90)"  x = "{-10}" y = "{($bar_width *2) + ($spacing *4) +5}" fill = "black">Space</text>
                            <text text-anchor = "end" transform = "rotate(-90)" x = "{-10}" y = "{($bar_width *3) + ($spacing *5) +5}" fill = "black">Air</text>
                            <text text-anchor = "end" transform = "rotate(-90)" x = "{-10}" y = "{($bar_width *4) + ($spacing *6) +5}" fill = "black">Fire</text>
                            <text text-anchor = "end" transform = "rotate(-90)" x = "{-10}" y = "{($bar_width *5) + ($spacing *7) +5 }" fill = "black">Spirit</text>
                            <text text-anchor = "middle" font-weight = "bold" x = "{$max_width div 2}" y = "{80}" fill = "black">Type of Imagery</text>
                            <text text-anchor = "middle"  font-weight = "bold" transform = "rotate(270)" x = "{($max_height * $yscale) div 2}" y = "{-30}" fill = "black">Number of Occurrences</text>
                            <text text-anchor = "middle" font-weight = "bold" x = "{$max_width div 2}" y = "{-215}" fill = "black">Imagery in <xsl:value-of select = "$album-names(current-grouping-key())"/></text>
                            <text x = "{-20}" y = "{-$yscale * 25}" fill = "black">25</text>
                            <text x = "{-20}" y = "{-$yscale * 50}" fill = "black">50</text>
                            <text x = "{-20}" y = "{-$yscale * 75}" fill = "black">75</text>
                            <!-- Ruling Lines -->
                            <line x1="0" x2="{$max_width}" y1="{-$yscale * 25}" y2="{-$yscale * 25}" stroke="LightGrey" stroke-width="2"/>
                            <line x1="0" x2="{$max_width}" y1="{-$yscale * 50}" y2="{-$yscale * 50}" stroke="LightGrey" stroke-width="2"/>
                            <line x1="0" x2="{$max_width}" y1="{-$yscale * 75}" y2="{-$yscale * 75}" stroke="LightGrey" stroke-width="2"/>
                            <!-- Bars-->
                            <xsl:apply-templates/>
                            <!--Axes-->
                            <line x1="0" x2="{$max_width}" y1="0" y2="0" stroke="black" stroke-width="2"/>
                            <line x1="0" x2="0" y1="0" y2="{-$max_height * $yscale}" stroke="black"
                                stroke-width="2"/>
                        </g>
                    </svg>
                </xsl:result-document>
            </xsl:for-each-group> 
        </xsl:template>
        
        
        <xsl:template match = "song">
            
            <xsl:variable name = "earth" as = "xs:integer" select = "//assoc[@type ='earth'] =>count() *$yscale"/>
            <xsl:variable name = "water" as = "xs:integer" select = "//assoc[@type ='water'] =>count() * $yscale"/>
            <xsl:variable name = "space" as = "xs:integer" select = "//assoc[@type ='space'] =>count()* $yscale"/>
            <xsl:variable name = "air" as = "xs:integer" select = "//assoc[@type ='air'] =>count()* $yscale"/>
            <xsl:variable name = "fire" as = "xs:integer" select = "//assoc[@type ='fire'] => count() * $yscale"/>
            <xsl:variable name = "spirit" as = "xs:integer" select = "//assoc[@type ='spirit'] =>count() * $yscale"/>
            
            
            <rect x = "{$spacing}" y = "-{$earth}" height = "{$earth}" width = "{$bar_width}" fill = "ForestGreen"/>
            <rect x = "{$bar_width *2}" y = "-{$water}" height = "{$water}" width = "{$bar_width}" fill = "DodgerBlue"/>
            <rect x = "{($bar_width *2) + ($spacing *3)}" y = "-{$space}" height = "{$space}" width = "{$bar_width}" fill = "DarkBlue"/>
            <rect x = "{($bar_width *3) + ($spacing *4)}" y = "-{$air}" height = "{$air}" width = "{$bar_width}" fill = "DeepPink"/>
            <rect x = "{($bar_width *4) + ($spacing *5)}" y = "-{$fire}" height = "{$fire}" width = "{$bar_width}" fill = "OrangeRed"/>
            <rect x = "{($bar_width *5) + ($spacing *6)}" y = "-{$spirit}" height = "{$spirit}" width = "{$bar_width}" fill = "MediumPurple"/>
            
            
        </xsl:template>
        
    </xsl:stylesheet>