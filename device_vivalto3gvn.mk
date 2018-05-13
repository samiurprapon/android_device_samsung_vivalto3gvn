# Inherit from the common product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from sprd-common device configuration
$(call inherit-product, device/samsung/sprd-common/common.mk)

# Inherit from vendor
$(call inherit-product, vendor/samsung/vivalto3gvn/vivalto3gvn-vendor.mk)

# Dalvik heap config
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

# WiFi BCMDHD
$(call inherit-product, hardware/broadcom/wlan/bcmdhd/firmware/bcm4343/device-bcm.mk)

# AAPT configuration
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := hdpi
PRODUCT_AAPT_PREBUILT_DPI := hdpi mdpi ldpi

# Boot animation
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480

LOCAL_PATH := device/samsung/vivalto3gvn

# Root init
files := \
	$(LOCAL_PATH)/rootdir/init.scx15.rc \
	$(LOCAL_PATH)/rootdir/init.scx15.usb.rc \
	$(LOCAL_PATH)/rootdir/init.scx15_ss.rc \
	$(LOCAL_PATH)/rootdir/init.vivalto3gvn.rc \
	$(LOCAL_PATH)/rootdir/init.vivalto3gvn_base.rc \
	$(LOCAL_PATH)/rootdir/init.wifi.rc \
	$(LOCAL_PATH)/rootdir/ueventd.scx15.rc \
	$(LOCAL_PATH)/rootdir/fstab.scx15 \

PRODUCT_COPY_FILES += \
	$(foreach f,$(files),$(f):root/$(notdir $(f)))

# System init
files := \
	$(LOCAL_PATH)/system/vendor/etc/init/at_distributor.rc \
	$(LOCAL_PATH)/system/vendor/etc/init/chown_service.rc \
	$(LOCAL_PATH)/system/vendor/etc/init/data.rc \
	$(LOCAL_PATH)/system/vendor/etc/init/engpc.rc \
	$(LOCAL_PATH)/system/vendor/etc/init/gpsd.rc \
	$(LOCAL_PATH)/system/vendor/etc/init/hostapd.rc \
	$(LOCAL_PATH)/system/vendor/etc/init/kill_phone.rc \
	$(LOCAL_PATH)/system/vendor/etc/init/macloader.rc \
	$(LOCAL_PATH)/system/vendor/etc/init/modemd.rc \
	$(LOCAL_PATH)/system/vendor/etc/init/nvitemd.rc \
	$(LOCAL_PATH)/system/vendor/etc/init/p2p_supplicant.rc \
	$(LOCAL_PATH)/system/vendor/etc/init/phoneserver.rc \
	$(LOCAL_PATH)/system/vendor/etc/init/refnotify.rc \
	$(LOCAL_PATH)/system/vendor/etc/init/rild.rc \
	$(LOCAL_PATH)/system/vendor/etc/init/set_mac.rc \
	$(LOCAL_PATH)/system/vendor/etc/init/smd_symlink.rc \
	$(LOCAL_PATH)/system/vendor/etc/init/swap.rc \
	$(LOCAL_PATH)/system/vendor/etc/init/wpa_supplicant.rc \

PRODUCT_COPY_FILES += \
	$(foreach f,$(files),$(f):system/vendor/etc/init/$(notdir $(f)))

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/system/etc/init/mediaserver.rc:system/etc/init/mediaserver.rc

# Recovery
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/rootdir/init.recovery.scx15.rc:root/init.recovery.scx15.rc \
	$(LOCAL_PATH)/rootdir/twrp.fstab:recovery/root/etc/twrp.fstab \

# Keylayout
files := \
	$(LOCAL_PATH)/system/vendor/usr/keylayout/ist30xx_ts_input.kl \
	$(LOCAL_PATH)/system/vendor/usr/keylayout/sci-keypad.kl

PRODUCT_COPY_FILES += \
	$(foreach f,$(files),$(f):system/vendor/usr/keylayout/$(notdir $(f)))

# Bluetooth
files := \
	$(LOCAL_PATH)/system/vendor/etc/bluetooth/bt_vendor.conf

PRODUCT_COPY_FILES += \
	$(foreach f,$(files),$(f):system/vendor/etc/bluetooth/$(notdir $(f)))

# Media
files := \
	$(LOCAL_PATH)/system/vendor/etc/audio_policy.conf \
	$(LOCAL_PATH)/system/vendor/etc/audio_hw.xml \
	$(LOCAL_PATH)/system/vendor/etc/audio_para \
	$(LOCAL_PATH)/system/vendor/etc/codec_pga.xml \
	$(LOCAL_PATH)/system/vendor/etc/tiny_hw.xml \
	$(LOCAL_PATH)/system/vendor/etc/media_codecs.xml \
	$(LOCAL_PATH)/system/vendor/etc/media_profiles.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml \

PRODUCT_COPY_FILES += \
	$(foreach f,$(files),$(f):system/vendor/etc/$(notdir $(f)))

# GPS
files := \
	$(LOCAL_PATH)/system/vendor/etc/gps.conf \
	$(LOCAL_PATH)/system/vendor/etc/gps.xml \

PRODUCT_COPY_FILES += \
	$(foreach f,$(files),$(f):system/vendor/etc/$(notdir $(f)))

# Nvitem
files := \
	$(LOCAL_PATH)/system/vendor/etc/nvitem_td.cfg \
	$(LOCAL_PATH)/system/vendor/etc/nvitem_w.cfg

PRODUCT_COPY_FILES += \
	$(foreach f,$(files),$(f):system/vendor/etc/$(notdir $(f)))

# Wifi
files := \
	$(LOCAL_PATH)/system/vendor/etc/wifi/nvram_net.txt \

PRODUCT_COPY_FILES += \
	$(foreach f,$(files),$(f):system/vendor/etc/wifi/$(notdir $(f)))

# Telephony
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/system/vendor/etc/spn-conf.xml:system/vendor/etc/spn-conf.xml

# Permissions
files := \
	frameworks/native/data/etc/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml \

PRODUCT_COPY_FILES += \
	$(foreach f,$(files),$(f):system/etc/permissions/$(notdir $(f)))

# HIDL manifest
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/manifest.xml:system/vendor/manifest.xml \


# HALs
PRODUCT_PACKAGES += \
	audio.primary.scx15 \
	libaudio-resampler \
	bluetooth.default \
	memtrack.scx15 \
	gralloc.scx15 \
	hwcomposer.scx15 \
	sprd_gsp.scx15 \
	libdither \
	lights.scx15 \
	libion_sprd \
	libmemoryheapion_sprd \

# Codecs
#PRODUCT_PACKAGES += \
#	libstagefrighthw \
#	libstagefright_sprd_soft_mpeg4dec \
#	libstagefright_sprd_soft_h264dec \
#	libstagefright_sprd_mpeg4dec \
#	libstagefright_sprd_mpeg4enc \
#	libstagefright_sprd_h264dec \
#	libstagefright_sprd_h264enc \
#	libstagefright_sprd_vpxdec \
#	libstagefright_sprd_aacdec \
#	libstagefright_sprd_mp3dec \

# Shim
PRODUCT_PACKAGES += \
	libril_shim \
	libgps_shim \

#	libstagefright_shim \

# Languages
PRODUCT_PROPERTY_OVERRIDES += \
	ro.product.locale.language=en \
	ro.product.locale.region=GB

# Google-specific location features
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.google.locationfeatures=1 \
	ro.com.google.networklocation=1

# ART device props
PRODUCT_PROPERTY_OVERRIDES += \
	dalvik.vm.dex2oat-Xms=8m \
	dalvik.vm.dex2oat-Xmx=96m \
	dalvik.vm.dex2oat-flags=--no-watch-dog \

# Enable insecure ADB for userdebug builds
PRODUCT_PROPERTY_OVERRIDES += \
	ro.secure=0 \
	ro.adb.secure=0 \
	ro.debuggable=1 \
	persist.sys.root_access=1 \
	persist.service.adb.enable=1
