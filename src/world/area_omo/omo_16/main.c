#include "omo_16.h"

EvtScript N(EVS_Main) = {
    Set(GB_WorldLocation, LOCATION_SHY_GUYS_TOYBOX)
    Call(SetSpriteShading, SHADING_NONE)
    Call(SetCamPerspective, CAM_DEFAULT, CAM_UPDATE_FROM_ZONE, 25, 16, 4096)
    Call(SetCamBGColor, CAM_DEFAULT, 0, 0, 0)
    Call(SetCamEnabled, CAM_DEFAULT, true)
    Call(MakeNpcs, true, Ref(N(DefaultNPCs)))
    Call(SetMusic, 0, SONG_TOYBOX_TRAIN, 0, VOL_LEVEL_FULL)
    ExecWait(N(EVS_802429C4))
    Wait(3)
    Return
    End
};
