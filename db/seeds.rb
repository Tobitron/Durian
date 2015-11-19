users = User.create([
  {email: "tobias@kahn.com",
  first_name: "Tobias",
  last_name: "Kahn",
  password: "password",
  password_confirmation: "password",
  food: 1,
  outdoors: 3,
  city_person: 3,
  off_beaten_track: 4,
  touristy: 3,
  shopping: 2,
  danger: 1,
  party: 3},

  {email: "mindy@nichamin.com",
  first_name: "Mindy",
  last_name: "Nichamin",
  password: "password",
  password_confirmation: "password",
  food: 3,
  outdoors: 2,
  city_person: 3,
  off_beaten_track: 3,
  touristy: 2,
  shopping: 4,
  danger: 2,
  party: 3}
])


cities = City.create([
  {name: "Bangkok", latitude: 13.7563, longitude: 100.5018},
  {name: "Hanoi", latitude: 21.0285, longitude: 105.8542},
  {name: "Siem Reap", latitude: 13.3622, longitude: 103.8597},
  # {name: "Chiang Mai", latitude: 18.7953, longitude: 98.9986},
  # {name: "Ho Chi Minh City", latitude: 10.7500, longitude: 106.6667}
])

reviews = Review.create([
  {description: "Bangkok is huge, traffic-choked, seedy and kinda overwhelming. But, if you take the time there certainly are gems to be found. The food here is especially amazing. It's a city you should visit, but I'd happy with no more than two days.",
  city_id: 1,
  value: 7.0,
  beauty: 3.0,
  activities: 5.5,
  friendliness: 5.0,
  food: 8.5,
  touristy: 5.0,
  user_id: 1,
},

  {description: "I liked Bangkok. Yeah it's huge, but taxis are cheap and plentiful and there's so much to explore. Such a vibrant city. I'd spend a good four days here.",
  city_id: 1,
  value: 6.0,
  beauty: 5.0,
  activities: 6.0,
  friendliness: 4.0,
  food: 9.0,
  touristy: 5.0,
  user_id: 2,
},

{description: "Hanoi is my favorite big city in Vietnam for sure. It has some romantic charm to it for sure, even amidst the pandemonium. And the food, dear god! It's so good. The value here of everything is also incredible, it's quite hip. I'd say it's a must visit in Vietnam.",
city_id: 2,
value: 9.0,
beauty: 6.0,
activities: 5.0,
friendliness: 4.0,
food: 9.5,
touristy: 7.0,
user_id: 1,
},

{description: "I was a fan of Hanoi. Did a really fun food tasting tour. There's not a lot of activities here per se, but it's a fun place to chill out and very affordable. If you're doing Halong Bay, which was great, very worth at least swinging by Hanoi.",
city_id: 2,
value: 8.0,
beauty: 7.0,
activities: 6.5,
friendliness: 5.0,
food: 8.5,
touristy: 6.0,
user_id: 2,
},

{description: "You go to Siem Reap for Angkor Wat, which is undeniably one of the great wonders of the world. It's so cool. The city is a nice little added bonus. It's cute, really affordable and nicely walkable which is hard to find in SE Asia. It's filled with tourists but doesn't feel strangled by them, it's still a place to eat and get a drink after the temples but it's a lot better than I expected.",
  city_id: 3,
  value: 8.0,
  beauty: 8.0,
  activities: 9.0,
  friendliness: 7.0,
  food: 6,
  touristy: 2.0,
  user_id: 1,
  },

{description: "Siem Reap was nice, pub street drove me crazy with all the drunk tourists but otherwise I quite liked it! Cambodia is such a lovely country. Hard to beat amok tasty fish curry!",
  city_id: 3,
  value: 7.5,
  beauty: 5.0,
  activities: 8.0,
  friendliness: 7.0,
  food: 8.0,
  touristy: 5.0,
  user_id: 2,
  },
])

Review.all.each do |review|
  review.review_average = review.calc_review_average
  review.save
end

City.all.each do |city|
  city.city_review_average = city.calc_city_review_average
  city.save
end
