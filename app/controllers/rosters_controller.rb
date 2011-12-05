class RostersController < ApplicationController
  before_filter :authenticate_user!
  #before_filter :check_ownership
  load_and_authorize_resource


    ## variables en dur pour tests
  @@activite = 5225
  @@missiondebut = Date.today
  @@missionfin = Date.today + 10.days

  def check_ownership
    unless params[:id].nil?
      @roster = Roster.find(params[:id])
      redirect_to root_path if @roster.id != current_user.roster.id
    end
  end

    # GET /rosters
    # GET /rosters.json
    def index
      @roster = Roster.all
      #@rosters = Roster.find_all_by_user_id(current_user.id)

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @rosters }
      end
    end

    # GET /rosters/1
    # GET /rosters/1.json
    def show
      @roster = Roster.find(params[:id])
      #if @roster.id != current_user.roster.id
      #  redirect_to roster_path(current_user.roster.id)
      #else
        respond_to do |format|
          format.html # show.html.erb
          format.json { render json: @roster }
        end
      #end
    end

    # GET /rosters/new
    # GET /rosters/new.json
    def new
      if Roster.find_all_by_user_id(current_user.id).empty?
        @roster = Roster.new
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
      #@roster.user_id = current_user.id
      #@roster.codeactivite = @@activite
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

    # PUT /rosters/1
    # PUT /rosters/1.json
    def update
      @roster = Roster.find(params[:id])

      respond_to do |format|
        if @roster.update_attributes(params[:roster])
          format.html { redirect_to @roster, notice: 'Roster was successfully updated.' }
          format.json { head :ok }
        else
          format.html { render action: "edit" }
          format.json { render json: @roster.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /rosters/1
    # DELETE /rosters/1.json
    def destroy
      @roster = Roster.find(params[:id])
      @roster.destroy

      respond_to do |format|
        format.html { redirect_to rosters_url }
        format.json { head :ok }
      end
    end
  end