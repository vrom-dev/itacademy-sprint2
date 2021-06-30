conn = new Mongo("localhost:27017")

db = conn.getDB("pizzeria")

db.dropDatabase()

const clientes = [
  {
    _id: ObjectId(),
    nombre: 'Luis',
    apellidos: 'Martínez Pere',
    direccion: 'c/Avenida principal 123',
    telefono: 618992288,
    localidad: ObjectId()
  },
  {
    _id: ObjectId(),
    nombre: 'Laura',
    apellidos: 'Hernández Mateu',
    direccion: 'c/Aragó 22',
    telefono: 600123123,
    localidad: ObjectId()
  },


]

const tiendas = [
  {
    _id: ObjectId(),
    nombre: 'Tienda 1',
    direccion: 'c/Meridiana 25',
    localidad: ObjectId()
  },
  {
    _id: ObjectId(),
    nombre: 'Tienda 2',
    direccion: 'c/Sicilia 44',
    localidad: ObjectId()
  }
]

const localidad = [
  {
    _id: ObjectId(),
    nombre: 'Mataró',
    provincia: 'Barcelona'
  },
  {
    _id: ObjectId(),
    nombre: 'Barcelona',
    provincia: 'Barcelona'
  }
]