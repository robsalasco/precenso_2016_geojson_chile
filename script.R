library(sf)
library(dplyr)
library(rmapshaper)

simplygeojson <- function(x, name, keep){
  shp <- ms_simplify(x, keep=keep)
  write_sf(shp, dsn = paste0(name, "/","R", sprintf("%02d", as.numeric(unique(x$REGION))),".geojson"), delete_dsn = FALSE, overwrite=TRUE)
}

data1 <- lapply(paste0("R",sprintf("%02d",1:16)), function(x){read_sf(paste0("Data/",x,"/COMUNA_C17.shp"))})
lapply(data1, function(x) {simplygeojson(x, "Comunas", 0.2)})

data2 <- lapply(paste0("R",sprintf("%02d",1:16)), function(x){read_sf(paste0("Data/",x,"/LIMITE_URBANO_CENSAL_C17.shp"))})
lapply(data2, function(x) {simplygeojson(x, "Limite_Urbano", 0.2)})

data3 <- lapply(paste0("R",sprintf("%02d",1:16)), function(x){read_sf(paste0("Data/",x,"/PROVINCIA_C17.shp"))})
lapply(data3, function(x) {simplygeojson(x, "Provincias", 0.2)})

data4 <- lapply(paste0("R",sprintf("%02d",1:16)), function(x){read_sf(paste0("Data/",x,"/MANZANA_IND_C17.shp"))})
lapply(data4, function(x) {simplygeojson(x, "Manzanas", 0.2)})

data5 <- lapply(paste0("R",sprintf("%02d",1:16)), function(x){read_sf(paste0("Data/",x,"/REGION_C17.shp"))})
lapply(data5, function(x) {simplygeojson(x, "Regiones", 0.2)})

data6 <- lapply(paste0("R",sprintf("%02d",1:16)), function(x){read_sf(paste0("Data/",x,"/DISTRITO_C17.shp"))})
lapply(data6, function(x) {simplygeojson(x, "Distritos", 0.2)})

data7 <- lapply(paste0("R",sprintf("%02d",1:16)), function(x){read_sf(paste0("Data/",x,"/ZONA_C17.shp"))})
lapply(data7, function(x) {simplygeojson(x, "Zonas", 0.2)})


chl <- lapply(paste0("R",sprintf("%02d",1:16)), function(x){read_sf(paste0("Data/",x,"/COMUNA_C17.shp"))})
chl <- do.call(rbind, chl)

s.chl1 <- ms_simplify(chl, keep=0.001)
write_sf(s.chl1, dsn = "Extras/CHILE1.geojson", delete_dsn = FALSE, overwrite=TRUE)

s.chl2 <- ms_simplify(chl, keep=0.01)
write_sf(s.chl2, dsn = "Extras/CHILE2.geojson", delete_dsn = FALSE, overwrite=TRUE)

s.chl3 <- ms_simplify(chl, keep=0.1)
write_sf(s.chl3, dsn = "Extras/CHILE3.geojson", delete_dsn = FALSE, overwrite=TRUE)



