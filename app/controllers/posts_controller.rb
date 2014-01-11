class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new
		@post.titulo = params[:post][:titulo]
		@post.texto  = params[:post][:texto]
		if @post.save
		  redirect_to post_url(@post)
		else
			render action: 'new'
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		
		@post.update(params[:post].
			permit([:titulo, :texto]))
		
		if @post.save
			redirect_to post_url(@post)
		else
			render action: 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_url
	end

end
	