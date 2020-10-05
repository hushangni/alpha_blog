class ArticlesController < ApplicationController
    def show
        @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
    end

    def new 
        @article = Article.new
    end

    def create
        @article = Article.new(params.require(:article).permit(:title, :description))
         if @article.save
            # Where do we want this article to go when we save it?
            flash[:notice] = "Article successfully created."
            redirect_to @article
        else
            render 'new'
        end
    end
end