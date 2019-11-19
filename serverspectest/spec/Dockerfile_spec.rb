require "serverspec"
require "docker"

describe "Dockerfile" do
  before(:all) do
    image = Docker::Image.build_from_dir('../nodeproject/')

    #set :os, family: :ubuntu # Seems optional, but increases by 4/5 seconds the test times
    set :backend, :docker
    set :docker_image, image.id
  end

  describe file('/app/package-lock.json') do
    it { should exist }
    its(:content) { should match /.*express.*/ }
  end

  describe file('/app/index.js') do
    it { should exist }
  end

  describe file('/app/package.json') do
    it { should exist }
  end

  describe port(3333) do
    it { should be_listening.with('tcp6') }
  end

  describe process("node") do
    it { should be_running }
  end

  describe command('node --version') do
    its(:exit_status) { should eq 0 }
    its(:stdout) { should match /v13.1.0/}
  end

end
