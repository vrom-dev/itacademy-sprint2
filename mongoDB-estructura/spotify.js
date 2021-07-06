const conn = new Mongo("localhost:27017")

const db = conn.getDB("spotify")

db.dropDatabase()

const usuarios = [
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
      fechaRenovacion: new Date(),
      formaDePago: 'paypal',
      pago: {
        fecha: new Date(),
        numOrden: 1,
        total: 9.99,
        tarjeta: null,
        paypal: {
          username: "walter@gmail.com"
        }
      }
    },
    artistasFavoritos: [],
    cancionesFavoritas: [],
    albumsFavoritos: [],
    playlists: []
  },
  {
    username: "jesse",
    email: "jesse@gmail.com",
    password: "pinkman",
    fechaNacimiento: new Date(),
    sexo: "M",
    pais: "USA",
    zipcode: 20222,
    suscripcion: null,
    artistasFavoritos: [],
    cancionesFavoritas: [],
    albumsFavoritos: [],
    playlists: []
  },
  {
    username: "gus",
    email: "polloshermanos@gmail.com",
    password: "fring",
    fechaNacimiento: new Date(),
    sexo: "M",
    pais: "USA",
    zipcode: 20201,
    suscripcion: {
      fechaInicio: new Date(),
      fechaRenovacion: new Date(),
      formaDePago: 'tarjeta',
      pagos: [
        {
          fecha: new Date(),
          numOrden: 2,
          total: 9.99,
          tarjeta: {
            numero: 1234124512451233,
            mes: 11,
            year: 2021,
            csv: 123
          },
          paypal: null
        }
      ]
    },
    artistasFavoritos: [],
    cancionesFavoritas: [],
    albumsFavoritos: [],
    playlists: []
  },
  {
    username: "saul",
    email: "saul@gmail.com",
    password: "goodman",
    fechaNacimiento: new Date(),
    sexo: "M",
    pais: "USA",
    zipcode: 20120,
    suscripcion: null,
    artistasFavoritos: [],
    cancionesFavoritas: [],
    albumsFavoritos: [],
    playlists: []
  },
]
db.usuarios.insertMany(usuarios)
const user1 = db.usuarios.findOne({username: "walterwhite"})._id
const user2 = db.usuarios.findOne({username: "jesse"})._id
const user3 = db.usuarios.findOne({username: "gus"})._id
const user4 = db.usuarios.findOne({username: "saul"})._id

const artistas = [
  {
    nombre: "Otis Redding",
    imagen: 'otisredding.png',
    albums: [
      {
        _id: ObjectId(),
        titulo: "Pain In My Heart",
        fecha: new Date("1964-01-01"),
        imagen: "otisalbum1.png",
        canciones: [
          {
            _id: ObjectId(),
            titulo: "Pain in My Heart",
            duracion: "2:22",
            reproducciones: 1235
          },
          {
            _id: ObjectId(),
            titulo: "The Dog",
            duracion: "2:30",
            reproducciones: 2502
          },
          {
            _id: ObjectId(),
            titulo: "Try a Little Tenderness",
            duracion: "2:30",
            reproducciones: 2945
          }
        ]
      }
    ],
    estilos: ["soul", "blues", "rock"],
    artistasRelacionados: []
  },
  {
    nombre: "Nina Simone",
    imagen: 'ninasimone.png',
    albums: [
      {
        _id: ObjectId(),
        titulo: "Little Girl Blue",
        fecha: new Date("1958-01-01"),
        imagen: "ninasimone.png",
        canciones: [
          {
            _id: ObjectId(),
            titulo: "Little Girl Blue",
            duracion: "3:01",
            reproducciones: 2321
          },
          {
            _id: ObjectId(),
            titulo: "Don't Smoke in Bed",
            duracion: "2:49",
            reproducciones: 2502
          },
          {
            _id: ObjectId(),
            titulo: "My Baby Just Cares for Me",
            duracion: "3:37",
            reproducciones: 2945
          }
        ]
      }
    ],
    estilos: ["soul", "jazz", "blues"],
    artistasRelacionados: []
  }
]
db.artistas.insertMany(artistas)

const artist1 = db.artistas.findOne({nombre: "Otis Redding"})
const artist2 = db.artistas.findOne({nombre: "Nina Simone"})

const playlists = [
  {
    titulo: "Soul fav songs",
    fechaCreacion: new Date(),
    fechaEliminacion: null,
    estado: "activa",
    creador: user1,
    canciones: []
  },  
  {
    titulo: "Temp playlist",
    fechaCreacion: new Date(),
    fechaEliminacion: new Date(),
    estado: "eliminada",
    creador: user1,
    canciones: []
  },  
  {
    titulo: "Jazz and other styles",
    fechaCreacion: new Date(),
    fechaEliminacion: null,
    estado: "activa",
    creador: user2,
    canciones: []
  }
]
db.playlists.insertMany(playlists)

const playlist1 = db.playlists.findOne({titulo: "Soul fav songs"})
const playlist2 = db.playlists.findOne({titulo: "Temp playlist"})
const playlist3 = db.playlists.findOne({titulo: "Jazz and other styles"})

//UPDATE OBJECT IDs DATA

const songs1 = artist1.albums[0].canciones
const songs2 = artist2.albums[0].canciones

db.playlists.updateOne({_id: playlist1._id}, {$set: {canciones: [songs1[0]._id, songs2[0]._id, songs2[1]._id]}})
db.playlists.updateOne({_id: playlist2._id}, {$set: {canciones: [songs2[1]._id, songs1[1]._id, songs1[2]._id]}})
db.playlists.updateOne({_id: playlist3._id}, {$set: {canciones: [songs2[1]._id, songs1[1]._id, songs1[2]._id, songs2[2]._id, songs1[0]._id]}})

db.usuarios.updateOne({_id: user1}, {$set: {cancionesFavoritas: [songs1[0]._id, songs2[0]._id]}})
db.usuarios.updateOne({_id: user1}, {$set: {playlists: [playlist1._id, playlist2._id]}})
db.usuarios.updateOne({_id: user1}, {$set: {artistasFavoritos: [artist1._id]}})
db.usuarios.updateOne({_id: user1}, {$set: {albumsFavoritos: [artist1.albums[0]._id]}})

db.usuarios.updateOne({_id: user2}, {$set: {cancionesFavoritas: [songs2[1]._id, songs1[1]._id]}})
db.usuarios.updateOne({_id: user2}, {$set: {playlists: [playlist3._id]}})
db.usuarios.updateOne({_id: user2}, {$set: {artistasFavoritos: [artist1._id, artist2._id]}})
db.usuarios.updateOne({_id: user2}, {$set: {albumsFavoritos: [artist2.albums[0]._id]}})

db.usuarios.updateOne({_id: user3}, {$set: {cancionesFavoritas: [songs2[1]._id, songs1[1]._id, songs2[2]._id]}})
db.usuarios.updateOne({_id: user3}, {$set: {playlists: [playlist1._id, playlist2._id, playlist3._id]}})
db.usuarios.updateOne({_id: user3}, {$set: {artistasFavoritos: [artist2._id]}})

db.usuarios.updateOne({_id: user4}, {$set: {cancionesFavoritas: [songs2[1]._id, songs1[1]._id, songs1[2]._id, songs1[0]._id]}})
db.usuarios.updateOne({_id: user4}, {$set: {playlists: [playlist2._id]}})
db.usuarios.updateOne({_id: user4}, {$set: {artistasFavoritos: [artist1._id]}})
db.usuarios.updateOne({_id: user4}, {$set: {albumsFavoritos: [artist1.albums[0]._id, artist2.albums[0]._id]}})

db.artistas.updateOne({_id: artist1._id}, {$set: {artistasRelacionados: [artist2._id]}})
db.artistas.updateOne({_id: artist2._id}, {$set: {artistasRelacionados: [artist1._id]}})