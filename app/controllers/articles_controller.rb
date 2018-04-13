class ArticlesController < ApplicationController
  
    def new #handled by create
      @article = Article.new
    end 
  
  def edit
    @article = Article.find(params[:id])
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
      @article = Article.find(params[:id])
    end 
  
    def destroy 
      @article = Article.find(params[:id])
      @article.destroy
      flash[:notice] = "Article was successfully deleted"
      redirect_to articles_path
    end
  
    def index
      @articles = Article.all
    end 
  
    def update(article_params) #handled by edit 
      @article = Article.find(params[:id])
      if @article.update
      flash[:notice] = "Article was successfuly updated"
      redirect_to article_path(@article)
      else 
        render 'edit'
      end
    end
  
  private 
  
  #white listed the params
    def article_params  

     params.require(:article).permit(:title, :description)
    end

end
