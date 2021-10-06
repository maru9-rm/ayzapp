class ReportsController < ApplicationController
    def index
      @reports = Report.all
    end

    def show
      @report = Report.find(params[:id])
    end

    def new
      @report = Report.new
    end
    
    def create
      @report = Report.new(report_params)
      if @report.save
        redirect_to report_path(@report), notice: '保存に成功しました'
      else
        flash.now[:error] = '保存に失敗しました'
        render :new
      end
    end
  
    private
    def report_params
      params.require(:report).permit(:title, :content)
    end
end