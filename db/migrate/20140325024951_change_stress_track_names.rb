class ChangeStressTrackNames < ActiveRecord::Migration
  def up
    StressTrack.find_each do |s|
      s.update_attributes name: "#{s.name} Stress"
    end
  end

  def down

  end
end
