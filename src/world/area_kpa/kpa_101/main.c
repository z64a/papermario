#include "kpa_101.h"

s32 N(map_init)(void) {
    sprintf(wMapShapeName, "kpa_119_shape");
    sprintf(wMapHitName, "kpa_119_hit");
    return false;
}

EvtScript N(EVS_ExitWalk_kpa_09_0) = EVT_EXIT_WALK(60, kpa_101_ENTRY_0, "kpa_09", kpa_09_ENTRY_0);

EvtScript N(EVS_BindExitTriggers) = {
    BindTrigger(Ref(N(EVS_ExitWalk_kpa_09_0)), TRIGGER_FLOOR_ABOVE, COLLIDER_deiliw, 1, 0)
    Return
    End
};

EvtScript N(EVS_Main) = {
    Set(GB_WorldLocation, LOCATION_BOWSERS_CASTLE)
    Call(SetSpriteShading, SHADING_NONE)
    Call(SetCamPerspective, CAM_DEFAULT, CAM_UPDATE_FROM_ZONE, 25, 16, 4096)
    Call(SetCamBGColor, CAM_DEFAULT, 0, 0, 0)
    Call(SetCamLeadPlayer, CAM_DEFAULT, false)
    Call(SetCamEnabled, CAM_DEFAULT, true)
    ExecWait(N(EVS_MakeEntities))
    Call(ModifyColliderFlags, MODIFY_COLLIDER_FLAGS_SET_BITS, COLLIDER_deiliwtt, COLLIDER_FLAGS_UPPER_MASK)
    Set(LVar0, Ref(N(EVS_BindExitTriggers)))
    Exec(EnterWalk)
    Wait(1)
    Exec(N(EVS_SetupMusic))
    Return
    End
};
