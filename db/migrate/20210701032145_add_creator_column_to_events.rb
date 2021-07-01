class AddCreatorColumnToEvents < ActiveRecord::Migration[6.1]
  def change
    add_reference :events, :creator, index: true
  end
end
