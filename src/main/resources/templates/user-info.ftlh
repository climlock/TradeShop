<!DOCTYPE html>
<html>
<head>
    <title>TradeShop</title>
</head>
<body>
<h1>
    TradeShop
</h1>
<h3>Особиста інформація користувача ${user.name}</h3>
<b>Номер телефону:</b> ${user.phoneNumber}<br>
<b>Email:</b> ${user.email}<br>
<h4>
    Оголошення користувача
</h4>
<#list products as product>
    <div>
        <img src="/images/${product.previewImageId}" height="200px" width="200px" style="object-fit: cover"/><br><br>
        <p><b>${product.title}</b> ${product.price} грн. | <a href="/product/#{product.id}">Детальніше..</a> </p>
    </div>
    <#else>
    <h3>Ще немає оголошень</h3>
</#list>

</body>

</html>