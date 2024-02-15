ScriptName OND_QuestScript Extends Quest

Actor Property PlayerRef Auto Const mandatory
Perk Property DoorOpenerPerk Auto Const mandatory
GlobalVariable Property DoorOpenRadius Auto mandatory
FormList Property LockerDoors Auto mandatory
FormList Property FridgeDoors Auto mandatory
FormList Property StallDoors Auto mandatory
FormList Property OfficeSupplyDoors Auto mandatory

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

  DebugTrace("Successfully added Door Opener perk")
EndFunction


Function OpenNearbyDoors(ObjectReference akTargetRef, Actor akActor)
  Float radius = DoorOpenRadius.GetValue()
  If (radius <= 0.0)
    radius = 8.0
  EndIf

  If (akTargetRef.GetOpenState() == 1)
    ; Only close the individual door
    akTargetRef.SetOpen(False)
    Return
  EndIf

  Form doorForm = akTargetRef.GetBaseObject()
  If (!doorForm)
    DebugTrace("Could not cast door to form")
    Return
  EndIf

  FormList doorsToOpen = None
  If LockerDoors.HasForm(doorForm)
    doorsToOpen = LockerDoors
  ElseIf FridgeDoors.HasForm(doorForm)
    doorsToOpen = FridgeDoors
  ElseIf StallDoors.HasForm(doorForm)
    doorsToOpen = StallDoors
  ElseIf OfficeSupplyDoors.HasForm(doorForm)
    doorsToOpen = OfficeSupplyDoors
  Else
    DebugTrace("ERROR: akTargetRef not in any door list")
    Return
  EndIf
  
  ObjectReference player = Game.GetPlayer()
  ObjectReference[] doors = player.FindAllReferencesOfType(doorsToOpen, radius)
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
    SetDoorOpenState(doorRefs[i])
    i += 1
  EndWhile
EndFunction

Function SetDoorOpenState(ObjectReference doorRef)
  If (doorRef != None)
    Int openState = doorRef.GetOpenState()
    If (!doorRef.IsLocked() && (openState == 3))
      doorRef.SetOpen(True)
    EndIf
  EndIf
EndFunction

Function DebugTrace(String Text) Global
  Debug.Trace("[OpenNearbyDoors] " + Text, 0)
EndFunction
