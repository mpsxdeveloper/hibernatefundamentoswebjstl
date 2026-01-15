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
            <div>
                <a type="button" class="btn btn-primary mt-3" href="ServletController?r=new">
                    Cadastrar Estudante <i class="bi bi-person-plus-fill"></i>
                </a>
                <a type="button" class="btn btn-success mt-3 float-end" href="ServletController?r=index">
                    <i class="bi bi-arrow-clockwise"></i>
                </a>
            </div>
            <hr />
        
            <form method="post" action="ServletController?r=search">
                <div class="input-group mb-3 w-50 float-end">            
                    <input type="text" class="form-control" name="nome" 
                           placeholder="Pesquisar por nome" required onblur="this.value=this.value.trim().toUpperCase();" />
                    <button type="submit" class="btn btn-primary">
                        Pesquisar <i class="bi bi-search"></i>
                    </button>

                </div>
            </form>
        
            <table class="table table-striped">
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th colspan="3">Ações</th>
                </tr>                
                <c:forEach var="estudante" items="${requestScope.estudantes}">
                    <tr>
                        <td><c:out value="${estudante.id}" /></td>
                        <td><c:out value="${estudante.nome}" /></td>
                        <td>
                            <a class="btn btn-danger" 
                               href="ServletController?r=delete&id=<c:out value="${estudante.id}" />">
                                Deletar <i class="bi bi-trash3-fill"></i>
                            </a>
                        <td>
                            <a class="btn btn-success" 
                               href="ServletController?r=read&id=<c:out value="${estudante.id}" />">
                                Ver Cursos <i class='bi bi-person-lines-fill'></i>
                            </a>
                        </td>                        
                        <td>
                            <a class="btn btn-warning" 
                                href="ServletController?r=edit&id=<c:out value="${estudante.id}" />">
                                Editar <i class="bi bi-pencil-square"></i>
                            </a>
                        </td>
                    </tr>
                </c:forEach>                
            </table>
            <c:if test="${requestScope.estudantes.size() == 0}">
                <div class="alert alert-danger text-end">
                    <c:out value="Não há registros na tabela ou a pesquisa não retornou resultados" />
                </div>
            </c:if>
        </div>
        
    </body>
    
</html>