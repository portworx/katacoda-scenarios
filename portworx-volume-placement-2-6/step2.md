</br>

##### Create a VolumePlacementStrategy object called `statefulset-config` with the following rules:


     1. Volume should not be placed next to another `config` volume, with `label type=config`.

     2. Volume should be placed next to a `data` volume, with `label type=data` and  `enforcement: preferred`.


(You may have to click continue multiple time after creating the VolumePlacementStrategy object called `statefulset-config`)
