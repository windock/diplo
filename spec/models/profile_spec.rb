require 'rails_helper'

RSpec.describe Domain::Profile, type: :model do

  before do
    @markets = [
      Domain::Market.new(code: 'm1'),
      Domain::Market.new(code: 'm2'),
      Domain::Market.new(code: 'm3')
    ]
    @markets.each do |market|
      Registry.market_repository.persist(market)
    end
    @profile = Domain::Profile.new(name: 'profile1')
    @profile.markets = @markets.take(1)
    Registry.profile_repository.persist(@profile)
  end

  it 'works' do
    Registry.profile_repository.transaction do
      @profile.markets = @markets.take(2)
      expect(@profile.markets).to contain_exactly(@markets[0], @markets[1])
      raise Sequel::Rollback
    end
    expect(@profile.markets).to contain_exactly(@markets[0], @markets[1])
    @profile = Registry.profile_repository.find(@profile.id)
    expect(@profile.markets).to contain_exactly(have_attributes(code: 'm1'))
  end

  after do
    Registry.profile_repository.remove_all
    Registry.market_repository.remove_all
  end
end
