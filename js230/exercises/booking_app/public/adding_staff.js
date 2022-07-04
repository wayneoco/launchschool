'use strict';

const form = document.querySelector('form');
form.addEventListener('submit', event => {
  event.preventDefault();
  const data = new FormData(form);
  const request = new XMLHttpRequest();

  request.open('POST', form.action);

  request.addEventListener('load', () => {
    switch(request.status) {
      case 201:
        const data = JSON.parse(request.response);
        alert(`Successfully created staff with id: ${data.id}`);
        form.reset();
        break;
      case 400:
        alert(request.responseText);
    }
  });

  request.send(data);
});
