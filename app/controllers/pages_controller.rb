class PagesController < ApplicationController
  before_action :set_filter, only: %i[ filter ]
  
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

  def filter
    @tasks = current_user.tasks.where(id: params[:tasks_id]).search_filter(params[:filter])
  end

  private

  def set_filter 
    @filt_selected = params[:filt_selected] ? params[:filt_selected] : -1
  end
end
