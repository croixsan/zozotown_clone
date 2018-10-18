$(function() {

var search_list = $("#header__wrapper__left__search__incremental__area");

  function appendProduct(search) {
    var html = `<div id= "header__wrapper__left__search__incremental">
                   <ul>
                     <li>
                       <form method="get" name="form1" action="/searches/show">
                         <input type="hidden" name="keyword" value="${ search.name }">
                           <a href="/searches/show" class = "incremental-btn">${ search.name }</button>
                       </form>
                     </li>
                   </ul>
                 </div>`
    search_list.append(html);
  }

  $(".search-field").on("keyup", function() {
    var input = $(".search-field").val();
    $.ajax({
      type: 'GET',
      url: '/searches/index',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(searches) {
      $("#header__wrapper__left__search__incremental__area").empty();
      searches.forEach(function(search){
        appendProduct(search);
      });
    })
    .fail(function() {
      alert('検索に失敗しました');
    })
  });
});
