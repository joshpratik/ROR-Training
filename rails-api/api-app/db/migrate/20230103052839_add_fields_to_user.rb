# frozen_string_literal: true

class AddFieldsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :age, :integer
    add_column :users, :bio, :text
  end
end
