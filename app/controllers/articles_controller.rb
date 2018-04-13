class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destory]
  
    def new #handled by create
      @article = Article.new
    end 
  
  def edit

  end 


#new send the article params to create. calls the private method 
    def create 
        @article = Article.new(article_params)
       if @article.save
        flash[:notice] = "Article was succssfully created"
        redirect_to articles_path(@article)
       else
        render 'new'  #can also write as :new
       end
     end

  
    def show
 
    end 
  
    def destroy 
      @article.destroy
      flash[:notice] = "Article was successfully deleted"
      redirect_to articles_path
    end
  
    def index
      @articles = Article.all
    end 
  
    def update #handled by edit 
      if @article.update(article_params)
      flash[:notice] = "Article was successfuly updated"
      redirect_to article_path(@article)
      else 
        render 'edit'
      end
    end
  
  
  private 
  
  def set_article
    @article = Article.find(params[:id])
  end
    
  #white listed the params
    def article_params  

     params.require(:article).permit(:title, :description)
    end

end
