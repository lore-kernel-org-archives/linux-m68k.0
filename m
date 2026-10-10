Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3626336194A
	for <linux-m68k@vger.kernel.org>; Sat, 10 Oct 2026 22:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791671379; cv=none; b=n46glMB33rWe0QOBBOAyu/eJCI+wQ5IAi5FsUoB58H3PVNVOnhk16CHblTRGYePOfPAT5MWQfRfRi9QClid891ny+5WOip/NSrpD8A21OuOIt+nX0B1WQMURSCUq4saEYHESzpHKfsFRwcs7/NyEEYv/TxtndEWLSilGnoWCwmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791671379; c=relaxed/simple;
	bh=5V7XCqfsH2S9fctBxEfcMVvBjpBBk344EMDxIP7LQbA=;
	h=From:To:Cc:Subject:Date:Message-Id; b=qa8O/l2CxCaIKyP3t0yHcd1l7MQ/kj+kWRCRCYJSmcej3cOsZ2FcwpLGicU+GiaG+TPHcrzk1SzTes/Va2bTWz17N707UcVOOnv43eHzEGEKawlcie5Npys6KsFpu6idFZGgoEhyU6w/gvIgbeteXj7jYzjUEifVIXLnajRiwGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DnhSZ0pa; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DnhSZ0pa"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-381b831d535so885992a91.0
        for <linux-m68k@vger.kernel.org>; Sat, 10 Oct 2026 15:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791671377; x=1792276177; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fWTxYT9An3E5jy/JhCPCAh2Vq05Lc6wzI+xajNSgcXM=;
        b=DnhSZ0paZewgIM6qlhYkXg4e5IxsMZ/ZL28TtN45Hbl++4K4UWYFEjL5WMvkPd/hM/
         cjqy9sKLQWibAZ55bl1IxCYhFHsm6ph1u4TbUtzMdQyS4gLbvq9pGUHWnu8YmvmvO4dp
         mkp+yWZnVofNQ7h7WkSDTXAf3VSm50VsRbIBR4vEAEx1njtV3M/zrY/IU6NM8W3qQwDG
         MTNdm0rn75iRL6p0x0D+MLBDX+pKlbNNkubwqIMM0YnwJLRpvoMFZWYBSwO0hmvD5FBC
         JEMUVUkh/oWwGROduKjRpfqDq+O68dnl2yTT9qQDEno3ID7dQstXvBAbDBi68dcl2Dsh
         6gEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791671377; x=1792276177;
        h=message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fWTxYT9An3E5jy/JhCPCAh2Vq05Lc6wzI+xajNSgcXM=;
        b=muU8kLxb8AOH6fb2wLiKuT/qHE4yrVzRRAsL9fE1GgEgxO4glTMLD7DnaW29aYGKpG
         MT4Qg+A3LfVHS1qbeqyhXKv+0yzYzPDSeHoh1ugfAAUc5gDrFV7RaJilqfs5rgVzXn9Z
         W0fjJ35RZumdwKjPndemfOnBymxTgo5JTDvJbwplGmfjjlSQF0E3wtchNEE8JUFsQn0y
         fzrsEEzg4SkytsTaW/RkbFd5IVcVhqKG0WjKFyMTf6z6MSkGWBzSeXUltelU+LM8IjEb
         tBedqGV25oL0bXUwrx7R2Ob3b6/zm+gn/Yv9Es9VVII90VJCo09gAn0ZbU59MQCi4FTf
         2UUA==
X-Gm-Message-State: AFq9FYJlsXdfKWOpdyvWgGxOL6GIcOEbQowCrzJ6cmsV/FXxcKbK2iw/
	PUv9OYWZZ2lRSLBGZ4yuqvsAN68h8gGFTEhhwdhgCxazJJLtk7Ei7Stg
X-Gm-Gg: AYBFou2JJlwR7QC8PloxBSolg6MxnKy2tmCJfaD9WvnJgIOxpzEmSLto1d1BX6ucLPP
	RBmkiAJOu6WjD9VsDeS6idjJopGc5aF7oLx1Ow4iKNDKTldEVMsRIdZx7qYGutWf11lU+an6c7n
	nwX+7PLtzM6iyxH/v42yXoGQ+jZIaK8Ph7qkBZdQmNswmIk8dfg7H5uunSDRbpUSBa9dw2eTFuG
	biPGZK05zbI/8bz7wBDcaD1a4SB1s3U8RZtIyJdvQeTSFwUtcSN8IAjiPvLIYVVEuHpDrkdsRsf
	vHsIUgyueveAX7WgBOhNMB/sBXFeaWF5t6aGKloE2xOYkge6ypwOt4AdQTQMdQlRVIHWcsBfjVH
	PeEgTPR6KOflGX67VCrCOQGIrp+kHuEum53PZWcD80wv2OTKfKCBapOCBc6qYf5Yjg0BlblG4DB
	xHa4CV4U23VpNdLDPOV6i9QNlS60Uuecq+QBBFbEou5D69SL8giVjdw6JOj+VLUqJrsLyrkB/AM
	uyAHlgcqRPamsruOe2kZy+m+TFwafq6/5SOIdKyRfLRRiAMm0PEymBPBWo=
X-Received: by 2002:a17:90b:390b:b0:3a7:f64f:6467 with SMTP id 98e67ed59e1d1-3ab3ae327b5mr5623157a91.57.1791671377419;
        Sat, 10 Oct 2026 15:29:37 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (122-59-250-182-adsl.sparkbb.co.nz. [122.59.250.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab371c32cesm9340478a91.16.2026.10.10.15.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 15:29:37 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
	id 8D00B3603BF; Sun, 11 Oct 2026 11:29:32 +1300 (NZDT)
From: Michael Schmitz <schmitzmic@gmail.com>
To: gerg@linux-m68k.org
Cc: linux-m68k@vger.kernel.org,
	geert@linux-m68k.org,
	Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH RFC] m68k/kernel: fix register dump for ColdFire format 4 exception frame
Date: Sun, 11 Oct 2026 11:29:30 +1300
Message-Id: <20261010222930.30616-1-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

On ColdFire, no extra processor state information is saved after an
exception frame. Take fault status and vector number from pt_regs.fmtvec
instead of from the longword following the exception frame (which would
be pt_regs.fmtvec from a prior exception on the stack).
Likewise, report the PC from pt_regs (redundant).

Untested ...

Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
---
 arch/m68k/kernel/traps.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/m68k/kernel/traps.c b/arch/m68k/kernel/traps.c
index 60759ba3cbd4..ec5cf9703e15 100644
--- a/arch/m68k/kernel/traps.c
+++ b/arch/m68k/kernel/traps.c
@@ -868,6 +868,21 @@ void show_registers(struct pt_regs *regs)
 		addr += sizeof(fp->un.fmt3);
 		break;
 	case 0x4:
+#if defined(CONFIG_COLDFIRE) && defined(CONFIG_MMU)
+		/* ColdFire format 4 frame has all information in pt_regs */
+		if (CPU_IS_COLDFIRE) {
+			unsigned int fs = (regs->vector & 0x3) |
+					 ((regs->vector & 0xc00) >> 8);
+			int vector = (regs->vector >> 2) & 0xff;
+
+			pr_cont("fault status=%0x vector=%u pc=%08lx\n",
+				fs, vector, regs->pc);
+			/* Frame format 4 extra size on ColdFire is 0
+			 * so don't advance addr
+			 */
+			break;
+		}
+#endif /* CONFIG_COLDFIRE && CONFIG_MMU */
 		if (CPU_IS_060)
 			pr_cont("fault addr=%08lx fslw=%08lx\n",
 				fp->un.fmt4.effaddr, fp->un.fmt4.pc);
-- 
2.17.1

