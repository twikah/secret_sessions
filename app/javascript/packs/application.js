import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
import { initMapbox } from '../plugins/init_mapbox';

initMapbox();


const updateTotal = () => {
  const totalField = document.querySelector('#booking-total');
  const quantity = document.querySelector('#booking_quantity').value;
  const price = document.querySelector('#booking-price');
  return console.log(quantity);
  console.log(price);
  // const total
  // totalField.innerText = `(${unread})`;
};

updateTotal()
