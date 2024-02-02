ScriptName OND_QuestScript Extends Quest

Actor Property PlayerRef Auto Const mandatory
Perk Property DoorOpenerPerk Auto Const mandatory
GlobalVariable Property DoorOpenRadius Auto mandatory

Int Property maxRetries = 3 Auto Const

Event OnQuestInit()
	Self.RegisterForRemoteEvent(PlayerRef as ScriptObject, "OnPlayerLoadGame")
	Self.AddInteractPerk()
EndEvent

Event Actor.OnPlayerLoadGame(Actor akSender)
	Self.RegisterForRemoteEvent(PlayerRef as ScriptObject, "OnPlayerLoadGame")
	Self.AddInteractPerk()
EndEvent

Function AddInteractPerk()
	If !PlayerRef.HasPerk(DoorOpenerPerk)
		PlayerRef.AddPerk(DoorOpenerPerk, False)		
	EndIf	

  If (!DoorOpenRadius.GetValue())
    DebugTrace("No door open radius")
  EndIf

  If (!DoorOpenerPerk)
    DebugTrace("No door open perk")
  EndIf

  DebugTrace("Done with AddInteractPerk")
EndFunction


Function OpenNearbyDoors(ObjectReference akTargetRef, Actor akActor)
  Debug.Notification("Start Open Nearby Doors")
  Float radius = DoorOpenRadius.GetValue()
  If (radius <= 0.0)
    radius = 8.0
  EndIf

  Form doorForm = akTargetRef as Form
  If (!doorForm)
    DebugTrace("Could not cast door to form")
  EndIf

  ; need to get the form from akTargetRef
  ; then use FindAllReferencesOfType to find all nearby doors
  ;ObjectReference[] doors = player.FindAllReferencesWithKeyword(doorOpenerKeyword, radius)
  ObjectReference player = Game.GetPlayer()
  ObjectReference[] doors = player.FindAllReferencesOfType(doorForm, radius)
  DebugTrace("Opening " + doors.Length + " nearby doors with radius: " + radius)

  If (doors.Length == 0)
    Int i = 1
    Int mult = 2
    While (i <= maxRetries && doors.Length == 0)
      Float retryRadius = (mult * radius)
      DebugTrace("Retrying with radius: " + retryRadius)
      
      doors = player.FindAllReferencesOfType(doorForm, retryRadius)
      
      mult = mult * 2
      i += 1
    EndWhile
  EndIf
  
  OpenDoors(doors)
EndFunction

Function OpenDoors(ObjectReference[] doorRefs)
  Int i = 0
  While i < doorRefs.Length
    SetOpenedIfNotOpened(doorRefs[i])
    i += 1
  EndWhile
EndFunction

Function SetOpenedIfNotOpened(ObjectReference doorRef)
  If (doorRef != None)
    Int openState = doorRef.GetOpenState()
    If (!doorRef.IsLocked() && (openState == 3)) ; #DEBUG_LINE_NO:112
      doorRef.SetOpen(True) ; #DEBUG_LINE_NO:113
    EndIf
  EndIf
EndFunction

Function DebugTrace(String Text) Global
  Debug.Trace("[OpenNearbyDoors] " + Text, 0) ; #DEBUG_LINE_NO:136
EndFunction


Function DebugTrace(String Text) Global
  Debug.Trace("[OpenNearbyDoors] " + Text, 0) ; #DEBUG_LINE_NO:136
EndFunction
