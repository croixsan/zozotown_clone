$(function() {

var search_list = $("#header__wrapper__left__search__incremental__area");

  function appendProduct(search) {
    var html = `<div id= "header__wrapper__left__search__incremental" class="search_result">
                   <ul>
                     <li>
                       <a href="/searches/result?keyword=${search.name}">
                         ${ search.name }
                       </a>
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
        if(input == ""){
          search_list.empty();
        }
      });
    })
  });
});
