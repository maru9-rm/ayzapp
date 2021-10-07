class ReportsController < ApplicationController
    before_action :set_report, only: [:show, :edit, :update]
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    
    def index
      @reports = Report.all
    end

    def show
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

    def edit
    end

    def update
      if @report.update(report_params)
        redirect_to report_path(@report), notice: '更新できました'
      else
        flash.now[:error] = '更新できませんでした'
        render :edit
      end
    end
  

    def destroy
      report = Report.find(params[:id])
      report.destroy!
      redirect_to root_path, notice: '削除に成功しました'
    end
  
  
    private
    def report_params
      params.require(:report).permit(:title, :content)
    end

    def set_report
      @report = Report.find(params[:id])
    end

end