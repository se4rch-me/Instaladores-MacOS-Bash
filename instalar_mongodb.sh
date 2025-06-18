
# Actualizar Homebrew
brew update

# Instalar MongoDB
brew tap mongodb/brew
brew install mongodb-community

# Iniciar MongoDB como un servicio
brew services start mongodb-community

# Instalar Node.js y npm si no están instalados
brew install node

# Crear un directorio para tu proyecto
mkdir mi_proyecto_mongo
cd mi_proyecto_mongo

# Inicializar un proyecto Node.js
npm init -y

# Instalar Mongoose
npm install mongoose

# Crear un archivo de ejemplo
cat << EOF > app.js
const mongoose = require('mongoose');

// Conectar a MongoDB
mongoose.connect('mongodb://localhost:27017/mi_base_de_datos');

// Definir un esquema
const Schema = mongoose.Schema;
const PersonaSchema = new Schema({
  nombre: String,
  edad: Number
});

// Crear un modelo
const Persona = mongoose.model('Persona', PersonaSchema);

// Función asincrónica para manejar las operaciones de la base de datos
async function ejecutarOperaciones() {
  try {
    // Crear un documento
    const nuevaPersona = new Persona({
      nombre: 'Juan',
      edad: 30
    });

    // Guardar el documento
    await nuevaPersona.save();
    console.log('Persona guardada correctamente');

    // Buscar documentos
    const personas = await Persona.find({nombre: 'Juan'});
    console.log('Personas encontradas:', personas);

  } catch (err) {
    console.error('Error:', err);
  } finally {
    // Cerrar la conexión
    await mongoose.connection.close();
    console.log('Conexión cerrada');
  }
}

// Ejecutar las operaciones
ejecutarOperaciones();
EOF

echo "Instalación y configuración completadas. Puedes ejecutar el ejemplo con 'node app.js'"