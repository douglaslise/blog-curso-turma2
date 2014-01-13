require 'test_helper'

class NotificacaoTest < ActionMailer::TestCase
  test "novo_comentario" do
    mail = Notificacao.novo_comentario
    assert_equal "Novo comentario", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
