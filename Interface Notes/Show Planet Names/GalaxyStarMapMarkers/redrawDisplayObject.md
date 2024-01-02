
``
```js
_loc2_ = this.CurrentView == ViewTypes.VIEW_GALAXY ? "aMarkerDefs" : "aMarkersData";
if(_loc1_.data[_loc2_] != null)
{
    this.UpdateMarkers(_loc1_.data[_loc2_], this.GetMarkerArray(this.CurrentView), this.GetMarkerContainer(this.CurrentView));
}
```
`