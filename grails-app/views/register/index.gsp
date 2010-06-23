<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="${session.layout ?: grailsApplication.config.grailskit.layout}" />
        <title>Create a new account</title>
    </head>
    <body>
        <div class="body">
            <h1>Create a new account</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${user}">
            <div class="errors">
                <g:renderErrors bean="${user}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="register" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>

                             <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="user.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: user, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${user?.name}" />
                                </td>
                            </tr>
                       
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="username"><g:message code="user.username.label" default="Username" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: user, field: 'username', 'errors')}">
                                    <g:textField name="username" value="${user?.username}" />
                                </td>
                            </tr>
                        
                       
                       
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="password"><g:message code="user.password.label" default="Password" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: user, field: 'password', 'errors')}">
                                    <g:passwordField name="password" value="${user?.password}" />
                                </td>
                            </tr>

                             <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email"><g:message code="user.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: user, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${user?.email}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Register')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
