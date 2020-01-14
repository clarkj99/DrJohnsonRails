class AddSeverityToHpis < ActiveRecord::Migration[6.0]
  def change
    add_column :hpis, :severity, :integer
  end
end
