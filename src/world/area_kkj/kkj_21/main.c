#include "kkj_21.h"

EvtScript N(EVS_ExitDoor_kkj_10_2) = {
    SetGroup(EVT_GROUP_EXIT_MAP)
    Call(DisablePlayerInput, true)
    Set(LVar0, kkj_21_ENTRY_0)
    Set(LVar1, COLLIDER_tte)
    Set(LVar2, MODEL_o57)
    Set(LVar3, DOOR_SWING_IN)
    Exec(ExitSingleDoor)
    Wait(17)
    Call(GotoMap, Ref("kkj_10"), kkj_10_ENTRY_2)
    Wait(100)
    Return
    End
};

EvtScript N(EVS_EnterMap) = {
    Call(GetEntryID, LVar0)
    Switch(LVar0)
        CaseEq(kkj_21_ENTRY_0)
            Set(LVar2, MODEL_o57)
            Set(LVar3, DOOR_SWING_IN)
            ExecWait(EnterSingleDoor)
    EndSwitch
    Return
    End
};

EvtScript N(EVS_Main) = {
    Set(GB_WorldLocation, LOCATION_PEACHS_CASTLE)
    Call(SetSpriteShading, SHADING_NONE)
    Call(SetCamPerspective, CAM_DEFAULT, CAM_UPDATE_FROM_ZONE, 25, 16, 4096)
    Call(SetCamBGColor, CAM_DEFAULT, 0, 0, 0)
    Call(SetCamEnabled, CAM_DEFAULT, true)
    Call(SetCamLeadPlayer, CAM_DEFAULT, false)
    Call(UseDoorSounds, DOOR_SOUNDS_BASIC)
    BindTrigger(Ref(N(EVS_ExitDoor_kkj_10_2)), TRIGGER_WALL_PRESS_A, COLLIDER_tte, 1, 0)
    Exec(N(EVS_EnterMap))
    Wait(1)
    Return
    End
};
