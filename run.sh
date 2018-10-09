## Author: Marta Fernandez Reig
## Date: 17/09/2018

## Bash Hands-On

## Task 1
cd  # I go to my directory
mkdir bash_HandsOn  #I create a new folder named "bash_HandsOn"
ls  # Comprovar que la carpeta es troba al meu directori
cd bash_HandsOn  #Per entrar a la carpeta 
mkdir bin
mkdir input
mkdir output
mkdir logs
mkdir trash  # Crea carpetes (5) dins la carpeta de bash_HandsOn
ls # Comprovar que les 5 carpetes estan dins
ls -l #List the content of the bash_HandsOn folder (long format, including hidden files)
cp -R trash/ trash2 #Copy the trash directory to trash2, quan estic dintre la carpeta de bash_HandsOn
ls # Comprovar que la carpeta conté trash i trash2
mv trash/ trash1 #Rename the trash directory to trash1
ls # Comprovar que esta renombrat correctament
rm -rf trash2 # Remove (eliminar) trash2 directory
ls # Comprovar que no existeix trash2

## Task 2
wget https://raw.githubusercontent.com/dgarrimar/teaching/master/uvic/AdvBI_2018/data/hands-on/bash/sample-groups.tsv
# Download the file sample-groups.tsv into the bash_HandsOn folder
ls # comprovar que esta a dins
mv sample-groups.tsv input.tsv #Rename the file you just downloaded to input.tsv
mv input.tsv input # Moure l'arxiu dins la carpeta
ln -s ../input/input.tsv trash1/input_symlink #Make a symbolic link of the file input.tsv in in the trash1 folder
cp input/input.tsv trash1/input_copy #Make a copy of the file input.tsv in the trash1 folder, named input_copy
cd trash1 # entrar a la carpeta trash1
touch IAmLearningSomeBash # Crear arxiu dins la carpeta trash1
rm -rf trash1 # Remove the trash1 folder, together with its content
cd # Per anar al directori principal

## Task3
cd bash_HandsOn # Entrar al directori de bash_HandsOn
mkdir output/task_3 # Crear la carpeta task_3 dintre de output
cd output # Entrar a la carpeta output 
ls # Veure que la carpeta task_3 està dintre de la carpeta de output.
cd bash_HandsOn # Entrar al directori de bash_HandsOn
head -n100 input/input.tsv > output/task_3/top100.tsv # Agafar les 100 primeres linies de l'arxiu input.tsv de la carpeta input i guardar-les a la carpeta task_3 amb el nom de top100.tsv
cd output/task_3 # Col·locar-me dins la carpeta de task_3 dins de output
ls # Comprovar que dins la carpeta task_3 hi ha l'arxiu top100.tsv
cd # Tornar al directori principal
cd bash_HandsOn # Entrar al directori de bash_HandsOn
tail -n50 input/input.tsv > output/task3/last50.tsv # Agafar les 50 últimes linies de l'arxiu input.tsv de la carpeta input i guardar-les a la carpeta task_3 amb el nom de last50.tsv
cd output/task_3 # Col·locar-me dins la carpeta de task_3 dins de output
ls # Comprovar que dins la carpeta task_3 hi ha l'arxiu last50.tsv
cat top100.tsv | wc  # Estant dins de la carpeta task_3, demano que ensenyi el contingut del fitxer top100.tsv i em dóna tres valors a la pantalla (línies del fitxer, caràcters/línia, caràcters totals). Així comprovo que el primer valor que em dóna és un 100
cat last50.tsv | wc  # Estant dins de la carpeta task_3, demano que ensenyi el contingut del fitxer last50.tsv i em dóna tres valors a la pantalla (línies del fitxer, caràcters/línia, caràcters totals). Així comprovo que el primer valor que em dóna és un 50
cat top100.tsv last50.tsv > 150together.tsv # Concatenar els dos arxius (top100.tsv i last50.tsv) i guardar la unió en un arxiu nou anomenat 150together.tsv
ls # Comprovar que dins la carpeta task_3 hi ha l'arxiu 150together.tsv
cat 150together.tsv | wc  # Estant dins de la carpeta task_3, demano que ensenyi el contingut del fitxer 150together.tsv i em dóna tres valors a la pantalla (línies del fitxer, caràcters/línia, caràcters totals). Així comprovo que el primer valor que em dóna és un 150
cd ../../input # Entrar al directori input
head input.tsv # Observar les 10 primeres línies del fitxer input.tsv per veure com està separat si amb comes, tabulador, etc. S'observa cada columna separada per tabuladors.
cd ../output/task_3 #Tornar a la carpeta task_3 dins de output
cut -f1 150together.tsv > 150column1.tsv # Tallar la primera columna de l'arxiu 150together.tsv (mitjançant tabulador que és tal com està l'arxiu) i guardar-lo en un nou arxiu anomenat 150column1.tsv
ls # Comprovar que l'arxiu 150column1.tsv es troba dins la carpeta task_3
paste 150column1.tsv 150column1.tsv > 150firstcX2.tsv # Enganxar dues còpies de l'arxiu 150column1.tsv en un document nou anomenat 150firstcX2.tsv
ls # Comprovar que l'arxiu 150firstcX2.tsv es troba dins la carpeta task_3


## Task 4
cd .. # Anar al directori output
mkdir task_4 # Crear una carpeta nova dins de output que es digui task_4
ls # Comprovar que la carpeta task_4 es troba dins de output
cd .. # anar al directori bash_HandsOn
cut -f2 input/input.tsv | sort -r | egrep "Adipose|Artery" -v | uniq > output/task_4/unique.tissues2.txt # Talla la columna 2 de l'arxiu input.tsv per tabuladors, l'ordena a l'inrevès i elimina les files que contenent Adipose o Artery i elimina les files duplicades. Ho guarda a un arxiu anomenat unique.tissues2.txt dins de la carpeta de task_4.
cd output/task_4 # Anar a la carpeta de task_4
ls # Comprovar que l'arxiu unique.tissues2.txt està dins la carpeta.
cd ../.. # Anar al directori bash_HandsOn
cut -f3 input/input.tsv | sort -r | egrep "Adipose|Artery" -v | uniq > output/task_4/unique.tissues3.txt # Talla la columna 3 de l'arxiu input.tsv per tabuladors, l'ordena a l'inrevès i elimina les files que contenent Adipose o Artery i elimina les files duplicades. Ho guarda a un arxiu anomenat unique.tissues3.txt dins de la carpeta de task_4.
cd output/task_4 # Anar a la carpeta de task_4
ls # Comprovar que l'arxiu unique.tissues3.txt està dins la carpeta.
diff unique.tissues2.txt unique.tissues3.txt > differences # Compara els dos fitxers línia per línia produeix les diferències, o res si els fitxers són idèntics i guarda el resultat en un nou arxiu anomenat differences.
ls # Comprovar que l'arxiu differences es troba dins la carpeta task_4
less differences # Observar el contingut de l'arxiu. 
q # Clicar q per sortir de l'arxiu.


## Task 5
cd ../.. # Anar al directori bash_HandsOn
wget https://github.com/dgarrimar/teaching/raw/master/uvic/AdvBI_2018/data/hands-on/bash/scripts.tar.gz # Baixar un arxiu anomenat scripts.tar.gz d'una web
cd ../Downloads # Entrar a la carpeta de Downloads
gunzip scripts.tar.gz # Descomprimeix la carpeta scripts.tar.gz per poder accedir a dins
tar -xf scripts.tar # Treure l'arxiu scripts.tar de la carpeta descomprimida i el deixa a fóra (a descarregues) per poder-lo usar
mv usage.sh /../bash_HandsOn/bin # Moure l'arxiu a la carpeta bin
cd ../bash_HandsOn/bin # Anar a la carpeta bin
ls # Comprovar que l'arxiu usage.sh està dins la carpeta bin
less bin/usage.sh # veure arxiu, sense poder-lo modificar
nano bin/usage.sh # Obre l'arxiu i te'l deixa modificar, obre amb format editor. El modifico posant les variables al echo i faig la prova que funciona
PATH="$PATH:/Home/bash_HandsOn/bin" # Li dono la ordre de que automàticament en aquesta direcció s'executarà l'arxiu bin desde tot arreu on estigui del pc. Només cridant l'arxiu, s'executarà.  
chmod +x bin/usage.sh # Donar permisos per executar l'arxiu bin. Sempre donar permisos després de fer lo del PATH.


## Task 6
cd .. # Anar a la carpeta de bash_HandsOn
wget https://github.com/dgarrimar/teaching/raw/master/uvic/AdvBI_2018/data/hands-on/bash/unknown.samples.tsv # Descarregar l'arxiu anomenat unknown.samples.tsv de la web
ls # comprovo que està descarregat
sort -k1,1 unknown.samples.tsv # ordenar alfanumèricament per la columna 1. Només ho faig per comprovar que ho fa bé.
join -t $'\t' <(sort -k1,1 input/input.tsv) <(sort -k1,1 unknown.samples.tsv) > output/joint.tsv # Ajuntar la primera columna de cada arxiu ordenada alfanumèricament en un arxiu nou anomenat joint.tsv
cd output # Entrar a la carpeta output
ls # comprovar que s'ha creat el document joint.tsv
less joint.tsv # veure el que conté el fitxer joint.tsv
q # sortir del fitxer
awk '{print $4,$3,$2,$1}' joint.tsv | sed 's/_/ /g' > joint.tsv # Canvia les _ de l'arxiu per espais i ordena al revès l'arxiu. Ho guarda amb el mateix nom, destrueix l'anterior.


## Task 7
cd .. #Anar al directori bash_HandsOn
# Modificar l'arxiu bin/usage.sh de manera que imprimeixi 5 vegades quan l'argument no està buit i imprimeixi no argument provided quan estigui buit.
cd bin # Anar a la carpeta de bin.
less usage.sh # veure el que conté el fitxer i veure que està modificat respecte el primer.
q # sortir del fitxer
./usage.sh AGTC # Provar que l'arxiu funciona i imprimeix 5 vegades. Ho provo i funciona.
./usage.sh # Provar que l'arxiu imprimeix "No argument provided" quan no posem argument. Ho provo i funciona.

 
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






