class PagesController < ApplicationController
  def home
  end

  def works
    @works = Work.all
  end

  def show
  end

  def contact
  end
end
