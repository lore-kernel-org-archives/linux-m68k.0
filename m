Return-Path: <SRS0=lYFo=7U=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 665F7C433E0
	for <linux-m68k@archiver.kernel.org>; Sun,  7 Jun 2020 19:06:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 28F1D206D5
	for <linux-m68k@archiver.kernel.org>; Sun,  7 Jun 2020 19:06:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=timesys-com.20150623.gappssmtp.com header.i=@timesys-com.20150623.gappssmtp.com header.b="dfZYJqRo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726780AbgFGTG0 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 7 Jun 2020 15:06:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726742AbgFGTG0 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sun, 7 Jun 2020 15:06:26 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5925FC061A0E
        for <linux-m68k@vger.kernel.org>; Sun,  7 Jun 2020 12:06:26 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id g9so11592670edw.10
        for <linux-m68k@vger.kernel.org>; Sun, 07 Jun 2020 12:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Nb3fCsvQkquN1lMqovM+e0CARz9jizkBrvF/ujBAsg0=;
        b=dfZYJqRoce6PnVvFj1mad4jFYbZO+3LxMnjoQvWq12hsE07DVlI1rYf9vNmNUhKQid
         QzslPDwuFMeeRxve2igfe9ZX/EZkCFVhC5LWYWQxk3/zqIxB5HNWDtl0RktXlt/9mItv
         jCt4u1vNC0GgqBO4HUzeSuE5iIYT0cRylYO17uaP9nV3RGSTUKhJzcXsyW7F+nDzf62v
         e4Yn8VizfLTKL2wJ62Tp1drl2dgBcUbnxKfor3qFcNDGMVNF/nQvoJ3PppafiN8jPdtM
         ZhBSmckhrmWfzLr1ZzkdsVfuVpVxNg5mXMF/TbFd5YDYT4n1biNRZzuligtDUC5Rj0j0
         pqzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Nb3fCsvQkquN1lMqovM+e0CARz9jizkBrvF/ujBAsg0=;
        b=Lvmo8yx2+oRyn6BNBHo8gNdnFOSH/PYZRjQNEZOfoQ6xV03yxlr6V21aRXPfsgeoFB
         O59ERtuur0Ss3gwBXKprOS0D6AD0X6rNzMEt+2qO4e45mLiLvU8T1XZrKCjmeWu69sDC
         7N7U2Ek5KRMikPepkf+M0wnzE403kM59l658xsqhm1QehDnREQjE5wP+ywFraP6+Z+EA
         2fP0N43mikCCSe7sy3mPBLiCC1nlCmFqtF9467mm/mjqEPfIELa7d8TdsVlRNOC1Nv9E
         UR+4DDHV/sO6jSYeT5uLoGnsPbPXot2B2o1xZbNCNqLQ7HPvmrZyEXVxqGVR7WwVIxUy
         guVw==
X-Gm-Message-State: AOAM530/WyQ5JE+2jjNtKcVALc7jTkImFsgDuiH1mOsTWcaa2PgfL+GY
        I+bvdqBkHzAuz0ZJsZlqpBD0HVh2kVw=
X-Google-Smtp-Source: ABdhPJyTUZp69DKf2j6tJpGWqEDd8ZAQEl07uDWEFYNJaMGAaNhzQy9gkhB1+l0gy7S622FXK+73Tw==
X-Received: by 2002:a05:6402:393:: with SMTP id o19mr19373727edv.28.1591556783857;
        Sun, 07 Jun 2020 12:06:23 -0700 (PDT)
Received: from localhost.localdomain (host203-36-dynamic.30-79-r.retail.telecomitalia.it. [79.30.36.203])
        by smtp.gmail.com with ESMTPSA id y18sm10444269edu.76.2020.06.07.12.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2020 12:06:23 -0700 (PDT)
From:   Angelo Dureghello <angelo.dureghello@timesys.com>
To:     gerg@linux-m68k.org
Cc:     linux-m68k@vger.kernel.org,
        Angelo Dureghello <angelo.dureghello@timesys.com>
Subject: [PATCH] m68k: stmark2: defconfig updates
Date:   Sun,  7 Jun 2020 21:12:15 +0200
Message-Id: <20200607191215.2626739-1-angelo.dureghello@timesys.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Some defconfig updates for stmark2 board, mainly to enable
sdcard and mmu.

Signed-off-by: Angelo Dureghello <angelo.dureghello@timesys.com>
---
 arch/m68k/configs/stmark2_defconfig | 48 ++++++++++++++++-------------
 1 file changed, 27 insertions(+), 21 deletions(-)

diff --git a/arch/m68k/configs/stmark2_defconfig b/arch/m68k/configs/stmark2_defconfig
index 27fa9465d19d..d92306472fce 100644
--- a/arch/m68k/configs/stmark2_defconfig
+++ b/arch/m68k/configs/stmark2_defconfig
@@ -1,38 +1,33 @@
 CONFIG_LOCALVERSION="stmark2-001"
 CONFIG_DEFAULT_HOSTNAME="stmark2"
 CONFIG_SYSVIPC=y
-# CONFIG_FHANDLE is not set
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_NAMESPACES=y
 CONFIG_BLK_DEV_INITRD=y
-# CONFIG_RD_BZIP2 is not set
-# CONFIG_RD_LZMA is not set
-# CONFIG_RD_XZ is not set
-# CONFIG_RD_LZO is not set
-# CONFIG_RD_LZ4 is not set
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+# CONFIG_FHANDLE is not set
 # CONFIG_AIO is not set
 # CONFIG_ADVISE_SYSCALLS is not set
 # CONFIG_MEMBARRIER is not set
 CONFIG_EMBEDDED=y
 # CONFIG_VM_EVENT_COUNTERS is not set
 # CONFIG_COMPAT_BRK is not set
-# CONFIG_BLK_DEV_BSG is not set
-CONFIG_BLK_CMDLINE_PARSER=y
-# CONFIG_MMU is not set
+CONFIG_COLDFIRE=y
 CONFIG_M5441x=y
 CONFIG_CLOCK_FREQ=240000000
 CONFIG_STMARK2=y
+CONFIG_UBOOT=y
 CONFIG_RAMBASE=0x40000000
 CONFIG_RAMSIZE=0x8000000
 CONFIG_VECTORBASE=0x40000000
 CONFIG_KERNELBASE=0x40001000
+# CONFIG_BLK_DEV_BSG is not set
+CONFIG_BLK_CMDLINE_PARSER=y
 CONFIG_BINFMT_FLAT=y
+CONFIG_BINFMT_ZFLAT=y
 CONFIG_BINFMT_MISC=y
-# CONFIG_UEVENT_HELPER is not set
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
-CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
 # CONFIG_ALLOW_DEV_COREDUMP is not set
 CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
@@ -48,7 +43,6 @@ CONFIG_MTD_CFI_STAA=y
 CONFIG_MTD_ROM=y
 CONFIG_MTD_COMPLEX_MAPPINGS=y
 CONFIG_MTD_PLATRAM=y
-CONFIG_MTD_M25P80=y
 CONFIG_MTD_SPI_NOR=y
 # CONFIG_INPUT_KEYBOARD is not set
 # CONFIG_INPUT_MOUSE is not set
@@ -66,24 +60,36 @@ CONFIG_DEBUG_GPIO=y
 CONFIG_GPIO_SYSFS=y
 CONFIG_GPIO_GENERIC_PLATFORM=y
 # CONFIG_HWMON is not set
-# CONFIG_RC_CORE is not set
 # CONFIG_HID is not set
 # CONFIG_USB_SUPPORT is not set
+CONFIG_MMC=y
+CONFIG_MMC_DEBUG=y
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_PLTFM=y
+CONFIG_MMC_SDHCI_ESDHC_MCF=y
+CONFIG_DMADEVICES=y
+CONFIG_MCF_EDMA=y
+CONFIG_EXT2_FS=y
+CONFIG_EXT2_FS_XATTR=y
+CONFIG_EXT2_FS_POSIX_ACL=y
+CONFIG_EXT2_FS_SECURITY=y
+CONFIG_EXT3_FS=y
+CONFIG_EXT3_FS_POSIX_ACL=y
+CONFIG_EXT3_FS_SECURITY=y
 # CONFIG_FILE_LOCKING is not set
 # CONFIG_DNOTIFY is not set
 # CONFIG_INOTIFY_USER is not set
+CONFIG_OVERLAY_FS=y
 CONFIG_FSCACHE=y
 # CONFIG_PROC_SYSCTL is not set
+CONFIG_CRAMFS=y
+CONFIG_SQUASHFS=y
+CONFIG_ROMFS_FS=y
+CONFIG_CRYPTO_ANSI_CPRNG=y
+# CONFIG_CRYPTO_HW is not set
 CONFIG_PRINTK_TIME=y
+# CONFIG_DEBUG_BUGVERBOSE is not set
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
 CONFIG_SLUB_DEBUG_ON=y
 CONFIG_PANIC_ON_OOPS=y
 # CONFIG_SCHED_DEBUG is not set
-# CONFIG_DEBUG_BUGVERBOSE is not set
-CONFIG_BOOTPARAM=y
-CONFIG_BOOTPARAM_STRING="console=ttyS0,115200 root=/dev/ram0 rw rootfstype=ramfs rdinit=/bin/init devtmpfs.mount=1"
-CONFIG_CRYPTO=y
-# CONFIG_CRYPTO_ECHAINIV is not set
-CONFIG_CRYPTO_ANSI_CPRNG=y
-# CONFIG_CRYPTO_HW is not set
-CONFIG_CRC16=y
-- 
2.26.2

