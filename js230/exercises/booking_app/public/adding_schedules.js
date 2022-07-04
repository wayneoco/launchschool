'use strict';

/* eslint-disable */

const staffMembers = (async () => {
  const response = await fetch('/api/staff_members');
  return response.json();
})();

document.addEventListener('DOMContentLoaded', () => {
  const staffNamesSelect = document.querySelector('select');
  const createStaffNameOptions = (parent) => {
    staffMembers.then(staff => {
      staff.forEach(({id, name}) => {
        const option = document.createElement('option');
        option.setAttribute('value', id);
        option.textContent = name;
        parent.appendChild(option);
      });
    });
  };
  createStaffNameOptions(staffNamesSelect);

  let scheduleCount = 1;
  const form = document.querySelector('form');
  const duplicateFormFields = () => {
    scheduleCount += 1;
    const fieldset = document.querySelector('fieldset');
    const newFieldset = fieldset.cloneNode(true);
    const legend = newFieldset.querySelector('legend');
    //const select = newFieldset.querySelector('select');
    newFieldset.setAttribute('name', `schedule-${scheduleCount}`);
    legend.textContent = `Schedule ${scheduleCount}`;
    form.appendChild(newFieldset);
    form.appendChild(submit);
  };

  const addMoreSchedulesButton = document.querySelector('button');
  addMoreSchedulesButton.addEventListener('click', e => {
    e.preventDefault();
    duplicateFormFields();
  });

  const createScheduleObject = (formData) => {
    const schedulesObject = { schedules: [] };
    let schedule = {};
    let count = 0;

    for (const pair of formData) {
      schedule[pair[0]] = pair[1];
      count += 1;

      if (count % 3 === 0) {
        schedulesObject.schedules.push(schedule);
        schedule = {};
      }
    }

    return schedulesObject;
  };

  const formReset = () => {
    scheduleCount = 1;
    const fieldset = document.querySelector('fieldset');
    form.reset();
    form.replaceChildren(fieldset);
    form.appendChild(submit);
  }

  const submit = document.querySelector('input[type=submit]');
  submit.addEventListener('click', async e => {
    e.preventDefault();
    const formData = new FormData(form);
    const scheduleData = JSON.stringify(createScheduleObject(formData));

    await fetch('/api/schedules', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
      },
      body: scheduleData,
    }).then(async response => {
      const responseText = await response.text();

      if (response.ok) {
        alert(responseText);
        formReset();
      } else {
        alert(responseText);
      }
    });
  });
});
