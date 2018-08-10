<#import "parts/common.ftl" as c>

<@c.page>


    <#include "parts/messageAdd.ftl">

 <h4 class="mt-3">Список файлов</h4>
<div class="form-row">
    <div class="form-group col-md-6">
        <form method="get" action="/main" class="form-inline">
            <input type="text" name="filter" class="form-control" value="${filter?ifExists}" placeholder="Поиск по тэгу">
            <button type="submit" class="btn btn-primary ml-2">Найти</button>
        </form>
    </div>
</div>



    <#include "parts/messageList.ftl">




</@c.page>