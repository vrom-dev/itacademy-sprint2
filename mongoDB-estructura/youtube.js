const conn = new Mongo("localhost:27017")

const db = conn.getDB("youtube")

db.dropDatabase()

const usuarios = [
  {
    username: "danabramov",
    email: "dan@facebook.com",
    fechaNacimiento: new Date("1991-05-23"),
    sexo: "M",
    pais: "USA",
    zipcode: 02012,
    suscripciones: [],
    playlists: []
  },
  {
    username: "kentcdodds",
    email: "kent@gmail.com",
    fechaNacimiento: new Date("1982-03-12"),
    sexo: "M",
    pais: "USA",
    zipcode: 20231,
    suscripciones: [],
    playlists: []
  }
]

const videos = [
  {
    titulo: "Video at the zoo",
    descripcion: "BCN Zoo",
    size: "130MB",
    filename: "zoo.mp4",
    duracion: "10:32",
    thumbnail: "zoovideo.png",
    reproducciones: 14509,
    fechaCreacion: new Date ("2020-01-30"),
    usuario: ObjectId(),
    estado: "Publico",
    etiquetas: ["outdoor", "animals", "zoo"],
    feedback: [
      {
        usuario: ObjectId(),
        tipo: "Like",
        fecha: new Date ("2020-01-31")
      },
      {
        usuario: ObjectId(),
        tipo: "Dislike",
        fecha: new Date ("2020-01-31")
      }
    ]
  }
]

const playlists = [
  {
    nombre: "playlist de videos de animales",
    fechaCreacion: new Date()
  }
]