class BlogsController < ApplicationController

    # before_action :authentication
    
    def index
        @blogs = Blog.all
       
        respond_to do |format|
          format.html  # index.html.erb
          format.json  { render :json => @posts }
        end
      end

      def new
        @blog = Blog.new
        # @comment = @blog.comments.build
       
        respond_to do |format|
          format.html  # new.html.erb
          format.json  { render :json => @blog }
        end
      end

    # def create
    #     @blog = Blog.new(user:session[:user_id],body:blog_params[:body],title:blog_params[:title])
    #     # flash[:notice] = "Blog created!"
    #     # redirect_to root_path
    #     if @blog.save
    #         flash[:notice] = "Blog created!"
    #         redirect_to "/blog"
    #     else
    #         flash[:alert] = "Username already exist"
    #         redirect_to new_path
    #     end 
    # end 
    def create
        @blog = Blog.new(user:session[:user_id],body:blog_params[:body],title:blog_params[:title])
        # @comment = @blog.comments.build
       
        respond_to do |format|
          if @blog.save
            format.html  { redirect_to(@blog,
                          :notice => 'blog was successfully created.') }
            format.json  { render :json => @blog,
                          :status => :created, :location => @blog }
          else
            format.html  { render :action => "new" }
            format.json  { render :json => @blog.errors,
                          :status => :unprocessable_entity }
          end
        end
    end

    def show
        @blog = Blog.find(params[:id])
        
        respond_to do |format|
            format.html  # show.html.erb
            format.json  { render :json => @blog }
        end
    end
    # def show
    #     @blog = Blog.find(params[:id])
    # end

    def edit
        @blog = Blog.find(params[:id])
    end

    def update
        @blog = Blog.find(params[:id])
       
        respond_to do |format|
          if @blog.update(blog_params)
            format.html  { redirect_to(@blog,
                          :notice => 'blog was successfully updated.') }
            format.json  { head :no_content }
          else
            format.html  { render :action => "edit" }
            format.json  { render :json => @blog.errors,
                          :status => :unprocessable_entity }
          end
        end
    end

    def destroy
        @blog = Blog.find(params[:id])
        @blog.destroy
       
        respond_to do |format|
          format.html { redirect_to blogs_url }
          format.json { head :no_content }
        end
    end

    private 

    def blog_params
        params.require(:blog).permit(:body,:title)
    end

end