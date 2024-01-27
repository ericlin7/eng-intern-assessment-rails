
class ArticlesController < ApplicationController

    def index
      #retrieves all records from the Article model's corresponding database table
      @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        if @article.save
          redirect_to articles_path, notice: 'Article was successfully created.'
        else
          render :new
        end
      end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            redirect_to articles_path, notice: 'Article was successfully updated.'
        else
            render :edit
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path, notice: 'Article was successfully deleted.'
    end


    private

    def article_params
        params.require(:article).permit(:title, :content, :author, :date)
    end
end
  