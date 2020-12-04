</br>

##### Create a VolumePlacementStrategy object called `statefulset-data` with the following rules:


     1. Volume should not be placed next to another `data` volume, with `label type=data`.
     
     2. Volume should be placed next to a `config` volume, with `label type=config` and `enforcement: preferred`.
     
