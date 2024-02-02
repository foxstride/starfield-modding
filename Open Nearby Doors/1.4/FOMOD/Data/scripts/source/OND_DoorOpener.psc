ScriptName OND_DoorOpener Extends Perk Const hidden

Function Fragment_Entry_02(ObjectReference akTargetRef, Actor akActor)
  String ModName
	
	If Game.IsPluginInstalled("OpenNearbyDoors.esm") == 1 as Bool
		ModName = "OpenNearbyDoors.esm"
	EndIf
	
	If ModName == ""
		Debug.Notification("ScriptFragment not found! Consult the Creator.")
		Return
	EndIf
	
	OND_QuestScript QuestScript = Game.GetFormFromFile(2050, ModName) as OND_QuestScript
	
	If !QuestScript
		Debug.Notification("Quest Script not found! Consult the Creator.")
		Return
	EndIf

	QuestScript.OpenNearbyDoors(akTargetRef, akActor)
EndFunction
