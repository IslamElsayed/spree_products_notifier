module Spree
  class SubscribeMailer < ActionMailer::Base
    def notify_email(user, product)
      subject = "#{Spree::Store.current.name} #{product.name} new stock"
      @product = product
      mail(to: user.email, from: from_address, subject: subject)
    end
  end
end
