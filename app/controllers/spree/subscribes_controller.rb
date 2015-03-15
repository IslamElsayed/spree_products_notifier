module Spree
  class SubscribesController < Spree::BaseController
    before_filter :load_variant

    def create
      subscribe = Spree::Subscribe.new
      subscribe.user = spree_current_user
      subscribe.variant = @variant
      subscribe.save

      redirect_to product_path(@variant.product)
    end

    private

      def load_variant
      	@variant = Spree::Variant.find(params[:variant_id])
      end
  end
end