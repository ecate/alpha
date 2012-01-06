class RostersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
      @roster = Roster.all

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @rosters }
      end
    end

    def show
      @roster = Roster.find(params[:id])
        respond_to do |format|
          format.html # show.html.erb
          format.json { render json: @roster }
        end
    end

    def new
      if Roster.find_all_by_user_id(current_user.id).empty?
        @roster = Roster.new
        @roster.user_id = current_user.id
        @roster.mission_id= '1'
          respond_to do |format|
            format.html # new.html.erb
            format.json { render json: @roster }
          end
      else
        redirect_to edit_roster_path(current_user.roster)
      end
    end

    def edit
      @roster = Roster.find(params[:id])

    end

    def create
      @roster = Roster.new(params[:roster])
      @roster.user_id = current_user.id
      @roster.mission_id= 2
      respond_to do |format|
        if @roster.save
          format.html { redirect_to @roster, notice: 'Roster was successfully created.' }
          format.json { render json: @roster, status: :created, location: @roster }
        else
          format.html { render action: "new" }
          format.json { render json: @roster.errors, status: :unprocessable_entity }
        end
      end
    end


  def update

      @roster = Roster.find(params[:id])

      # On récupère ce tableau du formulaire Edit. Il contient les jours cochés
      presents = params[:roster]["present"]

      # Le personnel ne vient pas à la séance
      if presents.nil?
        Jour.delete_all(:roster_id => @roster.id)
      else
        #Etape 1 : On supprime les jours qui ont été décochés par rapport à la fois précédente
        Jour.find_all_by_roster_id(@roster.id).each do |jid|
          jourid = jid.convocationjour_id

          if presents.include?(jourid.to_s)
            presents.delete(jourid.to_s)
          else
            Jour.find_by_convocationjour_id(jourid).destroy
          end
        end
        #Etape 2 : On ajoute les jours nouvellement cochés
        unless presents.empty?
          presents.each do |njour|
            Jour.create!(roster_id: @roster.id, convocationjour_id: njour.to_i)
          end
        end
      end


      #Etape 3 : on update le reste de l'objet Roster
      respond_to do |format|
        if @roster.update_attributes(params[:roster])
          format.html { redirect_to @roster, notice: 'Votre compte-rendu de presence est enregistre.'}
          format.json { head :ok }
        else
          format.html { render action: "edit" }
          format.json { render json: @roster.errors, status: :unprocessable_entity }
        end
      end
  end

    def destroy
      @roster = Roster.find(params[:id])
      @roster.destroy

      respond_to do |format|
        format.html { redirect_to rosters_url }
        format.json { head :ok }
      end
    end

    def nevientpas
      @roster = Roster.find(params[:roster_id])
      Jour.delete_all(:roster_id => @roster.id)
      redirect_to edit_roster_path(@roster), notice: 'Vous ne serez pas present a la seance.'


    end
  end