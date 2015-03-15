Spree::StockItem.class_eval do
  after_save :mail_variant_subscribes

  def mail_variant_subscribes
    subscribes = self.variant.subscribes
    if subscribes.any?
      subscribes_variants = Spree::Variant.where(id: subscribes.collect(&:variant_id))
      subscribes_products = Hash[Spree::Product.where(id: subscribes_variants.collect(&:product_id)).map { |i| [subscribes_variants.select{|v| v[:product_id] = i.id}.first.id, i] }]
      subscribes_users = Hash[Spree::User.where(id: subscribes.collect(&:user_id)).map { |i| [i.id, i] }]
      subscribes.each do |subscribe|
        Spree::SubscribeMailer.notify_email(subscribes_users[subscribe.user_id], subscribes_products[subscribe.variant_id]).deliver
      end
    end
  end
end