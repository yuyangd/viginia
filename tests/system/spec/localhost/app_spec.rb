require 'spec_helper'

describe package('nginx') do
  it { should be_installed }
end

describe service('nginx') do
  it { should be_enabled }
  it { should be_running }
end

describe port(80) do
  it { should be_listening }
end

describe package('gunicorn') do
  it { should be_installed.by('pip') }
end

describe package('Django') do
  it { should be_installed.by('pip') }
end

describe package('djangorestframework') do
  it { should be_installed.by('pip') }
end

describe package('psycopg2') do
  it { should be_installed.by('pip') }
end

describe package('PyYAML') do
  it { should be_installed.by('pip') }
end

describe file('/var/gunicorn/viginia.sock') do
  it { should be_socket }
end
