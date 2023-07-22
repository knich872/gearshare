require "open-uri"

puts "Cleaning database..."
Booking.destroy_all
Product.destroy_all
User.destroy_all

puts "Creating Users..."

techguru = User.create!(
  user_name: "TechGuru",
  email: "techguru@gearshare.com",
  location: ["Tokyo","Osaka","Kyoto","Nagoya","Fukuoka","Okinawa"].sample,
  password: "0123456"
)
puts "User with id :#{techguru.id} has been created"

fashionprincess = User.create!(
  user_name: "FashionPrincess",
  email: "fashionPrincess@gearshare.com",
  location: ["Tokyo","Osaka","Kyoto","Nagoya","Fukuoka","Okinawa"].sample,
  password: "0123456"
)
puts "User with id :#{fashionprincess.id} has been created"

outdoorsguy = User.create!(
  user_name: "OutdoorsGuy",
  email: "outdoorsguy@gearshare.com",
  location: ["Tokyo","Osaka","Kyoto","Nagoya","Fukuoka","Okinawa"].sample,
  password: "0123456"
)
puts "User with id :#{outdoorsguy.id} has been created"

partykingdom = User.create!(
  user_name: "PartyKingdom",
  email: "partykingdom@gearshare.com",
  location: ["Tokyo","Osaka","Kyoto","Nagoya","Fukuoka","Okinawa"].sample,
  password: "0123456"
)
puts "User with id :#{partykingdom.id} has been created"

ababy = User.create!(
  user_name: "ABaby",
  email: "Ababy@gearshare.com",
  location: ["Tokyo","Osaka","Kyoto","Nagoya","Fukuoka","Okinawa"].sample,
  password: "0123456"
)
puts "User with id :#{ababy.id} has been created"

puts "Creating Products..."

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

puts "Finished!"
