Joshjordan::Application.routes.draw do
  get "(*redirect_path)", to: "batman#index", constraints: lambda { |request| request.format == "text/html" }
end
