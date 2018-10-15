$(function(){
  $('.point-btn').on('click', function(){
    use_point = $(".point_form").val();
    current_point = Number($(".current_point").text())
    coupon_point = Number($(".coupon_price").text().replace(",", "").match(/\d+/))
    item_price = Number($(".payment-total-num").text().replace(",", "").match(/\d+/)[0]);

    if (use_point.match(/[^0-9]+/) == null) {
      use_point = Number(use_point);
      if(use_point > current_point){
        $(".point_form").val(0);
        alert("0 ~ " + String(current_point) + "の範囲で入力してください")
      }else if(use_point > item_price){
        $(".point_form").val(0);
        alert("0 ~ " + String(item_price) + "の範囲で入力してください")
      }else {
        // 「クーポン・ポイント欄」の表示を変更
        $(".point-price").empty();
        $(".point-price").append(`<a>-${use_point}pt</a>`);
        // 「合計欄」の表示を変更
        delivery_price = Number($(".payment-option-delivery-price").text().replace(",", "").match(/\d+/)[0]);
        payment_price = Number($(".payment-price").text().replace(",", "").match(/\d+/)[0]);
        total_price = item_price + delivery_price + payment_price - use_point - coupon_point

        final_price = "￥" + String(total_price).replace(/(\d)(?=(\d\d\d)+$)/g, "$1,");
        $(".payment-option-total-price").empty();
        $(".payment-option-total-price").append(`<a>${final_price}</a>`);
      }
    }else {
      $(".point_form").val(0);
      alert("半角英数字を入力してください");
      $(".coupon_price").empty();
      $(".coupon_price").append(`<a>￥${coupon_point}</a>`);
    }
  })
})
