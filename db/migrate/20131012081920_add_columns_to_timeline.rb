class AddColumnsToTimeline < ActiveRecord::Migration
  def change
    add_column :timelines, :timeline_type, :string, :after => :id
    add_column :timelines, :youtube_link,  :string, :after => :content
    add_column :timelines, :image_link,  :string, :after => :content
    add_column :timelines, :link,  :string, :after => :content
    add_index :timelines, :timeline_type
  end
end
