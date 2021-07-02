const conn = new Mongo("localhost:27017")

const db = conn.getDB("pizzeria")

db.dropDatabase()

const localidades = [
  {
    nombre: 'Mataró',
    provincia: 'Barcelona'
  },
  {
    nombre: 'Barcelona',
    provincia: 'Barcelona'
  }
]
db.localidades.insertMany(localidades)

const mataro = db.localidades.findOne({nombre: "Mataró"})._id
const bcn = db.localidades.findOne({nombre: "Barcelona"})._id

const clientes = [
  {
    nombre: 'Luis',
    apellidos: 'Martínez Pere',
    direccion: 'c/Avenida principal 123',
    telefono: 618992288,
    localidad: mataro
  },
  {
    nombre: 'Laura',
    apellidos: 'Hernández Mateu',
    direccion: 'c/Aragó 22',
    telefono: 600123123,
    localidad: bcn
  },
]
db.clientes.insertMany(clientes)

const cliente1 = db.clientes.findOne({nombre: "Luis"})._id
const cliente2 = db.clientes.findOne({nombre: "Laura"})._id

const tiendas = [
  {
    nombre: 'Tienda 1',
    direccion: 'c/Meridiana 25',
    localidad: bcn
  },
  {
    nombre: 'Tienda 2',
    direccion: 'c/Sicilia 44',
    localidad: mataro
  }
]
db.tiendas.insertMany(tiendas)

const tienda1 = db.tiendas.findOne({nombre: "Tienda 1"})._id
const tienda2 = db.tiendas.findOne({nombre: "Tienda 2"})._id

const empleados = [
  {
    nombre: "Marc",
    apellidos: "Luengo González",
    telefono: 685897969,
    puesto: "Repartidor",
    tienda: tienda1
  },
  {
    nombre: "Marta",
    apellidos: "Carreras Pérez",
    telefono: 623225454,
    puesto: "Cocinero",
    tienda: tienda1
  },
  {
    nombre: "Martí",
    apellidos: "Benhaví Rosell",
    telefono: 714558899,
    puesto: "Cocinero",
    tienda: tienda2
  },
  {
    nombre: "Carla",
    apellidos: "Companys Lliçà",
    telefono: 755898963,
    puesto: "Repartidor",
    tienda: tienda2
  }
]
db.empleados.insertMany(empleados)

const emp1 = db.empleados.findOne({nombre: "Marc"})._id

const productos = [
  {
    nombre: "Pizza margherita",
    descripcion: "Classic margherita",
    precio: 10.90,
    tipo: "Pizza",
    imagen: "pizzamargherita.png"
  },
  {
    nombre: "100% Angus",
    descripcion: "200 gr Angus meat",
    precio: 9.90,
    tipo: "Hamburguesa",
    imagen: "angus100.png"
  },
  {
    nombre: "Pizza carbonara di guanciale",
    descripcion: "Carbonara with certificated italian guanciale",
    precio: 12.90,
    tipo: "Pizza",
    imagen: "pizzacarbonara.png"
  },
  {
    nombre: "Pizza romana",
    descripcion: "Flor di cotto, mozzarella, funghi",
    precio: 11.90,
    tipo: "Pizza",
    imagen: "pizzaromana.png"
  },
  {
    nombre: "Pizza BBQ",
    descripcion: "BBQ sauce, mozzarella, chicken meat",
    precio: 12.90,
    tipo: "Pizza",
    imagen: "pizzabbq.png"
  },
  {
    nombre: "Coca-cola zero",
    descripcion: "Zero calories, 33cl",
    precio: 1.90,
    tipo: "Bebida",
    imagen: "cocacolazero.png"
  },
  {
    nombre: "Voll Damm",
    descripcion: "Doble malta, 33cl",
    precio: 1.90,
    tipo: "Bebida",
    imagen: "volldamm.png"
  },
  {
    nombre: "Agua",
    descripcion: "Agua mineral, 33cl",
    precio: 1.50,
    tipo: "Bebida",
    imagen: "agua.png"
  },
]
db.productos.insertMany(productos)

const bbq = db.productos.findOne({nombre: "Pizza BBQ"})._id
const margherita = db.productos.findOne({nombre: "Pizza margherita"})._id
const romana = db.productos.findOne({nombre: "Pizza romana"})._id
const carbonara = db.productos.findOne({nombre: "Pizza carbonara di guanciale"})._id
const angusBurger = db.productos.findOne({nombre: "100% Angus"})._id
const cocacolazero = db.productos.findOne({nombre: "Coca-cola zero"})._id
const volldamm = db.productos.findOne({nombre: "Voll Damm"})._id
const agua = db.productos.findOne({nombre: "Agua"})._id

const categoriasPizza = [
  {
    nombre: "Napoletanas",
    pizzas: [margherita, carbonara]
  },
  {
    nombre: "Romanas",
    pizzas: [romana]
  },
  {
    nombre: "American Style",
    pizzas: [bbq]
  }
]
db.categoriasPizza.insertMany(categoriasPizza)

const pedidos = [
  {
    fecha: new Date("2021-06-27T14:00:00Z"),
    tipo: "Recoger",
    precioTotal: 27.20,
    detalle: [
      {
        producto: agua, 
        cantidad: 1
      },
      {
        producto: volldamm,
        cantidad: 1
      },
      {
        producto: bbq,
        cantidad: 1
      },
      {
        producto: margherita,
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
        cantidad: 2
      },
      {
        producto: carbonara,
        cantidad: 1
      }
    ],
    reparto: {
      repartidor: emp1,
      horaEntrega: new Date("2021-06-28T14:00:00Z")
    },
    tienda: tienda1,
    cliente: cliente2
  }
]
db.pedidos.insertMany(pedidos)
