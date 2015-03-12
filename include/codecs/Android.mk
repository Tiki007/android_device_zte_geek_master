# autogenerated Android.mk
LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
# TARGET multi prebuilt binaries
LOCAL_IS_HOST_MODULE:=
LOCAL_PREBUILT_LIBS:=libmc_core.a libmc_codec_common.a libmc_mp3_dec.a libmc_aac_dec.a libmc_aac_enc.a libmc_gsmamr.a libmc_amrwb.a libmc_vorbis_dec.a libmc_wma_dec.a libmc_vp8_dec.a
include $(BUILD_MULTI_PREBUILT)
include $(CLEAR_VARS)
LOCAL_COPY_HEADERS:= mc_version.h UMCDecoder.h UMCMacro.h UMCPerfTracing.h USCDecoder.h USCEncoder.h
LOCAL_COPY_HEADERS_TO:=media_codecs
include $(BUILD_COPY_HEADERS)

