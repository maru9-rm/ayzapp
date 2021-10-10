class ReportsController < ApplicationController
    before_action :set_report, only: [:show]
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    
    def index
      @reports = Report.all
    end

    def show
      @comments = @report.comments
    end

    def new
      @report = current_user.reports.build
    end
    
    def create
      @report = current_user.reports.build(report_params)
      if @report.save
        redirect_to report_path(@report), notice: '保存に成功しました'
      else
        flash.now[:error] = '保存に失敗しました'
        render :new
      end
    end

    def edit
      @report = current_user.reports.find(params[:id])
    end

    def update
      @report = current_user.reports.find(params[:id])
      if @report.update(report_params)
        redirect_to report_path(@report), notice: '更新できました'
      else
        flash.now[:error] = '更新できませんでした'
        render :edit
      end
    end
  

    def destroy
      report = current_user.reports.find(params[:id])
      report.destroy!
      redirect_to root_path, notice: '削除に成功しました'
    end
  
  
    private
    def report_params
      params.require(:report).permit(:title, :content, :eyecatch)
    end

    def set_report
      @report = Report.find(params[:id])
    end

end