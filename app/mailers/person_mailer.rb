# app/mailers/person_mailer.rb
require 'csv'

class PersonMailer < ApplicationMailer
  def balance_report(user)
    @user = user

    csv_data = CSV.generate(headers: true) do |csv|
      csv << ['name', 'balance']

      # Obtenha as pessoas e seus saldos do modelo Person
      people = Person.order(:name).map do |person|
        [person.name, person.balance]
      end

      people.each do |person|
        csv << person
      end
    end

    attachments['balance_report.csv'] = { mime_type: 'text/csv', content: csv_data }
    mail(to: @user.email, subject: 'Relatório de Saldo', body: 'Seu relatório de saldo está anexado.')  end
end