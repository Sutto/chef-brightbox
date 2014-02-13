require 'spec_helper'

describe 'ruby' do
  describe command('ruby -v') do
    it { should return_stdout /ruby 2.1/ }
  end
end
