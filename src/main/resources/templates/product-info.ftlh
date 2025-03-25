<!DOCTYPE html>
<html lang="uk">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>TradeShop - Перегляд товару</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .product-card {
            max-width: 1500px;
            margin: 30px auto;
            padding: 20px;
            border-radius: 16px;
            background-color: #fff;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
            width: 100%;
        }
        .carousel-inner img {
            border-radius: 10px;
            object-fit: contain;
            width: 100%;
            height: auto;
            max-height: 500px;
        }
        .product-title {
            font-size: 1.8rem;
            font-weight: bold;
            margin-top: 15px;
            color: #212529;
        }
        .price-display {
            font-size: 2rem;
            font-weight: bold;
            color: #0d6efd;
            margin-top: 20px;
        }
        .description-box {
            border-top: 1px solid #dee2e6;
            margin-top: 15px;
            padding-top: 15px;
        }
        .contact-btn {
            background-color: #0d6efd;
            color: white;
            transition: all 0.2s ease;
        }
        .contact-btn:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }
        .phone-number {
            background-color: #e9f5ff;
            border: 1px solid #0d6efd;
            color: #0d6efd;
            border-radius: 8px;
            padding: 10px;
            text-align: center;
            font-weight: bold;
            font-size: 1.2rem;
            transition: all 0.3s ease;
        }
        .container {
            max-width: 1400px;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm mb-4">
    <div class="container">
        <a class="navbar-brand fw-bold" href="/">TradeShop</a>
        <div>
            <#if user.email??>
                <a href="/product/create/" class="btn btn-primary btn-sm ms-2">Створити оголошення</a>
                <form action="/logout" method="post" class="d-inline ms-2">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <button type="submit" class="btn btn-outline-danger btn-sm">Вийти з акаунту</button>
                </form>
                <#else>
                    <a href="/login" class="btn btn-primary">Увійти в обліковий запис</a>
            </#if>
        </div>
    </div>
</nav>

<div class="container">
    <div class="product-card">
        <h3 class="fw-bold mb-4">Інформація про товар</h3>
        <div class="row">
            <div class="col-md-6">
                <div id="carouselExample" class="carousel slide">
                    <div class="carousel-inner">
                        <#list images as img>
                            <div class="carousel-item <#if img?index == 0>active</#if>">
                                <img src="/images/${img.id}" class="d-block w-100" alt="Фото товару">
                            </div>
                        </#list>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
                <div class="price-display">${product.price} грн</div>
                <div class="description-box">
                    <p><strong>Опис товару:</strong> ${product.description}</p>
                </div>
            </div>
            <div class="col-md-6">
                <div class="product-title text-primary" style="font-size: 2rem; font-weight: bold; margin-bottom: 20px;">${product.title}</div>
                <p><strong>Місто:</strong> ${product.city}</p>
                <p><strong>Продавець:</strong> <a href="/user/${product.user.id}">${product.user.name}</a></p>
                <button id="show-phone-btn" onclick="showPhone()" class="btn contact-btn w-100 mt-3">📞 Показати номер телефону</button>
                <div id="phone-container" style="display: none;" class="mt-3">
                    <div class="phone-number">${product.user.phoneNumber}</div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function showPhone() {
        document.getElementById('show-phone-btn').style.display = 'none';
        document.getElementById('phone-container').style.display = 'block';
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
