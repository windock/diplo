# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#user = CreateAdminService.new.call
#puts 'CREATED ADMIN USER: ' << user.email

US = Market.create!(code: 'US', name: 'United States')
CA = Market.create!(code: 'CA', name: 'Canada')
DE = Market.create!(code: 'DE', name: 'Germany')
UA = Market.create!(code: 'UA', name: 'Ukraine')
RU = Market.create!(code: 'RU', name: 'Russia')
BG = Market.create!(code: 'BG', name: 'Belgium')
CH = Market.create!(code: 'CH', name: 'China')
IN = Market.create!(code: 'IN', name: 'India')

Category.create!(name: 'Men')
Category.create!(name: 'Women')
Category.create!(name: 'Universal')
Category.create!(name: 'Fragrance')

PrimaryConcern.create(name: 'Daily Care')
PrimaryConcern.create(name: 'Blemish')
PrimaryConcern.create(name: 'Cleanse')
PrimaryConcern.create(name: 'Daily Sun Care')
PrimaryConcern.create(name: 'De-aging')
PrimaryConcern.create(name: 'Deodorant')
PrimaryConcern.create(name: 'Dullness')
PrimaryConcern.create(name: 'Eye Area')
PrimaryConcern.create(name: 'Foundation')
PrimaryConcern.create(name: 'Hydration')
PrimaryConcern.create(name: 'Moisturize')
PrimaryConcern.create(name: 'Pores')
PrimaryConcern.create(name: 'Redness')
PrimaryConcern.create(name: 'Shave')
PrimaryConcern.create(name: 'Sun Protection')
PrimaryConcern.create(name: 'Tone')

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
  category: Category.find_by_name('Men'),
  title: 'Aloe Shave Gel',
  sku: 'Z4RN1',
  primary_concern: PrimaryConcern.find_by_name('Shave'),
  markets: Market.all,
  price: '5'
})
Product.create!({
  name: 'Aloe Shave Gel (D)',
  description: 'Aloe-rich gel softens and cushions face and beard for a smooth, close shave. Oil-free.',
  category: Category.find_by_name('Men'),
  title: 'Aloe Shave Gel',
  sku: 'Z4RN2',
  primary_concern: PrimaryConcern.find_by_name('Shave'),
  markets: Market.all,
  price: '6'
})
Product.create!({
  name: 'Antiperspirant Deodorant Roll-On (P)',
  description: 'Comfortable, dependable defense against perspiration and odor. Dries quickly.',
  category: Category.find_by_name('Men'),
  title: 'Antiperspirant Deodorant Roll-On',
  sku: 'Z4RN3',
  primary_concern: PrimaryConcern.find_by_name('Deodorant'),
  markets: Market.all,
  price: '6'
})
Product.create!({
  name: 'Antiperspirant Deodorant Roll-On (W)',
  description: 'Comfortable, dependable defense against perspiration and odor. Dries quickly.',
  category: Category.find_by_name('Men'),
  title: 'Antiperspirant Deodorant Roll-On',
  sku: 'Z4RN4',
  primary_concern: PrimaryConcern.find_by_name('Deodorant'),
  markets: Market.all,
  price: '5'
})
Product.create!({
  name: 'For Men Charcoal Face Wash (Europe)',
  description: 'Purifying gel wash delivers a deep-pore clean. Natural charcoal draws out the dirt and excess oil that can clog pores. Soothing, non-drying lather gently foams away impurities. Leaves all skin types feeling fresh, comfortable.',
  category: Category.find_by_name('Men'),
  title: 'Charcoal Face Wash',
  sku: 'Z4RM2',
  primary_concern: PrimaryConcern.find_by_name('Cleanse'),
  markets: [DE, BG, UA, RU],
  price: '10'
})
Product.create!({
  name: 'For Men Charcoal Face Wash (America)',
  description: 'Purifying gel wash delivers a deep-pore clean. Natural charcoal draws out the dirt and excess oil that can clog pores. Soothing, non-drying lather gently foams away impurities. Leaves all skin types feeling fresh, comfortable.',
  category: Category.find_by_name('Men'),
  title: 'Charcoal Face Wash',
  sku: 'Z4RM2',
  primary_concern: PrimaryConcern.find_by_name('Cleanse'),
  markets: [US, CA],
  price: '10'
})
Product.create!({
  name: 'Face Scrub (Europe)',
  description: 'Clears the way for closest shaves. Fine, non-abrasive grains de-flake, lift beard hairs, help reduce ingrown hairs. Revives and smooths skin.',
  category: Category.find_by_name('Men'),
  title: 'Face Scrub',
  sku: 'Z4RZ1',
  primary_concern: PrimaryConcern.find_by_name('Shave'),
  markets: [DE, UA, RU, BG],
  price: '10'
})
Product.create!({
  name: 'Face Scrub (America)',
  description: 'Clears the way for closest shaves. Fine, non-abrasive grains de-flake, lift beard hairs, help reduce ingrown hairs. Revives and smooths skin.',
  category: Category.find_by_name('Men'),
  title: 'Face Scrub',
  sku: 'Z4RZ1',
  primary_concern: PrimaryConcern.find_by_name('Shave'),
  markets: [US, CA],
  price: '10'
})
Product.create!({
  name: 'Liquid Facial Soap Extra-Mild',
  description: "The first step to dermatologist developed 3-Step Skin Care System: Leaves skin clean, comfortable, refreshed. All the benefits of famous Facial Soap in a liquid formula.",
  category: Category.find_by_name('Women'),
  title: 'Liquid Facial Soap',
  skin_type: Product::SkinType::Sensitive,
  sku: 'W4RZ1',
  primary_concern: PrimaryConcern.find_by_name('Daily Care'),
  markets: [US, CA],
  price: '20'
})

Device.create!(name: 'NA0001', device_type: Device::DeviceType::Kiosk, profile: profile_northern_america)
Device.create!(name: 'NA0002', profile: profile_northern_america)

Device.create!(name: 'WE0001', profile: profile_western_europe)
Device.create!(name: 'WE0002', profile: profile_western_europe)

Device.create!(name: 'EE0001', lifecycle: Device::Lifecycle::InService, profile: profile_eastern_europe)
Device.create!(name: 'EE0002', lifecycle: Device::Lifecycle::InService, profile: profile_eastern_europe)
