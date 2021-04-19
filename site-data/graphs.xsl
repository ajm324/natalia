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
    <xsl:variable name="max_width" as="xs:double" select="6 * ($bar_width + $spacing) + $spacing"/>
    <xsl:variable name="max_height" as="xs:integer" select="100"/>
    <xsl:variable name="yscale" as="xs:double" select="2"/>
    <xsl:variable name="interval" as="xs:double" select="$bar_width + $spacing"/>
    <xsl:variable name="album-names" as="map(*)" select='
            map {
                "musas-01": "Musas Vol.1",
                "musas-02": "Musas Vol.2",
                "canto-01": "Un Canto por México Vol.1"
            }'/>
    <xsl:variable name="assoc-colors" as="map(*)" select='
            map {
                "earth": "ForestGreen",
                "water": "DodgerBlue",
                "space": "DarkBlue",
                "air": "DeepPink",
                "fire": "OrangeRed",
                "spirit": "MediumPurple"
            }'/>
    <xsl:template name="xsl:initial-template">
        <xsl:for-each-group select="$all-songs" group-by="descendant::album">
            <xsl:result-document href="{current-grouping-key()}.svg" indent="yes" method="xml">
                <svg height="350" width="500">
                    <g transform="translate(100,250)">
                        <!-- Labels -->
                        <text text-anchor="middle" font-weight="bold" x="{$max_width div 2}"
                            y="{80}" fill="black">Type of Imagery</text>
                        <text text-anchor="middle" font-weight="bold" transform="rotate(270)"
                            x="{($max_height * $yscale) div 2}" y="{-30}" fill="black">Number of
                            Occurrences</text>
                        <text text-anchor="middle" font-weight="bold" x="{$max_width div 2}"
                            y="{-215}" fill="black">Imagery in <xsl:value-of
                                select="$album-names(current-grouping-key())"/></text>
                        <text dominant-baseline = "middle" x="{-20}" y="{-$yscale * 25}" fill="black">25</text>
                        <text dominant-baseline = "middle" x="{-20}" y="{-$yscale * 50}" fill="black">50</text>
                        <text dominant-baseline = "middle" x="{-20}" y="{-$yscale * 75}" fill="black">75</text>
                        <!-- Ruling Lines -->
                        <line  x1="0" x2="{$max_width}" y1="{-$yscale * 25}" y2="{-$yscale * 25}"
                            stroke="LightGrey" stroke-width="2"/>
                        <line  x1="0" x2="{$max_width}" y1="{-$yscale * 50}" y2="{-$yscale * 50}"
                            stroke="LightGrey" stroke-width="2"/>
                        <line  x1="0" x2="{$max_width}" y1="{-$yscale * 75}" y2="{-$yscale * 75}"
                            stroke="LightGrey" stroke-width="2"/>
                        <!-- Bars-->
                        <xsl:variable name="assocValue" as="xs:string+"
                            select="('earth', 'water', 'space', 'air', 'fire', 'spirit')"/>
                        <xsl:for-each select="$assocValue">
                            <xsl:variable name="y-pos" as="xs:double"
                                select="current-group()//assoc[@type = current()] => count() * $yscale"/>
                            <xsl:variable name="x-pos" as="xs:double"
                                select="($bar_width + $spacing) * position() - $bar_width"/>
                            <rect x="{$x-pos}"
                                y="-{$y-pos}" height="{$y-pos}" width="{$bar_width}"
                                fill="{$assoc-colors(.)}"/>
                            <text text-anchor = "middle" x="{$x-pos + $bar_width div 2}" y="{-$y-pos - 6}" fill="black" font-size="small"><xsl:value-of select="$y-pos div $yscale"/></text>
                            <text text-anchor="end" transform="rotate(-90)" x="{-10}"
                                y="{($bar_width + $spacing) * position() - $spacing div 2 -2 }" fill="black">
                                <xsl:value-of
                                    select="substring(current(), 1, 1) ! upper-case(.) || substring(current(), 2)"
                                />
                            </text>
                        </xsl:for-each>

                        <!--Axes-->
                        <line stroke-linecap = "square" x1="0" x2="{$max_width}" y1="0" y2="0" stroke="black" stroke-width="2"/>
                        <line stroke-linecap = "square" x1="0" x2="0" y1="0" y2="{-$max_height * $yscale}" stroke="black"
                            stroke-width="2"/>
                    </g>
                </svg>
            </xsl:result-document>
        </xsl:for-each-group>
    </xsl:template>

</xsl:stylesheet>
