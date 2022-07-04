'use strict';

async function getAvailableSchedules() {
  const controller = new AbortController();
  const timeout = setTimeout(() => controller.abort(), 5000);

  try {
    const response = await fetch('/api/staff_members', {signal: controller.signal});
    const staffMembers = await response.json();
    let openSchedules = staffMembers.map(async staff => {
      const response = await fetch(`/api/schedules/${staff.id}`, {signal: controller.signal});
      const allSchedules = await response.json();
      return allSchedules.filter(schedule => {
        return !schedule.student_email;
      });
    });
    openSchedules = await Promise.all(openSchedules).then(schedules => schedules);
    openSchedules = openSchedules.reduce((array, schedules) => {
      if (schedules.length > 0) {
        array.push(`Staff ${schedules[0].staff_id}: ${schedules.length}`);
      }
      return array;
    }, []);

    alert(openSchedules.join(', '));

  } catch(e) {
    if (e.name === 'AbortError') {
      alert('Your request timed out. Please try again.');
    } else {
      alert(`Error: ${e.name}. Message: ${e.message}`);
    }
  } finally {
    clearTimeout(timeout);
    alert('Your request has completed.');
  }
}

getAvailableSchedules();
