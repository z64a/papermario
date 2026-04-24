#include "common.h"
#include "effects_internal.h"

s8 DustAnimFrames24[16] = { 0, 1, 2, 2, 3, 3, 4, 4, 5, 5, 5, 6, 6, 6, -1 };

s8 DustAnimFrames32[20] = { 0, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 6, 7, 7, 7, -1 };

s8* DustAnimFrames[2] = { DustAnimFrames24, DustAnimFrames32 };

extern Gfx D_09002780_32B620[];
extern Gfx D_09002868_32B708[];
extern Gfx D_09002950_32B7F0[];
extern Gfx D_09002B20_32B9C0[];
extern Gfx D_09002B40_32B9E0[];

void walking_dust_init(EffectInstance* effect);
void walking_dust_update(EffectInstance* effect);
void walking_dust_render(EffectInstance* effect);
void walking_dust_appendGfx(void* effect);

void walking_dust_main(s32 type, f32 posX, f32 posY, f32 posZ, f32 velX, f32 velZ) {
    EffectBlueprint bp;
    EffectInstance* effect;
    WalkingDustFXData* data;
    s32 numParts = 1;
    s32 i;

    bp.unk_00 = 0;
    bp.init = walking_dust_init;
    bp.update = walking_dust_update;
    bp.renderScene = walking_dust_render;
    bp.renderUI = nullptr;
    bp.effectID = EFFECT_WALKING_DUST;

    effect = create_effect_instance(&bp);
    effect->numParts = numParts;

    data = general_heap_malloc(numParts * sizeof(*data));
    effect->data.walkingDust = data;
    ASSERT(effect->data.walkingDust != nullptr);

    mem_clear(data, numParts * sizeof(*data));
    data->texSet = type == FX_DUST_2;
    data->lifetime = 0;
    data->type = type;

    for (i = 0; i < numParts; i++, data++) {
        data->unk_00 = 1;
        data->velX = velX;
        data->velZ = velZ;
        data->pos.x = posX;
        data->pos.y = posY;
        data->pos.z = posZ;
        data->velR = 0.33333334f;
        data->velV = 1.75f;
        data->accelV = -0.16f;
    }
}

void walking_dust_init(EffectInstance* effect) {
}

void walking_dust_update(EffectInstance* effect) {
    WalkingDustFXData* data = effect->data.walkingDust;

    data->curFrameIdx = DustAnimFrames[data->texSet][data->lifetime++];

    if (data->curFrameIdx < 0) {
        remove_effect(effect);
    } else {
        s32 i;

        for (i = 0; i < effect->numParts; i++, data++) {
            data->pos.x += data->velR * data->velX;
            data->pos.z += data->velR * data->velZ;
            data->velV += data->accelV;
            data->pos.y += data->velV;
        }
    }
}

void walking_dust_render(EffectInstance* effect) {
    RenderTask renderTask;
    RenderTask* retTask;

    renderTask.appendGfx = walking_dust_appendGfx;
    renderTask.appendGfxArg = effect;
    renderTask.dist = 0;
    renderTask.renderMode = RENDER_MODE_PASS_THROUGH;

    retTask = queue_render_task(&renderTask);
    retTask->renderMode |= RENDER_TASK_FLAG_REFLECT_FLOOR;
}

void walking_dust_appendGfx(void* effect) {
    EffectInstance* effectInst = effect;
    WalkingDustFXData* data = effectInst->data.walkingDust;
    s32 type = data->type;
    s32 frameIdx = data->curFrameIdx;
    s32 isLastFrame = false;
    Matrix4f mtxTransform;
    Matrix4f mtxRot;
    s32 texEnd;
    s32 texStart;
    Gfx* gfxSetupTex;
    Gfx* gfxDrawModel;
    s32 texSize;
    s32 i;

    if (type == FX_DUST_WALK) {
        gfxDrawModel = D_09002B20_32B9C0;
    } else {
        gfxDrawModel = D_09002B40_32B9E0;
    }

    switch (type) {
        case FX_DUST_1:
            gfxSetupTex = D_09002868_32B708;
            break;
        default:
            gfxSetupTex = D_09002950_32B7F0;
            break;
        case FX_DUST_WALK:
            gfxSetupTex = D_09002780_32B620;
            break;
    }

    if ((data->texSet == 0 && frameIdx == 6) || (data->texSet == 1 && frameIdx == 7)) {
        isLastFrame = true;
    }

    gDPPipeSync(gMainGfxPos++);
    gSPSegment(gMainGfxPos++, 0x09, VIRTUAL_TO_PHYSICAL(effectInst->shared->graphics));
    gSPDisplayList(gMainGfxPos++, gfxSetupTex);
    gDPSetEnvColor(gMainGfxPos++, 0, 0, 0, 127);
    gDPSetPrimColor(gMainGfxPos++, 0, 0, 230, 222, 222, 110);

    if (type == FX_DUST_WALK) {
        texSize = 24;
    } else {
        texSize = 32;
    }

    texStart = frameIdx * texSize;
    texEnd = texStart + texSize;

    gDPSetTileSize(gMainGfxPos++, G_TX_RENDERTILE, texStart * 4, 0, (texEnd - 1) * 4, ((texSize - 1) * 4));

    if (isLastFrame) {
        gDPSetTileSize(gMainGfxPos++, 1, texEnd * 4, 0, ((texStart + (texSize * 2)) - 1) * 4, 0);
    } else {
        gDPSetTileSize(gMainGfxPos++, 1, texEnd * 4, 0, ((texStart + (texSize * 2)) - 1) * 4, (texSize - 1) * 4);
    }

    for (i = 0; i < effectInst->numParts; i++, data++) {
        guTranslateF(mtxTransform, data->pos.x, data->pos.y, data->pos.z);
        guRotateF(mtxRot, -gCameras[gCurrentCameraID].curYaw, 0.0f, 1.0f, 0.0f);
        guMtxCatF(mtxRot, mtxTransform, mtxTransform);
        guMtxF2L(mtxTransform, &gDisplayContext->matrixStack[gMatrixListPos]);
        gSPMatrix(gMainGfxPos++, &gDisplayContext->matrixStack[gMatrixListPos++],
                  G_MTX_PUSH | G_MTX_LOAD | G_MTX_MODELVIEW);
        gSPDisplayList(gMainGfxPos++, gfxDrawModel);
        gSPPopMatrix(gMainGfxPos++, G_MTX_MODELVIEW);
    }
    gDPPipeSync(gMainGfxPos++);
}
