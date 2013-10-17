Joshjordan::Application.routes.draw do
  root to: 'proof_of_concept#show'
  get '/stream' => 'proof_of_concept#stream'
end
