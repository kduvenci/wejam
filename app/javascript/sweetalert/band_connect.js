import swal from 'sweetalert';

function bindSweetAlertBandConnect() {
  const swalButton = document.getElementById('send-request');
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      swal({
        title: "Hey !",
        text: "Your request sent..",
        icon: "success"
      });
    });
  }
}

export { bindSweetAlertBandConnect };