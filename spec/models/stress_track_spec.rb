require 'spec_helper'

describe StressTrack do
  it { should have_many(:stress_levels).dependent(:destroy) }
end
