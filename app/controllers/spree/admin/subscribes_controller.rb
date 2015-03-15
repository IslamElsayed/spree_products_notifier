module Spree
  module Admin
    class SubscribesController < Spree::BaseController
      before_filter :load_variant, except: [:index, :destroy]
      helper Spree::StoreHelper
    	
      def index
        @subscribes = collection
        @variants = Hash[Spree::Variant.where(id: @subscribes.collect(&:variant_id)).map { |i| [i.id, i]  }]
        render layout: 'spree/layouts/admin'
      end

      def destroy
        @subscribe = Subscribe.find(params[:id])
        @subscribe.destroy

        flash[:success] = Spree.t('notice_messages.subscribe_deleted')
        respond_with(@product) do |format|
          format.js   { render :partial => "spree/admin/shared/destroy" }
        end
      end

      private

      def load_variant
      	 @variant = Spree::Variant.find(params[:variant_id])
      end

      def collection
        params[:q] ||= {}
        @search = Spree::Subscribe.ransack(params[:q])
        @collection = @search.result.includes([:variant, :user]).page(params[:page]).per(params[:per_page])
      end
    end
  end
end