<!DOCTYPE html>
<html>
<head>
    <title>TradeShop</title>
</head>
<body>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<div class="d-flex justify-content-center align-items-center vh-100">
    <div class="card p-4 shadow" style="width: 800px;">
        <h2 class="text-center mb-4">TradeSHOP</h2>
        <h4 class="text-center mb-4">Реєстрація</h4>
        <form action="registration" method="post">
            <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">Ім'я</label>
                <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="name">
            </div>
            <div class="mb-3">
                <label for="exampleInputPassword1" class="form-label">Номер телефону</label>
                <input type="text" class="form-control" id="exampleInputPassword1" name="phoneNumber">
            </div>
            <div class="mb-3">
                <label for="exampleInputPassword1" class="form-label">Email</label>
                <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="email">
                <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
            </div>
            <div class="mb-3">
                <label for="exampleInputPassword1" class="form-label">Пароль</label>
                <input type="password" class="form-control" id="exampleInputPassword1" name="password">
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <button type="submit" class="btn btn-primary btn-lg w-100">Створити акаунт</button>
            <div class="text-center mt-4">
                <a href="login">Вже є обліковий запис?</a>
                <#if errorMassage??>
                    <h2 STYLE="color: red">${errorMassage}</h2>
                </#if>
            </div>

        </form>

    </div>
</div>




<#--<form action="registration" method="post">-->
<#--    Ім'я: <input type="text" name="name">-->
<#--    Електронна адреса (email): <input type="email" name="email"><br><br>-->
<#--    Номер телефону: <input type="text" name="phoneNumber"><br><br>-->
<#--    Пароль: <input type="password" name="password"><br><br>-->
<#--    <input type="hidden" name="_csrf" value="${_csrf.token}">-->
<#--    <input type="submit" name="Створити обліковий запис">-->
<#--</form>-->


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>