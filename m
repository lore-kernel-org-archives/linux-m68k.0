From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH] mac68k: add color classic ii support
Date: Sat, 29 May 2010 03:27:18 +1000 (EST)
Message-ID: <alpine.LNX.2.00.1005290054270.4779@nippy.intranet>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from www.telegraphics.com.au ([204.15.192.19]:47939 "EHLO
	mail.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753485Ab0E1R1W (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 28 May 2010 13:27:22 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>


Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

Index: linux-2.6.34/arch/m68k/mac/config.c
===================================================================
--- linux-2.6.34.orig/arch/m68k/mac/config.c	2010-05-28 00:26:53.000000000 +1000
+++ linux-2.6.34/arch/m68k/mac/config.c	2010-05-28 00:27:22.000000000 +1000
@@ -332,6 +332,15 @@ static struct mac_model mac_data_table[]
 		.scc_type	= MAC_SCC_II,
 		.nubus_type	= MAC_NUBUS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR2,
+	}, {
+		.ident		= MAC_MODEL_CCLII,
+		.name		= "Color Classic II",
+		.adb_type	= MAC_ADB_CUDA,
+		.via_type	= MAC_VIA_IIci,
+		.scsi_type	= MAC_SCSI_OLD,
+		.scc_type	= MAC_SCC_II,
+		.nubus_type	= MAC_NUBUS,
+		.floppy_type	= MAC_FLOPPY_SWIM_ADDR2,
 	},
 
 	/*
