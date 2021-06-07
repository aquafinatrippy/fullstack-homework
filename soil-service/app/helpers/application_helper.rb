module ApplicationHelper
    def calculate_humus_delta(list)
        list.map do | item | 
            total = 0
            
            item[:crops].each do |crop|
                if crop[:crop][:value] == crop[:crop][:value]
                    total += crop[:crop][:humus_delta] * 1.3
                    else
                        total += crop[:crop][:humus_delta]
                end
                
            end
            item[:effected] = total.round
        end
        return list
    end
end
