class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]

  # GET /articles or /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1 or /articles/1.json
  def show
    #byebug # This will pause the execution of the code and open a console in the terminal.for the debugger to work, you need to have the 'byebug' gem installed in your Gemfile and run 'bundle install' in the terminal.
    @article = Article.find(params[:id])  # @ : instance variable (accessible in the view(template))
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles or /articles.json
  def create
    # render plain: params[:article]
    @article = Article.new(params.require(:article).permit(:title, :description))  # This line of code will create a new article object with the title and description from the form.
    @article.save
    redirect_to article_path(@article)  # This line of code will redirect the user to the show page of the article that was just created.

    # ou simplement:
    # redirect_to @article  # This line of code will redirect the user to the show page of the article that was just created.

    # render plain: @article.inspect  # This line of code will display the article object in the browser.

    # @article = Article.new(article_params)

    # respond_to do |format|
    #   if @article.save
    #     format.html { redirect_to article_url(@article), notice: "Article was successfully created." }
    #     format.json { render :show, status: :created, location: @article }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @article.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to article_url(@article), notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy!

    respond_to do |format|
      format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :description)
    end
end
