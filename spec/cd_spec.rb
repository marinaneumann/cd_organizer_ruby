require 'rspec'
require 'cd'


describe Cd do
  before do
    Cd.clear
  end

  describe '.clear' do
    it 'empties out all of the saved tasks' do
      Cd.new({:name => 'Abbey Road', :artist =>'Beatles'}).save
      Cd.clear
      expect(Cd.all).to eq []
    end
  end

  it 'creates an instance of CD' do
    cd1 = Cd.new({:name => 'The Slumdon Bridge', :artist => 'Ed Sheeran'})
    expect(cd1).to be_an_instance_of Cd
  end

  describe '#save' do
    it 'adds a cd to a saved array' do
      test_cd = Cd.new({:name => 'March Fires' , :artist => 'Birds of Tokyo'})
      test_cd.save
      expect(Cd.all).to eq [test_cd]
    end
  end

end
