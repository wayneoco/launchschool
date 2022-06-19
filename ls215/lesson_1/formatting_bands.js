function processBands(data) {
  return data.map(band => {
    const nameWithNoDots = removeDots(band.name);
    const capitalizedName = capitalizeWords(nameWithNoDots);

    return {
      name: capitalizedName,
      country: 'Canada',
      active: band.active,
    };
  });
}

function capitalizeWords(string) {
  let firstLetter = /\b\w/g;

  return string.replace(firstLetter, c => c.toUpperCase());
}

function removeDots(string) {
  return string.replace(/\./, '');
}

let bands = [
  { name: 'sunset rubdown', country: 'UK', active: false },
  { name: 'women', country: 'Germany', active: false },
  { name: 'a silver mt. zion', country: 'Spain', active: true },
];

console.log(processBands(bands));
