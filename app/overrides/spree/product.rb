Deface::Override.new(virtual_path: "spree/admin/shared/_product_sub_menu", 
			                     name: "insert_admin_subscribes_tab", 
			                     insert_bottom: '[data-hook="admin_product_sub_tabs"]',
			                     original: 'fa06f66f980f6231b718c4c6ca8ff99099905a04',
			                     text:  "<%= tab :subscribes %>")

#