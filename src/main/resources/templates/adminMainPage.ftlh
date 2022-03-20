<html lang="ru">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">    <title>Админ Главная страница</title>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <a class="navbar-brand" href="#">ОПрОсЫ)</a>
        <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/quizList">Главная</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Link</a>
                </li>
            </ul>

        </div>
    </div>
</nav>

<div class="container mt-2">
    <div class="row justify-content-center">
        <div class="col-12">
            <#if alert ??>
            <h6 class="alert alert-${alertType}">${alert}</h6>
            </#if>
        </div>
    </div>
</div>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-4">
            <h1>Список опросов</h1>
        </div>
    </div>
</div>
<br>


<div class="container">
    <div class="row">
        <div class="col-4">
            <div class="dropdown">
                <button class="btn btn-success dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-expanded="false">
                    Создать Опросы
                </button>
                <div class="dropdown-menu p-3" aria-labelledby="dropdownMenuButton">
                    <form method="post" action="/createQuiz">
                        <input class="form-control my-2" placeholder="Название опроса" type="text" id="name" name="name">
                        <input class="form-control my-2" type="date" id="dateStart" name="dateStart">
                        <input class="form-control my-2" type="date" id="dateEnd" name="dateEnd">
                        <input class="form-control my-2" placeholder="Описание" type="text" id="annotation" name="annotation">
                        
                        <input type="submit" id="send-quiz" class="btn btn-success mt-2" value="Создать опрос">
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<br>
    <div class="container">
        <div class="row">
            <div class="card-group">
                    <#if quizList??>
                    <#list quizList as quiz>
                        <div>
                        <div class="card m-2 shadow p-3 mb-5 bg-white rounde" style="width: 18rem;">
                          <div class="card-header">
                            ${quiz.name}
                          </div>
                          <ul class="list-group list-group-flush">
                            <li class="list-group-item">Начало: ${quiz.dateStart}</li>
                            <li class="list-group-item">Конец: ${quiz.dateEnd}</li>
                            <li class="list-group-item">Описание: ${quiz.annotation}</li>
                              <li class="list-group-item">
                                  <form method="get" action="/deleteQuiz/${quiz.id}">
                                    <input class="btn btn-danger mt-1" type="submit" value="Удалить">
                                  </form>
                                  <a class="btn btn-primary  mt-1" href="/redactQuiz/${quiz.id}">Измененить</a>
                                  <a class="btn btn-primary  mt-1" href="/createQuestion/${quiz.id}">Добавить вопросы в Опрос</a>
                              </li>
                          </ul>
                        </div>
                        </div>

                    </#list>
                    <#else>
                    <div>Совсем нет опросов( Создайте их</div>
                    </#if>
           </div>
    </div>
</div>




<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <#-- РЕАЛИЗАЦИЯ ЧЕРЕЗ REST, если потребудется -->
    <script>
    $("#send-quiz").on("click", function(){
        $.ajax({
            url: "/createQuiz",
            method: "POST",
            data: { name: $("#name").val(), dateStart: $("#dateStart").val(), dateEnd: $("#dateEnd").val(), annotation: $("#annotation").val()}
            success: function (resp) {
                alert(resp);
            },
            error: function (resp) {
                alert(resp);
            }
        });  
    });
</script>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
</body>
</html>