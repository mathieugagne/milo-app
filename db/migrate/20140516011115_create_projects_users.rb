class CreateProjectsUsers < ActiveRecord::Migration
  def change
    create_table :projects_users, id: false do |t|
      t.references :user, index: true
      t.references :project, index: true
    end
  end
end
