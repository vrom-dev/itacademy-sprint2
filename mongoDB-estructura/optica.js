const conn = new Mongo("localhost:27017")

const db = conn.getDB("optica")

db.dropDatabase()

db.clientes.insertMany([
  {
    telefono: 123,
    email: "abcdefghi@gmail.com",
    fecha_registro: new Date("2021-03-23"),
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
    telefono: 123,
    email: "abcde@gmail.com",
    fecha_registro: new Date("2021-05-06"),
    direccion: {
      calle: "Meridiana",
      numero: 21,
      piso: "5",
      puerta: "3",
      ciudad: "Barcelona",
      cpostal: 00002,
      pais: "ES"
    },
    referido: null
  }
])
const cliente1Id = db.clientes.findOne({email: "abcdefghi@gmail.com"})._id
const cliente2Id = db.clientes.findOne({email: "abcde@gmail.com"})._id

db.clientes.updateOne({email: "abcde@gmail.com"}, {$set: {referido: cliente1Id}})

db.gafas.insertMany([
  {
    cliente: cliente1Id,  
    graduacion_derecha: 1.2,
    graduacion_izquierda: 1.4,
    montura: "pasta",
    montura_color: "negro",
    crista_color: "transparente",
    precio: 79.99,
    marca: "Ray-B",
    fecha_venta: new Date("2021-03-23"),
    proveedor: {
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
    empleado: {
      nombre: "Juan Martínez"
    }
  },
  {
    cliente: cliente2Id,  
    graduacion_derecha: 2.2,
    graduacion_izquierda: 2.1,
    montura: "flotante",
    montura_color: "rojo",
    crista_color: "oscuro",
    precio: 59.99,
    marca: "Ray-B",
    fecha_venta: new Date("2021-05-06"),
    proveedor: {
      nombre: "Proveedor2",
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
    },
    empleado: {
      nombre: "Juan Martínez"
    }
  }
])