class SearchesController < ApplicationController
  before_action :load_category, :load_tag, :load_user, :load_question, only: :show

  def index
    @questions = Question.with_associations.joins(:category, :user, :tags)
      .where("title like ? or categories.name like ? or users.name like ? or tags.name like ?",
        "%#{params[:term]}%", "%#{params[:term]}%", "%#{params[:term]}%", "%#{params[:term]}%")
  end

  def show
    @items = @category + @tag + @user + @question
    render json: @items.uniq.sort
  end

  private

  def load_category
    @category = Category.where("name like '%#{params[:term]}%'").collect(&:name)
  end

  def load_tag
    @tag = Tag.where("name like '%#{params[:term]}%'").collect(&:name)
  end

  def load_user
    @user = User.where("name like '%#{params[:term]}%'").collect(&:name)
  end

  def load_question
    @question = Question.where("title like '%#{params[:term]}%'").collect(&:title)
  end
end
