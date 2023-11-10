'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "fe043e0776dd4c380a82b0c85b3191a6",
"index.html": "e4ad699ec3e8a0e1f0a7d3d534b5794e",
"/": "e4ad699ec3e8a0e1f0a7d3d534b5794e",
"main.dart.js": "fa90a406c3f99825811ea4a0aa6dbeb9",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"icons/favicon.ico": "a7e34e4971229071cbcddc3ad3ec11e9",
"icons/apple-touch-icon.png": "afd842829953e2a338fce685e168f668",
"icons/Icon-192.png": "ee0b1cd40e218cf0901da32dadc236cb",
"icons/icon-192-maskable.png": "98d90ffcbc8bf2937e23ef1d71640b19",
"icons/icon-512-maskable.png": "7667b359a9c038a3f6e4ac954f125f60",
"icons/Icon-512.png": "154534f742dfa7ade28bf5a40696b1cf",
"manifest.json": "798b3fe9a093c3f3b8c3f15d084a90b5",
"assets/AssetManifest.json": "d9a9a857ba21dbd3348104352b4c21ac",
"assets/NOTICES": "d891b72b42f05311658bae101e7419f4",
"assets/FontManifest.json": "946ee746c227b3e78ee4523a893f46c2",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/lib/features/flutter_widget/demos/animated_scale_demo.dart": "50aa5e6f26aac162aac24a67ee05d821",
"assets/lib/features/flutter_widget/demos/dropdown_button_demo.dart": "eb1286becfd95abe70786e99a27e5831",
"assets/lib/features/flutter_widget/demos/flexible_demo.dart": "0b9250207b0871f3790a5478cc6ce0f7",
"assets/lib/features/flutter_widget/demos/wrap_demo.dart": "906b7d1b15511c01b968707f6ea7e786",
"assets/lib/features/flutter_widget/demos/fractionally_sized_box_demo.dart": "2909d905a330993a28ae432f19847b4f",
"assets/lib/features/flutter_widget/demos/animated_slide_demo.dart": "bf96ba78972d868504ee767bff139bb0",
"assets/lib/features/flutter_widget/demos/icon_demo.dart": "516c9f05b7635f9cf88a04b01241505f",
"assets/lib/features/flutter_widget/demos/center_demo.dart": "49b5171a2c890f2079840e017efdd8cf",
"assets/lib/features/flutter_widget/demos/animated_switcher_demo.dart": "959e2e64542395f1ec3c1b20ed25a333",
"assets/lib/features/flutter_widget/demos/animated_positioned_demo.dart": "79357012192eea1f86dbae4d837ef9aa",
"assets/lib/features/flutter_widget/demos/stack_demo.dart": "9e3c9a335910f012690b1c6ee6923abf",
"assets/lib/features/flutter_widget/demos/card_demo.dart": "5c3a48262f1cc6bfa3bb6d73c0be2847",
"assets/lib/features/flutter_widget/demos/badge_demo.dart": "17ce66a30e9b3a714aa076e0c43478da",
"assets/lib/features/flutter_widget/demos/cupertino_alert_dialog_demo.dart": "47d02f24fad2143be12f28cbf2f59531",
"assets/lib/features/flutter_widget/demos/animated_size_demo.dart": "5ac6f1cc7f8ef1f463ea5711893c8670",
"assets/lib/features/flutter_widget/demos/cupertino_picker_demo.dart": "18083020a2dce05f986ee474413aae88",
"assets/lib/features/flutter_widget/demos/placeholder_demo.dart": "b82aedb9d5d178c95cd204566228068a",
"assets/lib/features/flutter_widget/demos/expanded_demo.dart": "b217653e84ce38267b3b8de8d65cb38b",
"assets/lib/features/flutter_widget/demos/radio_demo.dart": "61424e9b82177c1883b623300c595d57",
"assets/lib/features/flutter_widget/demos/segmented_button_demo.dart": "5bb75197f7d07c64791d2a10ae3c0568",
"assets/lib/features/flutter_widget/demos/text_field_demo.dart": "9fb3e336629add753535ca6c2c22a74c",
"assets/lib/features/flutter_widget/demos/single_child_scroll_view_demo.dart": "c8dd9fece4f766d28067b463f2d87cab",
"assets/lib/features/flutter_widget/demos/cupertino_date_picker_demo.dart": "4bb6767f171a6ab9a67c6b77508414df",
"assets/lib/features/flutter_widget/demos/demos.dart": "437b482c9d49dfd9eb64909d0805f24a",
"assets/lib/features/flutter_widget/demos/animated_padding_demo.dart": "ae3f54ad0603883fa6b90c4edd79fd9c",
"assets/lib/features/flutter_widget/demos/animated_opacity_demo.dart": "291f30c19bc0a7bc68ebfde90878aa59",
"assets/lib/features/flutter_widget/demos/animated_container_demo.dart": "febadd0c0a572d7f84c3d3296469efc4",
"assets/lib/features/flutter_widget/demos/app_bar_demo.dart": "7fe6e8c21994291a12fec0816f24878a",
"assets/lib/features/flutter_widget/demos/checkbox_demo.dart": "0399522a661918360f4d8ebd2ac69712",
"assets/lib/features/flutter_widget/demos/about_dialog_demo.dart": "c0ec3436b23b6e776cd4089837bbc000",
"assets/lib/features/flutter_widget/demos/filled_button_demo.dart": "5e4fe9381ab126038ad84b9e3d5db5f5",
"assets/lib/features/flutter_widget/demos/text_button_demo.dart": "42d3d7f11f4103164fcd030c063455f2",
"assets/lib/features/flutter_widget/demos/aspect_ratio_demo.dart": "15aecee826e7156c451c5f31cd49d767",
"assets/lib/features/flutter_widget/demos/circular_progress_indicator_demo.dart": "1b9bcbce5fa933529a449c1db0e4bfa6",
"assets/lib/features/flutter_widget/demos/spacer_demo.dart": "e9c882b6a3256221de557fbc709900ca",
"assets/lib/features/flutter_widget/demos/list_view_demo.dart": "88eea6ece29b3139180e3870789dde94",
"assets/lib/features/flutter_widget/demos/column_demo.dart": "5e8f67e63ac32560f0633ca7d4f54e15",
"assets/lib/features/flutter_widget/demos/slider_demo.dart": "44c00e06416f3830a44624ba7ed28160",
"assets/lib/features/flutter_widget/demos/positioned_demo.dart": "1d3d6110d5c7eade6f3614e0c01d2eed",
"assets/lib/features/flutter_widget/demos/elevated_button_demo.dart": "3b1e4cdfe652e4dbce24aaa847e23ca3",
"assets/lib/features/flutter_widget/demos/outlined_button_demo.dart": "b65b5e21c780c94895474149a58d3607",
"assets/lib/features/flutter_widget/demos/animated_rotation_demo.dart": "20438b86754abfa421c3c9ac6827d010",
"assets/lib/features/flutter_widget/demos/text_demo.dart": "670752c3e1231208dd5fb3e1f41911b7",
"assets/lib/features/flutter_widget/demos/cupertino_slider_demo.dart": "ae10882ca8660aa55f4db6eb03a9bc44",
"assets/lib/features/flutter_widget/demos/grid_view_demo.dart": "330f7af83786da0963a178b18c09c1d7",
"assets/lib/features/flutter_widget/demos/row_demo.dart": "c2fcd3acc467791b0bdee4f16ffd7483",
"assets/lib/features/flutter_widget/demos/image_demo.dart": "ee4d18d8d97176d5a27a5235b88abd8f",
"assets/lib/features/flutter_widget/demos/sized_box_demo.dart": "d2c51cc414e2bc11201ea78f1aebd685",
"assets/lib/features/flutter_widget/demos/cupertino_switch_demo.dart": "b573db712839841043b6c26bcd7ed43d",
"assets/lib/features/flutter_widget/demos/animated_cross_fade_demo.dart": "f87be89a9c4b4ef36417bda5422d1e57",
"assets/lib/features/flutter_widget/demos/scaffold_demo.dart": "8145c7d92b205974b3e455b67eef692e",
"assets/lib/features/flutter_widget/demos/hero_demo.dart": "48093a6482450033e23759dc318db7e6",
"assets/lib/features/flutter_widget/demos/align_demo.dart": "66b7e1c49d11021b1507e4ad64fd0bf4",
"assets/lib/features/flutter_widget/demos/switch_demo.dart": "779fd15447cce33c23af98ce5b548899",
"assets/lib/features/flutter_widget/demos/floating_action_button_demo.dart": "8aec049e3cf045db5964441f0b873421",
"assets/lib/features/flutter_widget/demos/linear_progress_indicator_demo.dart": "6250fe259af15d8a2f85f2fb2f8d50f5",
"assets/lib/features/flutter_widget/demos/alert_dialog_demo.dart": "418254c99cc7d75353527d1de6357c88",
"assets/lib/features/flutter_widget/demos/container_demo.dart": "15ec133717507b0e135038bc00fa9882",
"assets/lib/features/flutter_widget/demos/animated_align_demo.dart": "591b5465f4d47dca9f346bf9d0e4ff59",
"assets/lib/features/flutter_widget/demos/cupertino_button_demo.dart": "ea37e2839ad36626cd64c0227c7019d5",
"assets/lib/features/flutter_widget/demos/icon_button_demo.dart": "db2f15f2e232ead8c3c8f12157287ef3",
"assets/lib/features/flutter_widget/demos/cupertino_timer_picker_demo.dart": "411776f8f523b12e5f8cb02a23dfe035",
"assets/AssetManifest.bin": "7b1e64af586868476110ef59e9245f06",
"assets/fonts/MaterialIcons-Regular.otf": "4d53fc4f333c4971ae920437d869487b",
"assets/assets/images/icon.png": "02dcdb216e4a67b0da0f473dedfa5901",
"assets/assets/images/logo.png": "f28c97eaccd47beb7f32f678b3f12586",
"assets/assets/fonts/Lato-Thin.ttf": "7ab0bc06eecc1b75f8708aba3d3b044a",
"assets/assets/fonts/Lato-Bold.ttf": "24b516c266d7341c954cb2918f1c8f38",
"assets/assets/fonts/Lato-Black.ttf": "d83ab24f5cf2be8b7a9873dd64f6060a",
"assets/assets/fonts/JetBrainsMono-Regular.ttf": "b678c7a6800a9d944ae8342905c07cb7",
"assets/assets/fonts/Lato-Regular.ttf": "122dd68d69fe9587e062d20d9ff5de2a",
"assets/assets/fonts/Lato-Light.ttf": "2bcc211c05fc425a57b2767a4cdcf174",
"assets/assets/data/flutter_widgets.json": "d4d01c0925185881ace7dbae43dd42e1",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"canvaskit/skwasm.wasm": "1a074e8452fe5e0d02b112e22cdcf455",
"canvaskit/chromium/canvaskit.js": "96ae916cd2d1b7320fff853ee22aebb0",
"canvaskit/chromium/canvaskit.wasm": "be0e3b33510f5b7b0cc76cc4d3e50048",
"canvaskit/canvaskit.js": "bbf39143dfd758d8d847453b120c8ebb",
"canvaskit/canvaskit.wasm": "42df12e09ecc0d5a4a34a69d7ee44314",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
