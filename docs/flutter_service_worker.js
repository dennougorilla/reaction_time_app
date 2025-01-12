'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/1f.png": "2468dabc336136e0dacd9d38ec72d840",
"assets/1t.png": "bb9e3041c83d9eab593cfdd589b4545b",
"assets/Art_VALORANT.jpg": "58794f6427e85c1d215d5983aef312a8",
"assets/AssetManifest.json": "75693a92a50bc96d2e67702c48a36eed",
"assets/assets/1f.png": "2468dabc336136e0dacd9d38ec72d840",
"assets/assets/1t.png": "bb9e3041c83d9eab593cfdd589b4545b",
"assets/FontManifest.json": "01700ba55b08a6141f33e168c4a6c22f",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/LICENSE": "7f1df1ee47854388e684afc0845ea820",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"assets/Vertical_jett.jpg": "ebe0c677aed8d9fe68ab5b125c5933b7",
"assets/Vertical_Phx.jpg": "3fb5881ee6fd3bd15b007298b5a52b97",
"assets/Vertical_Viper.jpg": "02e75293a7d5cd4e9e260cb1700a5fdf",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"index.html": "07cadf46d052d5b78f221377e570413c",
"/": "07cadf46d052d5b78f221377e570413c",
"main.dart.js": "19457838ac539716911adcdaa38676bd",
"manifest.json": "2e7b1afdc21414bd9a734bfee5ea74f0"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request);
      })
  );
});
