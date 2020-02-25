import mapboxgl from 'mapbox-gl';

const injectMap = (coordinates) => {
  const lng = coordinates.lng;
  const lat = coordinates.lat;

  mapboxgl.accessToken = 'pk.eyJ1IjoidHdpa2FoIiwiYSI6ImNrNmM1ZThjMjBsd2MzbXA5dWc4a2lscWIifQ.N-CkmI-NekYY0_eU_swklg';
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

export { injectMap };

