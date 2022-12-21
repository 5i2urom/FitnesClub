class ServiceController < ApplicationController
  def show    
  end

  def pool
  end

  def gym
  end

  def pool_acts
    @act = params[:act]
    url = 'service/pool_acts/' + @act
    render url
  end
end
