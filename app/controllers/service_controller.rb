class ServiceController < ApplicationController
  include ServiceHelper

  def show    
  end

  def act
    @record = ServiceAct.new(service: params[:service])
  end


  # def pool
  #   @service = 'pool'
  # end

  # def gym
  #   @service = 'gym'
  #   p @record
  # end

  # def group
  #   @service = 'group'
  # end

  # def games
  #   @service = 'games'
  # end

  def acts
    @act = params[:act]
    @service = params[:service]
    url = 'service/' + @service + '_acts/' + @act
    render url
  end
end
