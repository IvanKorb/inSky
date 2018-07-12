<#import "parts/common.ftl" as c>

<@c.page>


<a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
    Add new file
</a>
<div class="collapse" id="collapseExample">
    <div class="form-group mt-3">
        <form method="post" enctype="multipart/form-data">
            <div class="form-group">
                <input type="text" class="form-control" name="text" placeholder="Введите сообщение" />
            </div>
            <div class="form-group">
                <input type="text" class="form-control" name="tag" placeholder="Тэг">
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file" id="customFile">
                    <label class="custom-file-label" for="customFile">Choose file</label>
                </div>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <div class="form-group">
                <button type="submit" class="btn btn-primary">Добавить</button>
            </div>
        </form>
    </div>
</div>

 <h4 class="mt-3">Список файлов</h4>
<div class="form-row">
    <div class="form-group col-md-6">
        <form method="get" action="/main" class="form-inline">
            <input type="text" name="filter" class="form-control" value="${filter?ifExists}" placeholder="Search by tag">
            <button type="submit" class="btn btn-primary ml-2">Search</button>
        </form>
    </div>
</div>




  <table class="table mt-3 table-bordered table-hover">
      <thead class="thead-dark">
      <tr>
          <th scope="col">id</th>
          <th scope="col">Text</th>
          <th scope="col">Tag</th>
          <th scope="col">Author</th>
          <th scope="col">Filename</th>
          <th scope="col">Time</th>
          <th scope="col">Edit</th>
      </tr>
      </thead>
      <tbody>
    <#list messages as message>
      <tr>
          <td scope="row">${message.id}</td>
          <td scope="row">${message.text}</td>
          <td scope="row">${message.tag}</td>
          <td scope="row">${message.authorName}</td>
          <td scope="row">
              <#if message.filename??>
              ${message.getFilename()}
                  <#else>
                  No information
          </#if></td>
          <td scope="row">Time download</td>
          <td><a href="/user/${message.id}">edit</a> <a href="/user/${message.id}">download</a> <a href="/user/${message.id}">delete</a></td>
      </tr>
    <#else >
No messages
    </#list>
      </tbody>
  </table>



</@c.page>