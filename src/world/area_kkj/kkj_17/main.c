#include "kkj_17.h"

EvtScript N(EVS_ExitDoors_kkj_11_5) = {
    SetGroup(EVT_GROUP_EXIT_MAP)
    Call(DisablePlayerInput, true)
    Set(LVar0, kkj_17_ENTRY_0)
    Set(LVar1, COLLIDER_ttw)
    Set(LVar2, MODEL_o2)
    Set(LVar3, DOOR_SWING_OUT)
    Exec(ExitSingleDoor)
    Wait(17)
    Call(GotoMap, Ref("kkj_11"), kkj_11_ENTRY_5)
    Wait(100)
    Return
    End
};

EvtScript N(EVS_EnterMap) = {
    Call(GetEntryID, LVar0)
    Switch(LVar0)
        CaseEq(kkj_17_ENTRY_0)
            Set(LVar2, MODEL_o2)
            Set(LVar3, DOOR_SWING_OUT)
            ExecWait(EnterSingleDoor)
    EndSwitch
    Return
    End
};

EvtScript N(EVS_Main) = {
    Set(GB_WorldLocation, LOCATION_PEACHS_CASTLE)
    Call(SetSpriteShading, SHADING_KKJ_17)
    Call(SetCamPerspective, CAM_DEFAULT, CAM_UPDATE_FROM_ZONE, 25, 16, 4096)
    Call(SetCamBGColor, CAM_DEFAULT, 0, 0, 0)
    Call(SetCamEnabled, CAM_DEFAULT, true)
    ExecWait(N(EVS_MakeEntities))
    Exec(N(EVS_SetupMagicChest))
    Call(UseDoorSounds, DOOR_SOUNDS_BASIC)
    BindTrigger(Ref(N(EVS_ExitDoors_kkj_11_5)), TRIGGER_WALL_PRESS_A, COLLIDER_ttw, 1, 0)
    Exec(N(EVS_EnterMap))
    Wait(1)
    Return
    End
};
