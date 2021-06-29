class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds, only: [:id, :name, :species]
  end

  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: { id: bird.id, name: bird.name, species: bird.species }
    else
      render json: { message: 'Bird not found' }
    end
  
    # or we can use  Ruby's built-in slice method. On the show action, that would look like this:
    # render json: bird.slice(:id, :name, :species)

    
  end


end
# Alternatively, rather than specifically listing every key we want to include, we could also exclude particular content using the except: option, like so:

# def index
#   birds = Bird.all
#   render json: birds, except: [:created_at, :updated_at]
# end 





# // This achieves the same result but in a slightly different way. Rather than having to spell out each key, the Hash slice method (Links to an external site.) returns a new hash with only the keys that are passed into slice. In this case, :id, :name, and :species were passed in, so created_at and updated_at get left out, just like before.

# In this case, we can add in the only: option directly after listing an object we want to render to JSON:

# def index
#   birds = Bird.all
#   render json: birds, only: [:id, :name, :species]
# end 