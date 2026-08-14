# 💊 RapidRx

RapidRx is an Online Medicine Shopping and Management Platform developed using Java Full Stack technologies.

The application allows users to register, login, browse medicines, add medicines to a cart, upload prescriptions, place orders, and make simulated payments. It also includes an Admin Module for managing medicines and viewing customer orders.

---

## 🚀 Features

### 👤 User Features

- User Registration
- User Login and Logout
- Browse Medicines
- Add Medicines to Cart
- Update Cart Quantity
- Remove Items from Cart
- Upload Prescription
- Checkout
- Cash on Delivery
- Simulated Online Payment
- Place Order
- Order History
- View Order Status

### 👨‍💼 Admin Features

- Admin Login
- Admin Dashboard
- View All Medicines
- Add New Medicine
- Delete Medicine
- View All Customer Orders

---

## 🛠 Technologies Used

### Backend

- Java 21
- JDBC
- Servlets
- JSP
- Maven

### Frontend

- HTML
- CSS
- JSP

### Database

- MySQL

### Server

- Apache Tomcat 9

---

## 📂 Project Structure

```text
RapidRx
│
├── src
│   └── main
│       ├── java
│       │   └── com
│       │       └── rapidrx
│       │           ├── Controller
│       │           ├── dao
│       │           ├── model
│       │           └── util
│       │
│       └── webapp
│           ├── css
│           ├── WEB-INF
│           ├── login.jsp
│           ├── register.jsp
│           ├── dashboard.jsp
│           ├── cart.jsp
│           └── ...
│
├── database
│   └── rapidrx.sql
│
├── pom.xml
├── .gitignore
└── README.md
