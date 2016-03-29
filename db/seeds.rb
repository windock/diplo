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

[
  'Men',
  'Women',
  'Universal',
  'Fragrance'
].each do |name|
  Category.create!(name: name)
end

[
  'Daily Care',
  'Blemish',
  'Cleanse',
  'Daily Sun Care',
  'De-aging',
  'Deodorant',
  'Dullness',
  'Eye Area',
  'Foundation',
  'Hydration',
  'Moisturize',
  'Pores',
  'Redness',
  'Shave',
  'Sun Protection',
  'Tone'
].each do |name|
  PrimaryConcern.create!(name: name)
end

[
  {
    name: '01-Northern-America',
    description: 'Lorem ipsum dolor sit amet',
    welcome_button1: Profile::WelcomeButton::Campaign,
    welcome_button2: Profile::WelcomeButton::MenCatalogue,
    welcome_button3: Profile::WelcomeButton::WomenCatalogue,
    markets: [US, CA]
  },
  {
    name: '01-Western-Europe',
    description: 'consectetur adipiscing elit, sed do eiusmod tempor incididunt',
    welcome_button1: Profile::WelcomeButton::MenCatalogue,
    welcome_button2: Profile::WelcomeButton::WomenCatalogue,
    markets: [DE, BG]
  },
  {
    name: '01-Eastern-Europe',
    description: 'ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation',
    welcome_button1: Profile::WelcomeButton::WomenSkinDiagnostics,
    welcome_button2: Profile::WelcomeButton::WomenCatalogue,
    welcome_button3: Profile::WelcomeButton::Campaign,
    markets: [RU, UA]
  }
].each do |attributes|
  Profile.create!(attributes)
end

[
  {
    name: 'Aloe Shave Gel (P)',
    description: 'Aloe-rich gel softens and cushions face and beard for a smooth, close shave. Oil-free.',
    category: Category.find_by_name('Men'),
    title: 'Aloe Shave Gel',
    sku: 'Z4RN1',
    primary_concern: PrimaryConcern.find_by_name('Shave'),
    markets: Market.all,
    price: '5'
  },
  {
    name: 'Aloe Shave Gel (D)',
    description: 'Aloe-rich gel softens and cushions face and beard for a smooth, close shave. Oil-free.',
    category: Category.find_by_name('Men'),
    title: 'Aloe Shave Gel',
    sku: 'Z4RN2',
    primary_concern: PrimaryConcern.find_by_name('Shave'),
    markets: Market.all,
    price: '6'
  },
  {
    name: 'Antiperspirant Deodorant Roll-On (P)',
    description: 'Comfortable, dependable defense against perspiration and odor. Dries quickly.',
    category: Category.find_by_name('Men'),
    title: 'Antiperspirant Deodorant Roll-On',
    sku: 'Z4RN3',
    primary_concern: PrimaryConcern.find_by_name('Deodorant'),
    markets: Market.all,
    price: '6'
  },
  {
    name: 'Antiperspirant Deodorant Roll-On (W)',
    description: 'Comfortable, dependable defense against perspiration and odor. Dries quickly.',
    category: Category.find_by_name('Men'),
    title: 'Antiperspirant Deodorant Roll-On',
    sku: 'Z4RN4',
    primary_concern: PrimaryConcern.find_by_name('Deodorant'),
    markets: Market.all,
    price: '5'
  },
  {
    name: 'For Men Charcoal Face Wash (Europe)',
    description: 'Purifying gel wash delivers a deep-pore clean. Natural charcoal draws out the dirt and excess oil that can clog pores. Soothing, non-drying lather gently foams away impurities. Leaves all skin types feeling fresh, comfortable.',
    category: Category.find_by_name('Men'),
    title: 'Charcoal Face Wash',
    sku: 'Z4RM2',
    primary_concern: PrimaryConcern.find_by_name('Cleanse'),
    markets: [DE, BG, UA, RU],
    price: '10'
  },
  {
    name: 'For Men Charcoal Face Wash (America)',
    description: 'Purifying gel wash delivers a deep-pore clean. Natural charcoal draws out the dirt and excess oil that can clog pores. Soothing, non-drying lather gently foams away impurities. Leaves all skin types feeling fresh, comfortable.',
    category: Category.find_by_name('Men'),
    title: 'Charcoal Face Wash',
    sku: 'Z4RM2',
    primary_concern: PrimaryConcern.find_by_name('Cleanse'),
    markets: [US, CA],
    price: '10'
  },
  {
    name: 'Face Scrub (Europe)',
    description: 'Clears the way for closest shaves. Fine, non-abrasive grains de-flake, lift beard hairs, help reduce ingrown hairs. Revives and smooths skin.',
    category: Category.find_by_name('Men'),
    title: 'Face Scrub',
    sku: 'Z4RZ1',
    primary_concern: PrimaryConcern.find_by_name('Shave'),
    markets: [DE, UA, RU, BG],
    price: '10'
  },
  {
    name: 'Face Scrub (America)',
    description: 'Clears the way for closest shaves. Fine, non-abrasive grains de-flake, lift beard hairs, help reduce ingrown hairs. Revives and smooths skin.',
    category: Category.find_by_name('Men'),
    title: 'Face Scrub',
    sku: 'Z4RZ1',
    primary_concern: PrimaryConcern.find_by_name('Shave'),
    markets: [US, CA],
    price: '10'
  },
  {
    name: 'Liquid Facial Soap Extra-Mild',
    description: "The first step to dermatologist developed 3-Step Skin Care System: Leaves skin clean, comfortable, refreshed. All the benefits of famous Facial Soap in a liquid formula.",
    category: Category.find_by_name('Women'),
    title: 'Liquid Facial Soap',
    skin_type: Product::SkinType::Sensitive,
    sku: 'W4RZ1',
    primary_concern: PrimaryConcern.find_by_name('Daily Care'),
    markets: [US, CA],
    price: '20'
  }
].each do |attributes|
  Product.create!(attributes)
end
