<#import  "parts/common.ftl" as c>

<@c.page>
    Список пользователей

<table class="table table-hover">
    <thead class="thead-dark">
    <tr>
        <th scope="col">№ Id</th>
        <th scope="col">Имя</th>
        <th scope="col">Роль</th>
        <th scope="col">Действие</th>
    </tr>
    </thead>
    <tbody>
    <#list users as user>
    <tr>
        <td scope="row">#{user.id}</td>
        <td scope="row">${user.username}</td>
        <td scope="row"><#list user.roles as role>${role}<#sep>, </#list></td>
        <td scope="row"><a href="/user/${user.id}">edit</a></td>
    </tr>
    </#list>
    </tbody>
</table>
</@c.page>