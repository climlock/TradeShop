<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<#assign searchFild=true>
<#include "fragments/navbar.ftl">


<div class="container mt-4">
    <div class="row">
        <!-- Блок з особистою інформацією -->
        <div class="col-md-4">
            <div class="card shadow-sm mb-4">
                <div class="card-body text-center">
                    <h4 class="card-title mb-3">Особиста інформація</h4>
                    <h5 class="fw-bold">${profileUser.name}</h5>
                    <p class="mb-1"><strong>Телефон:</strong> ${profileUser.phoneNumber}</p>
                    <p class="mb-3"><strong>Email:</strong> ${profileUser.email}</p>
                    <a href="/" class="btn btn-outline-primary btn-sm">На головну</a>
                </div>
            </div>
        </div>

        <!-- Блок з оголошеннями користувача -->
        <div class="col-md-8">
            <h4 class="mb-4">Оголошення користувача</h4>
            <div class="row">
                <#list products as product>
                    <div class="col-md-6 mb-4">
                        <div class="card shadow-sm h-100">
                            <img src="/images/${product.previewImageId}" class="card-img-top" alt="${product.title}" style="height:200px; object-fit:cover;">
                            <div class="card-body d-flex flex-column">
                                <h5 class="card-title">${product.title}</h5>
                                <p class="card-text fw-bold">${product.price} грн</p>
                                <a href="/product/${product.id}" class="btn btn-outline-primary mt-auto">Детальніше</a>
                            </div>
                        </div>
                    </div>
                <#else>
                    <p class="text-muted">Ще немає оголошень</p>
                </#list>
            </div>
        </div>
    </div>
</div>

<#--<h3>Особиста інформація користувача ${user.name}</h3>-->
<#--<b>Номер телефону:</b> ${user.phoneNumber}<br>-->
<#--<b>Email:</b> ${user.email}<br>-->
<#--<h4>-->
<#--    Оголошення користувача-->
<#--</h4>-->
<#--<#list products as product>-->
<#--    <div>-->
<#--        <img src="/images/${product.previewImageId}" height="200px" width="200px" style="object-fit: cover"/><br><br>-->
<#--        <p><b>${product.title}</b> ${product.price} грн. | <a href="/product/#{product.id}">Детальніше..</a> </p>-->
<#--    </div>-->
<#--    <#else>-->
<#--    <h3>Ще немає оголошень</h3>-->
<#--</#list>-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>