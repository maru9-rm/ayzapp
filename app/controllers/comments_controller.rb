class CommentsController < ApplicationController
    def new
      report = Report.find(params[:report_id])
      @comment = report.comments.build
    end



  def create
    report = Report.find(params[:report_id])
    @comment = report.comments.build(comment_params)
    if @comment.save
      redirect_to report_path(report), notice: 'コメントを追加'
    else
      flash.now[:error] = '更新できませんでした'
      render :new
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end