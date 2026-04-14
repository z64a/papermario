#include "dgb_13.h"

EvtScript N(EVS_ExitWalk_dgb_03_5) = EVT_EXIT_WALK(26, dgb_13_ENTRY_0, "dgb_03", dgb_03_ENTRY_5);

EvtScript N(EVS_BindExitTriggers) = {
    BindTrigger(Ref(N(EVS_ExitWalk_dgb_03_5)), TRIGGER_FLOOR_ABOVE, COLLIDER_deilis, 1, 0)
    Return
    End
};

EvtScript N(EVS_Main) = {
    Set(GB_WorldLocation, LOCATION_TUBBAS_MANOR)
    Call(SetSpriteShading, SHADING_NONE)
    Call(SetCamPerspective, CAM_DEFAULT, CAM_UPDATE_FROM_ZONE, 25, 16, 4096)
    Call(SetCamBGColor, CAM_DEFAULT, 0, 0, 0)
    Call(SetCamLeadPlayer, CAM_DEFAULT, false)
    Call(SetCamEnabled, CAM_DEFAULT, true)
    ExecWait(N(EVS_MakeEntities))
    Call(ModifyColliderFlags, MODIFY_COLLIDER_FLAGS_SET_BITS, COLLIDER_deilits, COLLIDER_FLAGS_UPPER_MASK)
    ExecWait(N(EVS_SetupDrawers))
    Exec(N(EVS_SetupMusic))
    Set(LVar0, Ref(N(EVS_BindExitTriggers)))
    Exec(EnterWalk)
    Wait(1)
    Return
    End
};
