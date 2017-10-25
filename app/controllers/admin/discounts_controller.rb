module Admin
  class DiscountsController < Fae::BaseController
    before_action :adjust_enum, only: [:create, :update]
    
    def adjust_enum
      params[:discount][:discount] = params[:discount][:discount].to_i
    end
  end
end
