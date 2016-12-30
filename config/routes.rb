Rails.application.routes.draw do

  # 页面: 全部员工
  get 'bruce1234567' => 'person#index'
  # 页面: 全部结果
  get 'bruce7654321' => 'person#result'

  # 页面: 评分录入
  get 'record/create/:url_code' => 'record#create'
  # 动作: 评分提交
  post 'record/rate'
  # page: 单人评分记录
  get 'record/list/:id' => 'record#list'

  # 页面: 个人总结录入
  get 'annual_summary/new/:id' => 'annual_summary#new'
  # 动作: 个人总结提交
  post 'annual_summary/create'
  # 页面: 个人总结显示
  get 'annual_summary/show/:id' => 'annual_summary#show'

  # 页面: 部门总结录入入口页面
  get 'department/:department' => 'person#list'
  # 页面: 目标打分对象入口页面
  get 'rater/:code' => 'person#list_target'

  # 动作: 导出列表到excel
  get 'export/list.xlsx' => 'person#export_result_list', defaults: { format: 'xlsx' }
  # 页面: 个人报告
  get 'person/report/:code' => 'person#report_to_one'

  # 动作: 持久化评分结果
  get 'rate_result/write'
  # 页面: 个人报告及下载入口
  get '2016report/:code(.:format)' => 'rate_result#report'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'person#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
