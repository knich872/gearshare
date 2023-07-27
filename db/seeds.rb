require "open-uri"

puts "Cleaning database..."
Booking.destroy_all
Product.destroy_all
User.destroy_all

puts "Creating Users..."

puts "Creating Test User..."
User.create!(
  user_name: "TestUser",
  email: "test@gearshare.com",
  location: ["Tokyo", "Osaka", "Kyoto", "Nagoya", "Fukuoka", "Okinawa"].sample,
  password: "123456"
)

techguru = User.create!(
  user_name: "TechGuru",
  email: "techguru@gearshare.com",
  location: ["Tokyo", "Osaka", "Kyoto", "Nagoya", "Fukuoka", "Okinawa"].sample,
  password: "123456"
)
puts "User with id :#{techguru.id} has been created"

fashionprincess = User.create!(
  user_name: "FashionPrincess",
  email: "fashionPrincess@gearshare.com",
  location: ["Tokyo", "Osaka", "Kyoto", "Nagoya", "Fukuoka", "Okinawa"].sample,
  password: "123456"
)
puts "User with id :#{fashionprincess.id} has been created"

outdoorsguy = User.create!(
  user_name: "OutdoorsGuy",
  email: "outdoorsguy@gearshare.com",
  location: ["Tokyo", "Osaka", "Kyoto", "Nagoya", "Fukuoka", "Okinawa"].sample,
  password: "123456"
)
puts "User with id :#{outdoorsguy.id} has been created"

partykingdom = User.create!(
  user_name: "PartyKingdom",
  email: "partykingdom@gearshare.com",
  location: ["Tokyo", "Osaka", "Kyoto", "Nagoya", "Fukuoka", "Okinawa"].sample,
  password: "123456"
)
puts "User with id :#{partykingdom.id} has been created"

ababy = User.create!(
  user_name: "ABaby",
  email: "Ababy@gearshare.com",
  location: ["Tokyo", "Osaka", "Kyoto", "Nagoya", "Fukuoka", "Okinawa"].sample,
  password: "123456"
)
puts "User with id :#{ababy.id} has been created"

puts "Creating Products..."

puts "Creating drill..."

drill = Product.create!(
  name: "DeWalt Cordless Drill Kit",
  description: "Dewalt drill has compact and lightweight design that fits into tight areas\n
  High performance motor of the power drill delivers 300 unit watts out (UWO) of power ability completing a wide range of applications\n
  High speed transmission of Dewalt 20V drill delivers 2 speeds (0-450 and 1,500 rpm) for a range of fastening and drilling application\n
  1/2-inch single sleeve ratcheting chuck provides tight bit gripping strength\n
  Ergonomic handle delivers comfort and control. Tool Height-6.5 inch\n
  The charger is designed to operate on standard 120V household electrical power. Do not attempt to use it on any other voltage. This does not apply to the vehicular charger",
  category: "tools",
  rental_price_day: 4500,
  user: techguru
)

drill_photo_urls = [
  "https://m.media-amazon.com/images/I/71n1TZHn6BS._AC_SL1500_.jpg",
  "https://m.media-amazon.com/images/I/81QVebXq3LS._AC_SL1500_.jpg",
  "https://m.media-amazon.com/images/I/81MhmmhX7DS._AC_SL1500_.jpg",
  "https://m.media-amazon.com/images/I/81oG0n9aeaL._AC_SL1500_.jpg",
  "https://m.media-amazon.com/images/I/81+2fv9PsDS._AC_SL1500_.jpg"
]

drill_photo_urls.each_with_index do |url, index|
  file = URI.open(url)
  drill.photos.attach(io: file, filename: "photo_#{index + 1}.png", content_type: "image/png")
end

puts "Creating bicycle..."

bicycle = Product.create!(
  name: "UnYOUsual Bicycle",
  description: "Shimano 6 Speeds, Simple twist grip shifter\n
  WANDA 20\" x 1.75 tires for speedy acceleration\n
  Weights around 32 lb. Easy to be carried around.\n
  Great for RV's, boats, apartments and small-space living.\n
  The transformer can be easily folded, transported and stored in any area.",
  category: "transportation",
  rental_price_day: 1500,
  user: outdoorsguy
)

bicycle_photo_urls = [
  "https://m.media-amazon.com/images/I/61T0tHJlCpL._AC_SL1000_.jpg",
  "https://m.media-amazon.com/images/I/61qUpJiG9JL._AC_SL1000_.jpg",
  "https://m.media-amazon.com/images/I/61I75MTcfJL._AC_SL1000_.jpg",
  "https://m.media-amazon.com/images/I/51WZvKSYCnL._AC_SL1000_.jpg",
  "https://m.media-amazon.com/images/I/61IfkFLehzL._AC_SL1000_.jpg"
]

bicycle_photo_urls.each_with_index do |url, index|
  file = URI.open(url)
  bicycle.photos.attach(io: file, filename: "photo_#{index + 1}.png", content_type: "image/png")
end

puts "Creating camera..."

nikon1 = Product.create!(
  name: "Nikon D3500 DSLR Camera",
  description: "Nikon D700 camera is perfect for portrait photography. Comes with two lenses, a 35mm f2.8 and a 85mm f3.5 lens. Spare battery included along with chargers and a small flash. Can dropoff anywhere within the Yamanote loop in Tokyo.",
  category: "cameras",
  rental_price_day: 1500,
  user: techguru
)

nikon1_photo_urls = [
  "https://static.mercdn.net/item/detail/orig/photos/m96614220582_1.jpg?1684596717",
  "https://www.dpreview.com/files/p/articles/4435013201/images/nikond700_front.jpeg",
  "https://static.mercdn.net/item/detail/orig/photos/m38366916056_1.jpg",
  "https://img.ponparemall.net/imgmgr/41/00112541/0/hu2/1050020597.jpg?ver=1",
  "https://img.ponparemall.net/imgmgr/41/00112541/0/hu2/1050020597_2.jpg?ver=1"
]

nikon1_photo_urls.each_with_index do |url, index|
  file = URI.open(url)
  nikon1.photos.attach(io: file, filename: "photo_#{index + 1}.png", content_type: "image/png")
end

puts "Creating camera kit..."

street_photo_gear = Product.create!(
  name: "Street Photography Camera Kit",
  description: "Leica camera 20-70mm zoom lens. This camera is great for street photography and low-light situations. The Leica glass produces beautiful images. Camera case and charger is included but no memory card. ( It uses a standard SD card )",
  category: "cameras",
  rental_price_day: 2000,
  user: techguru
)

street_photo_gear_photo_urls = [
  "https://www.cnet.com/a/img/resize/7f52e5050cc1b7c49840caec46b9123c2d925c93/hub/2022/01/12/41b8d96b-b9f1-482d-b46c-054f8c00bd93/leica-m11-product-cnet-hoyle-2.jpg?auto=webp&fit=crop&height=675&width=1200",
  "https://static.theceomagazine.net/wp-content/uploads/2022/01/24174122/Leica_M11_HF_Ambient22.jpg",
  "https://store.leica-camera.jp/upload/save_image/0522144618_646b01aa944b9.jpg",
  "https://store.leica-camera.jp/upload/save_image/0522144633_646b01b947938.jpg",
  "https://store.leica-camera.jp/upload/save_image/0522144624_646b01b02fb07.jpg"
]

street_photo_gear_photo_urls.each_with_index do |url, index|
  file = URI.open(url)
  street_photo_gear.photos.attach(io: file, filename: "photo_#{index + 1}.png", content_type: "image/png")
end

puts "Creating youtube kit..."

youtube_kit = Product.create!(
  name: "Everything you need for YouTube",
  description: "I have two Lumix G7 cameras which are perfect for videography. Both cameras have 20-70mm lenses. I'm also included sturdy tripods for both cameras and two lights with umbrellas. This setup will help you to film a professional youtube video with two camera angles. Discount offered for longer term rentals.",
  category: "cameras",
  rental_price_day: 3500,
  user: techguru
)

youtube_kit_photo_urls = [
  "https://shop.panasonic.com/sites/default/files/styles/product_main_2x/public/salsify/product/image/a469f12969313caf2183a8aed53a667febd6e048.webp?itok=4WPH1XA5",
  "https://shop.panasonic.com/sites/default/files/styles/product_main_2x/public/salsify/product/image/DMC-G7HK_BACK.webp?itok=TkNz0KRB",
  "https://shop.panasonic.com/sites/default/files/styles/product_main_2x/public/salsify/product/image/DMC-G7HK_TOP.webp?itok=JliuuXBP",
  "https://shop.panasonic.com/sites/default/files/styles/product_main_2x/public/salsify/product/image/DMC-G7HK_FRONT.webp?itok=Gqd9-ad-",
  "https://www.cnet.com/a/img/resize/9f3ff76a99c8b1591102fccd3f77ac64c54965ac/hub/2015/07/29/6c2f4e65-eb2f-4257-9eb4-86175697d348/panasonic-lumix-g7-drive-modes-43.jpg?auto=webp&width=1200"
]

youtube_kit_photo_urls.each_with_index do |url, index|
  file = URI.open(url)
  youtube_kit.photos.attach(io: file, filename: "photo_#{index + 1}.png", content_type: "image/png")
end

puts "Creating diaper..."
diaper = Product.create!(
  name: "Reusable Diaper",
  description: "Thoughtful Package: Including 6 pack of diapers + 6 inserts + 1 wet bag per pack, 6 different modern patterns. Cute stylish prints for boys & girls. It would be ideal products for the newborns and moms!\n
  One Size Adjustable Diaper: Three rows of adjustable snaps to allow for a small, medium,large size in one diaper. Usually fit 0-2 years' baby. If you are looking for a pocket diaper to last through your baby’s infancy, toddlerhood and even future babies. Wegreeco baby diapers grow with your baby.\n
  Soft Exterior: 100% polyester, leek-free and breathable PUL, this kind of soft materials, breathe and better construction diapers help keep your baby comfortable. Double Rows of snaps fit well, the leg gusset can avoid the leaks.\n
  Absorbent and Soft Insert: Inserts are made of 2 layers of microfiber and 2 layers bamboo, the strong absorbent material with breathability and softness is gentle on your baby’s bottom, keep your baby comfortable and happy. The inner suede cloth touches baby, and wicks moisture away from baby's bottom to the insert.\n
  Reusable & Washable: As disposable nappies are not great for our planet, these reusable, super-absorbent cloth diapers are an ideal choice, they will last you for a much longer period of time. No need to stock and store multiple size diapers. A great idea for your baby and our planet.",
  category: "baby",
  rental_price_day: 500,
  user: ababy
)

diaper_photo_urls = [
  "https://m.media-amazon.com/images/I/617Y79zkpjS._SL1500_.jpg",
  "https://m.media-amazon.com/images/I/41dwZSsvMKL.jpg",
  "https://m.media-amazon.com/images/I/61eJR8YY9IL._SL1200_.jpg",
  "https://m.media-amazon.com/images/I/71pbWNRZdRL._SL1200_.jpg",
  "https://m.media-amazon.com/images/I/71e5pqOLESL._SL1500_.jpg"
]

diaper_photo_urls.each_with_index do |url, index|
  file = URI.open(url)
  diaper.photos.attach(io: file, filename: "photo_#{index + 1}.png", content_type: "image/png")
end

puts "Creating hasselblad..."

hasselblad = Product.create!(
  name: "Hasselblad X1D II 50C Medium Format Mirrorless",
  description: "The Hasselblad X1D II 50C Medium Format Mirrorless is a high-resolution, medium-format mirrorless camera and an update to the original X1D. Key features include:\n
  - Improved touchscreen, EVF, live-view refresh rate, and interface/n
  - 50MP 43.8 × 32.99mm CMOS sensor/n
  - 14-stop dynamic range and 16-bit color depth/n
  - Built-in Wi-Fi and GPS/n
  NOTE : Lens not provided.",
  category: "cameras",
  rental_price_day: 2500,
  user: techguru
)

hasselblad_photo_urls = [
  "https://cdn.hasselblad.com/f/77891/3000x2250/8fcbb61993/x1dii-xcd38v-leaf.jpg",
  "https://cdn.hasselblad.com/f/77891/3000x2250/8c64f2a4cf/x1dii-xcd38v-right.jpg",
  "https://cdn.hasselblad.com/hasselblad-com/85c54cda296a69fdda284108895609a5110d0f20_x1d-ii-rear-display-white.jpg?auto=format&q=97",
  "https://cdn.hasselblad.com/hasselblad-com/fec67206-0c26-4dfe-a764-08a689868b06_Firmware_1.2.0_Video_menues_4000px.jpg?auto=format&q=97&rect=609,0,2778,2667&w=800&h=768",
  "https://cdn.hasselblad.com/f/77891/3000x2250/a8e63dc865/x1dii-xcd38v-top.jpg"
]

hasselblad_photo_urls.each_with_index do |url, index|
  file = URI.open(url)
  hasselblad.photos.attach(io: file, filename: "photo_#{index + 1}.png", content_type: "image/png")
end

puts "Creating Sony..."

sony = Product.create!(
  name: "Sony FE 16-35mm f/4 ZA OSS",
  description: "Optical SteadyShot Image Stabilization\n
  Linear Autofocus Motor\n
  Zeiss T* Anti-Reflective Coating\n
  This is the LENS ONLY.\n
  Comes with cleaning solution and lens protector.",
  category: "cameras",
  rental_price_day: 900,
  user: techguru
)

sony_photo_urls = [
  "https://media.the-digital-picture.com/Images/Review/Sony-FE-16-35mm-f-4-ZA-OSS-Lens.jpg",
  "https://media.the-digital-picture.com/Images/Other/Sony-FE-16-35mm-f-4-ZA-OSS-Lens/Sony-FE-16-35mm-f-4-Lens-Top.jpg",
  "https://media.the-digital-picture.com/Images/Other/Sony-FE-16-35mm-f-4-ZA-OSS-Lens/Sony-FE-16-35mm-f-4-Lens-Front.jpg",
  "https://media.the-digital-picture.com/Images/Other/Sony-FE-16-35mm-f-4-ZA-OSS-Lens/Sony-FE-16-35mm-f-4-Lens-Top-Extended-with-Hood.jpg",
  "https://media.the-digital-picture.com/Images/Standard/Lenses/Review/Hood/Retracted-MFD/Sony-FE-16-35mm-f-4-ZA-OSS-Lens.jpg"
]

sony_photo_urls.each_with_index do |url, index|
  file = URI.open(url)
  sony.photos.attach(io: file, filename: "photo_#{index + 1}.png", content_type: "image/png")
end

puts "Creating Sigma..."

sigma = Product.create!(
  name: "Sigma 16-28mm f/2.8 Contemporary L Mount",
  description: "Good multi-purpose lens for many shooting conditions. Can also be used for video.\n
  L Mount, Full Frame Coverage\n
  Stepping Motor\n
  f/2.8 Max Aperture Across Zoom Range\n
  This is only the lens.\n
  There is a slight scratch on the body of the lens.",
  category: "cameras",
  rental_price_day: 800,
  user: techguru
)

sigma_photo_urls = [
  "https://www.sigma-global.com/en/wp/wp-content/uploads/2022/04/29154245/kv_black_1_16_28_28_dg_dn_c022.jpg",
  "https://www.sigma-global.com/en/wp/wp-content/uploads/2022/04/29154343/kv_black_3_16_28_28_dg_dn_c022-2560x1920.jpg",
  "https://www.sigma-global.com/en/wp/wp-content/uploads/2022/04/29154051/kv_pc_ttl_16_28_28_dg_dn_c022-2560x1440.png",
  "https://b826082.smushcdn.com/826082/wp-content/uploads/2022/06/Sigma_16_28_28_dg_dn_c022_Emt_horizontal_16mm.jpg?lossy=1&strip=1&webp=1",
  "https://heyjimmy.in/wp-content/uploads/2022/08/Sigma-16-28mm-F2.8-DG-DN-Contemporary-Lens-for-Sony-E-Online-Buy-Mumbai-India.jpg"
]

sigma_photo_urls.each_with_index do |url, index|
  file = URI.open(url)
  sigma.photos.attach(io: file, filename: "photo_#{index + 1}.png", content_type: "image/png")
end

puts "Creating Komodo..."

komodo = Product.create!(
  name: "RENT RED DIGITAL CINEMA KOMODO 6K CAMERA",
  description: "Compact cinema camera featuring red's unparalleled imagequality, color science, and groundbreaking global shutter sensor technology in ashockingly small and versatile form factor.\n
  Capture every movement, burst, and flash without sacrificing an ounce of dynamic range or overall image quality.\n
  Capture fast-moving action like it's meant to be captured. No blurred or curved lines. Just perfect pixels in every shot.\n
  Please note that this camera is often booked so book it early for your upcoming project.",
  category: "cameras",
  rental_price_day: 9000,
  user: techguru
)

komodo_photo_urls = [
  "https://www.camerahire.com.au/images/hire/red-komodo-camera-kit-hire.jpg",
  "https://d1rzxhvrtciqq1.cloudfront.net/uploads/images/listingimage/968562/image/original-a4036e19c1033f135cfbd7fef185b0dc.jpeg",
  "https://rental.digitalazul.pt/wp-content/uploads/2022/09/Hero_2_RED-KOMODO-6K-%E2%80%94-for-rent-at-Digital-Azul-Lisbon-SharpenAI-motion.jpg",
  "https://rental.digitalazul.pt/wp-content/uploads/2022/09/1602677502_IMG_1428225.jpg",
  "https://cdn11.bigcommerce.com/s-1gjhifmkdp/images/stencil/600x600/products/7882/22787/RED-7100333-90_7__74377.1602612716.jpg?c=2"
]

komodo_photo_urls.each_with_index do |url, index|
  file = URI.open(url)
  komodo.photos.attach(io: file, filename: "photo_#{index + 1}.png", content_type: "image/png")
end

puts "Creating Gopro..."

gopro = Product.create!(
  name: "GoPro HERO11 Black",
  description: "Get incredible highlight videos sent to your phone automatically with the HERO11 Black. Its new, larger image sensor captures more of the scene with higher image quality, letting you instantly share vertical shots to social media. HyperSmooth 5.0 features AutoBoost and Horizon Lock built-in, ensuring your smoothest, most stunning shots yet. New Night Effects let you get creative after dark, and 10-bit colour brings all your videos to life. All this and more make HERO11 Black the most powerful GoPro yet.\n
  This camera is super popular for action videos. Waterproof and dustproof.",
  category: "cameras",
  rental_price_day: 1700,
  user: techguru
)

gopro_photo_urls = [
  "https://s.yimg.com/uu/api/res/1.2/ZPpYNjqIU6fTqXa3_BgQpg--~B/aD0xMjI2O3c9MjAwMDthcHBpZD15dGFjaHlvbg--/https://media-mbst-pub-ue1.s3.amazonaws.com/creatr-uploaded-images/2022-09/5b34b540-334e-11ed-9d7b-d28928625091.cf.webp",
  "https://mysterio.yahoo.com/api/res/1.2/VoVFD.0iyVviHz8IrFS_Mg--/ZHByPTI7dz04NzU7YXBwaWQ9ZW5nYWRnZXQ-/https://s.yimg.com/os/creatr-uploaded-images/2022-09/d786ebd0-334f-11ed-a6f9-7b65520696d5.cf.webp",
  "https://mysterio.yahoo.com/api/res/1.2/t_4Tj_Yh0rVMkZHxvKsiwQ--/ZHByPTI7dz04NzU7YXBwaWQ9ZW5nYWRnZXQ-/https://s.yimg.com/os/creatr-uploaded-images/2022-09/d435f6a0-3350-11ed-9e7e-c6eddea52185.cf.webp",
  "https://mysterio.yahoo.com/api/res/1.2/fAsKkP5CRSgasIOhciWUNQ--/ZHByPTI7dz04NzU7YXBwaWQ9ZW5nYWRnZXQ-/https://s.yimg.com/os/creatr-uploaded-images/2022-09/99322000-3351-11ed-bdd7-ce2172c4d230.cf.webp",
  "https://mysterio.yahoo.com/api/res/1.2/8cw6vseDdH331fFnis1Jgw--/ZHByPTI7dz04NzU7YXBwaWQ9ZW5nYWRnZXQ-/https://s.yimg.com/os/creatr-uploaded-images/2022-09/000c3140-3351-11ed-976e-b5b7070d9a16.cf.webp"
]

gopro_photo_urls.each_with_index do |url, index|
  file = URI.open(url)
  gopro.photos.attach(io: file, filename: "photo_#{index + 1}.png", content_type: "image/png")
end

puts "Creating Ricoh..."

ricoh = Product.create!(
  name: "Hire Ricoh THETA Z1 51GB 360° Camera",
  description: "Great camera for parties and events. Stress free filming. Set and forget.\n
  Records natural 360° images using approx. 23MP (6720 x 3360, 7K) still image shooting and highly accurate image stitching.\n
  Demonstrates superior noise reduction performance even when shooting at night or indoors with low light – due to the 1.0-inch back illuminated CMOS image sensor.\n
  Using a newly developed lens unit which reduces ghosting, flare and purple fringing. Aperture mechanism is newly adopted with the selection of F2.1, F3.5 and F5.6. By closing down the aperture, a clear image is producing by increasing the depth of field.",
  category: "cameras",
  rental_price_day: 1300,
  user: techguru
)

ricoh_photo_urls = [
  "https://theta360.com/intl/toppage/images/img_series.png",
  "https://theta360.com/intl/toppage/images/img_simple_en.png",
  "https://s3-eu-west-1.amazonaws.com/innoverne-t4-public/products/HAC00-08094/images/large/3-Ricoh-Theta-hire.png",
  "https://s3-eu-west-1.amazonaws.com/innoverne-t4-public/products/HAC00-08094/images/large/4-Ricoh-Theta-hire.png",
  "https://s3-eu-west-1.amazonaws.com/innoverne-t4-public/products/HAC00-08094/images/large/6-Ricoh-Theta-hire.png"
]

ricoh_photo_urls.each_with_index do |url, index|
  file = URI.open(url)
  ricoh.photos.attach(io: file, filename: "photo_#{index + 1}.png", content_type: "image/png")
end

puts "Creating Tripod..."

tripod = Product.create!(
  name: "Manfrotto Heavy Duty Tripod",
  description: "This is a tripod only which fits most common camera mounts. Can hold up to 10kg. Great for outdoors or extreme shooting situations.\n
  Comes with carry bag and mount converters.\n
  Please not that there are several scratches on the body of the tripod.",
  category: "cameras",
  rental_price_day: 300,
  user: techguru
)

tripod_photo_urls = [
  "https://static.independent.co.uk/2021/03/26/10/Manfrotto%20.jpg?quality=75&width=640&auto=webp",
  "https://cdn.cvp.com/images/products/altimage/17-08-20201597667326manfrotto-befree-3-way-mkbfrla4bk-3w-1.jpg",
  "https://cdn.cvp.com/images/products/altimage/17-08-20201597667343manfrotto-befree-3-way-mkbfrla4bk-3w-7.jpg",
  "https://cdn.cvp.com/images/products/altimage/17-08-20201597667340manfrotto-befree-3-way-mkbfrla4bk-3w-6.jpg",
  "https://cdn.cvp.com/images/products/altimage/17-08-20201597667337manfrotto-befree-3-way-mkbfrla4bk-3w-5.jpg"
]

tripod_photo_urls.each_with_index do |url, index|
  file = URI.open(url)
  tripod.photos.attach(io: file, filename: "photo_#{index + 1}.png", content_type: "image/png")
end

puts "Creating SkiByk..."

ski_bike = Product.create!(
  name: "SkiByk SB200 All-Mountain Ski Bike",
  description: "The SB200 will take your SkiBiking to the next level…with full air, hi/lo compression and rebound for both the front fork and rear shock…the SB200 can take whatever you throw at it and come back for more. No Limits to edge control on the steeps, No Limits on ripping up the jumps and the trees and No Limits on carving up the groomers. Whether you are a beginner or an expert Ski Biker, the SB200 has No Limits!",
  category: "sports",
  rental_price_day: 7000,
  user: outdoorsguy
)

ski_bike_photo_urls = [
  "https://friendwitha.com/media/CACHE/images/sb200.a28f0ab52fec.webp",
  "https://friendwitha.com/media/CACHE/images/sb200_2.300553075be6.webp",
  "https://friendwitha.com/media/CACHE/images/skibyk_nom.13da8882aa97.webp"
]

ski_bike_photo_urls.each_with_index do |url, index|
  file = URI.open(url)
  ski_bike.photos.attach(io: file, filename: "photo_#{index + 1}.png", content_type: "image/png")
end

puts "Creating Big Bertha..."

big_bertha = Product.create!(
  name: "Callaway Big Bertha Diablo Men’s Golf Set",
  description: "Full Callaway set. Rately used. Diablo driver. Big Bertha irons (3-9). Cheaper than you'd get them at a course. Hardly used and comes with a set of golf balls.",
  category: "sports",
  rental_price_day: 2000,
  user: outdoorsguy
)

big_bertha_photo_urls = [
  "https://friendwitha.com/media/CACHE/images/Screen_Shot_2019-07-02_at_6.25.37_AM.e0c4bbc92079.jpg",
  "https://friendwitha.com/media/CACHE/images/Screen_Shot_2019-07-02_at_6.25.13_AM.b5412e5bdfe5.jpg"
]

big_bertha_photo_urls.each_with_index do |url, index|
  file = URI.open(url)
  big_bertha.photos.attach(io: file, filename: "photo_#{index + 1}.png", content_type: "image/png")
end

puts "Creating KingSong..."

kingsong = Product.create!(
  name: "KingSong S18",
  description: "The KingSong S18 Suspension equipped EUC is the Magic Carpet of EUCs.\n
  If you absolutely positively need to glide over bumps & cracks & holes safely, this EUC is the weapon of choice!\n
  Also perfect for anyone who'd like to try an EUC before investing in one of course. :) Or make it a family event by renting this EUC and my 2 electric skateboards.",
  category: "sports",
  rental_price_day: 4000,
  user: outdoorsguy
)

kingsong_photo_urls = [
  "https://friendwitha.com/media/CACHE/images/01_20210528_180433.9e2ce2ca23e4.webp",
  "https://friendwitha.com/media/CACHE/images/02_20210528_181346.72dd3a44d102.webp",
  "https://friendwitha.com/media/CACHE/images/03_20210528_180045.651793c46f35.webp",
  "https://friendwitha.com/media/CACHE/images/04_20210528_180727.23d16c261c10.webp",
  "https://friendwitha.com/media/CACHE/images/05_20210528_181528.9ca3088266bd.webp"
]

kingsong_photo_urls.each_with_index do |url, index|
  file = URI.open(url)
  kingsong.photos.attach(io: file, filename: "photo_#{index + 1}.png", content_type: "image/png")
end

puts "Creating Standup Board..."

standup_board = Product.create!(
  name: "Standup Paddleboard (SUP)",
  description: "This s for a Standup Paddleboard.\n
  The paddle, leash, crossbar pads and straps are included.\n
  It has been heavily used so you don't have to worry about scratching it up. This is a great board to learn on and very stable.",
  category: "sports",
  rental_price_day: 2500,
  user: outdoorsguy
)

standup_board_photo_urls = [
  "https://friendwitha.com/media/CACHE/images/SUP_1.eb3d43f3e0e5.webp",
  "https://friendwitha.com/media/CACHE/images/SUP_2.d101c14224a7.webp"
]

standup_board_photo_urls.each_with_index do |url, index|
  file = URI.open(url)
  standup_board.photos.attach(io: file, filename: "photo_#{index + 1}.png", content_type: "image/png")
end

puts "Creating Mini Swell..."

mini_swell = Product.create!(
  name: "Hurley Mini Swell Electric Fat-Tire Bike",
  description: "Hurley Mini Swell Electric. Mini Swell offers electric peddle assist and electric throttle control.\n
  Ideal cruising setup with 3\" tires, 6-speed Shimano gears, disc brakes, and fork suspension.\n
  40-mile range with speeds up to 20MPH. Wide tires provide great traction and control on all terrain.\n
  Bikes are not designed for water - riders must use caution to avoid damage.",
  category: "sports",
  rental_price_day: 4500,
  user: outdoorsguy
)

mini_swell_photo_urls = [
  "https://friendwitha.com/media/CACHE/images/Hurley_Mini_Swell_3.8fd48a57d42e.webp",
  "https://friendwitha.com/media/CACHE/images/mini_swell_back.440b49c2884b.webp",
  "https://friendwitha.com/media/CACHE/images/IMG_5057.caa27acbbbfc.webp",
  "https://friendwitha.com/media/CACHE/images/mini_swell_dimensions.ecfc1887186a.webp",
  "https://friendwitha.com/media/CACHE/images/mini_swell_bridge.3af7b673f9a9.webp"
]

mini_swell_photo_urls.each_with_index do |url, index|
  file = URI.open(url)
  mini_swell.photos.attach(io: file, filename: "photo_#{index + 1}.png", content_type: "image/png")
end

puts "Creating Onewheel..."

onewheel = Product.create!(
  name: "Onewheel XR with extended CBXR battery",
  description: "EXTENDED RANGE with the CBXR battery. Has a treaded tire, front fangs, and easier carrying handle.",
  category: "sports",
  rental_price_day: 3400,
  user: outdoorsguy
)

onewheel_photo_urls = [
  "https://friendwitha.com/media/CACHE/images/16782609411857554050388118610036.75568df0b27a.webp",
  "https://friendwitha.com/media/CACHE/images/16782610064976086655563241462668.d4c53b8567be.webp",
  "https://friendwitha.com/media/CACHE/images/16782610277028326575857425031756.e94e6582b58c.webp",
  "https://friendwitha.com/media/CACHE/images/16782610470824228322828156186693.33b70b101f3d.webp"
]

onewheel_photo_urls.each_with_index do |url, index|
  file = URI.open(url)
  onewheel.photos.attach(io: file, filename: "photo_#{index + 1}.png", content_type: "image/png")
end

puts "Creating Ski Boots..."

ski_boots = Product.create!(
  name: "Back Country Ski Boots Atomic Backland 26",
  description: "These are the lightest ski boots. The Atomic Backland Carbon Backcountry touring boots are amazing.\n
  This size is Mondo 26.0/26.5\n
  - Quick change from uphill to downhill.\n
  - Boots do not replace knowledge of the back country.\n
    Rent from me and gain a back country guide.",
  category: "sports",
  rental_price_day: 600,
  user: outdoorsguy
)

ski_boots_photo_urls = [
  "https://friendwitha.com/media/CACHE/images/IMG_20220126_164842.a71e85e24cc6.webp",
  "https://friendwitha.com/media/CACHE/images/IMG_20220126_164918.12d8953c6c46.webp",
  "https://friendwitha.com/media/CACHE/images/IMG_20220126_164806.ae480102e913.webp",
  "https://friendwitha.com/media/CACHE/images/IMG_20220126_164749.3c13620fe70d.webp"
]

ski_boots_photo_urls.each_with_index do |url, index|
  file = URI.open(url)
  ski_boots.photos.attach(io: file, filename: "photo_#{index + 1}.png", content_type: "image/png")
end

puts "Creating Bike Helmet..."

bike_helmet = Product.create!(
  name: "Freetown Gear & Gravel Lumiere Adult Bike Helmet",
  description: "LUMIERE is a true one-fits-all helmet solution.\n
  Built to fit every possible application and improved performance with MIPS™ equipped safety system.\n
  For added rider safety, the Lumiere includes fully integrated LED lights that allow you to be more visible.\n
  The Lumiere helmet is built using an injection in-mold process that bonds the helmet shell permanently to the protective foam body.\n
  The result is a lighter weight helmet with incredible durability for all of your urban adventures.",
  category: "sports",
  rental_price_day: 150,
  user: outdoorsguy
)

bike_helmet_photo_urls = [
  "https://friendwitha.com/media/CACHE/images/adult_helmet_front_angle.cb94f8268fb5.webp",
  "https://friendwitha.com/media/CACHE/images/adult_helmet_interior_view.6bd20859e21c.webp",
  "https://friendwitha.com/media/CACHE/images/adult_helmet_rear_view.8f03ec79c41c.webp",
  "https://friendwitha.com/media/CACHE/images/adult_helmet_front_view.939873840a5a.webp"
]

bike_helmet_photo_urls.each_with_index do |url, index|
  file = URI.open(url)
  bike_helmet.photos.attach(io: file, filename: "photo_#{index + 1}.png", content_type: "image/png")
end

puts "Finished!"
