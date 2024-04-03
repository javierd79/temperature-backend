# frozen_string_literal: true

Rails.application.routes.draw do
  get 'refresh', to: 'application#refresh'

  resources :devices
  resources :archives do
    get 'last', on: :collection
  end 
  resources :logs do
    get 'last', on: :collection
  end
end
