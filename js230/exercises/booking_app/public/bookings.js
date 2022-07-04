'use strict';

document.addEventListener('DOMContentLoaded', () => {
  let dates;
  const ul = document.querySelector('ul');
  const getScheduledDates = async () => {
    const response = await fetch('/api/bookings');
    const json = await response.json();
    dates = json;
  };

  (async () => {
    await getScheduledDates();
    createListOfDates();
  })();

  const createListOfDates = () => {
    dates.forEach(async date => {
      const li = document.createElement('li');
      li.classList.add('date');
      li.textContent = date;
      ul.appendChild(li);
    });
  };

  ul.addEventListener('click', async e => {
    e.stopPropagation();
    if (e.target.tagName === 'UL') return;
    if (Array.from(e.target.classList).includes('open')) return;
    if (Array.from(e.target.classList).includes('booking')) return;
    if (Array.from(e.target.classList).includes('date')) {
      e.target.classList.add('open');
    }

    const date = e.target.textContent;

    let bookings = await getDateBookings(date);
    bookings.forEach(booking => {
      const nestedUl = document.createElement('ul');
      e.target.appendChild(nestedUl);
      const nestedLi = document.createElement('li');
      nestedLi.classList.add('booking');
      nestedLi.textContent = booking.join(' | ');
      nestedUl.appendChild(nestedLi);
    });
  });

  const getDateBookings = async (date) => {
    const response = await fetch(`/api/bookings/${date}`);
    const json = await response.json();
    return json;
  };
});
