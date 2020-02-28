import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
import { initMapbox } from '../plugins/init_mapbox';

initMapbox();

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
