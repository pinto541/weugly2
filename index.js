const express = require("express");
const app = express();
const mongoose = require("mongoose");
const { MONGO_DB_CONFIG } = require("./config/app.config");
const errors = require("./middleware/errors.js");
const swaggerUi= require("swagger-ui-express"),swaggerDocument = require("./api/swagger/swagger.json");

mongoose.promise =  global.promise;
mongoose
      .connect("mongodb://localhost:27017/weugly",{
        useNewUrlParser: true,
useUnifiedTopology: true,
family:4,

})
  .then(
       () =>{
            console.log("database connected");
            },
              (error) => {
                     console.log("database cant be connected:"+error);
                        }
                 );


        app.use(express.json());
app.use("/uploads",express.static("uploads"));
app.use("/api",require("./routes/app.routes"));
app.use(errors.errorHandler);
app.use("/api-docs",swaggerUi.serve,swaggerUi.setup(swaggerDocument));





app.get('/', (req, res) => {
  res.send('Hello yy!')
})

app.listen(process.env.part ||  4000, function() {
   console.log("ready to go");

});
