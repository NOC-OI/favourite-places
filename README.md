# Example Git Repository

This git repository is used for practicing collaboration between users of Github. 

* Edit the places.csv file and add your favourite place to it. 
* This is in the format name,symbol,creator,comments,lon,lat. 
* Use the website https://www.gps-coordinates.net/ to find the coordinates (longitude and latitude) of a place you like to visit.
* Valid symbols include bar, cafe and restaurant. You can find a complete list at https://labs.mapbox.com/maki-icons/
* After you commit/push a change to places.csv a github action will run automatically and convert the CSV file into a Geojson file (places.geojson).
* Click on the geojson file in Github and it will render the map for you.

## Exercise Suggestions

### Everyone commit to the same repository

* Everyone in the workshop is given write access to this repository.
* They all clone it to their computers and edit the places.csv file.
* They commit changes and push them back.
* All but the first person to commit will get a merge conflict.
* Work through the process of how to resolve a merege conflict.

### Pull Request based commits

* Write access is removed and everybody has to take a fork of this repository
* They all edit places.csv on their fork
* Once done editing they create a pull request back to the main repository
* The repository owner has to resolve any conflicts during the pull request acceptance.


