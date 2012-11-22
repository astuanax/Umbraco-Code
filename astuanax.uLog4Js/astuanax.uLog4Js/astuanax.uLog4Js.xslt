<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxml="urn:schemas-microsoft-com:xslt" xmlns:umbraco.library="urn:umbraco.library" version="1.0" exclude-result-prefixes="msxml umbraco.library">
  <xsl:output method="xml" omit-xml-declaration="yes"/>
  <xsl:param name="currentPage"/>
  <xsl:param name="pageid" select="/macro/pageid"/>
  <xsl:template match="/"><script type="text/javascript">"use strict";window.onerror=log;function log(m,u,l){ua=navigator.userAgent.split(/\s*[;)(]\s*/);loggerUrl="//localhost/base/uLog4Js/javascriptError/";now=new Date();parameters=escape(m)+"/"+<xsl:value-of select="$pageid"/>+"/"+encodeURIComponent(u.replace(/^http:\/\//g,"").replace(/(\/)/g,"_")).replace(/(\.)/g,"-")+"/"+escape(l)+"/"+escape(ua[0].replace(/\//g,"-")+";"+ua[3])+"/"+now.getFullYear()+"-"+now.getDate()+"-"+now.getDay()+"T"+now.getHours()+"_"+now.getMinutes()+"_"+now.getSeconds()+".aspx";new Image().src=loggerUrl+parameters;//return true}</script></xsl:template></xsl:stylesheet>
