const conn = new Mongo("localhost:27017")

const db = conn.getDB("optica")

db.dropDatabase()

const clientes = [
  {
    telefono: 600454545,
    email: "abcdefghi@gmail.com",
    fechaRegistro: new Date("2021-03-23"),
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
    telefono: 600121212,
    email: "abcde@gmail.com",
    fechaRegistro: new Date("2021-05-06"),
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
]
db.clientes.insertMany(clientes)
const cliente1Id = db.clientes.findOne({email: "abcdefghi@gmail.com"})._id
const cliente2Id = db.clientes.findOne({email: "abcde@gmail.com"})._id

db.clientes.updateOne({email: "abcde@gmail.com"}, {$set: {referido: cliente1Id}})

const gafas = [
  {
    cliente: cliente1Id,  
    graduacionDerecha: 1.2,
    graduacionIzquierda: 1.4,
    montura: "pasta",
    monturaColor: "negro",
    cristaColor: "transparente",
    precio: 79.99,
    marca: "Ray-B",
    fechaVenta: new Date("2021-03-23"),
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
    graduacionDerecha: 2.2,
    graduacionIzquierda: 2.1,
    montura: "flotante",
    monturaColor: "rojo",
    precio: 59.99,
    marca: "Ray-B",
    fechaVenta: new Date("2021-05-06"),
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
]
db.gafas.insertMany(gafas)