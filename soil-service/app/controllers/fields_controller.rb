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

    mutated = original.each do |u|
      if u[:id] == params[:id].to_i
          u
         u[:crops].map do | crop |
          if crop[:year] == params[:year].to_i
            case params[:newCrop].to_i
            when 1
               crop[:crop] = CropsService::SPRING_WHEAT
            when 2
              crop[:crop] = CropsService::WINTER_WHEAT
            when 3
              crop[:crop] = CropsService::RED_CLOVER
            when 4
              crop[:crop] = CropsService::WHITE_CLOVER
            when 5
              crop[:crop] = CropsService::BROAD_BEAN
            when 6
              crop[:crop] = CropsService::OATS
            else
              crop[:crop]
            end
          else
            crop
          end
         end
      else
        u
      end
    end
    render json: helpers.calculate_humus_delta(mutated)
  end


end
