Spree::ProductsController.class_eval do
	before_filter :user_subscribes, only: :show

private
	def user_subscribes
		@user_subscribes = spree_current_user.subscribes.collect(&:variant_id) if spree_user_signed_in?
	end
end