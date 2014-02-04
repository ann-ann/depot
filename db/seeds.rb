
Product.create(title: 'Web Design for Developers',
  description:
    %{<p>
        This book will show you how to make your
        web-based application look professionally designed. We'll help you
        learn how to pick the right colors and fonts, avoid costly interface
        and accessibility mistakes -- your application will really come alive.
        We'll also walk you through some common Photoshop and CSS techniques
        and work through a web site redesign, taking a new design from concept
        all the way to implementation.
      </p>},
  image_url: 'uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}/wd4d.jpg',    
  price: 42.95,
  in_stock: 10)
# . . .
Product.create(title: 'Programming Ruby 1.9',
  description:
    %{<p>
        Ruby is the fastest growing and most exciting dynamic language
        out there. If you need to get working programs delivered fast,
        you should add Ruby to your toolbox.
      </p>},
  image_url: 'uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}/ruby.jpg',
  price: 49.50,
  in_stock: 5)
# . . .

Product.create(title: 'Rails Test Prescriptions',
  description:
    %{<p>
        <em>Rails Test Prescriptions</em> is a comprehensive guide to testing
        Rails applications, covering Test-Driven Development from both a
        theoretical perspective (why to test) and from a practical perspective
        (how to test effectively). It covers the core Rails testing tools and
        procedures for Rails 2 and Rails 3, and introduces popular add-ons,
        including Cucumber, Shoulda, Machinist, Mocha, and Rcov.
      </p>},
  image_url: 'uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}/rtp.jpg',
  price: 43.75,
  in_stock: 3)

Address.create(address: "some str 11", zipcode: "12345", city: "Kiev", phone: "0631234567", country_id: "1")
Author.create(first_name: "Brian", last_name: "Hogan")
Author.create(first_name: "Dave", last_name: "Thomas")
Author.create(first_name: "Chad", last_name: "Fowler")
Author.create(first_name: "Noel", last_name: "Rappin")

ProductAuthor.create(product_id: 1, author_id: 1)
ProductAuthor.create(product_id: 2, author_id: 2)
ProductAuthor.create(product_id: 2, author_id: 3)
ProductAuthor.create(product_id: 3, author_id: 4)

Country.create(name: "Ukraine")

Customer.create(first_name: "ann", last_name: "vs", email: "ann@gmail.com", password: 1, password_confirmation: 1, role: "user")
Customer.create(first_name: "ann", last_name: "admin", email: "admin@gmail.com", password: 1, password_confirmation: 1, role: "admin")

Rating.create(customer_id: 1, product_id: 1, rating: 10, text: "Such an awesome book!")

Type.create(name: "book")
Type.create(name: "other")
ProductType.create(product_id: 1, type_id: 1)
ProductType.create(product_id: 2, type_id: 1)
ProductType.create(product_id: 3, type_id: 2)

Order.create(customer_id: 1)

OrderItem.create(product_id: 1, order_id: 1)
OrderItem.create(product_id: 2, order_id: 1)




