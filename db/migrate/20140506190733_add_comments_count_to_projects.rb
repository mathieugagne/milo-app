class AddCommentsCountToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :comments_count, :integer, default: 0
    Project.find_each do |project|
      project.update_attribute(:comments_count, project.comments.count)
    end
  end
end
