<!DOCTYPE html>
<html lang="uk">
<head>
    <meta charset="UTF-8">
    <title>TradeShop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
<#include "fragments/navbar.ftl">

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
