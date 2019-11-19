describe file('/app/package-lock.json') do
    it { should exist }
    its('content') {should match /.*express.*/}
end

describe file('/app/index.js') do
    it { should exist }
end

describe file('/app/package.json') do
    it { should exist }
end

describe port(3333) do
    it { should be_listening }
    its('protocols') {should include 'tcp'}
end

describe processes('node') do
    it { should exist }
end

describe http('http://localhost:3333') do
    its('status') { should cmp 200 }
end

describe command('node --version') do
    its('exit_status') { should eq 0 }
    its('stdout') { should match (/v13.1.0/) }
end