use Carola

//para hacer match con los valores y demás

//db.usuario.aggregate([{$match:{edad:35}},{$project:{nombre:1, precio:1}}]) sintaxis para mas elementos

db.usuario.aggregate([{$match:{edad:35}}])

//Revisar en el script para corregir
db.usuario.aggregate([{$match:{edad:35}},$project{{group:{id:123}}},count:{$sum:1}}}, $sort:{edad:-1}}])

//crear las colecciones bandas

db.createCollection("Bandas")

//inserts de las bandas estas y tres registros

db.Bandas.insertMany([{nombre:"banda 1", pais:"Colombia", albun:[{title:"nombre de album 1", year:2000,ranking:1, ventas:1200},{title:"albun 2",year:2001,ranking:2,ventas:1300}]}])

db.Bandas.insertMany([{nombre:"banda 2", pais:"Argentina", albun:[{title:"album 1 de banda 2", year:2003,ranking:12, ventas:12300},{title:"albun 2 de banda 2",year:2005,ranking:4,ventas:130440}]}])

db.Bandas.insertMany([{nombre:"banda 3", pais:"Peru", albun:[{title:"album 1 de banda 3", year:2006,ranking:45, ventas:1212300},{title:"albun 2 de banda 3",year:1999,ranking:7,ventas:13450}]}])

//para contat el numero de labunes
Carola
Selection deleted
db.Bandas.aggregate([])

//contar cuantos albunes tiene cada banda 2

db.Bandas.aggregate([{$unwind:"$albun"},{$group:{_id:"$nombre",albunCount:{$sum:1},ventas:{$sum:"$albun.ventas"}}}])

// top dos de albunes mas vendidos 3 
//aqui se usa el $unwind, $project, $sort, $limit

db.Bandas.aggregate([{$unwind:"$albun"},{$group:{_id:"$nombre",nombreAlbun:{$max:1},ventas:{$max:"$albun.ventas"}}}])


/reto 4
// obtener rankin por pais


