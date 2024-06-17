# Super-Advanced-Shopping-Automation Project

## Project Overview

Super-Advanced-Shopping-Automation is a web application developed using Java, JSP, Maven, Apache Tomcat, and MySQL. It allows users to register, log in, shop for products, and view their purchase history.

## Technologies Used

- Java
- JSP (JavaServer Pages)
- Maven
- Apache Tomcat
- MySQL

## Installation

Follow these steps to install and run the project locally:

### Clone the repository

```bash
$ git clone https://github.com/username/projectname.git
$ cd projectname
```

## Build the project

```bash
$ mvn clean install
```

## Set up the database

- Create a MySQL database named alisveris.

- Import the database schema from content/urunKategoriKullanici.sql file.

```bash
$ mysql -u username -p shopping < content/urunKategoriKullanici.sql
$ cd projectname
```

## Run the project

- $ mvn tomcat7:run

```bash
$ mvn tomcat7:run
```

## Features

- User Management:
  - Register and login functionalities.
- Shopping:
  - Browse products and add them to the cart.
- Order History:
  - View past orders and details.

## Alternative Approach: Using Database Instead of Cookies for Session and Cart Management

In this project, an alternative approach has been implemented to manage sessions and shopping carts using the database instead of cookies. This ensures better security and scalability.

#### How It Works

- Session Management:

  - User sessions are stored in the database using a session table (sessions) with fields like session_id, user_id, expiry_time, etc.

- Shopping Cart Management:

  - Each user's shopping cart items are stored in a database table (shopping_cart) associated with the user_id. This table includes fields such as user_id, product_id, quantity, etc.

- Implementation Details:
  - The application uses SQL queries to manage sessions and shopping carts.
  - Example SQL statements are provided in content/database.sql.

## Usage

#### Registration

- Navigate to the registration page.
- Fill out the required fields and submit the form.

#### Login

- After registration, login with your credentials.

#### Shopping

- Browse through available products.
- Add desired items to the shopping cart.

#### Order History

- View previous orders and their details.

## Contributing

Contributions are welcome! Please fork the repository and create a pull request for any new features or fixes.

## License

This project is licensed under the [MIT License](./LICENSE). See the LICENSE file for details.

## Contact

For any questions or feedback, feel free to reach out:

E-mail: isci.eren@gmail.com
