class PlayersController < ApplicationController
  # GET /players
  # GET /players.json

  before_filter :no_id_zero

  def no_id_zero
    if session[:user_id] == 0
      session[:user_id] = nil
    end
  end

  def index
    @players = Player.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @players }
    end
  end

  def about
    return
  end

  # GET /players/1
  # GET /players/1.json
  def show
    if session[:user_id].nil?
      flash[:error] = "Please log in."
      redirect_to '/'
      return
    end

    if session[:user_id].to_i != params[:id].to_i
      redirect_to '/nope'
      return
    end
    @player = Player.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @player }
    end
  end

  # GET /players/new
  # GET /players/new.json
  def new
    @player = Player.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @player }
    end
  end

  # GET /players/1/edit
  def edit
    @player = Player.find(params[:id])
  end

  # POST /players
  # POST /players.json
  def create
    @player = Player.new(params[:player])

    respond_to do |format|
      if @player.save
        format.html { redirect_to "/players/new", notice: (@player.name + ' was successfully created.') }
        format.json { render json: @player, status: :created, location: @player }
      else
        format.html { render action: "new" }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /players/1
  # PUT /players/1.json
  def update
    @player = Player.find(params[:id])

    respond_to do |format|
      if @player.update_attributes(params[:player])
        format.html { redirect_to @player, notice: 'Player was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player = Player.find(params[:id])
    @player.destroy

    respond_to do |format|
      format.html { redirect_to players_url }
      format.json { head :no_content }
    end
  end
  
  def login
    if request.post?
      session[:user_id] = Player.authenticate( params[:player][:email], params[:player][:password])
      if session[:user_id] == 0
        flash[:error] = "Login failed."
        redirect_to '/login'
      else
        redirect_to "/players/#{session[:user_id]}"
        return
      end # @user.nil?
    else
      if session[:user_id] != nil
        redirect_to '/'
      end
    end # request.post?
  end # login
  
  def logout
    session[:user_id] = nil
    session[:user] = nil
    redirect_to '/'
  end

  def tag
    if params[:player][:secret] == Player.find(session[:user_id]).target.secret
      p = Player.find(session[:user_id])
      t = Tag.new
      t.timestamp = Time.now
      t.tagger_id = p.id
      t.tagged_id = p.target.id
      t.save!

      old = p.target
      old.tagged = true
      p.target = old.target
      old.target = nil
      old.save!
      p.save!
      flash[:tag] = "Tag validated!"
    else
      flash[:tag] = "Incorrect code word!"
    end
    redirect_to "/players/#{session[:user_id]}"
  end
end # PlayersController
