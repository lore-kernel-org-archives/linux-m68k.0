From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH] mac68k: another mac_defconfig update
Date: Fri, 4 Jun 2010 15:11:25 +1000 (EST)
Message-ID: <alpine.OSX.2.00.1006041506550.278@localhost>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from www.telegraphics.com.au ([204.15.192.19]:61993 "EHLO
	mail.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750729Ab0FDFL3 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 4 Jun 2010 01:11:29 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org


Another update for mac_defconfig (tested more thoroughly now): enable SWIM 
driver, enable generic RTC, and disable more of the obscure and 
experimental stuff.

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

---

Geert, if you would prefer I will fold this into the previous defconfig 
patch and resubmit.

Index: linux-2.6.34/arch/m68k/configs/mac_defconfig
===================================================================
--- linux-2.6.34.orig/arch/m68k/configs/mac_defconfig	2010-06-04 14:45:46.000000000 +1000
+++ linux-2.6.34/arch/m68k/configs/mac_defconfig	2010-06-04 14:45:48.000000000 +1000
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
 # Linux kernel version: 2.6.34
-# Sat May 29 02:16:00 2010
+# Wed Jun  2 00:03:32 2010
 #
 CONFIG_M68K=y
 CONFIG_MMU=y
@@ -117,7 +117,7 @@ CONFIG_BLK_DEV_BSG=y
 # IO Schedulers
 #
 CONFIG_IOSCHED_NOOP=y
-CONFIG_IOSCHED_DEADLINE=y
+CONFIG_IOSCHED_DEADLINE=m
 CONFIG_IOSCHED_CFQ=y
 # CONFIG_DEFAULT_DEADLINE is not set
 CONFIG_DEFAULT_CFQ=y
@@ -252,7 +252,7 @@ CONFIG_DEFAULT_TCP_CONG="cubic"
 CONFIG_IPV6=m
 CONFIG_IPV6_PRIVACY=y
 CONFIG_IPV6_ROUTER_PREF=y
-CONFIG_IPV6_ROUTE_INFO=y
+# CONFIG_IPV6_ROUTE_INFO is not set
 # CONFIG_IPV6_OPTIMISTIC_DAD is not set
 CONFIG_INET6_AH=m
 CONFIG_INET6_ESP=m
@@ -263,7 +263,7 @@ CONFIG_INET6_TUNNEL=m
 CONFIG_INET6_XFRM_MODE_TRANSPORT=m
 CONFIG_INET6_XFRM_MODE_TUNNEL=m
 CONFIG_INET6_XFRM_MODE_BEET=m
-CONFIG_INET6_XFRM_MODE_ROUTEOPTIMIZATION=m
+# CONFIG_INET6_XFRM_MODE_ROUTEOPTIMIZATION is not set
 CONFIG_IPV6_SIT=m
 # CONFIG_IPV6_SIT_6RD is not set
 CONFIG_IPV6_NDISC_NODETYPE=y
@@ -485,7 +485,7 @@ CONFIG_CONNECTOR=m
 # CONFIG_MTD is not set
 # CONFIG_PARPORT is not set
 CONFIG_BLK_DEV=y
-# CONFIG_BLK_DEV_SWIM is not set
+CONFIG_BLK_DEV_SWIM=m
 # CONFIG_BLK_DEV_COW_COMMON is not set
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_CRYPTOLOOP=m
@@ -587,7 +587,7 @@ CONFIG_BLK_DEV_DM=m
 CONFIG_DM_CRYPT=m
 CONFIG_DM_SNAPSHOT=m
 CONFIG_DM_MIRROR=m
-CONFIG_DM_LOG_USERSPACE=m
+# CONFIG_DM_LOG_USERSPACE is not set
 CONFIG_DM_ZERO=m
 CONFIG_DM_MULTIPATH=m
 # CONFIG_DM_MULTIPATH_QL is not set
@@ -606,19 +606,18 @@ CONFIG_MAC_EMUMOUSEBTN=y
 CONFIG_NETDEVICES=y
 CONFIG_DUMMY=m
 # CONFIG_BONDING is not set
-CONFIG_MACVLAN=m
-# CONFIG_MACVTAP is not set
+# CONFIG_MACVLAN is not set
 CONFIG_EQUALIZER=m
 # CONFIG_TUN is not set
 CONFIG_VETH=m
 # CONFIG_PHYLIB is not set
 CONFIG_NET_ETHERNET=y
-CONFIG_MII=m
+# CONFIG_MII is not set
 CONFIG_MAC8390=y
 CONFIG_MAC89x0=y
 CONFIG_MACSONIC=y
 CONFIG_MACMACE=y
-CONFIG_NET_VENDOR_SMC=y
+# CONFIG_NET_VENDOR_SMC is not set
 # CONFIG_ETHOC is not set
 # CONFIG_DNET is not set
 # CONFIG_IBM_NEW_EMAC_ZMII is not set
@@ -738,12 +737,11 @@ CONFIG_SERIAL_PMACZILOG_TTYS=y
 CONFIG_SERIAL_PMACZILOG_CONSOLE=y
 # CONFIG_SERIAL_TIMBERDALE is not set
 CONFIG_UNIX98_PTYS=y
-CONFIG_DEVPTS_MULTIPLE_INSTANCES=y
-CONFIG_LEGACY_PTYS=y
-CONFIG_LEGACY_PTY_COUNT=256
+# CONFIG_DEVPTS_MULTIPLE_INSTANCES is not set
+# CONFIG_LEGACY_PTYS is not set
 # CONFIG_IPMI_HANDLER is not set
 # CONFIG_HW_RANDOM is not set
-CONFIG_GEN_RTC=m
+CONFIG_GEN_RTC=y
 CONFIG_GEN_RTC_X=y
 # CONFIG_R3964 is not set
 # CONFIG_RAW_DRIVER is not set
@@ -875,7 +873,6 @@ CONFIG_EXT3_FS=y
 # CONFIG_EXT3_FS_XATTR is not set
 # CONFIG_EXT4_FS is not set
 CONFIG_JBD=y
-CONFIG_JBD2=m
 CONFIG_REISERFS_FS=m
 # CONFIG_REISERFS_CHECK is not set
 # CONFIG_REISERFS_PROC_INFO is not set
@@ -891,12 +888,7 @@ CONFIG_XFS_FS=m
 # CONFIG_XFS_POSIX_ACL is not set
 # CONFIG_XFS_RT is not set
 # CONFIG_XFS_DEBUG is not set
-CONFIG_OCFS2_FS=m
-CONFIG_OCFS2_FS_O2CB=m
-CONFIG_OCFS2_FS_USERSPACE_CLUSTER=m
-# CONFIG_OCFS2_FS_STATS is not set
-# CONFIG_OCFS2_DEBUG_MASKLOG is not set
-# CONFIG_OCFS2_DEBUG_FS is not set
+# CONFIG_OCFS2_FS is not set
 # CONFIG_BTRFS_FS is not set
 # CONFIG_NILFS2_FS is not set
 CONFIG_FILE_LOCKING=y
@@ -908,7 +900,6 @@ CONFIG_QUOTA=y
 CONFIG_QUOTA_NETLINK_INTERFACE=y
 # CONFIG_PRINT_QUOTA_WARNING is not set
 # CONFIG_QUOTA_DEBUG is not set
-CONFIG_QUOTA_TREE=m
 # CONFIG_QFMT_V1 is not set
 # CONFIG_QFMT_V2 is not set
 CONFIG_QUOTACTL=y
@@ -1064,8 +1055,7 @@ CONFIG_NLS_ISO8859_15=m
 CONFIG_NLS_KOI8_R=m
 CONFIG_NLS_KOI8_U=m
 CONFIG_NLS_UTF8=y
-CONFIG_DLM=m
-# CONFIG_DLM_DEBUG is not set
+# CONFIG_DLM is not set
 
 #
 # Kernel hacking
