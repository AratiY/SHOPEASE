<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Footer Example</title>

  <!-- Theme CSS (your custom styles) -->
  <link rel="stylesheet" href="css/theme.min.css" />

  <!-- Bootstrap Icons CDN -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" />
</head>
<body>

  <footer class="bg-dark">
    <div class="pt-5 bg-darker">
      <div class="container">

        <!-- Features Row -->
        <div class="row pb-3">
          <div class="col-md-3 col-sm-6 mb-4">
            <div class="d-flex">
              <i class="bi bi-rocket-takeoff text-primary" style="font-size: 2.25rem;"></i>
              <div class="ps-3">
                <h6 class="text-light mb-1">Fast and free delivery</h6>
                <p class="text-light opacity-50 mb-0">Free delivery for all orders over ₹200</p>
              </div>
            </div>
          </div>
          
          <div class="col-md-3 col-sm-6 mb-4">
            <div class="d-flex">
              <i class="bi bi-currency-exchange text-primary" style="font-size: 2.25rem;"></i>
              <div class="ps-3">
                <h6 class="text-light mb-1">Money back guarantee</h6>
                <p class="text-light opacity-50 mb-0">We return money within 30 days</p>
              </div>
            </div>
          </div>

          <div class="col-md-3 col-sm-6 mb-4">
            <div class="d-flex">
              <i class="bi bi-headset text-primary" style="font-size: 2.25rem;"></i>
              <div class="ps-3">
                <h6 class="text-light mb-1">24/7 customer support</h6>
                <p class="text-light opacity-50 mb-0">Friendly 24/7 customer support</p>
              </div>
            </div>
          </div>

          <div class="col-md-3 col-sm-6 mb-4">
            <div class="d-flex">
              <i class="bi bi-shield-lock text-primary" style="font-size: 2.25rem;"></i>
              <div class="ps-3">
                <h6 class="text-light mb-1">Secure online payment</h6>
                <p class="text-light opacity-50 mb-0">We use SSL secure certificate</p>
              </div>
            </div>
          </div>
        </div>

        <!-- Divider -->
        <hr class="hr-light mb-5" />

        <!-- Footer Links -->
        <div class="row pb-2">
          <div class="col-md-6 text-center text-md-start mb-4">
            <div class="mb-4">
              <a href="#">
                <img src="{% static 'img/home/hero-slider/e-product.png' %}" width="117" alt="E-product" />
              </a>
            </div>

            <ul class="d-flex flex-wrap justify-content-center justify-content-md-start list-unstyled">
              <li class="me-4"><a class="text-light" href="#">Outlets</a></li>
              <li class="me-4"><a class="text-light" href="#">Affiliates</a></li>
              <li class="me-4"><a class="text-light" href="#">Support</a></li>
              <li class="me-4"><a class="text-light" href="#">Privacy</a></li>
              <li class="me-4"><a class="text-light" href="#">Terms of use</a></li>
            </ul>
          </div>
        </div>

        <!-- Copyright -->
        <div class="pb-4 text-center text-md-start text-light opacity-50 fs-xs">
          © All rights reserved. Made by 
          <a class="text-light" href="https://dse.studio/" target="_blank" rel="noopener">Pentagon Space Students</a>
        </div>
      </div>
    </div>
  </footer>

</body>
</html>