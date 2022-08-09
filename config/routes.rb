Rails.application.routes.draw do
  get 'games/current_week', to: 'games#current_week'
end
