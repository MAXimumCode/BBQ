ymaps.ready(init);

function init() {
  if (!document.getElementById('map')) return;
  const address = document.getElementById('map').getAttribute('data-address');

  const myMap = new ymaps.Map("map", {
    center: [55.76, 37.64],
    zoom: 10
  });

  const myGeocoder = ymaps.geocode(address);

  myGeocoder.then(
    function(res) {
      const coordinates = res.geoObjects.get(0).geometry.getCoordinates();

      myMap.geoObjects.add(
        new ymaps.Placemark(
          coordinates, {
            iconContent: address
          }, {
            preset: 'islands#blueStretchyIcon'
          }
        )
      );

      myMap.setCenter(coordinates);
      myMap.setZoom(15);
    },
    function(err) {
      alert('Ошибка при определении местоположения');
    }
  );
}