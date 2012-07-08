require 'rho/rhocontroller'
require 'helpers/browser_helper'

class ProjectController < Rho::RhoController
  include BrowserHelper

  # GET /Project
  def index
    @projects = Project.find(:all)
    render :back => '/app'
  end

  # GET /Project/{1}
  def show
    @project = Project.find(@params['id'])
    if @project
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Project/new
  def new
    @project = Project.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Project/{1}/edit
  def edit
    @project = Project.find(@params['id'])
    if @project
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Project/create
  def create
    @project = Project.create(@params['project'])
    redirect :action => :index
  end

  # POST /Project/{1}/update
  def update
    @project = Project.find(@params['id'])
    @project.update_attributes(@params['project']) if @project
    redirect :action => :index
  end

  # POST /Project/{1}/delete
  def delete
    @project = Project.find(@params['id'])
    @project.destroy if @project
    redirect :action => :index  
  end
end
