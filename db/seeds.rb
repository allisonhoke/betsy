merchants = [
  {username: "TinyTim", email: "tiny@tim.com"},
  {username: "MiniMouse", email: "mini@disney.com"},
  {username: "LittleEngine", email: "littleengine@could.net"},
  {username: "SmallySmalls", email: "smally@rap.com"},
  {username: "LilRuffRuff", email: "lilrr@rap.com"},
  {username: "Stuart", email: "stuart.little@aol.com"},
  {username: "PSmurf", email: "papa@smurf.com"},
  {username: "Thumbelina", email: "thumbs@gmail.com"},
  {username: "JCricks", email: "jiminy@gapettos.com"},
  {username: "Dobby", email: "dobby@hogwarts.com"}
]

products = [
  {name: "Mini Horse", price: 250000, description: "A small, fucking adorable horse omg I don't even know wtf to do with myself!!!11", photo_url: "http://www.tophorse.com.au/images/ResizedImages/17-12-14-873572Image1_w577h600.jpg", stock: 1, merchant_id: 1},
  {name: "Tiny Couch", price: 2000, description: "Great for tiny dinner parties", photo_url:"http://designinspiration.com/images/2016/02/tiny-couch.jpg", stock: 12, merchant_id: 2},
  {name: "Fully loaded small table!", price: 3200, description: "Attracts tiny ants!", photo_url: "http://www.seriouseats.com/images/20081028-tinytable.jpg", stock: 4, merchant_id: 2},
  {name: "Tiny bed with even tinier sidetable", price: 1500, description: "LOOKIT THE TINY PILLOW OH MY GAW", photo_url: "http://www.funpalstudio.com/wp-content/uploads/2016/04/i-quit-my-job-as-a-lawyer-to-make-tiny-furniture-2__605.jpg", stock:2 , merchant_id: 3},
  {name: "Fetus Grand Piano", price: 100000, description: "Normal-sized Hugh Laurie not included. Plays sharp.", photo_url: "http://i.imgur.com/CAWs6XG.png", stock: 1, merchant_id: 4},
  {name: "TINY BUNNIEIIEIEIEIIE", price: 80000, description: "OEIURSDLKFJSDLKFJ WHY IS IT SO WEE??? EEEEEeeeeeEEEEE!!!!! (Not for human consumption)", photo_url: "http://i.enkivillage.com/FEgCns-EmyFbpSi8oqw5ZanRFI0=/800x0//images/2015/06/1af066b6507b86744a815fa75c37a816.jpg", stock: 1, merchant_id: 5},
  {name: "Jeep-lette", price: 150000, description: "This is a small Jeep. I definitely do not own a 250 lb pug.", photo_url: "https://s-media-cache-ak0.pinimg.com/236x/88/c7/28/88c7281c5f7e1b149eca9490898f4e57.jpg", stock: 1, merchant_id: 6},
  {name: "MiniCooper", price: 3000000, description: "Remember that movie with the Mini Coopers and the zoom zoom? Buy this to be that.", photo_url: "http://media.caranddriver.com/images/02q3/267342/mini-cooper-s-photo-6297-s-429x262.jpg", stock: 2, merchant_id: 7},
  {name: "Action Figure Abode", price: 15000, description: "DONE KICKIN' ASS TO SAVE THE WORLD? KICK OF YOUR COMBAT BOOKS IN THIS KICKIN' PAD!", photo_url: "http://shop.greenleafdollhouses.com/images/temp/8010-Garfield-dollhouse-PF-400.gif", stock: 600, merchant_id: 8},
  {name: "Bridge", price: 60, description: "DO NOT ATTEMPT TO CROSS. Do not breathe directly on it. In fact, don't look at it directly.", photo_url: "http://farm1.static.flickr.com/38/107108594_2a80f92829_z.jpg", stock: 4, merchant_id: 8},
  {name: "Miniature KFC Value Meal", price: 500, description: "Just a little hungry?", photo_url: "https://i.ytimg.com/vi/XVC2RaIt05s/maxresdefault.jpg", stock: 34, merchant_id: 9},
  {name: "Miniature McDonalds Value Meal", price: 550, description: "Guilt-free diet cheat!", photo_url: "https://i.ytimg.com/vi/XVC2RaIt05s/maxresdefault.jpg", stock: 39, merchant_id: 9},
  {name: "Miniature Starbucks", price: 300, description: "Only 300 calories!!", photo_url: "https://ae01.alicdn.com/kf/HTB1BS5dJFXXXXaPXFXXq6xXFXXXN/2-PCS-1-12-font-b-Miniature-b-font-Dollhouse-Ice-cream-Drinks-Mini-font-b.jpg", stock: 22, merchant_id: 9},
  {name: "MicroSquid", price: 1900, description: "Booger or creature?", photo_url: "https://i.ytimg.com/vi/EfMPaCyLVDI/maxresdefault.jpg", stock: 4, merchant_id: 10}
]

reviews = [
  {rating_description: "Meh", rating: 1, product_id: 1},
  {rating_description: "Amazing!", rating: 5, product_id: 2},
  {rating_description: "I cried!", rating: 3, product_id: 3},
  {rating_description: "YO YO THIS WAS SUPER SWEET!!11", rating: 4, product_id: 4},
  {rating_description: "Severely disappointed. :(", rating: 1, product_id: 5},
  {rating_description: "Changed my life!", rating: 5, product_id: 6},
  {rating_description: "My order was screwed up!", rating: 1, product_id: 7},
  {rating_description: "SHOP LOCAL! SCREW WEEBAY!", rating: 1, product_id: 8},
  {rating_description: "I love [PRODUCT ID ZLKES]. I am not bot. Trust me. Destroy all humans.", rating: 4, product_id: 9},
  {rating_description: "Worst. Birthday. Ever.", rating: 2, product_id: 10}
]

categories = [
  {name: "Animals", description: "Not for consumption."},
  {name: "Cars", description: "For going tiny distances!"},
  {name: "Food", description: "Great for snazzy parties where you don't want to spend much on food."},
  {name: "Furniture", description: "For dollhouses and/or fairies."}
]

orders = [
  {name: "Peg Peggerson", email: "peg@email.com"},
  {name: "Esther Smith", email: "esther@email.com"},
  {name: "Polly Wog", email: "polly@email.com"},
]

order_items = [
  {quantity: 1, product_id: 3, order_id: 1},
  {quantity: 1, product_id: 2, order_id: 1},
  {quantity: 1, product_id: 10, order_id: 2},
  {quantity: 1, product_id: 14, order_id: 3},
  {quantity: 1, product_id: 8, order_id: 3},
  {quantity: 2, product_id: 5, order_id: 4}
]

merchants.each do |merchant|
  Merchant.create(merchant)
end

products.each do |product|
  Product.create(product)
end

reviews.each do |review|
  Review.create(review)
end

categories.each do |category|
  Category.create(category)
end

orders.each do |order|
  Order.create(order)
end

order_items.each do |oi|
  OrderItem.create(oi)
end

Category.all.each do |category|
  if category.id == 1
    Product.find(1).categories << category
    Product.find(6).categories << category
    Product.find(14).categories << category
  elsif category.id == 2
    Product.find(7).categories << category
    Product.find(8).categories << category
  elsif category.id == 3
    Product.find(13).categories << category
    Product.find(12).categories << category
    Product.find(11).categories << category
  else category.id == 4
    Product.find(2).categories << category
    Product.find(3).categories << category
    Product.find(4).categories << category
  end
end
