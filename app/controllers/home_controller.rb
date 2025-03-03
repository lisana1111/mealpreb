class HomeController < ApplicationController
 
  def index
    @planer = Weeklyplaner.first
  end 
end