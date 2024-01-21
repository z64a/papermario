#include "flo_16.h"
#include "entity.h"

#include "world/area_flo/common/FlowerSpawnRegion.inc.c"
#include "world/area_flo/common/DroppingVine.inc.c"

EvtScript N(EVS_SetupVines) = {
    Call(ModifyColliderFlags, MODIFY_COLLIDER_FLAGS_SET_SURFACE, COLLIDER_o214, SURFACE_TYPE_FLOWERS)
    EVT_FLOWER_SPAWN_REGION( -740, -140, -260,  -55, 100)
    EVT_FLOWER_SPAWN_REGION(  250, -140,  725,  -55, 180)
    EVT_DROPPING_VINE(ITEM_NONE, MODEL_o199, MODEL_o200, MODEL_o201, MODEL_o202)
    EVT_DROPPING_VINE(ITEM_STINKY_HERB, MODEL_o203, MODEL_o204, MODEL_o205, MODEL_o206)
    EVT_DROPPING_VINE(ITEM_NONE, MODEL_o209, MODEL_o210, MODEL_o211, MODEL_o212)
    EVT_DROPPING_VINE(ITEM_NONE, MODEL_o213, MODEL_o214, MODEL_o215, MODEL_o216)
    Return
    End
};
