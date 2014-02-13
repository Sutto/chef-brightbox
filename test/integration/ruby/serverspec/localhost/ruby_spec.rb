require 'spec_helper'

describe 'ruby' do
  describe command('ruby -v') do
    it { should return_stdout /ruby 2.1/ }
  end

  describe command('bundle -v') do
    it { should return_exit_status 0 }
  end

  describe command('rake --version') do
    it { should return_exit_status 0 }
  end
end
