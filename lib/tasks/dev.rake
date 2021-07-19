namespace :dev do
  desc "TODO"
  task gera_usuarios: :environment do
    if Rails.env.development?
      show_spinner("Apagando BD...") { %x(rails db:drop) }
      show_spinner("Criando BD...") { %x(rails db:create) }
      show_spinner("Migrando BD...") { %x(rails db:migrate) }
      show_spinner("Cadastrando Administrador Padrão...") { %x(rails dev:add_default_admin) }
    else
      puts "Você não está em ambiente de desenvolvimento!"
    end

  end

  desc "Adiciona o administrador padrão"
  task add_default_admin: :environment do
    User.where(email: 'admin@admin.com').first_or_create(email: 'admin@admin.com', password: 'admin123', password_confirmation: 'admin123')
  end

  private

  def show_spinner(msg_start, msg_end = "Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end

end
