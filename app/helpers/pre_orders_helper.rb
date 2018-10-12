module PreOrdersHelper
  def get_delivery_days
    now = Time.current
    delivery_days = (1..4).map do |i|
      [(now + i.days).strftime("%m月%d日"), (now + i.days)]
    end
  end

  def get_delivery_hours
     delivery_hours = [["午前中", "午前中"], ["14:00〜16:00"], ["16:00〜18:00"], ["18:00〜20:00"]]
  end
end
