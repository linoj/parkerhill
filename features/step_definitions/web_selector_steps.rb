# ref: http://bjeanes.com/2010/09/19/selector-free-cucumber-scenarios

When /^(.*) within ([^:"]+)$/ do |step, scope| #"
  with_scope(selector_for(scope)) do
    When step
  end
end

# Multi-line version of above
When /^(.*) within ([^:"]+):$/ do |step, scope, table_or_string| #"
  with_scope(selector_for(scope)) do
    When "#{step}:", table_or_string
  end
end
