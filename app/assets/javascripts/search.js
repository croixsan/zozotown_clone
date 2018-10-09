$(function() {

var search_list = $("#header__wrapper__left__search__incremental__area");

  function appendProduct(brand) {
     var html = `<div id= "header__wrapper__left__search__incremental">
                   <ul>
                     <li>
                       <a>
                         ${ brand.name }
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
   .done(function(brands) {
      $("#header__wrapper__left__search__incremental__area").empty();
        brands.forEach(function(brand){
          appendProduct(brand);
      });
    })
    .fail(function() {
      alert('映画検索に失敗しました');
    })
  });
});
