$(function() {

var search_list = $("#header__wrapper__left__search__textfield");

  function appendProduct(brand) {
     var html = `<div class= "suggest">
                   <ul>
                     <li>
                       ${ brand.name }
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
     console.log(brands)
     if (brands.length !== 0) {
       brands.forEach(function(brand){
         appendProduct(brand);
       });
     }
     else {
       appendNoProduct("一致する映画はありません");
     }
   })

  });
});
