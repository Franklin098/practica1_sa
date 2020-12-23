function callAPI() {
  let name = document.getElementById("inputName").value;
  let email = document.getElementById("inputEmail").value;

  console.log("valor", name, email);
  let objeto = {
    nombre: name,
    email,
  };
  let json = JSON.stringify(objeto);
  console.log("json", json);

  const Url = "http://localhost:3000/registrar-correo";
  $.ajax({
    url: Url,
    type: "POST",
    contentType: "application/json",
    dataType: "json",
    data: json,
    responseType: "application/json",
    success: function (respuesta) {
      alert("Correcto !");
    },
    error: function (error) {
      alert(error?.responseJSON?.mensaje);
      console.log(error?.responseJSON?.mensaje);
    },
  });
}
