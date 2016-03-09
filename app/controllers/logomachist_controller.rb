class LogomachistController < ApplicationController
  def index
   @glossaries = Glossary.all
  end
end