class NotificationsController < ApplicationController
  before_action :authenticate_user!

    def show
      user = User.first
      user_id = user.id
      @reports = Report.where(user_id: user_id)
    end
  end