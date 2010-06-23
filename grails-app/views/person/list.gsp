
<%@ page import="com.grailskit.Person" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
														<th>&nbsp;</th>
                        
                            <g:sortableColumn property="username" title="${message(code: 'person.username.label', default: 'Username')}" />
                        
                            <g:sortableColumn property="email" title="${message(code: 'person.email.label', default: 'Email')}" />
                            <g:sortableColumn property="accountConfirmed" title="${message(code: 'person.enabled.label', default: 'Enabled?')}" />
                        
                            <g:sortableColumn property="accountConfirmed" title="${message(code: 'person.accountConfirmed.label', default: 'Confirmed?')}" />
                            <g:sortableColumn property="passwordExpired" title="${message(code: 'person.passwordExpired.label', default: 'Password Expired?')}" />
                            <g:sortableColumn property="accountExpired" title="${message(code: 'person.accountExpired.label', default: 'Expired?')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${personInstanceList}" status="i" var="personInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td>
														<g:link action="show" id="${personInstance.id}">show</g:link> | 
														<g:link action="edit" id="${personInstance.id}">edit</g:link> | 
														<g:link onClick="if(!confirm('Are you sure?')) { return false; }" action="delete" id="${personInstance.id}">delete</g:link> 
														</td>
                        
                            <td>${fieldValue(bean: personInstance, field: "username")}</td>
                        
                            <td>${fieldValue(bean: personInstance, field: "email")}</td>
                        
                            <td><g:formatBoolean boolean="${personInstance.accountConfirmed}" /></td>
                            <td><g:formatBoolean boolean="${personInstance.enabled}" /></td>
                        
                            <td><g:formatBoolean boolean="${personInstance.passwordExpired}" /></td>
                            <td><g:formatBoolean boolean="${personInstance.accountExpired}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${personInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
