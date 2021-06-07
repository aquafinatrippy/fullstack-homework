class FieldsController < ActionController::Base
  def index
    fields = FieldsService.instance.fetch_fields
   helpers.calculate_humus_delta(fields)
    render json:  helpers.calculate_humus_delta(fields)
  end

  #url /fields/3
  def show
    logger.debug params[:second]
    original = FieldsService.instance.fetch_fields
    



    mutated = original.map do |u|
      if u[:id] == params[:id].to_i
         u
         logger.debug u[:crops]
      else
        u
      end
    end
    render json: {msg: "ok", id: params[:id], year: params[:year], third: params[:test], json: mutated}
  end


end
