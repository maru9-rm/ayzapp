class PointsController < ApplicationController
    before_action :authenticate_user!
  
    def create
      report = Report.find(params[:report_id])
      report.points.create!(user_id: current_user.id)
      redirect_to report_path(report)
    end

    def destroy
        report = Report.find(params[:report_id])
        point = report.points.find_by!(user_id: current_user.id)
    
        point.destroy!
        redirect_to report_path(report)
      end
  end