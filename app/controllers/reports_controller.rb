class ReportsController < ApplicationController
  def balance
    # Certifique-se de que o usuário está autenticado antes de enviar o email
    if current_user
      PersonMailer.balance_report(current_user).deliver_now
      flash[:notice] = 'Relatório de saldo enviado!'
    else
      flash[:alert] = 'Você precisa estar logado para solicitar um relatório de saldo.'
    end
    redirect_to root_path
  end
end