class SomeController < ApplicationController
  if RAILS_ENV == "development"
    def method_missing(name, *args)
      render(inline: %{
<h2>Unknown action: #{name}</h2>
Here are the request parameters:<br/>
<%= debug(params) %> })
    end
  end
end
