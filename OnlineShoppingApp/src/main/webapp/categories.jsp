<nav>
    <a href="home.jsp">Home</a>

    <!-- Dropdown for Categories -->
    <div class="dropdown">
        <a class="btn dropdown-toggle" href="#" role="button" id="categoriesDropdown" 
           data-bs-toggle="dropdown" aria-expanded="false" style="color: #333; text-decoration: none;">
            Categories
        </a>
        <ul class="dropdown-menu" aria-labelledby="categoriesDropdown">
            <% for (String category : categoryMap.keySet()) { %>
                <li><a class="dropdown-item" href="category.jsp?name=<%= category %>"><%= category %></a></li>
            <% } %>
        </ul>
    </div>

    <!-- Dropdown for More -->
    <div class="dropdown">
        <a class="btn dropdown-toggle" href="#" role="button" id="moreDropdown" 
           data-bs-toggle="dropdown" aria-expanded="false" style="color: #333; text-decoration: none;">
            More
        </a>
        <ul class="dropdown-menu" aria-labelledby="moreDropdown">
            <li><a class="dropdown-item" href="about.jsp">About Us</a></li>
            <li><a class="dropdown-item" href="contact.jsp">Contact</a></li>
            <li><a class="dropdown-item" href="faq.jsp">FAQs</a></li>
        </ul>
    </div>

    <a href="cart.jsp">Cart</a>
    <a href="profile.jsp">Profile</a>
</nav>
