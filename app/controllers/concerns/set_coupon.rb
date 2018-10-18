module SetCoupon
  extend ActiveSupport::Concern
  included do
    def set_coupon
      # クーポン機能
      if Coupon.exists?
        @coupon = Coupon.first
        @coupon_shops = Coupon.all.includes(:shop).map{|coupon| coupon.shop}
      end
    end
  end
end
