function dateDiff(date1, date2){
    let diff = {}                           // Initialisation du retour
    let tmp = date2 - date1;

    tmp = Math.floor(tmp/1000);             // Nombre de secondes entre les 2 dates
    diff.sec = tmp % 60;                    // Extraction du nombre de secondes

    tmp = Math.floor((tmp-diff.sec)/60);    // Nombre de minutes (partie entière)
    diff.min = tmp % 60;                    // Extraction du nombre de minutes

    tmp = Math.floor((tmp-diff.min)/60);    // Nombre d'heures (entières)
    diff.hour = tmp % 24;                   // Extraction du nombre d'heures

    tmp = Math.floor((tmp-diff.hour)/24);   // Nombre de jours restants
    diff.day = tmp;

    return diff;
}

function generatePrice() {
  const form = document.getElementById('new_booking');
  if (form) {
    document.getElementById('booking_ends_at').addEventListener("change", () => {
      let my_startdate = new Date(document.getElementById('booking_starts_at').value.replace( /(\d{2})\/(\d{2})\/(\d{4})/, "$2/$1/$3") );
      let my_enddate = new Date(document.getElementById('booking_ends_at').value.replace( /(\d{2})\/(\d{2})\/(\d{4})/, "$2/$1/$3") );
      const diff = dateDiff(my_startdate, my_enddate);
      const numberOfDays = diff.day
      console.log(diff);
      const price = parseInt(document.getElementById('jet-price').innerHTML) * numberOfDays;
      console.log(price);
      document.getElementById("booking_price_total").value = price;
      document.getElementById("price-total").innerHTML = price + " €";
    })

    document.getElementById('booking_starts_at').addEventListener("change", () => {
      let my_startdate = new Date(document.getElementById('booking_starts_at').value.replace( /(\d{2})\/(\d{2})\/(\d{4})/, "$2/$1/$3") );
      let my_enddate = new Date(document.getElementById('booking_ends_at').value.replace( /(\d{2})\/(\d{2})\/(\d{4})/, "$2/$1/$3") );
      const diff = dateDiff(my_startdate, my_enddate);
      const numberOfDays = diff.day
      console.log(diff);
      const price = parseInt(document.getElementById('jet-price').innerHTML) * numberOfDays;
      console.log(price);
      document.getElementById("booking_price_total").value = price;
      document.getElementById("price-total").innerHTML = price + " €";
    })
  }
}

export { generatePrice };
