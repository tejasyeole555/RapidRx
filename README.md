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

## Save the file

Your structure should now include:

```text
E:\RapidRx
│
├── README.md  ✅
├── pom.xml
├── src
└── .gitignore
