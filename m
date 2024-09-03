Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1197423D7
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Sep 2024 13:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725371952; cv=none; b=RADYZ1cCSzT6ekG0yqlVopvvhydJwF9fG+hE4B5oc9x4V178DKogtsPvXrjbnttz/becnp60/PQWrfuTAq5tNQI/5Z/QB+Rkw3bvTVtJeu+JKas7gXQplgfhSxLRylXuwZj+iv68Alops/nmhkhOaGiFOss3iPibjYp8o38MvEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725371952; c=relaxed/simple;
	bh=2p59Io14Tx6Jv5Z+uTWRhGzxXeHD3dt3DFGNdbpHvhc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pCMUQFb2ktAVUAYGhPzQd/WGSf9/BxNV+qemaIgMkgm9xB6U9avqzJSRdpmIFEl7eVmq+x68HTJ4tzZa+7OKB+o2q8lpsYFrTUyvs/LmGmOdy9UhBwWY70ddMIY/GNunOCswDeW43TzHKsMhrNMk4fQlDfEoNzjMDJu74WZL5yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=W+jvXXGB; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="W+jvXXGB"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-202376301e6so41036415ad.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 03 Sep 2024 06:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1725371949; x=1725976749; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UGDCAIae5kRwEgTwP4mEBr6L2E7fTYcFokMRKodxlJQ=;
        b=W+jvXXGBOlH1p5vL268Xq2Yl5jpHKWhb8x6+B4s/UpsEeFUtpZXrqklD9SWlEyg8nx
         SkKSDA179GVh4NcNtoFRVApV7G+4piYyxxfIRpX1DO8sS4nBcdVbCp7io7qSRtl2OCtu
         N1/qxTcL4Td9k/i5PhLzQZ45B+gIMEZb5Xfgg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725371949; x=1725976749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UGDCAIae5kRwEgTwP4mEBr6L2E7fTYcFokMRKodxlJQ=;
        b=odAM2qh/PXsYG1fIqF2MXHVGxJmO5lGVczHFiMLhklEck/C3kNINgp5JVx/M7/Zw7W
         Sjg4OiPCoGswrQvtwXcr0HIY4uZOuBjywNsVSh85JPPq0ngsTSQJSTpuiOLzSL7ZTZuf
         FHXcINthTRO4J9ESVsmKcy4fAJaAYJ5p9lrvydLsP1u//8MOer0YrrkR6oUU8xRuNOdP
         sbRhFJd8VZlaUu5G8V3oSE6IPjhU8n4fdbYy+5tkDDr/U7vX0BjJkMGV4GwxXOyn6gRR
         /VBefOEE9o7wQoHks02GrikkahSleCdAGG6lFcXa+88qJupUDua0Xb1IQL3yHKro0Vrr
         M8WA==
X-Gm-Message-State: AOJu0Ywzac1UkdWAl4rQRWvUFT3No8CNhs1mVcOehFaqnzP0hqWb04Ye
	RlVHZEcW9FTQepMXRz3JeSfaVnqQX0EEe8az9i96798DucOISKQpnXcBdiEHH0MZRt4pGu6SYzr
	roK4=
X-Google-Smtp-Source: AGHT+IEWpsD6HI7caSArtIN54zToreNlZkIRIyHGpC3jul4Och+Ow+zGZAbP2qHt0qBXDIp10quhBg==
X-Received: by 2002:a17:903:22c7:b0:205:866d:174f with SMTP id d9443c01a7336-205866d1a85mr45493385ad.44.1725371949200;
        Tue, 03 Sep 2024 06:59:09 -0700 (PDT)
Received: from shiro.work.home.arpa (p1980092-ipxg00g01sizuokaden.shizuoka.ocn.ne.jp. [153.201.32.92])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20535e8aa0fsm62688305ad.286.2024.09.03.06.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 06:59:08 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
To: linux-m68k@lists.linux-m68k.org,
	linux-scsi@vger.kernel.org,
	geert@linux-m68k.org,
	James.Bottomley@HansenPartnership.com,
	martin.petersen@oracle.com
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 2/2] scsi: wd33c93: Avoid deferencing null pointer in interrupt handler
Date: Tue,  3 Sep 2024 22:58:57 +0900
Message-ID: <20240903135857.455818-2-daniel@0x0f.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240903135857.455818-1-daniel@0x0f.com>
References: <20240903135857.455818-1-daniel@0x0f.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I have no idea if this fix is appropriate, the code in this driver
makes my brain hurt just looking at it, but sometimes when getting
scsi_pointer from cmd cmd itself is actually null and we get a weird
garbage pointer for scsi_pointer.

When this is accessed later on bad things happen. For my machine
this happens when the SCSI bus is initially scanned.

With this "fix" SCSI on my MVME147 is happy again.

[   84.330000] wd33c93-0: chip=WD33c93B/13 no_sync=0xff no_dma=0
[   84.330000]  debug_flags=0x00
[   84.350000]            setup_args=
<snip>
[   84.490000]
[   84.510000]            Version 1.26++ - 10/Feb/2007
[   84.520000] scsi host0: MVME147 built-in SCSI
[   85.480000]  sending SDTR 0103015e00
[   85.480000] 01
[   85.490000] 03
[   85.500000] 01
[   85.510000] 00
[   85.520000] 00
[   85.520000]  sync_xfer=30
[   85.530000] scsi 0:0:5:0: Direct-Access     BlueSCSI HARDDRIVE        2.0  PQ: 0 ANSI: 2
[   85.820000] st: Version 20160209, fixed bufsize 32768, s/g segs 256
[   85.900000] sd 0:0:5:0: Attached scsi generic sg0 type 0

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 drivers/scsi/wd33c93.c | 10 +++++++---
 drivers/scsi/wd33c93.h |  2 ++
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/scsi/wd33c93.c b/drivers/scsi/wd33c93.c
index a44b60c9004a..9789d852d541 100644
--- a/drivers/scsi/wd33c93.c
+++ b/drivers/scsi/wd33c93.c
@@ -733,7 +733,7 @@ transfer_bytes(const wd33c93_regs regs, struct scsi_cmnd *cmd,
 void
 wd33c93_intr(struct Scsi_Host *instance)
 {
-	struct scsi_pointer *scsi_pointer;
+	struct scsi_pointer *scsi_pointer = NULL;
 	struct WD33C93_hostdata *hostdata =
 	    (struct WD33C93_hostdata *) instance->hostdata;
 	const wd33c93_regs regs = hostdata->regs;
@@ -752,7 +752,9 @@ wd33c93_intr(struct Scsi_Host *instance)
 #endif
 
 	cmd = (struct scsi_cmnd *) hostdata->connected;	/* assume we're connected */
-	scsi_pointer = WD33C93_scsi_pointer(cmd);
+	/* cmd could be null */
+	if (cmd)
+		scsi_pointer = WD33C93_scsi_pointer(cmd);
 	sr = read_wd33c93(regs, WD_SCSI_STATUS);	/* clear the interrupt */
 	phs = read_wd33c93(regs, WD_COMMAND_PHASE);
 
@@ -828,8 +830,10 @@ wd33c93_intr(struct Scsi_Host *instance)
 		    (struct scsi_cmnd *) hostdata->selecting;
 		hostdata->selecting = NULL;
 
-		/* construct an IDENTIFY message with correct disconnect bit */
+		/* cmd should now be valid and we can get scsi_pointer */
+		scsi_pointer = WD33C93_scsi_pointer(cmd);
 
+		/* construct an IDENTIFY message with correct disconnect bit */
 		hostdata->outgoing_msg[0] = IDENTIFY(0, cmd->device->lun);
 		if (scsi_pointer->phase)
 			hostdata->outgoing_msg[0] |= 0x40;
diff --git a/drivers/scsi/wd33c93.h b/drivers/scsi/wd33c93.h
index e5e4254b1477..898c1c7d024d 100644
--- a/drivers/scsi/wd33c93.h
+++ b/drivers/scsi/wd33c93.h
@@ -259,6 +259,8 @@ struct WD33C93_hostdata {
 
 static inline struct scsi_pointer *WD33C93_scsi_pointer(struct scsi_cmnd *cmd)
 {
+	WARN_ON_ONCE(!cmd);
+
 	return scsi_cmd_priv(cmd);
 }
 
-- 
2.43.0

