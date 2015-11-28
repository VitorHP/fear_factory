require 'rails_helper'

describe StressLevel do
  it { should belong_to(:stress_track) }
end
