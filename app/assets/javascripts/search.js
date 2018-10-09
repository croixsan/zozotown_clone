$(function() {

var search_list = $("#header__wrapper__left__search__incremental__area");

  function appendProduct(search) {
     var html = `<div id= "header__wrapper__left__search__incremental">
                   <ul>
                     <li>
                       <a>
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
      console.log(searches)
      $("#header__wrapper__left__search__incremental__area").empty();
        searches.forEach(function(search){
          appendProduct(search);
      });
    })
    // .fail(function() {
    //   alert('映画検索に失敗しました');
    // })
  });
});
