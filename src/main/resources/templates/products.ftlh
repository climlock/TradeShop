<!DOCTYPE html>
<html lang="uk">
<head>
    <meta charset="UTF-8">
    <title>TradeShop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
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
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm mb-4">
    <div class="container">
        <a class="navbar-brand" href="/">TradeShop</a>
        <div>
            <#if user.email??>
                <span class="me-3 fw-semibold">Вітаємо, ${user.name}</span>
                <a href="/product/create/" class="btn btn-primary btn-sm ms-2">Створити оголошення</a>
                <form action="/logout" method="post" class="d-inline">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <button type="submit" class="btn btn-outline-danger btn-sm">Вийти з акаунту</button>
                </form>
                <#if user.isAdmin()>
                    <a href="/admin" class="btn btn-outline-primary btn-sm ms-2">Адмін панель</a>
                </#if>
            <#else>
                <a href="login" class="btn btn-primary">Увійти в обліковий запис</a>
            </#if>
        </div>
    </div>
</nav>

<div class="container">
    <h4 class="mb-4">Шукайте будь-які товари з усієї території України</h4>

    <form class="d-flex mb-5" action="/search" method="get">
        <input class="form-control me-2" type="text" name="title" placeholder="Пошук товарів...">
        <button class="btn btn-primary" type="submit">Пошук</button>
    </form>

    <div class="row">
        <#list products as product>
            <div class="col-md-4 mb-4">
                <div class="card shadow-sm">
                    <img src="images/${product.previewImageId}" class="card-img-top" alt="${product.title}">
                    <div class="card-body">
                        <h5 class="card-title">${product.title}</h5>
                        <p class="card-text fw-bold">${product.price} грн</p>
                        <a href="/product/${product.id}" class="btn btn-outline-primary w-100">Детальніше</a>
                    </div>
                </div>
            </div>
        <#else>
            <h5 class="text-center text-muted">Нічого не знайдено...</h5>
        </#list>
    </div>

    <div class="text-center mt-4">
        <a href="/test-page" class="btn btn-secondary">Тестова Кнопка</a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
