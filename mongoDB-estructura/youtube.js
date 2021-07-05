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
    canal: {
      nombre: "Canal de Dan",
      descripcion: "Canal de temas diversos",
      fechaCreacion: new Date(),
      suscriptores: []
    }
  },
  {
    username: "kentcdodds",
    email: "kent@gmail.com",
    fechaNacimiento: new Date("1982-03-12"),
    sexo: "M",
    pais: "USA",
    zipcode: 20231,
    canal: {
      nombre: "Canal de kent",
      descripcion: "Canal de temas aún más diversos",
      fechaCreacion: new Date(),
      suscriptores: []
    }
  },
  {
    username: "elonmusk",
    email: "elon@gmail.com",
    fechaNacimiento: new Date("1971-01-12"),
    sexo: "M",
    pais: "USA",
    zipcode: 20201,
    canal: null
  },
  {
    username: "linustorvalds",
    email: "linus@gmail.com",
    fechaNacimiento: new Date("1969-11-12"),
    sexo: "M",
    pais: "FIN",
    zipcode: 02156,
    canal: null
  }
]
db.usuarios.insertMany(usuarios)

const user1 = db.usuarios.findOne({username: "danabramov"})._id
const user2 = db.usuarios.findOne({username: "kentcdodds"})._id
const user3 = db.usuarios.findOne({username: "elonmusk"})._id
const user4 = db.usuarios.findOne({username: "linustorvalds"})._id

db.usuarios.updateOne({username: "danabramov"}, {$set: {canal: {suscriptores: [user2, user3]}}})
db.usuarios.updateOne({username: "kentcdodds"}, {$set: {canal: {suscriptores: [user1, user3, user4]}}})

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
    usuario: user1,
    estado: "Publico",
    etiquetas: ["outdoor", "animals", "zoo"],
    feedback: {
      likes: [
        {
          usuario: user2,
          fecha: new Date ("2020-02-03")
        },
        {
          usuario: user4,
          fecha: new Date ("2020-02-01")
        }
      ],
      dislikes: [
        {
          usuario: user3,
          fecha: new Date ("2020-01-31")
        }
      ]
    },
    comentarios: []
  },
  {
    titulo: "Video at It academy",
    descripcion: "Cibernarium 2021",
    size: "170MB",
    filename: "itacademy.mp4",
    duracion: "8:32",
    thumbnail: "itacademybcn.png",
    reproducciones: 5104,
    fechaCreacion: new Date ("2020-02-03"),
    usuario: user2,
    estado: "Publico",
    etiquetas: ["cibernarium", "itacademy", "javascript"],
    feedback: {
      likes: [
        {
          usuario: user1,
          fecha: new Date ("2020-02-04")
        },
        {
          usuario: user3,
          fecha: new Date ("2020-02-05")
        }
      ],
      dislikes: []
    },
    comentarios: []
  },
  {
    titulo: "Holidays 2021",
    descripcion: "Trip to Caribbean islands",
    size: "112MB",
    filename: "caribbean.mp4",
    duracion: "5:10",
    thumbnail: "caribbean.png",
    reproducciones: 22004,
    fechaCreacion: new Date ("2020-02-16"),
    usuario: user1,
    estado: "Privado",
    etiquetas: ["trip", "caribbean", "beach"],
    feedback: {
      likes: [],
      dislikes: []
    },
    comentarios: []
  },
  {
    titulo: "Learn Javascript in 20 seconds",
    descripcion: "From 0 to Master",
    size: "10MB",
    filename: "jstutorial.mp4",
    duracion: "0:20",
    thumbnail: "jstutorial.png",
    reproducciones: 151224,
    fechaCreacion: new Date ("2020-03-07"),
    usuario: user2,
    estado: "Publico",
    etiquetas: ["js", "programming", "tutorials"],
    feedback: {
      likes: [
        {
          usuario: user1,
          fecha: new Date ("2020-02-17")
        },
        {
          usuario: user3,
          fecha: new Date ("2020-02-17")
        },
        {
          usuario: user4,
          fecha: new Date ("2020-02-17")
        }
      ],
      dislikes: []
    },
    comentarios: []
  },
  {
    titulo: "Tabs vs Spaces: debate",
    descripcion: "Which one is better?",
    size: "105MB",
    filename: "tabsvsspaces.mp4",
    duracion: "3:36",
    thumbnail: "tabsvsspaces.png",
    reproducciones: 55498,
    fechaCreacion: new Date ("2020-03-11"),
    usuario: user3,
    estado: "Publico",
    etiquetas: ["programming", "debate"],
    feedback: {
      likes: [
        {
          usuario: user2,
          fecha: new Date ("2020-03-12")
        },
        {
          usuario: user1,
          fecha: new Date ("2020-03-13")
        }
      ],
      dislikes: [
        {
          usuario: user4,
          fecha: new Date ("2020-03-12")
        }
      ]
    },
    comentarios: [
      {
        texto: "spaces are better",
        fecha: new Date("2020-03-15"),
        usuario: user1,
        feedback: {
          likes: [
            {
              usuario: user3,
              fecha: new Date ("2020-03-15")
            }
          ],
          dislikes: []
        }
      },
      {
        texto: "i love tabs ❤",
        fecha: new Date("2020-03-15"),
        usuario: user2,
        feedback: {
          likes: [
            {
              usuario: user3,
              fecha: new Date ("2020-03-15")
            },
            {
              usuario: user4,
              fecha: new Date ("2020-03-16")
            }
          ],
          dislikes: [
            {
              usuario: user1,
              fecha: new Date ("2020-03-15")
            }
          ]
        }
      }
    ]
  },
  {
    titulo: "UFC 229 Fight: McGregor vs Khabib",
    descripcion: "Khabib defeats McGregor",
    size: "532MB",
    filename: "ufc229.mp4",
    duracion: "1:29:10",
    thumbnail: "ufc229.png",
    reproducciones: 1345904,
    fechaCreacion: new Date ("2020-01-03"),
    usuario: user2,
    estado: "Publico",
    etiquetas: ["ufc", "mma", "fighting"],
    feedback: {
      likes: [
        {
          usuario: user1,
          fecha: new Date ("2020-01-17")
        },
        {
          usuario: user3,
          fecha: new Date ("2020-01-11")
        }
      ],
      dislikes: [
        {
          usuario: user4,
          fecha: new Date ("2020-01-05")
        }
      ]
    },
    comentarios: [
      {
        texto: "khabib was great",
        fecha: new Date("2020-01-05"),
        usuario: user1,
        feedback: {
          likes: [
            {
              usuario: user2,
              fecha: new Date ("2020-01-12")
            },
            {
              usuario: user3,
              fecha: new Date ("2020-01-11")
            }
          ],
          dislikes: [
            {
              usuario: user4,
              fecha: new Date ("2020-01-05")
            }
          ]
        }
      }
    ]
  },
  {
    titulo: "UFC 231 Fight: Holloway vs Ortega",
    descripcion: "Holloway gets an ez win",
    size: "557MB",
    filename: "ufc231.mp4",
    duracion: "1:25:10",
    thumbnail: "ufc231.png",
    reproducciones: 22004,
    fechaCreacion: new Date ("2020-01-10"),
    usuario: user3,
    estado: "Publico",
    etiquetas: ["ufc", "mma", "fighting"],
    feedback: {
      likes: [
        {
          usuario: user1,
          fecha: new Date ("2020-01-12")
        },
        {
          usuario: user2,
          fecha: new Date ("2020-01-13")
        }
      ],
      dislikes: [
        {
          usuario: user4,
          fecha: new Date ("2020-01-15")
        }
      ]
    },
    comentarios: []
  },
]
db.videos.insertMany(videos)

const video1 = db.videos.findOne({titulo: "Video at the zoo"})._id
const video2 = db.videos.findOne({titulo: "Video at It academy"})._id
const video3 = db.videos.findOne({titulo: "Holidays 2021"})._id
const video4 = db.videos.findOne({titulo: "Learn Javascript in 20 seconds"})._id
const video5 = db.videos.findOne({titulo: "Tabs vs Spaces: debate"})._id
const video6 = db.videos.findOne({titulo: "UFC 229 Fight: McGregor vs Khabib"})._id
const video7 = db.videos.findOne({titulo: "UFC 231 Fight: Holloway vs Ortega"})._id

const playlists = [
  {
    nombre: "Playlist ufc",
    fechaCreacion: new Date("2020-01-10"),
    estado: "Publica",
    usuario: user4,
    videos: [video6, video7]
  },
  {
    nombre: "Playlist programming",
    fechaCreacion: new Date("2020-03-17"),
    estado: "Publica",
    usuario: user2,
    videos: [video2, video4, video5]
  },
  {
    nombre: "A bit of everything",
    fechaCreacion: new Date("2020-04-24"),
    estado: "Publica",
    usuario: user1,
    videos: [video1, video2, video3, video4, video5, video6, video7]
  }
]

db.playlists.insertMany(playlists)