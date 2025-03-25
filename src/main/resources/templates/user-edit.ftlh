<!DOCTYPE html>
<html>
<head>
    <title>TradeShop</title>
</head>
<body>
<h1>TradeShop</h1>
<h3>Редагування користувача ${user.name}</h3>
<form action="/admin/user/edit" method="post">
    <#list roles as role>
        <div>
            <label><input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked","")}>${role}</label>
        </div>
    </#list>
    <input type="hidden" value="${user.id}" name="userId">
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <button type="submit">Зберегти</button>
    <br>
</form>
<form action="/admin/user/delete/${user.id}" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <button type="submit">Видалити акаунт</button>
</form>
</body>
</html>