<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<nav:resources/>
		<title><g:layoutTitle default="jobs" /></title>
		<link rel="stylesheet" href="http://yui.yahooapis.com/2.7.0/build/reset-fonts-grids/reset-fonts-grids.css" type="text/css">
		<link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
		<g:javascript library="application" />
		<g:layoutHead />
</head>
<body>
<div id="doc2" class="yui-t7">
   <div id="hd" role="banner">
	 <div class="headertext">
	 <span class="headertitle">
        ${grailsApplication.config.grailskit.siteName}
	 </span>
		<span class="headerlogin">
<gk:login security="${session.security}"/>
		</span>

	 </div>
	 </div>
   <div id="bd" role="main">
	<div id="yui-main">
	<div class="yui-b"><div class="yui-g">
	<!--
	<g:if test="${flash.message}">
	<div class="messages">${flash.message}</div>
	<% flash.message = null %>
	</g:if>
	<g:if test="${flash.errors}">
	<div class="errors">${flash.errors}</div>
	<% flash.errors = null %>
	</g:if>
	-->
	    <div id="menu">
					    </div>
        <g:layoutBody />
	<!-- YOUR DATA GOES HERE -->
	</div>
</div>
	</div>
	<div class="yui-b">
	<!-- YOUR NAVIGATION GOES HERE -->
	</div>
	
	</div>
   <div id="ft" role="contentinfo">
	 <p>built with grailsKit</p>
	 </div>
</div>
</body>
</html>
