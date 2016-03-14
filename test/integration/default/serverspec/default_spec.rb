require 'spec_helper'

describe 'rise-base::default' do
  # Serverspec examples can be found at
  # http://serverspec.org/resource_types.html
  it 'should install epel-release' do
    expect{ package('epel_release').should be_installed }
  end

  it 'should install wget' do
    expect{ package('wget').should be_installed }
  end

  it 'should install ntp' do
    expect{ package('ntp').should be_installed }
  end

  it 'should install ntpdate' do
    expect{ package('ntpdate').should be_installed }
  end

  describe file('/etc/motd') do
  	its(:content) { should == 
						[
						 "  .--,--.",
						 "  `.  ,.'   Chef Managed Server",
						 "   |___|    RISE ISP Server",
						 "   :o o:",
						 "  _`~^~'_   Authorized Use Only!",
						 "/'   ^   `"
						 ].join("\n")
					}
   end
   
end
