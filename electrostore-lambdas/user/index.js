const AWS = require("aws-sdk");
const bcrypt = require("bcryptjs");
const { v4: uuidv4 } = require("uuid");

const dynamoDb = new AWS.DynamoDB.DocumentClient({ region: "us-west-1"});
const USERS_TABLE = "User";

exports.handler = async (event) => {
  try {
    const body = JSON.parse(event.body || '{}');
    const { name, email, password, phone } = body;

    // Validaciones básicas
    if (!name || !email || !password || !phone) {
      return {
        statusCode: 400,
        body: JSON.stringify({ message: "Todos los campos son obligatorios" })
      };
    }

    // Hash de la contraseña
    const hashedPassword = await bcrypt.hash(password, 10);

    const userId = uuidv4();
    const createdAt = new Date().toISOString();

    const params = {
      TableName: USERS_TABLE,
      Item: {
        uuid: userId,
        email,
        name,
        phone,
        password: hashedPassword,
        createdAt
      }
    };

    await dynamoDb.put(params).promise();

    return {
      statusCode: 201,
      body: JSON.stringify({
        message: "Usuario registrado exitosamente",
        data: {
          id: userId,
          name,
          email,
          phone,
          createdAt
        }
      })
    };
    } catch (error) {
    console.error("Error al registrar usuario:", error.message);
    console.error(error.stack);
    return {
      statusCode: 500,
      body: JSON.stringify({ message: "Error interno del servidor", error: error.message })
    };
  }
};
