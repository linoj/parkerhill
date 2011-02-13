	# Switch the javascript_include_tag :defaults to
	# use jQuery instead of the default prototype helpers.
	# Also setup a :jquery expansion, just for good measure.
	# Written by: Logan Leger, logan@loganleger.com
	# http://github.com/lleger/Rails-3-jQuery

	ActionView::Helpers::AssetTagHelper.register_javascript_expansion :jquery => ['jquery-1.4.4.min', 'rails']
	ActiveSupport.on_load(:action_view) do
	  ActiveSupport.on_load(:after_initialize) do
	    ActionView::Helpers::AssetTagHelper::register_javascript_expansion :defaults => ['jquery-1.4.4.min', 'rails']
	  end
	end