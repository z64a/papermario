#include "dgb_06.h"

EvtScript N(EVS_ExitDoor_dgb_04_1) = {
    SetGroup(EVT_GROUP_EXIT_MAP)
    Call(DisablePlayerInput, true)
    Call(UseDoorSounds, DOOR_SOUNDS_BASIC)
    Set(LVar0, dgb_06_ENTRY_0)
    Set(LVar1, COLLIDER_deilittw)
    Set(LVar2, MODEL_o161)
    Set(LVar3, DOOR_SWING_IN)
    Exec(ExitSingleDoor)
    Wait(17)
    Call(GotoMap, Ref("dgb_04"), dgb_04_ENTRY_1)
    Wait(100)
    Return
    End
};

EvtScript N(EVS_EnterMap) = {
    Call(UseDoorSounds, DOOR_SOUNDS_BASIC)
    Call(GetEntryID, LVar0)
    Switch(LVar0)
        CaseEq(dgb_06_ENTRY_0)
            Set(LVar2, MODEL_o161)
            Set(LVar3, DOOR_SWING_IN)
            ExecWait(EnterSingleDoor)
    EndSwitch
    Return
    End
};

EvtScript N(EVS_Main) = {
    Set(GB_WorldLocation, LOCATION_TUBBAS_MANOR)
    Call(SetSpriteShading, SHADING_DGB_06)
    Call(SetCamPerspective, CAM_DEFAULT, CAM_UPDATE_FROM_ZONE, 25, 16, 4096)
    Call(SetCamBGColor, CAM_DEFAULT, 0, 0, 0)
    Call(SetCamLeadPlayer, CAM_DEFAULT, false)
    Call(SetCamEnabled, CAM_DEFAULT, true)
    Call(MakeNpcs, true, Ref(N(DefaultNPCs)))
    ExecWait(N(EVS_MakeEntities))
    IfEq(GF_DGB05_BoardedFloor, false)
        Call(EnableGroup, MODEL_g52, false)
    Else
        Call(EnableGroup, MODEL_g53, false)
    EndIf
    BindTrigger(Ref(N(EVS_ExitDoor_dgb_04_1)), TRIGGER_WALL_PRESS_A, COLLIDER_deilittw, 1, 0)
    Exec(N(EVS_SetupMusic))
    Exec(N(EVS_EnterMap))
    Return
    End
};
