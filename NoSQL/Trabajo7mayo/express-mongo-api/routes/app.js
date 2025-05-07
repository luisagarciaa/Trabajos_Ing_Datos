const express=require("express");
const mongoose=require("mongoose");
const bodyParser=require("body-parser");
const cors=require("cors");
const itemRoutes=require("./routes/productosRoutes");

const app=express();
const port=3000;



app.use(bodyParser.json());
app.use(cors());

//conexion MongoDB 

mongoose.connect("mongodb://localhost:27017/miapp",{
    useNewIrlParser:true,
    useUnifiedTipologt:true,
})

.then(()=>console.log("MongoDB Conectado"))
.catch(err=>console.err(err))

//ruta principal 
app.use("api/items",itemRoutes);

// iniciar servidor 
app.listen(port,()=>{
    console.log(`servidor corriendo sobre http://localhost:${port}`)
});