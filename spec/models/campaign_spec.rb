require 'rails_helper'

describe Campaign do
  it { should have_many :characters }
  it { should have_many :stress_tracks }
  it { should have_many :consequences }
  it { should belong_to :skill_type }
  it { should belong_to :user }

end
