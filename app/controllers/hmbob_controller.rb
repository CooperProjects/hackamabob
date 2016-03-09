class HmbobController < ApplicationController
    
  def display
   @websites = Website.all
  end
end
