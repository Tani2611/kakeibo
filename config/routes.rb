Rails.application.routes.draw do
  # トップページ
  get "/" => "lists#index"
  get "list_category/:id" => "lists#list"
  post "list_new" => "lists#new"
  delete "list_delete/:id" => "lists#delete"
  
  
  # カテゴリー編集ページ
  get "category_edit" => "categories#edit"
  post "category_new" => "categories#new"
  delete "category_delete/:id" => "categories#delete"
  post "payment_new/:id" => "payments#new"
  delete "payment_delete/:id" => "payments#delete"


end
