class TasksController < ApplicationController
    def new
      profile = current_user.profile
      @task = profile.tasks.build
    end



  def create
    profile = current_user.profile
    @task = profile.tasks.build(task_params)
    if @task.save
      redirect_to profile_path(profile), notice: 'コメントを追加'
    else
      flash.now[:error] = '更新できませんでした'
      render :new
    end
  end

  def destroy
    task = current_user.profile.tasks.find(params[:id])
    task.destroy!
    redirect_to root_path, notice: '削除に成功しました'
  end


  private
  def task_params
    params.require(:task).permit(:title)
  end
end