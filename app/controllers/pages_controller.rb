class PagesController < ApplicationController
  def users_options
    @option = 'user'
  end

  def home
    @option = 'home'
  end

  def searcher
    @tasks = current_user.tasks.order(:due_date)
    @tasks = current_user.tasks.where('title ILIKE ?', "%#{params[:search]}%") unless params[:search].nil?
  end
end
