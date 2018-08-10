<#include  "security.ftl">
<table class="table mt-3 table-bordered table-hover">
    <thead class="thead-dark">
    <tr>

        <th scope="col">Текст</th>
        <th scope="col">Тэг</th>
        <th scope="col">Автор добавления</th>
        <th scope="col">Название файла</th>
        <th scope="col">Дата загрузки</th>
        <th scope="col">Действия над файлом</th>
    </tr>
    </thead>
    <tbody>
    <#list messages as message>
    <tr>

        <td scope="row">${message.text}</td>
        <td scope="row">${message.tag}</td>
        <td scope="row">${message.authorName}</td>
        <td scope="row">
              <#if message.filename??>
                  ${message.getFilename()}
              <#else>
                  Файл отсутсвует
              </#if></td>
        <td scope="row">
               <#if message.dateTime??>
                   ${message.dateTime}
               <#else>
               Дата загрузки
               </#if></td>
    <td>
            <#if message.author.id == currentUserId>
                <a class="btn btn-warning" href="/user-messages/${message.author.id}?message=${message.id}">
                    Редактировать
                </a>
                <a href="/message/${message.id}/download" class="btn btn-success">Скачать</a>
                <a href="/message/${message.id}/delete" class="btn btn-danger">Удалить</a></td>

    <#else >
              <a href="/message/${message.id}/download" class="btn btn-success">Скачать</a>
            </#if>
    </tr>
    <#else >
No messages
    </#list>
    </tbody>
</table>