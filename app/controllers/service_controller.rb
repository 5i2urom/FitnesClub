class ServiceController < ApplicationController
  def show    
  end

  def act
    #@service = params[:service]
    p @service
  end

  def pool
    @service = 'pool'
  end

  def gym
    @service = 'gym'
  end

  def group
    @service = 'group'
  end

  def games
    @service = 'games'
  end

  def acts
    @act = params[:act]
    @service = params[:service]
    url = 'service/' + @service + '_acts/' + @act
    render url
  end
end
