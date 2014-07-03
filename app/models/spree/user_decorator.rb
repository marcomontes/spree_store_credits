module Spree
  User.class_eval do
    has_many :store_credits

    def has_store_credit?(city)
      store_credits.where(city: city).present?
    end

    def store_credits_total(city)
      store_credits.where(city: city).sum(:remaining_amount)
    end
  end
end
