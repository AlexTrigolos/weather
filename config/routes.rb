# frozen_string_literal: true

Rails.application.routes.draw do
  root 'health#status', defaults: { format: :json }
  resource :weather, defaults: { format: :json }, only: [] do
    collection do
      get :current
      get :by_time
      get :historical

      resource :historical, controller: :weathers, only: [] do
        get :max
        get :min
        get :avg
      end
    end
  end

  get '/health', to: 'health#status', defaults: { format: :json }
end
