#include "common.h"
#include "effects_internal.h"

extern Gfx D_09000F20_338EE0[];
extern Gfx D_090011C8_339188[];
extern Gfx D_090011E0_3391A0[];
extern Gfx D_090011F8_3391B8[];
extern Gfx D_09001210_3391D0[];
extern Gfx D_09001228_3391E8[];
extern Gfx D_09001240_339200[];
extern Gfx D_09001258_339218[];
extern Gfx D_09001270_339230[];

Gfx* D_E0022CD0[] = {
    D_09001210_3391D0, D_09001228_3391E8, D_09001240_339200,
    D_09001258_339218, D_09001270_339230, D_090011C8_339188,
    D_090011E0_3391A0, D_090011F8_3391B8
};

u8 D_E0022CF0[] = {
    254, 172, 172,
    254, 172, 213,
    254, 180, 154,
    213, 180, 254,
    180, 180, 254,
    180, 221, 254,
    180, 254, 254,
    180, 254, 213,
    180, 254, 180,
    213, 254, 180,
    254, 254, 180,
    254, 213, 172
};

u8 D_E0022D14[] = { 0x1E, 0x3C, 0x50, 0x5F, 0x64, 0x68, 0x6A };
u8 D_E0022D1C[] = { 0x3C, 0x5A, 0x64, 0x68, 0x6A, 0x6C, 0x6D };

void sparkles_init(EffectInstance* effect);
void sparkles_update(EffectInstance* effect);
void sparkles_render(EffectInstance* effect);
void sparkles_appendGfx(void* effect);

void sparkles_main(s32 type, f32 posX, f32 posY, f32 posZ, f32 scale) {
    EffectBlueprint bp;
    EffectBlueprint* bpPtr = &bp;
    EffectInstance* effect;
    SparklesFXData* part;
    s32 numParts;
    f32 userScale;
    f32 angle;
    f32 angle2;
    s32 i;

    switch (type) {
        case FX_SPARKLES_STAR:
            numParts = 36;
            userScale = scale;
            break;
        case FX_SPARKLES_SCATTER_FEW:
            numParts = 4;
            userScale = scale;
            break;
        case FX_SPARKLES_SCATTER_MANY:
            numParts = 8;
            userScale = scale;
            break;
        case FX_SPARKLES_FALLING_FEW:
            numParts = 4;
            userScale = 8.0f;
            break;
        default:
            numParts = 8;
            userScale = 8.0f;
            break;
    }

    numParts++;

    bpPtr->init = sparkles_init;
    bpPtr->update = sparkles_update;
    bpPtr->renderScene = sparkles_render;
    bpPtr->unk_00 = 0;
    bpPtr->renderUI = nullptr;
    bpPtr->effectID = EFFECT_SPARKLES;

    effect = create_effect_instance(bpPtr);
    effect->numParts = numParts;
    part = effect->data.sparkles = general_heap_malloc(numParts * sizeof(*part));
    ASSERT(effect->data.sparkles != nullptr);

    part->pos.x = posX;
    part->pos.y = posY;
    part->pos.z = posZ;
    part->lifetime = 0;
    part->type = type;
    part->timeLeft = 30;

    part++;
    for (i = 1; i < numParts; i++, part++) {
        f32 rand1 = rand_int(scale * 1000.0f) / 1000.0f;
        f32 rand2 = rand_int(userScale * 1000.0f) / 1000.0f;

        switch (type) {
            case FX_SPARKLES_STAR:
                angle = (360.0f / (numParts - 1)) * i;
                angle2 = (1800.0f / (numParts - 1)) * i - 90.0f;
                part->accelY = 0.0f;
                part->velX = (sin_deg(angle) * (85.0f - sin_deg(angle2) * 15.0f - (i & 1) * 5) / 100.0f) * scale;
                part->velY = (cos_deg(angle) * (85.0f - sin_deg(angle2) * 15.0f - (i & 1) * 5) / 100.0f) * scale;
                part->pos.z = 0;
                part->variant = 0;
                break;
            case FX_SPARKLES_SCATTER_FEW:
            case FX_SPARKLES_SCATTER_MANY:
                angle = (360.0f / (numParts - 1)) * i + rand_int(359);
                if (i & 1) {
                    part->accelY = -(rand_int(50) / 1000 + 0.05);
                } else {
                    part->accelY = 0;
                }
                part->velX = 0;
                part->velY = 0;
                part->pos.x = rand1 * sin_deg(angle);
                part->pos.y = rand2 * cos_deg(angle);
                part->pos.z = 0;
                part->scale = 1.0f;
                part->timeLeft = i * 2 + 30;
                part->variant = i % 3;
                part->lifetime = 0;
                break;
            case FX_SPARKLES_FALLING_FEW:
            case FX_SPARKLES_FALLING_MANY:
            default:
                angle = (360.0f / (numParts - 1)) * i + rand_int(359);
                part->accelY = -(rand_int(50) / 1000 + 0.05);
                part->velX = 0.0f;
                part->velY = 0.0f;
                part->pos.x = rand1 * sin_deg(angle);
                part->pos.y = rand2 * cos_deg(angle);
                part->pos.z = 0;
                part->scale = 1.0f;
                part->timeLeft = i * 2 + 18;
                part->variant = i % 3;
                part->lifetime = 0;
                break;
        }
    }
}

void sparkles_init(EffectInstance* effect) {
}

void sparkles_update(EffectInstance *effect) {
    SparklesFXData* part = effect->data.sparkles;
    SparklesFXData* firstPart = part;
    s32 type = part->type;
    f32 velX;
    f32 velY;
    s32 time;
    s32 count = 0;
    f32 velScale;
    f32 angle;
    s32 i;

    part->timeLeft--;
    part->lifetime++;

    time = part->lifetime;

    if ((type == FX_SPARKLES_STAR || type == FX_SPARKLES_ADRIFT) && part->timeLeft < 0) {
        remove_effect(effect);
        return;
    }

    part++;
    for (i = 0; i < effect->numParts - 1; i++, part++) {
        part->animFrame = (time + i) & 7;
        switch (type) {
            case FX_SPARKLES_STAR:
                part->accelY += -0.02;
                if (time - 1 < 7) {
                    part->pos.x = part->velX * D_E0022D14[time - 1] * 0.01;
                    part->pos.y = part->velY * D_E0022D14[time - 1] * 0.01 + part->accelY;
                    part->scale = (f32) D_E0022D1C[time - 1] * 0.01;
                } else {
                    angle = effect_simple_rand(360, i + 177);
                    velScale = (i & 3) * 0.5f + 1.0f;
                    firstPart->type = FX_SPARKLES_ADRIFT;
                    part->velX = velScale * sin_deg(angle);
                    part->velY = velScale * cos_deg(angle);
                    part->accelY = -0.05f;
                }
                break;
            case FX_SPARKLES_ADRIFT:
                part->velX *= 0.96;
                part->scale += (0.1 - part->scale) * 0.1;
                part->velY *= 0.96;
                part->velY += part->accelY;
                part->pos.x += part->velX;
                part->pos.y += part->velY;
                break;
            default:
                part->velX *= 0.9;
                part->velY += part->accelY;
                velX = part->velX;
                velY = part->velY;
                if (part->timeLeft < 0) {
                    count++;
                }
                part->pos.x += velX;
                part->pos.y += velY;
                part->timeLeft--;
                if (part->timeLeft < 0 || part->timeLeft > 20) {
                    part->animFrame = -1;
                } else {
                    part->lifetime++;
                    time = part->lifetime;
                    if (time - 1 < 7) {
                        part->scale = (f32) D_E0022D1C[time - 1] * 0.01;
                    } else {
                        part->scale += (0.1 - part->scale) * 0.1;
                    }
                }
                break;
        }
    }

    if (type != FX_SPARKLES_STAR && type != FX_SPARKLES_ADRIFT && count >= effect->numParts - 1) {
        remove_effect(effect);
    }
}

void sparkles_render(EffectInstance* effect) {
    RenderTask renderTask;
    RenderTask* retTask;

    renderTask.appendGfx = sparkles_appendGfx;
    renderTask.appendGfxArg = effect;
    renderTask.dist = 0;
    renderTask.renderMode = RENDER_MODE_CLOUD_NO_ZCMP;

    retTask = queue_render_task(&renderTask);
}

void sparkles_appendGfx(void* effect) {
    SparklesFXData* part = ((EffectInstance*)effect)->data.sparkles;
    Matrix4f mtxTransform;
    Matrix4f mtxTemp;
    Matrix4f mtxRoot;
    s32 colorIdx;
    s32 i;

    gDPPipeSync(gMainGfxPos++);
    gSPSegment(gMainGfxPos++, 0x09, VIRTUAL_TO_PHYSICAL(((EffectInstance*)effect)->shared->graphics));
    gSPDisplayList(gMainGfxPos++, D_09000F20_338EE0);

    colorIdx = (part->lifetime - 1) * 3;

    guTranslateF(mtxTransform, part->pos.x, part->pos.y, part->pos.z);
    guRotateF(mtxTemp, -gCameras[gCurrentCameraID].curYaw, 0.0f, 1.0f, 0.0f);
    guMtxCatF(mtxTemp, mtxTransform, mtxRoot);

    part++;
    for (i = 0; i < ((EffectInstance*)effect)->numParts - 1; i++, part++) {
        s32 frameIdx = part->animFrame;

        if (frameIdx >= 0) {
            guTranslateF(mtxTemp, part->pos.x, part->pos.y, part->pos.z);

            mtxTemp[0][0] = part->scale;
            mtxTemp[1][1] = part->scale;
            mtxTemp[2][2] = part->scale;
            colorIdx += 3;

            guMtxCatF(mtxTemp, mtxRoot, mtxTransform);
            guMtxF2L(mtxTransform, &gDisplayContext->matrixStack[gMatrixListPos]);

            colorIdx %= ARRAY_COUNT(D_E0022CF0);

            gDPSetPrimColor(gMainGfxPos++, 0, 0, D_E0022CF0[colorIdx], D_E0022CF0[colorIdx + 1], D_E0022CF0[colorIdx + 2], 255);
            gSPMatrix(gMainGfxPos++, &gDisplayContext->matrixStack[gMatrixListPos++], G_MTX_PUSH | G_MTX_MUL | G_MTX_MODELVIEW);
            gSPDisplayList(gMainGfxPos++, D_E0022CD0[frameIdx & 7]);
            gSPPopMatrix(gMainGfxPos++, G_MTX_MODELVIEW);
        }
    }

    gDPPipeSync(gMainGfxPos++);
}
