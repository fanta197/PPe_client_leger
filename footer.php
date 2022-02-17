<footer>
<!-- ***** Reservation Us Area Starts ***** -->
  <div class="container">
    <div class="row">
      <div class="col-lg-6 align-self-center">
        <div class="left-text-content">
          <div class="section-heading">
            <h6>Contact Us</h6>
            <h2>Une question à nous poser ?</h2>
          </div>
          <p>Hachette Livre, filiale du groupe Lagardère, est dépositaire d’une partie de l’héritage culturel d’un pays. Au-delà de ses frontières historiques, le Groupe poursuit l’aventure entamée en 1826 par Louis Hachette et fédère des maisons d’édition aussi variées que prestigieuses qui exercent leur savoir-faire dans tous les segments du marché du livre à destination du grand public et de l’éducation. Trois mots résument son engagement : variété, autonomie, responsabilité.</p>
          <div class="row">
            <div class="col-lg-6">
              <div class="phone">
                <i class="fa fa-phone"></i>
                <h4>Phone Numbers</h4>
                <span><a href="#">080-090-0990</a></span>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="message">
                <i class="fa fa-envelope"></i>
                <h4>Emails</h4>
                <span><a href="#">contact@iris.com</a></span>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-lg-6">
        <div class="contact-form">
          <form id="contact" action="" method="post">
            <div class="row">
              <div class="col-lg-12">
                <h4>Contact</h4>
              </div>
              <div class="col-lg-6 col-sm-12">
                <fieldset>
                  <input name="name" type="text" id="name" placeholder="Nom & Prénom*" required="">
                </fieldset>
              </div>
              <div class="col-lg-6 col-sm-12">
                <fieldset>
                  <input name="email" type="text" id="email" pattern="[^ @]*@[^ @]*" placeholder="Adresse Mail*" required="">
                </fieldset>
              </div>
              <div class="col-lg-12">
                <fieldset>
                  <textarea name="message" rows="6" id="message" placeholder="Message*" required=""></textarea>
                </fieldset>
              </div>
              <div class="col-lg-12">
                <fieldset>
                  <button type="submit" id="form-submit" class="main-button-icon">Envoyer</button>
                </fieldset>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
  <!-- ***** Reservation Area Ends ***** -->
  <div class="container">
    <div class="row">
      <div class="col-lg-4 col-xs-12">
        <div class="right-text-content">
          <ul class="social-icons">
            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
            <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
            <li><a href="#"><i class="fa fa-instagram"></i></a></li>
          </ul>
        </div>
      </div>
      <div class="col-lg-4">
        <div class="logo">
          <a href="index.html"><img src="assets/images/white-logo.png" alt=""></a>
        </div>
      </div>
      <div class="col-lg-4 col-xs-12">
        <div class="left-text-content">
          <p>© Copyright Iris Co.</p>
        </div>
      </div>
    </div>
  </div>
</footer>

<!-- jQuery -->
<script src="assets/js/jquery-2.1.0.min.js"></script>

<!-- Bootstrap -->
<script src="assets/js/popper.js"></script>
<script src="assets/js/bootstrap.min.js"></script>

<!-- Plugins -->
<script src="assets/js/owl-carousel.js"></script>
<script src="assets/js/accordions.js"></script>
<script src="assets/js/datepicker.js"></script>
<script src="assets/js/scrollreveal.min.js"></script>
<script src="assets/js/waypoints.min.js"></script>
<script src="assets/js/jquery.counterup.min.js"></script>
<script src="assets/js/imgfix.min.js"></script>
<script src="assets/js/slick.js"></script>
<script src="assets/js/lightbox.js"></script>
<script src="assets/js/isotope.js"></script>

<!-- Global Init -->
<script src="assets/js/custom.js"></script>
<script>
  $(function() {
    var selectedClass = "";
    $("p").click(function() {
      selectedClass = $(this).attr("data-rel");
      $("#portfolio").fadeTo(50, 0.1);
      $("#portfolio div").not("." + selectedClass).fadeOut();
      setTimeout(function() {
        $("." + selectedClass).fadeIn();
        $("#portfolio").fadeTo(50, 1);
      }, 500);

    });
  });
</script>
</body>

</html>
