## EXERCICI 1

cd .. # Anar a la carpeta bash_HandsOn
mkdir exercices # crear una carpeta anomenada exercices dins bash_HandsOn
cd exercices # Entrar dins la carpeta exercices
nano exercise1.sh # Crear un fitxer nano amb el nom exercice1.sh i guardar-lo dins la carpeta exercices
cd .. # anar a la carpeta de bash_HandsOn
wget https://github.com/dgarrimar/teaching/raw/master/uvic/AdvBI_2018/data/exercises/bash/TAIR9_mRNA.bed # Descarregar l'arxiu anomenat TAIR9_mRNA.bed de la web i es queda guardat dins de bash_HandsOn
cat TAIR9_mRNA.bed # Observar el contingut del fitxer de cop (és gran)
less TAIR9_mRNA.bed # Observar el contingut del fitxer per pàgines i vas baixant tu.
q # Sortir de l'arxiu
# Per comprimir l'arxiu hauria de fer servir: gzip TAIR9_mRNA.bed
# Per descomprimir l'arxiu hauria de fer servir: gunzip TAIR9_mRNA.bed i després usar cat i less per observar el contingut.
# En aquest cas no estava comprimit l'arxiu i es podia observar directament.
wc <(grep + <(grep chr1 TAIR9_mRNA.bed)) # et diu el nombre de línies que hi ha a la cadena + del cromosoma 1. Això seran els transcripts. La resposta és 4366.
# les mides dels exons estan localitzades a la posició 11
uniq <(sort -nr <(awk '{print$NF}' <(sed 's/,/ /g' <(head -n 10 <(awk '{print$11}' TAIR9_mRNA.bed))))) # Imprimeix les 10 primeres mides d'exons del arxiu, eliminant l'última coma, eliminant valors repetits i mostrant valors ordenats de més a menys grans. S'observen només 6 valors ja que 4 dels 10 eren reptits. Sinó s'observarien 10 valors. awk permet fer diferents tasques alhora.
grep chr1 TAIR9_mRNA.bed | awk '{print$11}' | tr , "\n" | sort -nr | head # imprimeix la mida dels 10 exons més llargs del cromosoma 1 de l'arxiu ordenats de més a menys llarg. 
grep chr1 TAIR9_mRNA.bed | awk '{print$4"\t"$10}' | sort -nr -k2,2 | uniq | head # imprimeix el nom de les transcripcions (primera columna) i el nombre d'exons (segona columna) dels deu gens amb més exons del cromosoma 1 sense mostrar els duplicats.
 
