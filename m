From: Angelo Dureghello <angelo@sysam.it>
Subject: [PATCH] m68k/defconfig: fix stmark2 broken local compilation
Date: Mon, 4 Dec 2017 11:19:41 +0100
Message-ID: <20171204101940.7bztuju66aj5xa3d@jerusalem>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from ec2-18-194-220-216.eu-central-1.compute.amazonaws.com ([18.194.220.216]:37036
        "EHLO sysam.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753460AbdLDKTo (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Mon, 4 Dec 2017 05:19:44 -0500
Content-Disposition: inline
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gregungerer@westnet.com.au, linux-m68k@vger.kernel.org

Signed-off-by: Angelo Dureghello <angelo@sysam.it>
---
 arch/m68k/configs/stmark2_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/m68k/configs/stmark2_defconfig b/arch/m68k/configs/stmark2_defconfig
index 55e55dbc2fb6..3d07b1de7eb0 100644
--- a/arch/m68k/configs/stmark2_defconfig
+++ b/arch/m68k/configs/stmark2_defconfig
@@ -5,7 +5,6 @@ CONFIG_SYSVIPC=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_NAMESPACES=y
 CONFIG_BLK_DEV_INITRD=y
-CONFIG_INITRAMFS_SOURCE="../uClinux-dist/romfs"
 # CONFIG_RD_BZIP2 is not set
 # CONFIG_RD_LZMA is not set
 # CONFIG_RD_XZ is not set
-- 
2.15.0
