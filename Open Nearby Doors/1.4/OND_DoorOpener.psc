ScriptName OND_DoorOpener Extends Perk Const hidden

Function Fragment_Entry_01(ObjectReference akTargetRef, Actor akActor)
	String ModName
	
	If Game.IsPluginInstalled("OpenNearbyDoors.esm") == 1 as Bool
		ModName = "OpenNearbyDoors.esm"
  Else
    DebugTrace("Could not load esm")
    Return
	EndIf
	
  ; update ID
	OND_QuestScript QuestScript = Game.GetFormFromFile(2050, ModName) as OND_QuestScript
	
  If !QuestScript
		Debug.MessageBox("Could not load quest script")
		Return
	EndIf

	QuestScript.OpenNearbyDoors(akTargetRef, akActor)
	
EndFunction

Function DebugTrace(String Text) Global
  Debug.Trace("[OpenNearbyDoors] " + Text, 0) ; #DEBUG_LINE_NO:136
EndFunction
