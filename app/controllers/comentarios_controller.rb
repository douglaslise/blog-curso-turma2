class ComentariosController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
		@comentario = @post.comentarios.build
		@comentario.update(
			params[:comentario].
			permit([:autor, :texto])
		)
		
		@comentario.save

		redirect_to post_url(@post)
	end

end
