Factory.define :user do |user|
  user.name                  "Oussama Issaoui"
  user.email                 "OIssaoui@example.com"
  user.password              "foobar"
  user.password_confirmation "foobar"
end

Factory.define :category do |category|
  category.name              "Example Category"
  category.description       "Some words to describe the Example Category"
end

Factory.define :product do |product|
  product.name               "Example Product"
  product.description        "Some words to describe the Example Product"
  product.price              "1.23"
end
