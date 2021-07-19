class CreateSubmitters < ActiveRecord::Migration[5.2]
  def change
    unless table_exists? Submitter.table_name
      create_table Submitter.table_name do |t|
        t.string :name, comment: 'Identifica o nome do apresentador'
        t.string :email, comment: 'Identifica o email do apresentador'
        t.string :phone, comment: 'Identifica o telefone do apresentador'
        t.timestamps
      end
    end
  end
end
