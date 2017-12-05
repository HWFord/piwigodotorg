{literal}
<script type="text/javascript">
$(document).ready(function() {
    $('.btn-news-see-more .btn').click(function() {
      var $start = $(".newsletter-content").length;
      $.ajax({
        type: "GET",
        url: "ws.php",
        dataType: "html",
        data: {
          method: "porg.newsletters.seemore",
          start: $start,
          count: 6,
        },
        success: function(html) {
          $(".row-newsletters").append(html);
          if (($start + 6) >= $(".btn-news-see-more .btn").data("length")) {
            $(".btn-news-see-more .btn").css("display", "none");
          }
        },
      });
    });
});
</script>
{/literal}

  <section class="container-fluide pwg-newsletter">
    <div class="container">
      <div class="equal">
        <div class="col-md-6">
          <h1>Newsletter</h1>
          <p>Keep up with Piwigo news. You will receive emails when a new release is available and when major events happen to the project.</p>
        </div>
        <div class="col-md-6 pwg-newsletter-icon">
        </div>
      </div>
    </div>
  </section>

  <section class="container form-newsletter">
    <form class="form-inline form-newsletter-subscribe text-center">
      <h1 class="bold">Subscribe to our newsletter and stay updated!</h1>
      <div class="form-group">
        <label for="email"></label>
        <input type="email" class="form-newsletter-email" id="email" placeholder="Enter your email here" name="email">
      </div>
      <button type="submit" class="btn btn-default"><span class="bold">SIGN UP</span></button>
    </form>
  </section>

  <section class="container newsletter-container" {counter start=0 skip=1}>
    <div class="equal row-newsletters">
    {include file='template/newsletters_articles.tpl'} 
    </div>
 </section>

  <section class="container-fluide container-red-salmon">
    <div class="container">
      {if {$newsletters_length > 9}}
      <div class="text-center btn-news-see-more">
        <button class="btn" data-length="{$newsletters_length}"><span class="bold">See More</span></button>
      </div>
      {/if}
    </div>
  </section>
