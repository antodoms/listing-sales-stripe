class BlogsController < ApplicationController

	def index
		@blogs = Blog.all
	end

	def blog_params
		params.require(:blog).permit(:title, :body)
	end
	
	def new
		@blogs = Blog.new
	end

	def create
		@blogs = Blog.new(blog_params)

		if @blogs.save
			redirect_to blogs_path, :notice => "Your blog was created"
		else
			render "new"
		end
	end

	def edit
		@blogs = Blog.find(params[:id])
	end

	def update
		@blogs = Blog.find(params[:id])

		if @blogs.update_attributes(blog_params)
			redirect_to blogs_path, :notice => "Your post is updated"
		else
			render "edit"
		end
	end

	def show
		@blogs= Blog.find(params[:id])
	end

	def destroy

		@blogs = Blog.find(params[:id])
		@Blogs.destroy
		redirect_to blogs_path, :notice => "Your article was deleted:"

	end

	

end
