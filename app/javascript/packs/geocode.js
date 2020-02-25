import mapboxgl from 'mapbox-gl';

const injectCoordinates = (coordinates) => {
  const paragraphElement = document.getElementById('coordinates');
  paragraphElement.innerText = `${coordinates.lat}, ${coordinates.lng}`;
};

const injectMap = (coordinates) => {
  const lng = coordinates.lng;
  const lat = coordinates.lat;

  mapboxgl.accessToken = 'yourApiKey';
  const map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v9',
    center: [ lng, lat ],
    zoom: 12
  });
  new mapboxgl.Marker()
    .setLngLat([ lng, lat ])
    .addTo(map);
};

export { injectCoordinates, injectMap };

