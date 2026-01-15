<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
        <title>JSP Page</title>
    </head>
    
    <body>
        
        <div class="container">        
            <h2 class="text-center mt-5">Novo Estudante e Cursos</h2>
            <div class="container w-50 mt-5 align-middle">
                <form method="post" action="ServletController?r=update">
                    <label class="form-label">ID:</label>
                    <input type="text" class="form-control" name="id" readonly value="<c:out value="${estudante.id}" />" />
                    <label class="form-label">Nome do estudante:</label>
                    <input type="text" class="form-control" name="nome" required onblur="this.value=this.value.trim().toUpperCase();" maxlength="50" value="<c:out value="${estudante.nome}" />" />                    
                    <c:set var="cursos" value="${estudante.cursos}" />
                    <label class="form-label">Curso (Pelo menos um curso deve ser preenchido):</label>
                    <input type="text" class="form-control" name="titulo1" required onblur="this.value=this.value.trim().toUpperCase();" maxlength="20" value="<c:out value="${cursos[0].titulo}" />" />
                    <c:choose>
                        <c:when test="${cursos.size() == 3}">
                            <label class="form-label">Curso:</label>
                            <input type="text" class="form-control" name="titulo2" onblur="this.value=this.value.trim().toUpperCase();" maxlength="20" 
                                value="<c:out value="${cursos[1].titulo}" />" />
                            <label class="form-label">Curso:</label>
                            <input type="text" class="form-control" name="titulo3" onblur="this.value=this.value.trim().toUpperCase();" maxlength="20" 
                                value="<c:out value="${cursos[2].titulo}" />" />
                        </c:when>
                        <c:when test="${cursos.size() == 2}">
                            <label class="form-label">Curso:</label>
                            <input type="text" class="form-control" name="titulo2" onblur="this.value=this.value.trim().toUpperCase();" maxlength="20" 
                                value="<c:out value="${cursos[1].titulo}" />" />
                            <label class="form-label">Curso:</label>
                            <input type="text" class="form-control" name="titulo3" onblur="this.value=this.value.trim().toUpperCase();" maxlength="20" />
                        </c:when>
                        <c:otherwise>
                            <label class="form-label">Curso:</label>
                            <input type="text" class="form-control" name="titulo2" onblur="this.value=this.value.trim().toUpperCase();" maxlength="20" />
                            <label class="form-label">Curso:</label>
                            <input type="text" class="form-control" name="titulo3" onblur="this.value=this.value.trim().toUpperCase();" maxlength="20" />
                        </c:otherwise>
                    </c:choose>
                    <button type="submit" class="btn btn-primary mt-3">Editar <i class="bi bi-pencil-square"></i></button>                
                </form>
                <hr />
                <div class="text-center">
                    <a type="button" class="btn btn-success" href="ServletController?r=index"><i class="bi bi-house-door-fill"></i></a>
                </div>
            </div>
        </div>
        
    </body>
    
</html>