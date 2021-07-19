class CreateUserBackofficeYields < ActiveRecord::Migration[5.2]
  def change
    unless table_exists? UserBackoffice::Yield.table_name
      create_table UserBackoffice::Yield.table_name do |t|
        t.numeric :requester_id, comment: 'Identifica o id do funcionario'
        t.integer :level, default: 0, comment: 'Identifica o nível do funcionario'
        t.numeric :xp, default: 0, comment: 'Identifica o xp do funcionario'
        t.timestamps
      end
    end
  end
end
