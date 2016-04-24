# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#user = CreateAdminService.new.call
#puts 'CREATED ADMIN USER: ' << user.email

US = Registry.market_repository.persist(Domain::Market.new(code: 'US', name: 'United States'))
CA = Registry.market_repository.persist(Domain::Market.new(code: 'CA', name: 'Canada'))
DE = Registry.market_repository.persist(Domain::Market.new(code: 'DE', name: 'Germany'))
UA = Registry.market_repository.persist(Domain::Market.new(code: 'UA', name: 'Ukraine'))
RU = Registry.market_repository.persist(Domain::Market.new(code: 'RU', name: 'Russia'))
BG = Registry.market_repository.persist(Domain::Market.new(code: 'BG', name: 'Belgium'))
CH = Registry.market_repository.persist(Domain::Market.new(code: 'CH', name: 'China'))
IN = Registry.market_repository.persist(Domain::Market.new(code: 'IN', name: 'India'))
all_markets = [US, CA, DE, UA, RU, BG, CH, IN]

[
  Domain::Category.new(name: 'Men'),
  Domain::Category.new(name: 'Women'),
  Domain::Category.new(name: 'Universal'),
  Domain::Category.new(name: 'Fragrance')
].each do |category|
  Registry.category_repository.persist(category)
end

[
  Domain::PrimaryConcern.new(name: 'Daily Care'),
  Domain::PrimaryConcern.new(name: 'Blemish'),
  Domain::PrimaryConcern.new(name: 'Cleanse'),
  Domain::PrimaryConcern.new(name: 'Daily Sun Care'),
  Domain::PrimaryConcern.new(name: 'De-aging'),
  Domain::PrimaryConcern.new(name: 'Deodorant'),
  Domain::PrimaryConcern.new(name: 'Dullness'),
  Domain::PrimaryConcern.new(name: 'Eye Area'),
  Domain::PrimaryConcern.new(name: 'Foundation'),
  Domain::PrimaryConcern.new(name: 'Hydration'),
  Domain::PrimaryConcern.new(name: 'Moisturize'),
  Domain::PrimaryConcern.new(name: 'Pores'),
  Domain::PrimaryConcern.new(name: 'Redness'),
  Domain::PrimaryConcern.new(name: 'Shave'),
  Domain::PrimaryConcern.new(name: 'Sun Protection'),
  Domain::PrimaryConcern.new(name: 'Tone')
].each do |primary_concern|
  Registry.primary_concern_repository.persist(primary_concern)
end

profile_northern_america = Profile.create!({
  name: '01-Northern-America',
  description: 'Lorem ipsum dolor sit amet',
  welcome_button1: Profile::WelcomeButton::Campaign,
  welcome_button2: Profile::WelcomeButton::MenCatalogue,
  welcome_button3: Profile::WelcomeButton::WomenCatalogue,
  markets: [US, CA]
})

profile_western_europe = Profile.create!({
  name: '01-Western-Europe',
  description: 'consectetur adipiscing elit, sed do eiusmod tempor incididunt',
  welcome_button1: Profile::WelcomeButton::MenCatalogue,
  welcome_button2: Profile::WelcomeButton::WomenCatalogue,
  markets: [DE, BG]
})

profile_eastern_europe = Profile.create!({
  name: '01-Eastern-Europe',
  description: 'ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation',
  welcome_button1: Profile::WelcomeButton::WomenSkinDiagnostics,
  welcome_button2: Profile::WelcomeButton::WomenCatalogue,
  welcome_button3: Profile::WelcomeButton::Campaign,
  markets: [RU, UA]
})

profile_asia = Profile.create!({
  name: '01-Asia',
  description: 'But I must explain to you how all this mistaken idea of denouncing pleasure',
  markets: [CH, IN]
})

Product.create!({
  name: 'Aloe Shave Gel (P)',
  description: 'Aloe-rich gel softens and cushions face and beard for a smooth, close shave. Oil-free.',
  category: Registry.category_repository.find_by_name('Men'),
  title: 'Aloe Shave Gel',
  sku: 'Z4RN1',
  primary_concern: Registry.primary_concern_repository.find_by_name('Shave'),
  markets: all_markets,
  price: '5'
})
Product.create!({
  name: 'Aloe Shave Gel (D)',
  description: 'Aloe-rich gel softens and cushions face and beard for a smooth, close shave. Oil-free.',
  category: Registry.category_repository.find_by_name('Men'),
  title: 'Aloe Shave Gel',
  sku: 'Z4RN2',
  primary_concern: Registry.primary_concern_repository.find_by_name('Shave'),
  markets: all_markets,
  price: '6'
})
Product.create!({
  name: 'Antiperspirant Deodorant Roll-On (P)',
  description: 'Comfortable, dependable defense against perspiration and odor. Dries quickly.',
  category: Registry.category_repository.find_by_name('Men'),
  title: 'Antiperspirant Deodorant Roll-On',
  sku: 'Z4RN3',
  primary_concern: Registry.primary_concern_repository.find_by_name('Deodorant'),
  markets: all_markets,
  price: '6'
})
Product.create!({
  name: 'Antiperspirant Deodorant Roll-On (W)',
  description: 'Comfortable, dependable defense against perspiration and odor. Dries quickly.',
  category: Registry.category_repository.find_by_name('Men'),
  title: 'Antiperspirant Deodorant Roll-On',
  sku: 'Z4RN4',
  primary_concern: Registry.primary_concern_repository.find_by_name('Deodorant'),
  markets: all_markets,
  price: '5'
})
Product.create!({
  name: 'For Men Charcoal Face Wash (Europe)',
  description: 'Purifying gel wash delivers a deep-pore clean. Natural charcoal draws out the dirt and excess oil that can clog pores. Soothing, non-drying lather gently foams away impurities. Leaves all skin types feeling fresh, comfortable.',
  category: Registry.category_repository.find_by_name('Men'),
  title: 'Charcoal Face Wash',
  sku: 'Z4RM2',
  primary_concern: Registry.primary_concern_repository.find_by_name('Cleanse'),
  markets: [DE, BG, UA, RU],
  price: '10'
})
Product.create!({
  name: 'For Men Charcoal Face Wash (America)',
  description: 'Purifying gel wash delivers a deep-pore clean. Natural charcoal draws out the dirt and excess oil that can clog pores. Soothing, non-drying lather gently foams away impurities. Leaves all skin types feeling fresh, comfortable.',
  category: Registry.category_repository.find_by_name('Men'),
  title: 'Charcoal Face Wash',
  sku: 'Z4RM2',
  primary_concern: Registry.primary_concern_repository.find_by_name('Cleanse'),
  markets: [US, CA],
  price: '10'
})
Product.create!({
  name: 'Face Scrub (Europe)',
  description: 'Clears the way for closest shaves. Fine, non-abrasive grains de-flake, lift beard hairs, help reduce ingrown hairs. Revives and smooths skin.',
  category: Registry.category_repository.find_by_name('Men'),
  title: 'Face Scrub',
  sku: 'Z4RZ1',
  primary_concern: Registry.primary_concern_repository.find_by_name('Shave'),
  markets: [DE, UA, RU, BG],
  price: '10'
})
Product.create!({
  name: 'Face Scrub (America)',
  description: 'Clears the way for closest shaves. Fine, non-abrasive grains de-flake, lift beard hairs, help reduce ingrown hairs. Revives and smooths skin.',
  category: Registry.category_repository.find_by_name('Men'),
  title: 'Face Scrub',
  sku: 'Z4RZ1',
  primary_concern: Registry.primary_concern_repository.find_by_name('Shave'),
  markets: [US, CA],
  price: '10'
})
Product.create!({
  name: 'Liquid Facial Soap Extra-Mild',
  description: "The first step to dermatologist developed 3-Step Skin Care System: Leaves skin clean, comfortable, refreshed. All the benefits of famous Facial Soap in a liquid formula.",
  category: Registry.category_repository.find_by_name('Women'),
  title: 'Liquid Facial Soap',
  skin_type: Product::SkinType::Sensitive,
  sku: 'W4RZ1',
  primary_concern: Registry.primary_concern_repository.find_by_name('Daily Care'),
  markets: [US, CA],
  price: '20'
})

Device.create!(name: 'NA0001', device_type: Device::DeviceType::Kiosk, profile: profile_northern_america)
Device.create!(name: 'NA0002', profile: profile_northern_america)

Device.create!(name: 'WE0001', profile: profile_western_europe)
Device.create!(name: 'WE0002', profile: profile_western_europe)

Device.create!(name: 'EE0001', lifecycle: Device::Lifecycle::InService, profile: profile_eastern_europe)
Device.create!(name: 'EE0002', lifecycle: Device::Lifecycle::InService, profile: profile_eastern_europe)
