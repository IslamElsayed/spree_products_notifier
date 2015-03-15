Deface::Override.new(:virtual_path => "spree/products/_cart_form", 
			                     :name => "insert_notify_button", 
			                     :insert_after => "erb[silent]:contains('@product.variants.empty?')",
			                     :text => "
			                     <% if @user_subscribes.include?(@product.master.id) %>
			                     	<%= link_to 'Already subscribed for noticing', class: 'button' %><br/>
						  <% else %>			                     	
			                     	<%= link_to 'Notify me when available', subscribes_path(variant_id: @product.master.id), method: :post, class: 'button' %><br/>
						  <% end %>")

Deface::Override.new(:virtual_path => "spree/products/_cart_form", 
			                     :name => "insert_notify_button_for_each_variant", 
			                     :insert_after => "erb[silent]:contains('variant.can_supply?')",
			                     :text => "
			                     <% if @user_subscribes.include?(variant.id) %>
			                     	<%= link_to 'Already subscribed for noticing', class: 'button' %><br/>
						  <% else %>			                     	
			                     	<%= link_to 'Notify me when available', subscribes_path(variant_id: variant.id), method: :post, class: 'button' %><br/>
						  <% end %>")