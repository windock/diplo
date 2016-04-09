require 'rails_helper'

RSpec.describe Profile, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  before do
    @markets = [Market.create(code: 'm1'), Market.create(code: 'm2'), Market.create(code: 'm3')]
    @profile = Profile.new(name: 'profile1', markets: @markets.take(1)).save
  end

  it 'works' do
    ActiveRecord::Base.transaction do
      @profile.markets = markets.take(2)
      expect(@profile.markets).to contain_exactly(@markets[0], @markets[1])
      raise ActiveRecord::Rollback
    end
    expect(@profile.markets).to contain_exactly(@markets[0], @markets[1])
    @profile.reload
    expect(@profile.markets).to contain_exactly(have_attributes(code: 'm1'))
  end

  it 'with attributes' do
  end

  after do
    ProfileMarket.destroy_all
    Market.destroy_all
    Profile.destroy_all
  end
end
