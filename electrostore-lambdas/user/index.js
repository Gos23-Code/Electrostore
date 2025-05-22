exports.handler = async (event) => {
  // Puedes acceder a los datos del evento aquí
  console.log("Evento recibido:", event);

  // Lógica de registro de usuario (ejemplo simple)
  const response = {
    statusCode: 200,
    body: JSON.stringify({ message: "Usuario registrado con éxito" }),
  };

  return response;
};
