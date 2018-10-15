$(function(){
  if ($(".coupon_price_text")){
    price = $(".coupon_price_text").text().replace(",", "").match(/\d+/)
    if(price){
      coupon = Number(price[0])
      switch (coupon) {
      case 1000:
        $(".coupon_header").addClass("coupon-color-one")
        $(".coupon_today_text").addClass("coupon-color-one")
        break;
      case 2000:
        $(".coupon_header").addClass("coupon-color-two")
        $(".coupon_today_text").addClass("coupon-color-two")
        break;
      case 3000:
        $(".coupon_header").addClass("coupon-color-three")
        $(".coupon_today_text").addClass("coupon-color-three")
        break;
      case 4000:
        $(".coupon_header").addClass("coupon-color-four")
        $(".coupon_today_text").addClass("coupon-color-four")
        break;
      case 5000:
        $(".coupon_header").addClass("coupon-color-five")
        $(".coupon_today_text").addClass("coupon-color-five")
        break;
      }
    }
  }
})
