class WhiteLabelsController < ApplicationController
  before_action :set_white_label, only: [:show, :edit, :update, :destroy]

  def css
    @white_label = WhiteLabel.find_by_domain!(css_params[:domain])






    render text: %Q{body { background: ##{@white_label.background}; } .logo::before { content: "#{@white_label.name}"} }
  end

  # GET /white_labels
  # GET /white_labels.json
  def index
    @white_labels = WhiteLabel.all
  end

  # GET /white_labels/1
  # GET /white_labels/1.json
  def show
  end

  # GET /white_labels/new
  def new
    @white_label = WhiteLabel.new
  end

  # GET /white_labels/1/edit
  def edit
  end

  # POST /white_labels
  # POST /white_labels.json
  def create
    @white_label = WhiteLabel.new(white_label_params)

    respond_to do |format|
      if @white_label.save
        format.html { redirect_to @white_label, notice: 'White label was successfully created.' }
        format.json { render :show, status: :created, location: @white_label }
      else
        format.html { render :new }
        format.json { render json: @white_label.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /white_labels/1
  # PATCH/PUT /white_labels/1.json
  def update
    respond_to do |format|
      if @white_label.update(white_label_params)
        format.html { redirect_to @white_label, notice: 'White label was successfully updated.' }
        format.json { render :show, status: :ok, location: @white_label }
      else
        format.html { render :edit }
        format.json { render json: @white_label.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /white_labels/1
  # DELETE /white_labels/1.json
  def destroy
    @white_label.destroy
    respond_to do |format|
      format.html { redirect_to white_labels_url, notice: 'White label was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_white_label
    @white_label = WhiteLabel.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def white_label_params
    params[:white_label]
  end

  def css_params
    params.permit(:domain)
  end
end
