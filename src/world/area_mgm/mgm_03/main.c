#include "mgm_03.h"

EvtScript N(EVS_Main) = {
    Call(SetSpriteShading, SHADING_ARN_09)
    Call(SetCamPerspective, CAM_DEFAULT, CAM_UPDATE_FROM_ZONE, 25, 16, 4096)
    Call(SetCamBGColor, CAM_DEFAULT, 0, 0, 0)
    Call(SetCamEnabled, CAM_DEFAULT, true)
    Call(SetCamLeadPlayer, CAM_DEFAULT, false)
    Return
    End
};
