
var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
tooltipTriggerList.map(function (tooltipTriggerEl) {
  return new bootstrap.Tooltip(tooltipTriggerEl);
});


var myModal = document.getElementById('myModal');
var bsModal = new bootstrap.Modal(myModal);

myModal.addEventListener('show.bs.modal', function (event) {

  var button = event.relatedTarget;

  var id = button.getAttribute('data-bs-id');

  var modalTitle = myModal.querySelector('.modal-title');
  modalTitle.textContent = 'Exclusão do treino ' + id;

  var modalButton = myModal.querySelector('.modal-footer #delete');

  var newButton = modalButton.cloneNode(true);
  modalButton.parentNode.replaceChild(newButton, modalButton);
  modalButton = newButton;

  modalButton.addEventListener('click', function () {
    deleteTraining(button, id);
    bsModal.hide();
  });
});

function deleteTraining(button, id) {

  var row = button.closest('tr');


  var url = contextPath + '/training?action=delete&id=' + id;

  fetch(url)
    .then(function (response) {
      return response.json();
    })
    .then(function (data) {
      if (data) {
        row.parentNode.removeChild(row);
      }
    })
    .catch(function (error) {
      console.log('Erro ao excluir treino', error);
    });
}
