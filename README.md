# 💊 RapidRx

## Online Medicine Shopping and Management Platform

RapidRx is a full-stack web application developed using Java technologies. It provides an online platform where users can browse medicines, manage their cart, upload prescriptions, place orders, and track order status.

The application also includes an Admin Module for managing medicines, monitoring orders, checking low-stock medicines, and viewing dashboard statistics.

---

## 🚀 Features

### 👤 User Features

* User Registration
* User Login and Logout
* Personalized User Dashboard
* Browse Available Medicines
* Search Medicines by Name
* Filter Medicines by Category
* Add Medicines to Cart
* Update Cart Quantity
* Remove Items from Cart
* Stock Validation
* Out-of-Stock Protection
* Upload Prescription
* Checkout
* Cash on Delivery
* Simulated Online Payment
* Payment Status Management
* Place Orders
* View Order History
* Track Order Status

### 👨‍💼 Admin Features

* Admin Login and Logout
* Admin Dashboard
* Dashboard Statistics
* View Total Medicines
* View Total Orders
* View Total Users
* Low Stock Alert
* View All Medicines
* Add New Medicine
* Update Medicine
* Delete Medicine
* View All Customer Orders
* Update Order Status

---

## 🛠 Technology Stack

### Backend

* Java 21
* Java Servlets
* JDBC
* JSP
* Maven

### Frontend

* HTML
* CSS
* JSP

## 📸 Screenshots

### 🏠 User Dashboard

![User Dashboard](screenshots/user-dashboard.png)

### 💊 Medicine Store

![Medicine Store](screenshots/medicine-store.png)

### 🛒 Shopping Cart

![Shopping Cart](screenshots/cart.png)

### 📦 Order History

![Order History](screenshots/order-history.png)

### 👨‍💼 Admin Dashboard

![Admin Dashboard](screenshots/admin-dashboard.png)

### 💊 Manage Medicines

![Manage Medicines](screenshots/manage-medicines.png)

### 📦 Admin Orders

![Admin Orders](screenshots/admin-orders.png)

### ⚠️ Low Stock Alert

![Low Stock Alert](screenshots/low-stock.png)


### Database

* MySQL

### Server

* Apache Tomcat 9

### Tools

* VS Code
* MySQL Command Line Client
* Git
* GitHub

---

## 🏗 Project Architecture

RapidRx follows a layered architecture:

```text
User
  ↓
JSP / Frontend
  ↓
Servlet Controller
  ↓
DAO Layer
  ↓
JDBC
  ↓
MySQL Database
```

### Main Components

* **Controller** – Handles HTTP requests and application flow.
* **DAO** – Handles database operations.
* **Model** – Contains application entities such as User, Medicine, CartItem, and Order.
* **Util** – Contains database connection utilities.
* **JSP** – Displays the user and admin interfaces.

---

## 📂 Project Structure

```text
RapidRx/
│
├── src/
│   └── main/
│       ├── java/
│       │   └── com/rapidrx/
│       │       ├── Controller/
│       │       ├── dao/
│       │       ├── model/
│       │       └── util/
│       │
│       └── webapp/
│           ├── css/
│           ├── WEB-INF/
│           ├── login.jsp
│           ├── register.jsp
│           ├── dashboard.jsp
│           ├── medicines.jsp
│           ├── cart.jsp
│           ├── order-history.jsp
│           └── ...
│
├── database/
│   └── rapidrx.sql
│
├── pom.xml
├── .gitignore
└── README.md
```

---

## 🗄 Database

The project uses a MySQL database named:

```text
rapidrx
```

### Main Tables

* `users` – Stores user information.
* `admins` – Stores admin credentials.
* `medicines` – Stores medicine details, categories, prices, and stock.
* `orders` – Stores customer order and payment information.
* `order_items` – Stores medicines associated with each order.

The database setup file is available at:

```text
database/rapidrx.sql
```

---

## ⚙️ Installation and Setup

### 1. Clone the Repository

Clone the project from GitHub:

```text
git clone <your-repository-url>
```

### 2. Create the Database

Open MySQL and import the database file:

```sql
CREATE DATABASE rapidrx;
USE rapidrx;
```

Then import:

```text
database/rapidrx.sql
```

### 3. Configure Database Connection

Update the database configuration in the `DBConnection` utility according to your MySQL setup.

### 4. Build the Project

```text
mvn clean package
```

### 5. Deploy on Tomcat

Copy the generated WAR file from the Maven `target` directory into the Tomcat `webapps` directory.

Start Apache Tomcat and open the application in your browser.

---

## 🔐 Security and Validation Features

* Session-based user authentication
* Separate Admin and User modules
* Login protection for restricted pages
* Stock validation before adding items to the cart
* Out-of-stock protection
* Stock reduction during order processing
* Database transaction handling during order creation

---

## 💡 Future Enhancements

* Password hashing and encryption
* Real payment gateway integration
* Email notifications
* OTP-based authentication
* Medicine image support
* Prescription verification workflow
* Admin analytics and reports
* REST API integration
* Improved responsive mobile UI

---

## 👨‍💻 Author

**Tejas Yeole**

Final Year Information Technology Student

---

⭐ If you found this project useful, consider giving the repository a star!
