module Admin
  class SchedulesController < Fae::BaseController
    before_action :adjust_enum, only: [:create, :update]
    
    def adjust_enum
      params[:schedule][:schedule_statuses_attributes] = params[:schedule][:schedule_statuses_attributes].each do |key, value|
        value["status"] = value["status"].to_i
      end
    end
  end
end
