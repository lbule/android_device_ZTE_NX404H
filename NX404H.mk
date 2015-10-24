LOCAL_PATH := device/ZTE/NX404H


# Dalvik
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

$(shell mkdir -p $(OUT)/obj/KERNEL_OBJ/usr)

# overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Language
PRODUCT_LOCALES := ru_RU en_US

#System.prop
PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.locale.language=ru \
    ro.product.locale.region=RU


# Kernel
ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif
   
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/zImage:kernel \
    $(LOCAL_PATH)/dt.img:dt.img
    

# Power
PRODUCT_PACKAGES += \
    power.msm8226

# Torch
PRODUCT_PACKAGES += \
    Torch 

# Filesystem
PRODUCT_PACKAGES += \
    e2fsck \
    make_ext4fs \
    resize2fs \
    setup_fs

# GPS
#PRODUCT_PACKAGES += \
#    gps.msm8226 \
#    libgps.utils \
#    libloc_adapter \
#    libloc_eng


#PRODUCT_PROPERTY_OVERRIDES += \
#    ro.gps.agps_provider=1 \
#    persist.gps.qc_nlp_in_use=0

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/gps.conf:system/etc/gps.conf

# Etc
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/hsic.control.bt.sh:system/etc/hsic.control.bt.sh \
    $(LOCAL_PATH)/rootdir/etc/init.ath3k.bt.sh:system/etc/init.ath3k.bt.sh \
    $(LOCAL_PATH)/rootdir/etc/init.crda.sh:system/etc/init.crda.sh \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.audio.sh:system/etc/init.qcom.audio.sh \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.bt.sh:system/etc/init.qcom.bt.sh \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.coex.sh:system/etc/init.qcom.coex.sh \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.efs.sync.sh:system/etc/init.qcom.efs.sync.sh \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.fm.sh:system/etc/init.qcom.fm.sh \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.sdio.sh:system/etc/init.qcom.sdio.sh \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.wifi.sh:system/etc/init.qcom.wifi.sh 


PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# OMX
#PRODUCT_PACKAGES += \
#    qcmediaplayer

#PRODUCT_BOOT_JARS += \
#    qcmediaplayer

#RAM
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/sbin/adbd:root/sbin/adbd \
    $(LOCAL_PATH)/rootdir/etc/sbin/healthd:root/sbin/healthd \
    $(LOCAL_PATH)/rootdir/etc/sbin/ueventd:root/sbin/ueventd \
    $(LOCAL_PATH)/rootdir/etc/sbin/watchdogd:root/sbin/watchdogd \
    $(LOCAL_PATH)/rootdir/etc/charger:root/charger \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom:root/fstab.qcom \
    $(LOCAL_PATH)/rootdir/etc/init:root/init \
    $(LOCAL_PATH)/rootdir/etc/init.class_main.sh:root/init.class_main.sh \
    $(LOCAL_PATH)/rootdir/etc/init.environ.rc:root/init.environ.rc \
    $(LOCAL_PATH)/rootdir/etc/init.mdm.sh:root/init.mdm.sh \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.class_core.sh:root/init.qcom.class_core.sh \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.early_boot.sh:root/init.qcom.early_boot.sh \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.factory.sh:root/init.qcom.factory.sh \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.rc:root/init.qcom.rc \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.sh:root/init.qcom.sh \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.ssr.sh:root/init.qcom.ssr.sh \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.syspart_fixup.sh:root/init.qcom.syspart_fixup.sh \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.usb.rc:root/init.qcom.usb.rc \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.usb.sh:root/init.qcom.usb.sh \
    $(LOCAL_PATH)/rootdir/etc/init.rc:root/init.rc \
    $(LOCAL_PATH)/rootdir/etc/init.superuser.rc:root/init.superuser.rc \
    $(LOCAL_PATH)/rootdir/etc/init.target.rc:root/init.target.rc \
    $(LOCAL_PATH)/rootdir/etc/init.trace.rc:root/init.trace.rc \
    $(LOCAL_PATH)/rootdir/etc/init.usb.rc:root/init.usb.rc \
    $(LOCAL_PATH)/rootdir/etc/ueventd.qcom.rc:root/ueventd.qcom.rc \
    $(LOCAL_PATH)/rootdir/etc/ueventd.rc:root/ueventd.rc

# Ramdisk
PRODUCT_PACKAGES += \
    charger \
    charger_res_images \
    fstab.qcom \
    init.qcom.rc \
    init.qcom.usb.rc \
    init.usb.rc \
    ueventd.qcom.rc \
    init \
    init.environ.rc \
    init.rc \
    init.target.rc \
    init.trace.rc \
    init.superuser.rc \
    ueventd.rc

# MMI
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/mmi.cfg:system/etc/mmi.cfg \
    $(LOCAL_PATH)/config/qcom.cfg:system/etc/qcom.cfg \
    $(LOCAL_PATH)/config/sensor_def_qcomdev.conf:system/etc/sensor_def_qcomdev.conf \
    $(LOCAL_PATH)/config/vold.fstab:system/etc/vold.fstab \
    $(LOCAL_PATH)/config/thermal-engine-8226.conf:system/etc/thermal-engine-8226.conf \
    $(LOCAL_PATH)/config/ftm_test_config:system/etc/ftm_test_config \
    $(LOCAL_PATH)/config/izat.conf:system/etc/izat.conf \
    $(LOCAL_PATH)/config/lowi.conf:system/etc/lowi.conf \
    $(LOCAL_PATH)/config/quipc.conf:system/etc/quipc.conf \
    $(LOCAL_PATH)/config/qlog-conf.xml:system/etc/qlog-conf.xml

# EGL config
#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/config/egl.cfg:system/lib/egl/egl.cfg

# Sap/location secuity configuration file
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/sap.conf:system/etc/sap.conf \
    $(LOCAL_PATH)/config/sec_config:system/etc/sec_config

# Media config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/config/media_codecs.xml:system/etc/media_codecs.xml

# Audio configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/config/snd_soc_msm_Tapan:system/etc/snd_soc_msm/snd_soc_msm_Tapan \
    $(LOCAL_PATH)/config/snd_soc_msm_TapanLite:system/etc/snd_soc_msm/snd_soc_msm_TapanLite \
    $(LOCAL_PATH)/config/snd_soc_msm_Tapan_SKUF:system/etc/snd_soc_msm/snd_soc_msm_Tapan_SKUF \
    $(LOCAL_PATH)/config/snd_soc_msm_TapanLite_SKUF:system/etc/snd_soc_msm/snd_soc_msm_TapanLite_SKUF   


# Keylayouts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    $(LOCAL_PATH)/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/keylayout/synaptics_rmi4_i2c.kl:system/usr/keylayout/synaptics_rmi4_i2c.kl

# IRSC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sec_config:system/etc/sec_config

# Ebtables
PRODUCT_PACKAGES += \
    ebtables \
    ethertypes \
    libebtc

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    bluetooth.hfp.client=1 \
    qcom.bt.dev_power_class=1

PRODUCT_PACKAGES += \
    init.qcom.bt.sh

# Camera
#PRODUCT_PACKAGES += \
#    libxml2

# CRDA
PRODUCT_PACKAGES += \
    crda \
    linville.key.pub.pem \
    regdbdump \
    regulatory.bin

# Display
PRODUCT_PACKAGES += \
    copybit.msm8226 \
    gralloc.msm8226 \
    hwcomposer.msm8226 \
    memtrack.msm8226 \
    liboverlay

# Audio
PRODUCT_PACKAGES += \
    audio.primary.msm8226 \
    audio_policy.msm8226 \
    audio.a2dp.default \
    audio.r_submix.default \
    audio.usb.default

PRODUCT_PACKAGES += \
    libaudio-resampler \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    tinymix

# ANT+
PRODUCT_PACKAGES += \
    AntHalService \
    com.dsi.ant.antradio_library \
    libantradio

# Radio
PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/vendor/lib/libril-qc-qmi-1.so \
    persist.radio.msgtunnel.start=false \
    persist.sys.ssr.restart_level=3 \
    persist.sys.qc.sub.rdump.on=1 \
    ro.telephony.default_network=9,1 \
    telephony.lteOnCdmaDevice=0 \
    persist.radio.no_wait_for_card=1 \
    persist.radio.dfr_mode_set=1

# Opengles version 3
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=196608

# QCOM Display
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=320

# Qualcomm
PRODUCT_PROPERTY_OVERRIDES += \
    persist.timed.enable=true \
    qcom.hw.aac.encoder=true \
    ro.qualcomm.cabl=0 \
    ro.vendor.extension_library=/vendor/lib/libqc-opt.so

#wi-fi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf 


PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_cfg.ini:system/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_wlan_nv.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin

PRODUCT_PACKAGES += \
    hostapd.accept \
    hostapd.deny \
    hostapd_default.conf \
    p2p_supplicant_overlay.conf \
    wpa_supplicant_overlay.conf \
    WCNSS_cfg.dat \
    WCNSS_qcom_cfg.ini \
    WCNSS_qcom_wlan_nv.bin

PRODUCT_PACKAGES += \
    libcurl \
    libnetcmdiface \
    libqsap_sdk \
    libQWiFiSoftApCfg \
    wcnss_service

PRODUCT_PROPERTY_OVERRIDES += \
    persist.debug.wfd.enable=1 \
    persist.sys.wfd.virtual=0 \
    persist.sys.ssr.restart_level=3 \
    wifi.interface=wlan0

# Light
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/lib/lights.msm8226.so:system/lib/hw/lights.msm8226.so

# DRM
PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true

# USB
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \

#Apps
PRODUCT_PACKAGES += \
    Stk \
    LiveWallpapers \
    MagicSmokeWallpapers \
    HoloSpiralWallpaper \
    VisualizationWallpapers

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Proprietary files
$(call inherit-product, vendor/ZTE/NX404H/NX404H-vendor-blobs.mk)

