module SetCart
  extend ActiveSupport::Concern
  included do
    def set_cart
      if user_signed_in?
        @cart = current_user.cart
        if @cart.items
          @cart_length = @cart.items.length
        else
          @cart_length = 0
        end
      end
    end
  end
end
