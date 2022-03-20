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
        <div class="col-7">
            <h1>Изменить праметры опроса</h1>
        </div>
    </div>
</div>
<br>


    <div class="container">
        <div class="row justify-content-center">
            <div class="col-10">

                <#if quizEntity??>
                <form method="post" action="/saveRedactedQuiz">
                    <input type="hidden" value="${quizEntity.id}" name="id">
                    <span>Название</span><input class="form-control my-2" placeholder="Название опроса" type="text" id="name" name="name" value="${quizEntity.name}">
                    <span>Начало</span><input class="form-control my-2" type="date" id="dateStart" name="dateStart" value="${quizEntity.dateStart}">
                    <span>Конец</span><input class="form-control my-2" type="date" id="dateEnd" name="dateEnd" value="${quizEntity.dateEnd}">
                    <span>Описание</span><input class="form-control my-2" placeholder="Описание" type="text" id="annotation" name="annotation" value="${quizEntity.annotation}">

                    <input type="submit" id="send-quiz" class="btn btn-success mt-2" value="Сохранить">
                </form>
                <#else>
                    <div>Беда!</div>
                </#if>

            </div>
        </div>
    </div>



    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>