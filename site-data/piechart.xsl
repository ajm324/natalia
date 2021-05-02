<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/2000/svg"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="#all"
    version="3.0">
    <xsl:output method="xml" indent="yes"/>
    
    <svg width="100%" height="100%" viewBox="0 0 42 42">
       
        <circle cx="21" cy="21" r="15.92" fill="transparent" 
                stroke="ForestGreen" 
                stroke-width="3" 
                stroke-dasharray="calc((174/386) * 100) calc(100 - ((174/386) * 100))" 
                stroke-dashoffset="25"/>
        <circle cx="21" cy="21" r="15.92" fill="transparent" 
                stroke="DodgerBlue" 
                stroke-width="3" 
                stroke-dasharray="calc((43/386) * 100) calc(100 - ((43/386) * 100))" 
                stroke-dashoffset="calc(100 - ((174/386) * 100) + 25)"/>
        <circle cx="21" cy="21" r="15.92" fill="transparent" 
            stroke="DarkBlue" 
            stroke-width="3" 
            stroke-dasharray="calc((94/386) * 100) calc(100 - ((94/386) * 100))" 
            stroke-dashoffset="-31.2"/>
        <circle cx="21" cy="21" r="15.92" fill="transparent" 
            stroke="DeepPink" 
            stroke-width="3" 
            stroke-dasharray="calc((11/386) * 100) calc(100 - ((11/386) * 100))" 
            stroke-dashoffset="-55.55"/>
        <circle cx="21" cy="21" r="15.92" fill="transparent" 
            stroke="OrangeRed" 
            stroke-width="3" 
            stroke-dasharray="calc((3/386) * 100) calc(100 - ((3/386) * 100))" 
            stroke-dashoffset="-58.4"/>
        <circle cx="21" cy="21" r="15.92" fill="transparent" 
            stroke="MediumPurple" 
            stroke-width="3" 
            stroke-dasharray="calc((61/386) * 100) calc(100 - ((61/386) * 100))" 
            stroke-dashoffset="-59.185"/>
        <text text-anchor = "middle" x="250" y="0" fill="black" font-size="small">Total Occurances of Images</text>
    </svg>
    
</xsl:stylesheet>