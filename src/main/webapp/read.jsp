<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    </head>
    
    <body>
        
        <div class="container w-50">        
            <div class="text-center mt-3">
                <a type="button" class="btn btn-success" href="ServletController?r=index"><i class="bi bi-house-door-fill"></i></a>
            </div>
            <hr />

            <div class="fw-bold mb-3">
                <c:out value="${estudante.nome}" />
            </div>

            <table class="table table-striped">
                <tr>
                    <th>Cursos</th>                    
                </tr>
                <c:forEach var="curso" items="${estudante.cursos}">
                    <tr>
                        <td><c:out value="${curso.titulo}" /></td>
                    </tr>
                </c:forEach>
            </table>            
        </div>
        
    </body>
    
</html>