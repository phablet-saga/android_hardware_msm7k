#
# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)

ifneq ($(BOARD_USES_QCOM_LEGACY),true)

    common_msm_dirs := liblights
    qsd8k_dirs := $(common_msm_dirs) dspcrashd libcopybit
    msm7x30_dirs := $(common_msm_dirs) liboverlay

else

    common_msm_dirs := libcopybit liblights libopencorehw librpc libstagefrighthw
    qsd8k_dirs := $(common_msm_dirs) libaudio-qsd8 dspcrashd libgralloc-qsd8k
    msm7x30_dirs := $(common_msm_dirs) libaudio-msm7x30 liboverlay libgralloc-qsd8k

endif

msm7x27a_dirs := $(common_msm_dirs) boot dspcrashd
msm7k_dirs := $(common_msm_dirs) boot libaudio libcopybit dspcrashd

ifeq ($(TARGET_BOARD_PLATFORM),msm7x30)
    include $(call all-named-subdir-makefiles,$(msm7x30_dirs))
endif

ifeq ($(TARGET_BOARD_PLATFORM),qsd8k)
    include $(call all-named-subdir-makefiles,$(qsd8k_dirs))
endif

ifeq ($(TARGET_BOARD_PLATFORM), msm7x27a)
   include $(call all-named-subdir-makefiles,$(msm7x27a_dirs))
endif

ifeq ($(TARGET_BOARD_PLATFORM), msm7x27)
  include $(call all-named-subdir-makefiles,$(msm7k_dirs))
endif

endif