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
            <div class="row mt-5">
                <div class="col-6 text-center">
                    <div class="alert alert-danger">
                        <h2>Erro 404</h2>
                        <p class="text-start">
                            Possíveis causas:
                        <ul class="text-start">
                            <li>A página/recurso que você tentou acessar não existe mais</li>
                            <li>Sobrecarga no servidor JSP. Tente novamente mais tarde</li>
                        </ul>                        
                        </p>
                        <hr />
                    </div>
                </div>
                <div class="col-6 text-center">
                    <i class="bi bi-question-square-fill" style="font-size: 5rem;"></i>
                    <h3>Página não encontrada</h3>
                </div>
            </div>
        </div>
        
    </body>
    
</html>