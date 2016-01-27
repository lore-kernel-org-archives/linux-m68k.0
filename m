From: Finn Thain <fthain@telegraphics.com.au>
Subject: Add mode register to aranym's fake ncr5380
Date: Wed, 27 Jan 2016 16:22:14 +1100 (AEDT)
Message-ID: <alpine.LNX.2.00.1601271550050.26292@nippy.intranet>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:50387 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751420AbcA0FWt (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 27 Jan 2016 00:22:49 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org


I've compile-tested this patch but I didn't do any more than that. Are you 
able to test whether the mainline atari_scsi module works any better with 
a patched aranym?

BTW, the two kernel patches I sent to the mailing lists yesterday are 
fixes for NCR5380 driver exception handing (EH) bugs. They should help 
with an unpatched aranym, because the fake NCR 5380 will cause SCSI 
commands to timeout and hence undergo EH. The eh_ebort_handler call will 
likely return FAILED and this will escalate to a call to the 
eh_bus_reset_handler. The command may be retried, but the mid-layer should 
recover eventually. To observe this, you may need to enable scsi error 
logging.

diff --git a/src/include/ncr5380.h b/src/include/ncr5380.h
index f8fc43b..55bb84d 100644
--- a/src/include/ncr5380.h
+++ b/src/include/ncr5380.h
@@ -33,6 +33,7 @@ class NCR5380 {
 		uae_u8	hd_count;
 
 		uae_u8	hd_initiator;
+		uae_u8	hd_mode;
 
 	public:
 		NCR5380(void);
diff --git a/src/ncr5380.cpp b/src/ncr5380.cpp
index 75d8f50..b3177f1 100644
--- a/src/ncr5380.cpp
+++ b/src/ncr5380.cpp
@@ -120,7 +120,7 @@ NCR5380::~NCR5380(void)
 
 void NCR5380::reset(void)
 {
-	hd_count = hd_status = hd_initiator = 0;
+	hd_count = hd_status = hd_initiator = hd_mode = 0;
 
 	D(bug("ncr5380: reset"));
 }
@@ -140,6 +140,7 @@ uae_u8 NCR5380::ReadData(uae_u16 control)
 			data = hd_initiator = ICR_ARBITRATION_PROGRESS;
 			break;
 		case MODE_REG:
+			data = hd_mode;
 			break;
 		case TARGET_COMMAND_REG:
 			break;
@@ -172,6 +173,7 @@ void NCR5380::WriteData(uae_u16 control, uae_u8 data)
 			hd_initiator = data;
 			break;
 		case MODE_REG:
+			hd_mode = data;
 			break;
 		case TARGET_COMMAND_REG:
 			break;
