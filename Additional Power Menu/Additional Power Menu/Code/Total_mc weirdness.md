In `DefineSprite 184` the Total_MC gets removed on Frame 2 and a second one is added

Original:
```
Frame 1
PlaceObject2 180 Depth 11 (Total_mc)

Frame 2
RemoveObject2 Depth 11
PlaceObject2 183 Depth 11 (Total_mc
```

Going to remove the RemoveObject and second placement