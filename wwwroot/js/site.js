// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.

function showWelcome() {
    if (document.cookie == '') {
        document.cookie = 'true';
        Swal.fire({
            title: 'Bienvenido!',
            text: 'Usted está por ingresar al Hospital virtual. En él podra dar de alta Pacientes, Doctores y Consultas, para luego gestionarlos desde el menú principal.',
            icon: 'success',
            confirmButtonText: 'Ingresar'
        })
    }
}
showWelcome();