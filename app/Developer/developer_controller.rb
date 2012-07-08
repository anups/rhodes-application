require 'rho/rhocontroller'
require 'helpers/browser_helper'

class DeveloperController < Rho::RhoController
  include BrowserHelper

  # GET /Developer
  def index
    @developers = Developer.find(:all)
    render :back => '/app'
  end

  # GET /Developer/{1}
  def show
    @developer = Developer.find(@params['id'])
    if @developer
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Developer/new
  def new
    @developer = Developer.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Developer/{1}/edit
  def edit
    @developer = Developer.find(@params['id'])
    if @developer
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Developer/create
  def create
    @developer = Developer.create(@params['developer'])
    redirect :action => :index
  end

  # POST /Developer/{1}/update
  def update
    @developer = Developer.find(@params['id'])
    @developer.update_attributes(@params['developer']) if @developer
    redirect :action => :index
  end

  # POST /Developer/{1}/delete
  def delete
    @developer = Developer.find(@params['id'])
    @developer.destroy if @developer
    redirect :action => :index  
  end
end
