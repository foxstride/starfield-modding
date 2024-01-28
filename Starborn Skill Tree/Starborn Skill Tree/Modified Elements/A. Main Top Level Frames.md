Depth to SkillTab:
```
	13  - SkillTab5 - Social
	79  - SkillTab4 - Physical
	145 - SkillTab3 - Tech
	211 - SkillTab2 - Science
	277 - SkillTab1 - Combat
	300 - SkillTab6 - Starborn
```

Add ~955 to H value for Move Transforms for gaps between Skill tabs

Frame 1
- Copy PlaceObject 2 157 Depth 277 and rename to SkillTab6
- Set Depth to 300

### Movement groups
Starts on Tech, then the tabs move left or right to another SkillTab
RightTo2 -> Move right to SkillTab2 (Science)
RightTo1 -> Move right to SkillTab1 (Combat)
RightTo5 -> Move right to SkillTab5 (Social)
RightTo4 -> Move right to SkillTab4 (Physical)
- This group needs the Starborn tab to show on the left
- Frame should first appear 8 frames after start
- H Progression over 8 frames:
	1. -867.800
	2. -804.300
	3. -740.850
	4. -677.350
	5. -613.850
	6. -550.400
	7. -486.900
	8. -423.450
LeftTo5
- Depth 300 should transition from Frame 8 H position in RightTo4 to Frame 1 H position

RightTo3
- Rename RightTo6, this is currently unused
- Depth 145 should be Depth 300
LeftTo4
- Update to use Starborn panel instead. Depth 145 should be Depth 300
Both may need to be added to addFrameScripts and maybe a gotoAndStop("StarbornStopFrame") as well
### New Movement Groups and Stop Frame
StarbornStopFrame
- 1 frame
- Should resemble the Physical stop frame except use Depth 300 instead
- PlaceObject2 Depth 300 H 473.300 V 162.850

When adding frames, will need to adjust `addFrameScript` in SkillsMenu ctor and offset any frames after the ones that are added
- Planning to add 49 frames
- Ideally add after frame 265 so we don't have to offset too much stuff



### Close Frame
Frame 266 to 274
Adjust these in addFrameScript call
