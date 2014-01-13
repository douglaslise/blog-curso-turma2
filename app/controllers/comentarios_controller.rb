class ComentariosController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
		@comentario = @post.comentarios.build
		@comentario.update(
			params[:comentario].
			permit([:autor, :texto])
		)
		
		@comentario.save

		Notificacao.novo_comentario(@comentario).deliver

		redirect_to post_url(@post)
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comentario = @post.comentarios.find(params[:id])
		@comentario.destroy
		respond_to do |format|
	    format.html {redirect_to post_url(@post)}
	    format.js   {}
	  end
	end

end
