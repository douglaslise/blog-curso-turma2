class PostsController < ApplicationController

  before_filter :authenticate_user!, 
    except: [:index, :show] 

	def index
		carrega_posts
	end

	def show
		carrega_posts
		@post = @posts.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new
		@post.titulo    = params[:post][:titulo]
		@post.texto     = params[:post][:texto]
		@post.publicado = params[:post][:publicado]
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
			permit([:titulo, :texto, :publicado]))
		
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

private
  def carrega_posts
		@posts = Post.mais_recentes
		unless user_signed_in?
			@posts = @posts.publicados
		end
  end

end
	