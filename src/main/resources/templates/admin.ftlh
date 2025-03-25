<!DOCTYPE html>
<html>
<head>
    <title>TradeShop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, sans-serif;
        }
        .table th, .table td {
            vertical-align: middle;
            text-align: center;
        }
        .card {
            border-radius: 20px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
        }
        h1, h4 {
            font-weight: 700;
        }
    </style>
</head>
<body>
<div class="container my-5">
    <div class="card p-4">
        <div class="text-center mt-4">
            <h1>TradeShop</h1>
        </div>
        <hr>
        <h4>Адмін сторінка</h4>
            <table class="table table-striped table-bordered">
                <thead class="table-light">
                <tr>
                    <th>Email</th>
                    <th>Номер телефону</th>
                    <th>Статус</th>
                    <th>Роль</th>
                    <th>Ban/Unban</th>
                    <th>Деталі</th>
                    <th>Редагувати</th>
                </tr>
                </thead>
                <tbody>
                <#list users as user>
                    <tr>
                        <td>${user.email}</td>
                        <td>${user.phoneNumber}</td>
                        <td><#if user.active >True<#else>False</#if></td>
                        <td><#list user.roles as role>${role}<#sep>, </#list></td>
                        <td>
                            <form action="/admin/user/ban/${user.id}" method="post">
                                <input type="hidden" name="_csrf" value="${_csrf.token}">
                                <button type="submit" class="btn btn-danger btn-sm">Ban/Unban</button>
                            </form>
                        </td>
                        <td><a href="/user/${user.id}" class="btn btn-outline-info btn-sm">Детальніше</a></td>
                        <td><a href="/admin/user/edit/${user.id}" class="btn btn-outline-primary btn-sm">Редагувати</a></td>
                    </tr>
                <#else>
                    <h5 class="text-center text-muted">Користувачі відсутні</h5>
                </#list>
                </tbody>
            </table>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>