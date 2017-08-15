module ResponsesHelper

  def build_options(response, num_selections)
    num_selections.times do 
      response.selections.build
    end
    response.selections
 end

end
