<%@ Page Title="Test Page" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">

<script async src="https://cdn.ampproject.org/v0.js"></script>
 <script async custom-element="amp-accordion" src="https://cdn.ampproject.org/v0/amp-accordion-0.1.js"></script>
    <script async custom-element="amp-carousel" src="https://cdn.ampproject.org/v0/amp-carousel-0.1.js"></script>
    <meta name="viewport" content="width=device-width,minimum-scale=1">
    <style type="text/css">
        amp-accordion section[expanded] .show-more {
  display: none;
}
amp-accordion section:not([expanded]) .show-less {
  display: none;
}
    </style>
    <div>
  
    <h1>Test Page</h1>
  <amp-accordion disable-session-states>
  <section>
    <h4>
      <span class="show-more">Show more</span>
      <span class="show-less">Show less</span>
    </h4>
    <p>Id lacus amet. Aliquam eos nunc ut scelerisque lacinia, eu rutrum id, vestibulum aliqua vivamus luctus eu rhoncus ut, sodales id. Velit lacus, fermentum neque et sagittis, ac venenatis volutpat, dolore neque feugiat proin fermentum odio, odio arcu
      in eu wisi. </p>
  </section>
</amp-accordion>

    <amp-carousel width="400"
  height="300"
  layout="responsive"
  type="slides"
  autoplay
  delay="2000">
  <amp-img src="../content/site/carousel-01.jpg"
    width="400"
    height="300"
    layout="responsive"
    alt="a sample image"></amp-img>
  <amp-img src="../content/site/carousel-01.jpg"
    width="400"
    height="300"
    layout="responsive"
    alt="another sample image"></amp-img>
  <amp-img src="../content/site/carousel-01.jpg"
    width="400"
    height="300"
    layout="responsive"
    alt="and another sample image"></amp-img>
</amp-carousel>
    </div>
	<ks:Snippet runat="server" Name="Layout08" />
</asp:Content>
