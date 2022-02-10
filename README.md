# The Ice Cream Truck Rest API built with Ruby on Rails

## About the Project

In this project, I built a REST API, Ice Cream Truck.

- The ice cream truck is selling three types of food items: Ice Creams, Shaved Ice, and Snack bars
- Each one of these food items has a price and a name
- An Ice cream has many flavors. Chocolate, Pistachio, Strawberry and Mint
- The Ice cream truck has a limited amount of Ice creams, Shaved ice and Chocolate bars
- Each time customers buy something, the truck owner should say "ENJOY!"
- If customers try to buy more than what the ice cream truck has in stock, then the ice cream truck owner should respond with "SO SORRY!"

The database has 3 tables and models: Category, Product, and Sale

- Categories table has name, max columns: eg. Ice Creams, Shaved Ice, Snack bars
- Products table has name, price and stock columns: eg. Chocolate, Pistachio, Strawberry, Mint
- Sales table has sold_date and product_id

A list of commonly used resources that I find helpful is listed in the acknowledgments.

## Built With

- [Ruby on Rails](https://rubyonrails.org/)
- [Ruby](https://www.ruby-lang.org/en/)

## Endpoints

### Overview

#### GET api/v1/overview

- Overview of ice cream truck. It shows:
  - total_amount_of_sale (total amount of money the ice cream truck has made)
  - total_number_of_sold_items
  - total_number_of_stocks (inventory of the ice cream truck)
  - sales_for_each_item
  - total_number_of_each_sold_item

### Sales

#### GET #index api/v1/sales

- List of sales

#### GET #show api/v1/sales/1/

- A sale that has id:1

#### POST #create api/v1/sales/

- Create a new sale
- params { sale: { sold_date: '-4712-01-01T00:00:00.000Z', product_id: 1 }}

### Products

#### GET #index api/v1/products

- List of products

#### GET #show api/v1/products/1/

- A product that has id:1

#### POST #create api/v1/products/

- Create a new product
- params {
  product: {
  name: 'New Product',
  price: 99,
  stock: 100,
  category_id: 1
  }
  }

#### PUT #update api/v1/products/1

- Update a product
- params {
  id: 1,
  product: {
  price: 9999
  }
  }

#### DELETE #destroy api/v1/products/1

- Delete a product
- params { id: 1 }

### Categories

#### GET #index api/v1/categories

- List of categories

#### GET #show api/v1/categories/1/

- A category that has id:1

#### POST #create api/v1/categories/

- Create a new category
- params {
  category: {
    name: 'New Category',
    max: 99
    }
  }

#### PUT #update api/v1/categories/1

- Update a category
- params {
  id: 1,
  category: {
    name: ''
    }
  }

#### DELETE #destroy api/v1/categories/1

- Delete a category
- params { id: 1 }

## Getting Started

To get a local copy up and running follow these simple example steps.

1. On the project GitHub page, navigate to the main page of the repository.
2. Under the repository name, locate and click on a green button named `Code`.
3. Copy the project URL as displayed.
4. If you're running the Windows Operating System, open your command prompt. On Linux, Open your terminal.
5. Change the current working directory to the location where you want the cloned directory to be made. Leave as it is if the current location is where you want the project to be.
6. Type git clone, and then paste the URL you copied in Step 3. <br>
   e.g. $ git clone https://github.com/yourUsername/yourProjectName
7. Press Enter. Your local copy will be created.
8. To install all dependencies and necessary gems, run `bundle install`
9. Run `rails db:setup`
10. Run `rails server` to run rails application in your local server
11. Run `rspec` to run rspec tests

## Author

👤 **Yoko Saka**

- GitHub: [@yocosaka](https://github.com/yocosaka)
- LinkedIn: [Yoko Saka](https://www.linkedin.com/in/yokosaka)

## Contributing

Contributions, issues, and feature requests are welcome!
Feel free to check the [issues page](../../issues).

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## Show your support

Give a ⭐️ if you like this project!

## License

This project is [MIT](./LICENSE) licensed.

## Acknowledgements

- [Ruby on Rails guide](https://guides.rubyonrails.org/api_documentation_guidelines.html)
- [Shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers)
- [Rspec-rails](https://github.com/rspec/rspec-rails)
