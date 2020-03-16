// import places from "places.js"

// const algoliaPlaces = () => {
//   const userAddress = document.getElementById('user_address');
//   if (userAddress){
//     var placesAutocomplete = places({
//       appId:  "plI342LRK4XN",
//       apiKey: "e0822b9cb8e58bbd7861492e7189dc38",
//       container: document.querySelector('user_address')
//     });
//   }
//  }

// export { places };

import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('user_address');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
