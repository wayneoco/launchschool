'use strict';

document.addEventListener('DOMContentLoaded', () => {
  let staffs;
  let schedules;
  const schedulesList = [];
  const scheduleSelect = document.querySelector('select');

  // function to initialize data, i.e., fetch lists of schedules and staff
  const initData = async () => {
    const schedulesPromise = fetchJSON('/api/schedules');
    const staffsPromise = fetchJSON('/api/staff_members');
    await Promise.allSettled([staffsPromise, schedulesPromise])
      .then(responses => {
        responses = responses.map(response => response.value);
        [ staffs, schedules ] = responses;
      });
  };

  // helper function to make fetch calls and then convert JSON response to JS objects
  const fetchJSON = (path) => {
    return fetch(path)
      .then(response => response.json());
  };

  // IIFE to invoke `initData()` function using async/await to ensure
  // schedule and staff data are available before creating schedule select options
  (async () => {
    await initData();
    createSchedulesList(schedules, staffs);
    createSchedulesOptions(scheduleSelect);
  })();

  // function to create an array of available schedule objects
  const createSchedulesList = (schedules, staffs) => {
    const openSchedules = schedules.filter(({student_email}) => !student_email);
    openSchedules.forEach(({id, staff_id, date, time}) => {
      const staffName = staffs.find(({id}) => id === staff_id).name;
      const schedule = `${staffName} | ${date} | ${time}`;
      schedulesList.push({'id': id, 'schedule': schedule});
    });
  };

  // function to create select option HTML elements
  const createSchedulesOptions = (parent) => {
    schedulesList.forEach(({id, schedule}) => {
      const option = document.createElement('option');
      option.setAttribute('value', id);
      option.textContent = schedule;
      parent.appendChild(option);
    });
  };

  // add event listener to add-schedule form
  const scheduleForm = document.getElementById('add-schedule');
  scheduleForm.addEventListener('submit', e => {
    e.preventDefault();
    const formData = new FormData(scheduleForm);
    const data = formDataToPlainObject(formData);
    createNewBooking(scheduleForm, data);
  });

  const createNewBooking = (scheduleForm, data) => {
    fetch('/api/bookings', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
      },
      body: JSON.stringify(data),
    }).then(async response => {
      const responseText = await response.text();

      if (response.ok) {
        alert('Booked');
        resetScheduler(scheduleForm, data);
      } else if (responseText.split(' ').includes('booking_sequence:')) {
        alert(responseText);
        const email = data.student_email;
        const newStudentForm = document.getElementById('add-student');
        let bookingSequence = responseText.split(' ');
        bookingSequence = bookingSequence[bookingSequence.length - 1];

        // if the new student form already exists, then update the email and
        // booking_sequence fields with current data from the schedule booking form;
        // otherwise, add the new student form
        if (newStudentForm) {
          const emailInput = document.getElementById('email');
          emailInput.setAttribute('value', email);
          const bookingSequenceInput = document.getElementById('booking_sequence');
          bookingSequenceInput.setAttribute('value', bookingSequence);
          return;
        } else {
          createNewStudentForm(email, bookingSequence);
          createNewStudentFormEventHandler(data);
        }
      } else {
        alert(responseText);
      }
    });
  };

  // clears the schedule booking form and removes the schedule option that was booked
  const resetScheduler = (form, data) => {
    const scheduleSelect = document.querySelector('select');
    const scheduleToRemove = document.querySelector(`option[value='${data.id}']`);
    form.reset();
    scheduleSelect.removeChild(scheduleToRemove);
  };

  // create an event listener on the new student form
  const createNewStudentFormEventHandler = (scheduleData) => {
    const newStudentForm = document.getElementById('add-student');
    newStudentForm.addEventListener('submit', e => {
      e.preventDefault();
      const formData = new FormData(newStudentForm);
      const studentData = formDataToPlainObject(formData);
      fetch('/api/students', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
        },
        body: JSON.stringify(studentData),
      }).then(async response => {
        const responseText = await response.text();

        // if the new student form receives a 200 category response,
        // book the requested schedule
        if (response.ok) {
          alert(responseText);
          const scheduleForm = document.getElementById('add-schedule');
          createNewBooking(scheduleForm, scheduleData);
          newStudentForm.remove();
        } else {
          alert(responseText);
        }
      });
    });
  };

  const formDataToPlainObject = (formData) => {
    const obj = {};
    for (const pair of formData) {
      obj[pair[0]] = pair[1];
    }
    return obj;
  };
});

const createNewStudentForm = (email, bookingSequence) => {
  const br = document.createElement('br');
  const wrapper = document.createElement('div')
  wrapper.setAttribute('id', 'new-student');
  document.body.appendChild(wrapper);

  const form = document.createElement('form');
  form.setAttribute('id', 'add-student');
  form.setAttribute('method', 'POST');
  form.setAttribute('action', '/api/students');
  wrapper.appendChild(form);

  const fieldset = document.createElement('fieldset');
  fieldset.setAttribute('id', 'student');
  form.appendChild(fieldset);

  const legend = document.createElement('legend');
  legend.textContent = 'Please provide new student details';
  fieldset.appendChild(legend);

  const labelEmail = document.createElement('label');
  labelEmail.setAttribute('for', 'email');
  labelEmail.textContent = 'Email: ';
  fieldset.appendChild(labelEmail);

  const inputEmail = document.createElement('input');
  inputEmail.setAttribute('id', 'email');
  inputEmail.setAttribute('type', 'email');
  inputEmail.setAttribute('name', 'email');
  inputEmail.setAttribute('value', email);
  inputEmail.setAttribute('required', '');
  fieldset.appendChild(inputEmail);
  fieldset.appendChild(br.cloneNode());

  const labelName = document.createElement('label');
  labelName.setAttribute('for', 'name');
  labelName.textContent = 'Name: ';
  fieldset.appendChild(labelName);

  const inputName = document.createElement('input');
  inputName.setAttribute('id', 'name');
  inputName.setAttribute('type', 'text');
  inputName.setAttribute('name', 'name');
  inputName.setAttribute('required', '');
  fieldset.appendChild(inputName);
  fieldset.appendChild(br.cloneNode());

  const labelBookingSequence = document.createElement('label');
  labelBookingSequence.setAttribute('for', 'booking_sequence');
  labelBookingSequence.textContent = 'Booking sequence: ';
  fieldset.appendChild(labelBookingSequence);

  const inputBookingSequence = document.createElement('input');
  inputBookingSequence.setAttribute('id', 'booking_sequence');
  inputBookingSequence.setAttribute('inputmode', 'number');
  inputBookingSequence.setAttribute('name', 'booking_sequence');
  inputBookingSequence.setAttribute('value', bookingSequence);
  inputBookingSequence.setAttribute('required', '');
  fieldset.appendChild(inputBookingSequence);
  fieldset.appendChild(br.cloneNode());

  const submit = document.createElement('input');
  submit.setAttribute('type', 'submit');
  submit.setAttribute('value', 'Submit');
  fieldset.appendChild(submit);
};
