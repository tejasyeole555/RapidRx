<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.rapidrx.model.Medicine" %>

<%
    String userName = (String) session.getAttribute("userName");

    if (userName == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Medicine> medicines =
            (List<Medicine>) request.getAttribute("medicines");

    String keyword = request.getParameter("keyword");
    String category = request.getParameter("category");

    if (keyword == null) keyword = "";
    if (category == null) category = "";
%>

<!DOCTYPE html>
<html>
<head>
    <title>RapidRx - Medicines</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<body>

<div class="container">

    <div class="medicine-header">
        <h1>💊 RapidRx Medicine Store</h1>
        <p>Welcome, <strong><%= userName %></strong>! Browse and order available medicines.</p>
    </div>

    <!-- Search and Filter -->
    <div class="search-section">

        <h3>🔍 Search Medicines</h3>

        <form action="search-medicines"
              method="get"
              class="search-form">

            <input
                type="text"
                name="keyword"
                placeholder="Search medicine by name..."
                value="<%= keyword %>"
            >

            <select name="category">

                <option value="">All Categories</option>

                <option value="Fever"
                    <%= "Fever".equalsIgnoreCase(category) ? "selected" : "" %>>
                    Fever
                </option>

                <option value="Pain Relief"
                    <%= "Pain Relief".equalsIgnoreCase(category) ? "selected" : "" %>>
                    Pain Relief
                </option>

                <option value="Allergy"
                    <%= "Allergy".equalsIgnoreCase(category) ? "selected" : "" %>>
                    Allergy
                </option>

                <option value="Antibiotic"
                    <%= "Antibiotic".equalsIgnoreCase(category) ? "selected" : "" %>>
                    Antibiotic
                </option>

                <option value="Supplements"
                    <%= "Supplements".equalsIgnoreCase(category) ? "selected" : "" %>>
                    Supplements
                </option>

            </select>

            <button type="submit" class="search-btn">
                🔍 Search
            </button>

            <a href="medicines" class="clear-btn">
                Clear
            </a>

        </form>

    </div>

    <!-- Medicine Table -->
    <div class="medicine-table-container">

        <table class="medicine-table">

            <tr>
                <th>ID</th>
                <th>Medicine Name</th>
                <th>Category</th>
                <th>Price</th>
                <th>Stock Status</th>
                <th>Action</th>
            </tr>

            <%
                if (medicines != null && !medicines.isEmpty()) {

                    for (Medicine medicine : medicines) {
            %>

            <tr>

                <td><%= medicine.getId() %></td>

                <td>
                    <strong><%= medicine.getName() %></strong>
                </td>

                <td>
                    <span class="category-badge">
                        <%= medicine.getCategory() %>
                    </span>
                </td>

                <td>
                    ₹ <strong><%= medicine.getPrice() %></strong>
                </td>

                <td>

                    <% if (medicine.getStock() > 5) { %>

                        <span class="stock-available">
                            ✓ In Stock (<%= medicine.getStock() %>)
                        </span>

                    <% } else if (medicine.getStock() > 0) { %>

                        <span class="stock-low">
                            ⚠ Low Stock (<%= medicine.getStock() %>)
                        </span>

                    <% } else { %>

                        <span class="stock-out">
                            ✕ Out of Stock
                        </span>

                    <% } %>

                </td>

                <td>

                    <% if (medicine.getStock() > 0) { %>

                        <a href="cart?action=add&id=<%= medicine.getId() %>"
                           class="cart-btn">
                            🛒 Add to Cart
                        </a>

                    <% } else { %>

                        <span class="disabled-cart">
                            Unavailable
                        </span>

                    <% } %>

                </td>

            </tr>

            <%
                    }
                } else {
            %>

            <tr>
                <td colspan="6" class="no-results">
                    😕 No medicines found matching your search.
                </td>
            </tr>

            <%
                }
            %>

        </table>

    </div>

    <div class="medicine-footer">
        <a href="dashboard.jsp" class="back-btn">
            ← Back to Dashboard
        </a>
    </div>

</div>

</body>
</html>