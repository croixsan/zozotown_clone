$(function(){
  function buildHtml(){
    var html = `
    <input type="text" class="input_day">
    <input type="text" class="input_hour">
    `
    return html
  }
  $('#card_payment').on('click', function(){
    $(".card_table").css("display","block")
  })

  $('.other_payment').on('click', function(){
    $(".card_table").css("display","none")
  })

  $('.table_left').on('click', '#select_date', function(){
    $(".select_form").css("display","block")
  })

  $('.table_left').on('click', '.other_date', function(){
    $(".select_form").css("display","none")
  })

})
