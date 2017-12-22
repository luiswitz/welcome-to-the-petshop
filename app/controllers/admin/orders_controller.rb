module Admin
  class OrdersController < Fae::BaseController
    before_action :adjust_enum, only: [:create, :update]

    def adjust_enum
      params[:order][:status] = params[:order][:status].to_i
    end
  end
end
