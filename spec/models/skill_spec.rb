require 'spec_helper'

describe Skill do
  it { should have_many(:ratings).dependent(:destroy) }
  it { should have_many(:characters).through(:ratings) }
  it { should have_many(:stress_tracks) }
  it { should have_many(:consequences) }
end
