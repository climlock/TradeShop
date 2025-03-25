<!doctype html>
<html lang="uk">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>TradeShop - Створити оголошення</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .create-btn {
            background-color: #0d6efd;
            color: white;
            border: 1px solid #0d6efd;
            transition: all 0.2s ease;
        }
        .create-btn:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }
        .card {
            border-radius: 16px;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm mb-4">
    <div class="container">
        <a class="navbar-brand fw-bold" href="/">TradeShop</a>
        <div>
            <span class="me-3 fw-semibold">Вітаємо, ${currentUser.name}</span>
            <a href="/product/create" class="btn btn-primary btn-sm ms-2">Створити оголошення</a>
            <form action="/logout" method="post" class="d-inline ms-2">
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <button type="submit" class="btn btn-outline-danger btn-sm">Вийти з акаунту</button>
            </form>
        </div>
    </div>
</nav>

<#if currentUser.email??>
    <div class="container">
        <div class="card p-4 shadow mx-auto" style="max-width: 700px;">
            <h4 class="mb-4">Створити нове оголошення</h4>
            <form action="/product/create-new" method="post" enctype="multipart/form-data">
                <div class="mb-3">
                    <label class="form-label">Назва товару</label>
                    <input type="text" class="form-control" name="title" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Опис товару</label>
                    <textarea class="form-control" name="description" rows="3" required></textarea>
                </div>
                <div class="mb-3">
                    <label class="form-label">Ціна</label>
                    <input type="number" class="form-control" name="price" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Місто</label>
                    <input type="text" class="form-control" name="city" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Завантажити фото (до 7 штук)</label>
                    <#list 1..7 as i>
                        <input type="file" class="form-control mb-2" name="file${i}">
                    </#list>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <button type="submit" class="btn create-btn w-100">Створити товар</button>
            </form>
        </div>
    </div>
</#if>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
