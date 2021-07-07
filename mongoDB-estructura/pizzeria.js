const conn = new Mongo("localhost:27017")

const db = conn.getDB("pizzeria")

db.dropDatabase()

const clientes = [
  {
    nombre: "Luis",
    apellidos: "Martínez Pere",
    direccion: "c/Avenida principal 123",
    telefono: 618992288,
    localidad: {
      nombre: "Mataró",
      provincia: "Barcelona"
    }
  },
  {
    nombre: "Laura",
    apellidos: "Hernández Mateu",
    direccion: "c/Aragó 22",
    telefono: 600123123,
    localidad: {
      nombre: "Barcelona",
      provincia: "Barcelona"
    }
  },
]
db.clientes.insertMany(clientes)

const cliente1 = db.clientes.findOne({nombre: "Luis"})._id
const cliente2 = db.clientes.findOne({nombre: "Laura"})._id

const tiendas = [
  {
    nombre: "Tienda 1",
    direccion: "c/Meridiana 25",
    localidad: {
      nombre: "Barcelona",
      provincia: "Barcelona"
    },
    empleados: [
      {
        nombre: "Marc",
        apellidos: "Luengo González",
        telefono: 685897969,
        puesto: "Repartidor"
      },
      {
        nombre: "Marta",
        apellidos: "Carreras Pérez",
        telefono: 623225454,
        puesto: "Cocinero"
      }
    ]
  },
  {
    nombre: "Tienda 2",
    direccion: "c/Sicilia 44",
    localidad: {
      nombre: "Mataró",
      provincia: "Barcelona"
    },
    empleados: [
      {
        nombre: "Martí",
        apellidos: "Benhaví Rosell",
        telefono: 714558899,
        puesto: "Cocinero"
      },
      {
        nombre: "Carla",
        apellidos: "Companys Lliçà",
        telefono: 755898963,
        puesto: "Repartidor"
      }
    ]
  }
]
db.tiendas.insertMany(tiendas)

const tienda1 = db.tiendas.findOne({nombre: "Tienda 1"})._id
const tienda2 = db.tiendas.findOne({nombre: "Tienda 2"})._id

const productos = [
  {
    nombre: "Pizza margherita",
    descripcion: "Classic margherita",
    precio: 10.90,
    tipo: "Pizza",
    categoriaPizza: "Napoletana",
    imagen: "pizzamargherita.png"
  },
  {
    nombre: "100% Angus",
    descripcion: "200 gr Angus meat",
    precio: 9.90,
    tipo: "Hamburguesa",
    categoriaPizza: null,
    imagen: "angus100.png"
  },
  {
    nombre: "Pizza carbonara di guanciale",
    descripcion: "Carbonara with certificated italian guanciale",
    precio: 12.90,
    tipo: "Pizza",
    categoriaPizza: "Napoletana",
    imagen: "pizzacarbonara.png"
  },
  {
    nombre: "Pizza romana",
    descripcion: "Flor di cotto, mozzarella, funghi",
    precio: 11.90,
    tipo: "Pizza",
    categoriaPizza: "Romana",
    imagen: "pizzaromana.png"
  },
  {
    nombre: "Pizza BBQ",
    descripcion: "BBQ sauce, mozzarella, chicken meat",
    precio: 12.90,
    tipo: "Pizza",
    categoriaPizza: "American Style",
    imagen: "pizzabbq.png"
  },
  {
    nombre: "Coca-cola zero",
    descripcion: "Zero calories, 33cl",
    precio: 1.90,
    tipo: "Bebida",
    categoriaPizza: null,
    imagen: "cocacolazero.png"
  },
  {
    nombre: "Voll Damm",
    descripcion: "Doble malta, 33cl",
    precio: 1.90,
    tipo: "Bebida",
    categoriaPizza: null,
    imagen: "volldamm.png"
  },
  {
    nombre: "Agua",
    descripcion: "Agua mineral, 33cl",
    precio: 1.50,
    tipo: "Bebida",
    categoriaPizza: null,
    imagen: "agua.png"
  },
]
db.productos.insertMany(productos)

const agua = db.productos.findOne({nombre: "Agua"})._id
const volldamm = db.productos.findOne({nombre: "Voll Damm"})._id
const pizzabbq = db.productos.findOne({nombre: "Pizza BBQ"})._id
const pizzamargherita = db.productos.findOne({nombre: "Pizza margherita"})._id
const pizzacarbonara = db.productos.findOne({nombre: "Pizza carbonara di guanciale"})._id

const pedidos = [
  {
    fecha: new Date("2021-06-27T14:00:00Z"),
    tipo: "Recoger",
    precioTotal: 27.20,
    detalle: [
      {
        producto: agua,
        precio: 1.50,
        cantidad: 1
      },
      {
        producto: volldamm,
        precio: 1.90,
        cantidad: 1
      },
      {
        producto: pizzabbq,
        precio: 12.90,
        cantidad: 1
      },
      {
        producto: pizzamargherita,
        precio: 10.90,
        cantidad: 1
      }
    ],
    reparto: null,
    tienda: tienda2,
    cliente: cliente1
  },
  {
    fecha: new Date("2021-06-28T13:30:00Z"),
    tipo: "Domicilio",
    precioTotal: 15.90,
    detalle: [
      {
        producto: agua,
        precio: 1.50,
        cantidad: 2
      },
      {
        producto: pizzacarbonara,
        precio: 12.90,
        cantidad: 1
      }
    ],
    reparto: {
      repartidor: {
        nombre: "Marc",
        apellidos: "Luengo González"
      },
      horaEntrega: new Date("2021-06-28T14:00:00Z")
    },
    tienda: tienda1,
    cliente: cliente2
  }
]
db.pedidos.insertMany(pedidos)