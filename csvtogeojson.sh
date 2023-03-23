
#get the number of lines we have
#wc -l outputs the number of lines and file name, use cut just to get the line count which is the first field 
lines=$(wc -l $1 | cut -d' ' -f 1 )

echo "{ \"type\": \"FeatureCollection\", \"features\": [" > $2

for linenum in $(seq 2 $lines) ; do
    line=$(head -n $linenum $1 | tail -1)
    echo "Line: $linenum"
    echo $line
    name=$(echo $line | cut -d, -f 1)
    if [ "$name" = "" ] ; then
        echo "Missing name"
        exit 1
    fi
    
    markersymbol=$(echo $line | cut -d, -f 2)
    if [ "$markersymbol" = "" ] ; then
        echo "Missing markersymbol"
        exit 1
    fi
        
    creator=$(echo $line | cut -d, -f 3)
    if [ "$creator" = "" ] ; then
        echo "Missing creator"
        exit 1
    fi    
    
    comment=$(echo $line | cut -d, -f 4)
    if [ "$comment" = "" ] ; then
        echo "Missing comment"
        exit 1
    fi        
    
    lon=$(echo $line | cut -d, -f 5)
    if [ "$lon" = "" ] ; then
        echo "Missing lon"
        exit 1
    fi           
    
    lat=$(echo $line | cut -d, -f 6)
    if [ "$lat" = "" ] ; then
        echo "Missing lat"
        exit 1
    fi           
    

    echo  "{ \"type\": \"Feature\", \"properties\": { \"marker-size\": \"medium\", \"marker-symbol\": \"$markersymbol\", \"name\": \"$name\", \"creator\" : \"$creator\", \"comment\" : \"$comment\" }," >> $2

    #don't put a trailing comma on the last line
    if [ "$linenum" = "$lines" ] ; then
        echo  "\"geometry\": { \"type\": \"Point\", \"coordinates\": [$lon,$lat] } }" >> $2
    else
        echo  "\"geometry\": { \"type\": \"Point\", \"coordinates\": [$lon,$lat] } }," >> $2
    fi

done

echo "] }" >> $2



