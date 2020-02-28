import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
import { initMapbox } from '../plugins/init_mapbox';

initMapbox();

// Update session price totals
const updateTotal = (quantity) => {
  const totalField = document.querySelector('#booking-total');
  const price = document.querySelector('#booking-price').innerText;
  const total = Number.parseInt(quantity, 10) * Number.parseInt(price, 10);
  console.log(quantity);

  totalField.innerText = `$ ${total}`;
};

const quantityField = document.querySelector('#booking_quantity');

if (quantityField) {
  quantityField.addEventListener('change', (event) => {
    const quantity = quantityField.value || 0;
    updateTotal(quantity);
  });
}

// Show social media share buttons
const shareButton = document.querySelector('#share-btn')
const socialButtons = document.querySelector('#social-btns')
shareButton.addEventListener('click', (event) => {
  event.preventDefault();
  if (socialButtons.classList.contains('.d-none')) {
    socialButtons.classList.remove('.d-none')
  } else {
    socialButtons.classList.add('.d-none')
  }
});
