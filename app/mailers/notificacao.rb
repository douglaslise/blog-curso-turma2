class Notificacao < ActionMailer::Base
  default from: "douglaslise@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notificacao.novo_comentario.subject
  #
  def novo_comentario(comentario)
    @comentario = comentario
    mail to: "douglaslise@gmail.com",
         subject: "Novo email criado no blog"
  end
end
