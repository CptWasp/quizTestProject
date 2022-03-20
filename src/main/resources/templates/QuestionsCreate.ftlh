<html lang="ru">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <title>Админ Главная страница</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
            <h1>Праметры опроса</h1>
        </div>
    </div>
</div>
<br>


    <div class="container">
        <div class="row justify-content-center">
            <div class="col-6">
                    <span class="my-2">Название: ${quizEntity.name}</span><br>
                    <span class="my-2">Начало: ${quizEntity.dateStart}</span><br>
                    <span class="my-2">Конец: ${quizEntity.dateEnd}</span><br>
                    <span class="my-2">Описание: ${quizEntity.annotation}</span><br>
            </div>
        </div>
    </div>


<br>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-7">
            <h1>Вопросы</h1>
        </div>
    </div>
</div>

<br>


    <div class="container">
        <div class="row justify-content-center">
            <div class="col-7">
                <form action="/saveQuestion" id="myForm" method="post">
                    <input id="quiz" type="hidden" value="${quiz}">
                    <span>Текст вопроса: </span><input id="questionText" class="form-control" name="questionText"/>
                    <br>
                    
                    <span>Тип ответа: </span> 
                    <div class="form-check">
                      <input class="form-check-input" type="radio" value="0" name="flexRadioDefault" id="flexRadioDefault1" checked>
                      <label class="form-check-label" for="flexRadioDefault1">
                        текстовый ответ
                      </label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input check" type="radio" value="1" name="flexRadioDefault" id="flexRadioDefault2">
                      <label class="form-check-label" for="flexRadioDefault2">
                        один ответ
                      </label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input check" type="radio" value="2" name="flexRadioDefault" id="flexRadioDefault2">
                      <label class="form-check-label" for="flexRadioDefault2">
                        несколько ответов
                      </label>
                    </div>
                    <br>
                    <br>
                    <div id="answers">
                        
                    </div>
                    <div id="answers-control">
                        
                    </div>
                </form>
            </div>
        </div>
    </div>

    
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-3">
                <input class="btn btn-secondary" type="button" value="Сохранить вопрос" id="save"> 
            </div>
        </div>
    </div>
    
    

<script>
    var answerArr = [];
    
    function saveAnswer(){
        $("#answers").append("<p>"+$("#answerText").val()+"</p>");
        answerArr.push($("#answerText").val());
        $("#answerText").empty();
    }
    
    
    $(".check").change(function(){
        $("#answers-control").empty();
        $("#answers-control").append("<input id='answerText' class='form-control' type='text'>");
        $("#answers-control").append("<br><input type='button' class='btn btn-danger' onclick='saveAnswer()' value='Сохранить ответ'>");
    });
</script>

    
    
<script>
    $("#save").on("click", function(){
        var myJsonString = JSON.stringify(answerArr);
        console.log(myJsonString);
        console.log($('input[name=radioName]:checked', '#myForm').val());
        $.ajax({
            url: "/saveQuestion",
            method: "POST",
            dataType: "JSON",
            data: { quizId: $("#quiz").val(), questionText: $("#questionText").val(),
            questionType: $('input[name=flexRadioDefault]:checked', '#myForm').val(), answersArray: myJsonString },
            success: function(data){
		        alert(data);
		    }
        });
    });
</script>



    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>