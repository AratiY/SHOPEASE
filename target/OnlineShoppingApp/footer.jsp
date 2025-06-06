
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Simple Footer</title>
<style>
  body {
    margin: 0;
    font-family: Arial, sans-serif;
    background-color: #fff;
  }
  footer {
    background-color: #F2C6B9;
    padding: 30px 20px;
    color: #333;
  }
  .footer-container {
    max-width: 1200px;
    margin: 0 auto;
  }
  .footer-columns {
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
    gap: 30px;
  }
  .footer-column {
    flex: 1;
    min-width: 180px;
  }
  .footer-column h4 {
    margin-bottom: 12px;
    font-size: 14px;
    color: #0073e6;
    text-transform: uppercase;
  }
  .footer-column ul {
    list-style: none;
    padding: 0;
    margin: 0;
  }
  .footer-column ul li {
    margin-bottom: 8px;
    font-size: 13px;
    cursor: pointer;
    transition: color 0.3s ease;
  }
  .footer-column ul li:hover {
    color: #005bb5;
  }
  .footer-description {
    font-size: 13px;
    color: #444;
    line-height: 1.5;
    max-width: 900px;
    margin: 30px auto 0 auto;
    text-align: center;
  }
  .footer-company-info {
    font-size: 12px;
    color: #555;
    margin-top: 30px;
    border-top: 1px solid #ccc;
    padding-top: 15px;
    text-align: center;
  }
  .footer-company-info p {
    margin: 5px 0;
    line-height: 1.4;
  }
  .footer-bottom {
    font-size: 12px;
    color: #666;
    text-align: center;
    margin-top: 20px;
  }
  .footer-bottom p {
    margin: 2px 0;
  }
</style>
</head>
<body>

<footer>
  <div class="footer-container">
    <div class="footer-columns">
      <div class="footer-column">
        <h4>Shop</h4>
        <ul>
          <li>Men</li>
          <li>Women</li>
          <li>Kids</li>
          <li>Home</li>
          <li>Beauty</li>
        </ul>
      </div>
      <div class="footer-column">
        <h4>About Us</h4>
        <ul>
          <li>Careers</li>
          <li>Blog</li>
          <li>Corporate Info</li>
          <li>Contact</li>
        </ul>
      </div>
      <div class="footer-column">
        <h4>Support</h4>
        <ul>
          <li>FAQ</li>
          <li>Shipping</li>
          <li>Returns</li>
          <li>Privacy Policy</li>
        </ul>
      </div>
    </div>

    <div class="footer-description">
      <p><strong>ShopEase</strong> - Your trusted online shopping destination. Enjoy safe and easy shopping with fast delivery and customer support.</p>
    </div>

    <div class="footer-company-info">
      <p>Registered Office: Embassy Tech Village, Outer Ring Road, Bengaluru - 560103, India</p>
      <p>Tel: +91-800-1234567 | +91-801-7654321</p>
    </div>

    <div class="footer-bottom">
      <p>© 2025 ShopEase. All rights reserved.</p>
      <p>A Flipkart company</p>
    </div>
  </div>
</footer>

</body>
</html>
