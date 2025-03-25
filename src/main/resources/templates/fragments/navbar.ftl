<style>
    body {
        background-color: #f8f9fa;
        font-family: 'Segoe UI', sans-serif;
    }
    .navbar-brand {
        font-weight: 700;
        font-size: 28px;
    }
    .card img {
        object-fit: contain;
        width: 100%;
        height: 250px;
        background-color: #f8f9fa;
    }
    .btn-outline-primary:hover {
        background-color: #0d6efd;
        color: white;
    }

</style>
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm mb-4">
    <div class="container">
        <a class="navbar-brand" href="/">TradeShop</a>

        <!-- Поисковая строка сразу в тулбаре -->
        <#if searchFild?? && searchFild>
            <form class="flex-grow-1 d-flex me-4" action="/search" method="get" style="width: 550px;">
                <input class="form-control me-2 w-100" type="text" name="title" placeholder="Пошук товарів...">
                <button class="btn btn-primary" type="submit">Пошук</button>
            </form>
        </#if>
<#--        <#if searchFild?? && searchFild>-->
<#--            <form class="d-flex me-auto ms-4" action="/search" method="get" style="width: 550px;">-->
<#--                <input class="form-control me-2" type="text" name="title" placeholder="Пошук товарів...">-->
<#--                <button class="btn btn-primary" type="submit">Пошук</button>-->
<#--            </form>-->
<#--        </#if>-->
        <div class="d-flex align-items-center">
            <#if currentUser.email??>
                <span class="me-3 fw-semibold">Вітаємо, ${currentUser.name}</span>
                <a href="/product/create/" class="btn btn-primary btn-sm ms-2">Створити оголошення</a>
                <form action="/logout" method="post" class="d-inline">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <button type="submit" class="btn btn-outline-danger btn-sm ms-2">Вийти з акаунту</button>
                </form>
                <#if currentUser.isAdmin()>
                    <a href="/admin" class="btn btn-outline-primary btn-sm ms-2">Адмін панель</a>
                </#if>
            <#else>
                <a href="/login" class="btn btn-primary">Увійти в обліковий запис</a>
            </#if>
        </div>
    </div>
</nav>