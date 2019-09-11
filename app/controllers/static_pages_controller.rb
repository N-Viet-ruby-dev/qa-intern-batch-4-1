class StaticPagesController < ApplicationController
  before_action :log_in_user, only: :home

  def home
    @questions = current_user.questions.with_associations
      .page(params[:page]).per(10)
  end
end
