const conn = new Mongo("localhost:27017")

const db = conn.getDB("spotify")

db.dropDatabase()

const usuario = [
  {
    username: "walterwhite",
    email: "walter@gmail.com",
    password: "heisenberg",
    fechaNacimiento: new Date(),
    sexo: "M",
    pais: "USA",
    zipcode: 20219,
    suscripcion: {
      fechaInicio: new Date(),
      fechaRenovacion: new Date()
    }
  },
  {
    username: "jesse",
    email: "jesse@gmail.com",
    password: "pinkman",
    fechaNacimiento: new Date(),
    sexo: "M",
    pais: "USA",
    zipcode: 20222,
    suscripcion: null
  },
  {
    username: "gus",
    email: "polloshermanos@gmail.com",
    password: "fring",
    fechaNacimiento: new Date(),
    sexo: "M",
    pais: "USA",
    zipcode: 20201,
    suscripcion: null
  },
  {
    username: "saul",
    email: "saul@gmail.com",
    password: "goodman",
    fechaNacimiento: new Date(),
    sexo: "M",
    pais: "USA",
    zipcode: 20120,
    suscripcion: null
  },
]