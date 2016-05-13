class HomeController < ApplicationController
  before_action :init_session, only: [:index]
  
  def index
    @joke = get_joke
  end

  def like
    vote("like")
  end

  def dislike
    vote("dislike")
  end

  def init_session
    session[:user_id] ||= Digest::SHA2.hexdigest(Time.now.to_s)
    session[:read_jokes] ||= []
  end

  private
    def get_joke
      Joke.where.not(id: session[:read_jokes]).take(1).first()
    end

    def vote(vote_type)
      # set joke is read
      session[:read_jokes].push(params[:joke_id]) 

      # save joke's vote
      joke = Joke.find(params[:joke_id])
      vote = joke.votes.build(:vote_type => vote_type, :user_id => session[:user_id])

      # respond to client
      respond_to do |format|      
        if vote.save
          format.json { render json: { :joke => get_joke } }
        else
          format.json { render json: vote.errors, status: :unprocessable_entity }
        end
      end
    end
end
