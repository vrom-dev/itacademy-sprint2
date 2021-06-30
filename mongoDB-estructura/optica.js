conn = new Mongo("localhost:27017")

db = conn.getDB("optica")

db.dropDatabase()

db.proveedores.insertMany([
  {
    _id: ObjectId("60dc437a1e63992e9eb1c968"),
    nombre: "Proveedor1",
    telefono: "937775645",
    fax: "937775646",
    direccion: {
      calle: "Aragó",
      numero: 123,
      piso: "1",
      puerta: "1",
      ciudad: "Barcelona",
      cpostal: 00001,
      pais: "ES"
    },
    nif: 83411652
  },
  {
    _id: ObjectId("60dc437a1e63992e9eb1c969"),
    nombre: "Proveedor1",
    telefono: "937775645",
    fax: "937775646",
    direccion: {
      calle: "Montserrat",
      numero: 212,
      piso: "3",
      puerta: "3",
      ciudad: "Mataró",
      cpostal: 00002,
      pais: "ES"
    },
    nif: 72300641
  }
])

db.clientes.insertMany([
  {
    _id: ObjectId("60dc441ac750534eb3615057"),
    telefono: 123,
    email: "abcde@gmail.com",
    fecha_registro: "23-03-2021 14:00:00",
    direccion: {
      calle: "Bonanova",
      numero: 321,
      piso: "2",
      puerta: "2",
      ciudad: "Barcelona",
      cpostal: 00001,
      pais: "ES"
    },
    referido: null
  },
  {
    _id: ObjectId("60dc441ac750534eb3615058"),
    telefono: 123,
    email: "abcde@gmail.com",
    fecha_registro: "06-05-2021 14:00:00",
    direccion: {
      calle: "Meridiana",
      numero: 21,
      piso: "5",
      puerta: "3",
      ciudad: "Barcelona",
      cpostal: 00002,
      pais: "ES"
    },
    referido: ObjectId("60dc441ac750534eb3615057")
  }
])

db.gafas.insertMany([
  {
    _id: ObjectId("60dc4457c750534eb3615059"),
    graduacion_derecha: 1.2,
    graduacion_izquierda: 1.4,
    montura: "pasta",
    montura_color: "negro",
    crista_color: "transparente",
    precio: 79.99,
    marca: "Ray-B",
    fecha_venta: "23-03-2021 14:00:00",
    proveedor: ObjectId("60dc437a1e63992e9eb1c968"),
    cliente: ObjectId("60dc441ac750534eb3615057"),  
    empleado: {
      nombre: "Juan Martínez"
    }
  },
  {
    _id: ObjectId("60dc4457c750534eb361505a"),
    graduacion_derecha: 2.2,
    graduacion_izquierda: 2.1,
    montura: "flotante",
    montura_color: "rojo",
    crista_color: "oscuro",
    precio: 59.99,
    marca: "Ray-B",
    fecha_venta: "06-05-2021 11:00:00",
    proveedor: ObjectId("60dc437a1e63992e9eb1c969"),
    cliente: ObjectId("60dc441ac750534eb3615058"),  
    empleado: {
      nombre: "Juan Martínez"
    }
  }
])