require 'rails_helper'

describe Character do
  it { should have_many(:aspects).dependent(:destroy) }
  it { should have_many(:ratings).dependent(:destroy) }
  it { should have_many(:skills).through(:ratings) }
  it { should have_many(:stunts).dependent(:destroy) }
  it { should have_many(:extras).dependent(:destroy) }

  it { should validate_presence_of :name }
end
