library(leaflet)
library(rgdal) #for reading/writing geo files
library(rgeos) #for simplification
library(sp)
library("rio")
library("readxl")
library("tmap")
library("leaflet")
library("tmap")
library("tmaptools")
library(htmlwidgets)

usshapefile <- "C:\\Users\\Mary\\Documents\\Map\\cb_2014_us_county_5m.shp"
usgeo <- read_shape(usshapefile)
usdata <- read.csv(file="C:\\Users\\Mary\\Documents\\Map\\county_data_voting_master_csvf.csv")



al_fipscode <- "01"
al_ab <- "AL"
az_fipscode <- "04"
az_ab <- "AZ"
ar_fipscode <- "05"
ar_ab <- "AR"
ca_fipscode <- "06"
ca_ab <- "CA"
co_fipscode <- "08"
co_ab <- "CO"
ct_fipscode <- "09"
ct_ab <- "CT"
de_fipscode <- "10"
de_ab <- "DE"
dc_fipscode <- "11"
dc_ab <- "DC"
fl_fipscode <- "12"
fl_ab <- "FL"
de_fipscode <- "10"
de_ab <- "DE"
ga_fipscode <- "13"
ga_ab <- "GA"
hi_fipscode <- "15"
hi_ab <- "HI"
id_fipscode <- "16"
id_ab <- "ID"
il_fipscode <- "17"
il_ab <- "IL"
in_fipscode <- "18"
in_ab <- "IN"
ia_fipscode <- "19"
ia_ab <- "IA"
ks_fipscode <- "20"
ks_ab <- "KS"
ky_fipscode <- "21"
ky_ab <- "KY"
la_fipscode <- "22"
la_ab <- "LA"
me_fipscode <- "23"
me_ab <- "ME"
md_fipscode <- "24"
md_ab <- "md"
ma_fipscode <- "25"
ma_ab <- "ma"
mi_fipscode <- "26"
mi_ab <- "MI"
mn_fipscode <- "27"
mn_ab <- "MN"
ms_fipscode <- "28"
ms_ab <- "MS"
mo_fipscode <- "29"
mo_ab <- "MO"
mt_fipscode <- "30"
mt_ab <- "MT"
ne_fipscode <- "31"
ne_ab <- "NE"
nv_fipscode <- "32"
nv_ab <- "NV"
nh_fipscode <- "33"
nh_ab <- "NH"
nj_fipscode <- "34"
nj_ab <- "NJ"
nm_fipscode <- "35"
nm_ab <- "NM"
ny_fipscode <- "36"
ny_ab <- "NY"
nc_fipscode <- "37"
nc_ab <- "NC"
nd_fipscode <- "38"
nd_ab <- "ND"
oh_fipscode <- "39"
oh_ab <- "OH"
ok_fipscode <- "40"
ok_ab <- "OK"
or_fipscode <- "41"
or_ab <- "OR"
pa_fipscode <- "42"
pa_ab <- "PA"
ri_fipscode <- "44"
ri_ab <- "RI"
sc_fipscode <- "45"
sc_ab <- "SC"
sd_fipscode <- "46"
sd_ab <- "SD"
tn_fipscode <- "47"
tn_ab <- "TN"
tx_fipscode <- "48"
tx_ab <- "TX"
ut_fipscode <- "49"
ut_ab <- "UT"
vt_fipscode <- "50"
vt_ab <- "VT"
va_fipscode <- "51"
va_ab <- "VA"
wa_fipscode <- "53"
wa_ab <- "WA"
wv_fipscode <- "54"
wv_ab <- "WV"
wi_fipscode <- "55"
wi_ab <- "WI"
wy_fipscode <- "56"
wy_ab <- "WY"
va_fipscode <- "51"
va_ab <- "VA"

## State maps
## Alabama
algeo <- usgeo[usgeo@data$STATEFP==al_fipscode,]
aldata <- subset(usdata, usdata$state_abbreviation==al_ab)
algeo@data$NAME <- as.character(algeo@data$NAME)
algeo <- algeo[order(algeo@data$NAME),]
aldata <- aldata[order(aldata$area_name),]
almap <- append_data(algeo, aldata)

## Arizona
azgeo <- usgeo[usgeo@data$STATEFP==az_fipscode,]
azdata <- subset(usdata, usdata$state_abbreviation==az_ab)
azgeo@data$NAME <- as.character(azgeo@data$NAME)
azgeo <- azgeo[order(azgeo@data$NAME),]
azdata <- azdata[order(azdata$area_name),]
azmap <- append_data(azgeo, azdata)

## Arkansas
argeo <- usgeo[usgeo@data$STATEFP==ar_fipscode,]
ardata <- subset(usdata, usdata$state_abbreviation==ar_ab)
argeo@data$NAME <- as.character(argeo@data$NAME)
argeo <- argeo[order(argeo@data$NAME),]
ardata <- ardata[order(ardata$area_name),]
armap <- append_data(argeo, ardata)

## California
cageo <- usgeo[usgeo@data$STATEFP==ca_fipscode,]
cadata <- subset(usdata, usdata$state_abbreviation==ca_ab)
cageo@data$NAME <- as.character(cageo@data$NAME)
cageo <- cageo[order(cageo@data$NAME),]
cadata <- cadata[order(cadata$area_name),]
camap <- append_data(cageo, cadata)

## Connecticut
ctgeo <- usgeo[usgeo@data$STATEFP==ct_fipscode,]
ctdata <- subset(usdata, usdata$state_abbreviation==ct_ab)
ctgeo@data$NAME <- as.character(ctgeo@data$NAME)
ctgeo <- ctgeo[order(ctgeo@data$NAME),]
ctdata <- ctdata[order(ctdata$area_name),]
ctmap <- append_data(ctgeo, ctdata)

## Colorado
cogeo <- usgeo[usgeo@data$STATEFP==co_fipscode,]
codata <- subset(usdata, usdata$state_abbreviation==co_ab)
cogeo@data$NAME <- as.character(cogeo@data$NAME)
cogeo <- cogeo[order(cogeo@data$NAME),]
codata <- codata[order(codata$area_name),]
comap <- append_data(cogeo, codata)

## Deleware
degeo <- usgeo[usgeo@data$STATEFP==de_fipscode,]
dedata <- subset(usdata, usdata$state_abbreviation==de_ab)
degeo@data$NAME <- as.character(degeo@data$NAME)
degeo <- degeo[order(degeo@data$NAME),]
dedata <- dedata[order(dedata$area_name),]
demap <- append_data(degeo, dedata)

## DC
dcgeo <- usgeo[usgeo@data$STATEFP==dc_fipscode,]
dcdata <- subset(usdata, usdata$state_abbreviation==dc_ab)
dcgeo@data$NAME <- as.character(dcgeo@data$NAME)
dcgeo <- dcgeo[order(dcgeo@data$NAME),]
dcdata <- dcdata[order(dcdata$area_name),]
dcmap <- append_data(dcgeo, dcdata)

## Florida
flgeo <- usgeo[usgeo@data$STATEFP==fl_fipscode,]
fldata <- subset(usdata, usdata$state_abbreviation==fl_ab)
flgeo@data$NAME <- as.character(flgeo@data$NAME)
flgeo <- flgeo[order(flgeo@data$NAME),]
fldata <- fldata[order(fldata$area_name),]
flmap <- append_data(flgeo, fldata)

## Georgia
gageo <- usgeo[usgeo@data$STATEFP==ga_fipscode,]
gadata <- subset(usdata, usdata$state_abbreviation==ga_ab)
gageo@data$NAME <- as.character(gageo@data$NAME)
gageo <- gageo[order(gageo@data$NAME),]
gadata <- gadata[order(gadata$area_name),]
gamap <- append_data(gageo, gadata)

## Hawaii
higeo <- usgeo[usgeo@data$STATEFP==hi_fipscode,]
hidata <- subset(usdata, usdata$state_abbreviation==hi_ab)
higeo@data$NAME <- as.character(higeo@data$NAME)
higeo <- higeo[order(higeo@data$NAME),]
hidata <- hidata[order(hidata$area_name),]
himap <- append_data(higeo, hidata)

## Idaho
idgeo <- usgeo[usgeo@data$STATEFP==id_fipscode,]
iddata <- subset(usdata, usdata$state_abbreviation==id_ab)
idgeo@data$NAME <- as.character(idgeo@data$NAME)
idgeo <- idgeo[order(idgeo@data$NAME),]
iddata <- iddata[order(iddata$area_name),]
idmap <- append_data(idgeo, iddata)

## Illinois
ilgeo <- usgeo[usgeo@data$STATEFP==il_fipscode,]
ildata <- subset(usdata, usdata$state_abbreviation==il_ab)
ilgeo@data$NAME <- as.character(ilgeo@data$NAME)
ilgeo <- ilgeo[order(ilgeo@data$NAME),]
ildata <- ildata[order(ildata$area_name),]
ilmap <- append_data(ilgeo, ildata)

## Indiana
ingeo <- usgeo[usgeo@data$STATEFP==in_fipscode,]
indata <- subset(usdata, usdata$state_abbreviation==in_ab)
ingeo@data$NAME <- as.character(ingeo@data$NAME)
ingeo <- ingeo[order(ingeo@data$NAME),]
indata <- indata[order(indata$area_name),]
inmap <- append_data(ingeo, indata)

## Iowa
iageo <- usgeo[usgeo@data$STATEFP==ia_fipscode,]
iadata <- subset(usdata, usdata$state_abbreviation==ia_ab)
iageo@data$NAME <- as.character(iageo@data$NAME)
iageo <- iageo[order(iageo@data$NAME),]
iadata <- iadata[order(iadata$area_name),]
iamap <- append_data(iageo, iadata)

## Kansas
ksgeo <- usgeo[usgeo@data$STATEFP==ks_fipscode,]
ksdata <- subset(usdata, usdata$state_abbreviation==ks_ab)
ksgeo@data$NAME <- as.character(ksgeo@data$NAME)
ksgeo <- ksgeo[order(ksgeo@data$NAME),]
ksdata <- ksdata[order(ksdata$area_name),]
ksmap <- append_data(ksgeo, ksdata)

## Kentucky
kygeo <- usgeo[usgeo@data$STATEFP==ky_fipscode,]
kydata <- subset(usdata, usdata$state_abbreviation==ky_ab)
kygeo@data$NAME <- as.character(kygeo@data$NAME)
kygeo <- kygeo[order(kygeo@data$NAME),]
kydata <- kydata[order(kydata$area_name),]
kymap <- append_data(kygeo, kydata)

## Louisiana
lageo <- usgeo[usgeo@data$STATEFP==la_fipscode,]
ladata <- subset(usdata, usdata$state_abbreviation==la_ab)
lageo@data$NAME <- as.character(lageo@data$NAME)
lageo <- lageo[order(lageo@data$NAME),]
ladata <- ladata[order(ladata$area_name),]
lamap <- append_data(lageo, ladata)

## Maine
megeo <- usgeo[usgeo@data$STATEFP==me_fipscode,]
medata <- subset(usdata, usdata$state_abbreviation==me_ab)
megeo@data$NAME <- as.character(megeo@data$NAME)
megeo <- megeo[order(megeo@data$NAME),]
medata <- medata[order(medata$area_name),]
memap <- append_data(megeo, medata)

## Maryland
mdgeo <- usgeo[usgeo@data$STATEFP==md_fipscode,]
mddata <- subset(usdata, usdata$state_abbreviation=="MD")
mdgeo@data$NAME <- as.character(mdgeo@data$NAME)
mdgeo <- mdgeo[order(mdgeo@data$NAME),]
mddata <- mddata[order(mddata$area_name),]
mdmap <- append_data(mdgeo, mddata)

## Massachusetts
mageo <- usgeo[usgeo@data$STATEFP==ma_fipscode,]
madata <- subset(usdata, usdata$state_abbreviation=="MA")
mageo@data$NAME <- as.character(mageo@data$NAME)
mageo <- mageo[order(mageo@data$NAME),]
madata <- madata[order(madata$area_name),]
mamap <- append_data(mageo, madata)

## Michigan
migeo <- usgeo[usgeo@data$STATEFP==mi_fipscode,]
midata <- subset(usdata, usdata$state_abbreviation==mi_ab)
migeo@data$NAME <- as.character(migeo@data$NAME)
migeo <- migeo[order(migeo@data$NAME),]
midata <- midata[order(midata$area_name),]
mimap <- append_data(migeo, midata)

## Minnesota
mngeo <- usgeo[usgeo@data$STATEFP==mn_fipscode,]
mndata <- subset(usdata, usdata$state_abbreviation==mn_ab)
mngeo@data$NAME <- as.character(mngeo@data$NAME)
mngeo <- mngeo[order(mngeo@data$NAME),]
mndata <- mndata[order(mndata$area_name),]
mnmap <- append_data(mngeo, mndata)

## Mississippi
msgeo <- usgeo[usgeo@data$STATEFP==ms_fipscode,]
msdata <- subset(usdata, usdata$state_abbreviation==ms_ab)
msgeo@data$NAME <- as.character(msgeo@data$NAME)
msgeo <- msgeo[order(msgeo@data$NAME),]
msdata <- msdata[order(msdata$area_name),]
msmap <- append_data(msgeo, msdata)

## Missouri
mogeo <- usgeo[usgeo@data$STATEFP==mo_fipscode,]
modata <- subset(usdata, usdata$state_abbreviation==mo_ab)
mogeo@data$NAME <- as.character(mogeo@data$NAME)
mogeo <- mogeo[order(mogeo@data$NAME),]
modata <- modata[order(modata$area_name),]
momap <- append_data(mogeo, modata)

## Montana
mtgeo <- usgeo[usgeo@data$STATEFP==mt_fipscode,]
mtdata <- subset(usdata, usdata$state_abbreviation==mt_ab)
mtgeo@data$NAME <- as.character(mtgeo@data$NAME)
mtgeo <- mtgeo[order(mtgeo@data$NAME),]
mtdata <- mtdata[order(mtdata$area_name),]
mtmap <- append_data(mtgeo, mtdata)

## Nebraska
negeo <- usgeo[usgeo@data$STATEFP==ne_fipscode,]
nedata <- subset(usdata, usdata$state_abbreviation==ne_ab)
negeo@data$NAME <- as.character(negeo@data$NAME)
negeo <- negeo[order(negeo@data$NAME),]
nedata <- nedata[order(nedata$area_name),]
nemap <- append_data(negeo, nedata)

## Nevada
nvgeo <- usgeo[usgeo@data$STATEFP==nv_fipscode,]
nvdata <- subset(usdata, usdata$state_abbreviation==nv_ab)
nvgeo@data$NAME <- as.character(nvgeo@data$NAME)
nvgeo <- nvgeo[order(nvgeo@data$NAME),]
nvdata <- nvdata[order(nvdata$area_name),]
nvmap <- append_data(nvgeo, nvdata)

## New Hampshire
nhgeo <- usgeo[usgeo@data$STATEFP==nh_fipscode,]
nhdata <- subset(usdata, usdata$state_abbreviation==nh_ab)
nhgeo@data$NAME <- as.character(nhgeo@data$NAME)
nhgeo <- nhgeo[order(nhgeo@data$NAME),]
nhdata <- nhdata[order(nhdata$area_name),]
nhmap <- append_data(nhgeo, nhdata)

## New Jersey
njgeo <- usgeo[usgeo@data$STATEFP==nj_fipscode,]
njdata <- subset(usdata, usdata$state_abbreviation==nj_ab)
njgeo@data$NAME <- as.character(njgeo@data$NAME)
njgeo <- njgeo[order(njgeo@data$NAME),]
njdata <- njdata[order(njdata$area_name),]
njmap <- append_data(njgeo, njdata)

## New Mexico
nmgeo <- usgeo[usgeo@data$STATEFP==nm_fipscode,]
nmdata <- subset(usdata, usdata$state_abbreviation==nm_ab)
nmgeo@data$NAME <- as.character(nmgeo@data$NAME)
nmgeo <- nmgeo[order(nmgeo@data$NAME),]
nmdata <- nmdata[order(nmdata$area_name),]
nmmap <- append_data(nmgeo, nmdata)

## New York
nygeo <- usgeo[usgeo@data$STATEFP==ny_fipscode,]
nydata <- subset(usdata, usdata$state_abbreviation==ny_ab)
nygeo@data$NAME <- as.character(nygeo@data$NAME)
nygeo <- nygeo[order(nygeo@data$NAME),]
nydata <- nydata[order(nydata$area_name),]
nymap <- append_data(nygeo, nydata)

## North Carolina	
ncgeo <- usgeo[usgeo@data$STATEFP==nc_fipscode,]
ncdata <- subset(usdata, usdata$state_abbreviation==nc_ab)
ncgeo@data$NAME <- as.character(ncgeo@data$NAME)
ncgeo <- ncgeo[order(ncgeo@data$NAME),]
ncdata <- ncdata[order(ncdata$area_name),]
ncmap <- append_data(ncgeo, ncdata)

## North Dakota
ndgeo <- usgeo[usgeo@data$STATEFP==nd_fipscode,]
nddata <- subset(usdata, usdata$state_abbreviation==nd_ab)
ndgeo@data$NAME <- as.character(ndgeo@data$NAME)
ndgeo <- ndgeo[order(ndgeo@data$NAME),]
nddata <- nddata[order(nddata$area_name),]
ndmap <- append_data(ndgeo, nddata)

## Ohio
ohgeo <- usgeo[usgeo@data$STATEFP==oh_fipscode,]
ohdata <- subset(usdata, usdata$state_abbreviation==oh_ab)
ohgeo@data$NAME <- as.character(ohgeo@data$NAME)
ohgeo <- ohgeo[order(ohgeo@data$NAME),]
ohdata <- ohdata[order(ohdata$area_name),]
ohmap <- append_data(ohgeo, ohdata)

## Oklahoma
okgeo <- usgeo[usgeo@data$STATEFP==ok_fipscode,]
okdata <- subset(usdata, usdata$state_abbreviation==ok_ab)
okgeo@data$NAME <- as.character(okgeo@data$NAME)
okgeo <- okgeo[order(okgeo@data$NAME),]
okdata <- okdata[order(okdata$area_name),]
okmap <- append_data(okgeo, okdata)

## Oregon
orgeo <- usgeo[usgeo@data$STATEFP==or_fipscode,]
ordata <- subset(usdata, usdata$state_abbreviation==or_ab)
orgeo@data$NAME <- as.character(orgeo@data$NAME)
orgeo <- orgeo[order(orgeo@data$NAME),]
ordata <- ordata[order(ordata$area_name),]
ormap <- append_data(orgeo, ordata)

## Pennsylvania
pageo <- usgeo[usgeo@data$STATEFP==pa_fipscode,]
padata <- subset(usdata, usdata$state_abbreviation==pa_ab)
pageo@data$NAME <- as.character(pageo@data$NAME)
pageo <- pageo[order(pageo@data$NAME),]
padata <- padata[order(padata$area_name),]
pamap <- append_data(pageo, padata)

## Rhode Island	
rigeo <- usgeo[usgeo@data$STATEFP==ri_fipscode,]
ridata <- subset(usdata, usdata$state_abbreviation==ri_ab)
rigeo@data$NAME <- as.character(rigeo@data$NAME)
rigeo <- rigeo[order(rigeo@data$NAME),]
ridata <- ridata[order(ridata$area_name),]
rimap <- append_data(rigeo, ridata)

## South Carolina
scgeo <- usgeo[usgeo@data$STATEFP==sc_fipscode,]
scdata <- subset(usdata, usdata$state_abbreviation==sc_ab)
scgeo@data$NAME <- as.character(scgeo@data$NAME)
scgeo <- scgeo[order(scgeo@data$NAME),]
scdata <- scdata[order(scdata$area_name),]
scmap <- append_data(scgeo, scdata)

## South Dakota
sdgeo <- usgeo[usgeo@data$STATEFP==sd_fipscode,]
sddata <- subset(usdata, usdata$state_abbreviation==sd_ab)
sdgeo@data$NAME <- as.character(sdgeo@data$NAME)
sdgeo <- sdgeo[order(sdgeo@data$NAME),]
sddata <- sddata[order(sddata$area_name),]
sdmap <- append_data(sdgeo, sddata)

## Tennessee	
tngeo <- usgeo[usgeo@data$STATEFP==tn_fipscode,]
tndata <- subset(usdata, usdata$state_abbreviation==tn_ab)
tngeo@data$NAME <- as.character(tngeo@data$NAME)
tngeo <- tngeo[order(tngeo@data$NAME),]
tndata <- tndata[order(tndata$area_name),]
tnmap <- append_data(tngeo, tndata)

## Texas
txgeo <- usgeo[usgeo@data$STATEFP==tx_fipscode,]
txdata <- subset(usdata, usdata$state_abbreviation==tx_ab)
txgeo@data$NAME <- as.character(txgeo@data$NAME)
txgeo <- txgeo[order(txgeo@data$NAME),]
txdata <- txdata[order(txdata$area_name),]
txmap <- append_data(txgeo,txdata)

## Utah
utgeo <- usgeo[usgeo@data$STATEFP==ut_fipscode,]
utdata <- subset(usdata, usdata$state_abbreviation==ut_ab)
utgeo@data$NAME <- as.character(utgeo@data$NAME)
utgeo <- utgeo[order(utgeo@data$NAME),]
utdata <- utdata[order(utdata$area_name),]
utmap <- append_data(utgeo, utdata)

## Vermont
vtgeo <- usgeo[usgeo@data$STATEFP==vt_fipscode,]
vtdata <- subset(usdata, usdata$state_abbreviation==vt_ab)
vtgeo@data$NAME <- as.character(vtgeo@data$NAME)
vtgeo <- vtgeo[order(vtgeo@data$NAME),]
vtdata <- vtdata[order(vtdata$area_name),]
vtmap <- append_data(vtgeo, vtdata)

## Virginia
vageo <- usgeo[usgeo@data$STATEFP==va_fipscode,]
vadata <- subset(usdata, usdata$state_abbreviation==va_ab)
vageo@data$NAME <- as.character(vageo@data$NAME)
vageo <- vageo[order(vageo@data$NAME),]
vadata <- vadata[order(vadata$area_name),]
vamap <- append_data(vageo, vadata)

## Washington
wageo <- usgeo[usgeo@data$STATEFP==wa_fipscode,]
wadata <- subset(usdata, usdata$state_abbreviation==wa_ab)
wageo@data$NAME <- as.character(wageo@data$NAME)
wageo <- wageo[order(wageo@data$NAME),]
wadata <- wadata[order(wadata$area_name),]
wamap <- append_data(wageo, wadata)

## West Virginia
wvgeo <- usgeo[usgeo@data$STATEFP==wv_fipscode,]
wvdata <- subset(usdata, usdata$state_abbreviation==wv_ab)
wvgeo@data$NAME <- as.character(wvgeo@data$NAME)
wvgeo <- wvgeo[order(wvgeo@data$NAME),]
wvdata <- wvdata[order(wvdata$area_name),]
wvmap <- append_data(wvgeo, wvdata)

## Wisconsin
wigeo <- usgeo[usgeo@data$STATEFP==wi_fipscode,]
widata <- subset(usdata, usdata$state_abbreviation==wi_ab)
wigeo@data$NAME <- as.character(wigeo@data$NAME)
wigeo <- wigeo[order(wigeo@data$NAME),]
widata <- widata[order(widata$area_name),]
wimap <- append_data(wigeo, widata)

## Wyoming
wygeo <- usgeo[usgeo@data$STATEFP==wy_fipscode,]
wydata <- subset(usdata, usdata$state_abbreviation==wy_ab)
wygeo@data$NAME <- as.character(wygeo@data$NAME)
wygeo <- wygeo[order(wygeo@data$NAME),]
wydata <- wydata[order(wydata$area_name),]
wymap <- append_data(wygeo, wydata)


## All states
statesMap <- rbind(almap, azmap, armap, camap, ctmap, comap, dcmap, demap, flmap, gamap,   
                   iamap, idmap, ilmap, inmap, ksmap, kymap, lamap, mamap, mdmap,  
                   memap, mimap, mnmap, momap, msmap, mtmap, nemap, nhmap, njmap, nmmap, 
                   nymap, ncmap, ndmap, nvmap, ohmap, okmap, ormap, pamap, rimap, scmap, 
                   sdmap, tnmap, txmap, utmap, vamap, vtmap, wamap, wvmap, wvmap, wimap, 
                   wymap)


AmznLocations <- read.csv(file="C:\\Users\\Mary\\Documents\\wholeFoods\\AmznLocs.csv")
wfLocations <- read.csv(file="C:\\Users\\Mary\\Documents\\wholeFoods\\coords.csv")

statesMap@data$INC110213 <- as.numeric(as.character(statesMap@data$INC110213))


incomePaletteDomain <- colorNumeric(palette = "Blues", domain=statesMap@data$INC110213, reverse = FALSE)

allStatesPopup <- paste0("<b>County: ", statesMap@data$NAME, 
                         "<br /> Average income (2013): ", statesMap@data$INC110213) 
                        

allStates <- leaflet(statesMap) %>%
  addProviderTiles("CartoDB.Positron") %>%
  addPolygons(stroke=TRUE,
              weight=1,
              smoothFactor = 0.2, 
              fillOpacity = .75, 
              popup=allStatesPopup, 
              color= ~incomePaletteDomain(statesMap@data$INC110213))  %>%
  addTiles() %>%
  addCircleMarkers(
    lat=AmznLocations$lat, lng=AmznLocations$lon, 
    color= "red",
    radius = 3) %>%
  addCircleMarkers(
    lat=wfLocations$lat, lng=wfLocations$lon, 
    color= "blue",
    radius = 3)

allStates %>%
  addLegend("bottomright", pal = incomePaletteDomain, values = ~statesMap@data$INC110213,
            title = "Avg Income 2013",
            labFormat = labelFormat(prefix = "$"),
            opacity = 1
  )


