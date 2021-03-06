# coding: utf-8
class MissionsController < ApplicationController


  # GET /missions
  # GET /missions.json
  def index
    @missions = Mission.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @missions }
    end
  end

  # GET /missions/1
  # GET /missions/1.json
  def show
    @mission = Mission.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @mission }
    end
  end

  # GET /missions/new
  # GET /missions/new.json
  def new
    @mission = Mission.new(:convocationjours => [Convocationjour.new])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @mission }
    end
  end

  def form_prealloc
    @mission = Mission.new
  end

  # GET /missions/1/edit
  def edit
    @mission = Mission.find(params[:id])
  end

  # POST /missions
  # POST /missions.json
  def create
    @mission = Mission.new(params[:mission])

    respond_to do |format|
      if @mission.save
        format.html { redirect_to @mission, :notice => 'La mission est cree.' }
        format.json { render :json => @mission, :status => :created, :location => @mission }
      else
        format.html { render :action => "new" }
        format.json { render :json => @mission.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /missions/1
  # PUT /missions/1.json
  def update
    @mission = Mission.find(params[:id])

    respond_to do |format|
      if @mission.update_attributes(params[:mission])
        format.html { redirect_to @mission, :notice => 'Changements bien pris en compte' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @mission.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /missions/1
  # DELETE /missions/1.json
  def destroy
    @mission = Mission.find(params[:id])
    @mission.destroy

    respond_to do |format|
      format.html { redirect_to missions_url }
      format.json { head :ok }
    end
  end

  def demandespa
    redirect_to 'spa_listedesenvois', :notice => 'Mail envoyé'
  end

  def envoyerspa
    @mission = Mission.find(params[:id])

    #mission passée active pour affichage des SPA
    if !@mission.encours
        @mission.encours= true
        @mission.save!
    end

    # créer les rosters pour les users actifs et envoyer un email
    User.find_all_by_actif(true).each do |soldat|
      rost= Roster.find_by_mission_id_and_user_id(@mission.id,soldat.id)

      if rost.nil?
        r= Roster.create!(:mission_id => @mission.id, :user_id => soldat.id)
      else
        r= rost
      end

      unless r.nil?
        DemandeSpaMailer.compterendu_spa(r).deliver
      end
    end
      render 'spa_listedesenvois', :notice => 'Mail envoyé'
  end
end