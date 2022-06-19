'use strict';

const fs = require('fs');
const emailData = fs.readFileSync('mail_count.txt', 'utf8');

function mailCount(emailData) {
  const emails = emailData.split('##||##');
  const emailObjs = emails.map(createEmailObject)
                          .sort((a, b) => a.date - b.date);
  const firstDate = emailObjs[0].date.toDateString();
  const lastDate = emailObjs[emailObjs.length - 1].date.toDateString();

  console.log(`Count of Email: ${emailObjs.length}`);
  console.log(`Date Range: ${firstDate} - ${lastDate}`);
}

function createEmailObject(email) {
  let emailParts = email.split('#/#').map(removeLineBreaks);
  let emailObj = {
    sender: emailParts[0].replace('From: ', ''),
    subject: emailParts[1].replace('Subject: ', ''),
    date: new Date(emailParts[2].replace('Date: ', '')),
    recipient: emailParts[3].replace('To: ', ''),
    body: emailParts[4],
  };
  return emailObj;
}

function removeLineBreaks(string) {
  return string.replace(/\\n/g, '');
}

mailCount(emailData);

// console output

// Count of Email: 5
// Date Range: Sat Jun 25 2016 - Thu Aug 11 2016
