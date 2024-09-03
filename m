Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2EA23D7
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Sep 2024 13:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725371949; cv=none; b=ew+lQ339qsrHJuxXEfYz9M0gm36sMiMGc9suZFej1tWe4qss3QdqrbnYa4/YKVelts1XRgoxnwXknqoQldbLrrgAvxUGaXHvoM23f+Zy8a4AzM5sYV0c4blVfvj7BCjJdHqWPzKLFENAUlC+Lgo3fW2TGfldgQl99xuzx4C6lg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725371949; c=relaxed/simple;
	bh=A3qTCpkD1tY/o7kPq9Ivj2Iymq37hYiFD3zZCTon5mw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QlVxDbk91wnlzsf00+WlL9XRWLvTTrOQKmbzIlzMelnqK1SRyfvm/OJpqqufvAjtUuQFJW+q7HdVyaQyht/4YaGb/fIzNq9VbDpCXjIlfvA5nByQqgJC7mREafO9U7mj22gBSoUOrzJKh1fN+ob0IOsoFbGdZSoqsxp1RfU2vaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=wOJlvBYp; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="wOJlvBYp"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2055a3f80a4so17558545ad.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 03 Sep 2024 06:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1725371947; x=1725976747; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W9MboPUXsg/Px+LwZ6+8JIU+4J0WsFaBGBEODEMGVas=;
        b=wOJlvBYplAraIUUsu9YVUNZXcVz2dX0Hkd2KqLM4kBgo3zuPyk74eNBWRBDZ2Owkdt
         sU5qPy7t50dvsDyCBBFUuEr1LbUhLtwaK06FFZD18ifnZHJCtPKYlECOQfILKG/RsnzD
         kPtzvkt77EANwTaiaFGQy4B4O9Zh0TxekhwyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725371947; x=1725976747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W9MboPUXsg/Px+LwZ6+8JIU+4J0WsFaBGBEODEMGVas=;
        b=Ihms26YNkgAsO46q5a3JYf6DNoy7A38GH8AhCx8lkrnQ+kgt4l0str+sqQBc5lYe8a
         0/TeIAcHegkH1M1FrPcgLqxPnTaWXWv3vSwYnFsoHx2Gy7XgPxc8sdFv5fHnUlkg61iR
         vKAmJM6/WG1w2IIa7cmdsmKZLxn5BMJaJeTQ6Fxj526QJzyH2Q9rc7tnSfJUdJC/KSCX
         dsoTNVThplkngYw818j05FeaCder9vCo6wlNGgHXeKWD18JY7WMij/CUd76uy5f7irOT
         IaF6Fz3nvGts9oXCrBPRbpyYqQX80O+6hdjQfCop4UQ/YqhgNPUxWo9/pGjALvX6S88J
         9luw==
X-Gm-Message-State: AOJu0Yy4CS9XPp8+C27t9SZJjuHiGXoA105v0Z5ocuNROowRaHOBNehi
	ctitXGqh3axJKp0fnA32e74Jx2IxQbrG8tZ+LCBKjTwbZIq/V+STwIqwq/UnZMDEDme7yMkxAs+
	p6Gc=
X-Google-Smtp-Source: AGHT+IGbCBnBMPU2eZxrUfWrnlWj/Kh07Gptupnf3wm+gluWsdFBgP4m5pVsoREBAqxXGnFp06T0OQ==
X-Received: by 2002:a17:902:ccce:b0:205:56e8:4a4b with SMTP id d9443c01a7336-20556e84f14mr101632425ad.2.1725371946592;
        Tue, 03 Sep 2024 06:59:06 -0700 (PDT)
Received: from shiro.work.home.arpa (p1980092-ipxg00g01sizuokaden.shizuoka.ocn.ne.jp. [153.201.32.92])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20535e8aa0fsm62688305ad.286.2024.09.03.06.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 06:59:06 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
To: linux-m68k@lists.linux-m68k.org,
	linux-scsi@vger.kernel.org,
	geert@linux-m68k.org,
	James.Bottomley@HansenPartnership.com,
	martin.petersen@oracle.com
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 1/2] m68k/mvme147: Fix SCSI IRQ numbers
Date: Tue,  3 Sep 2024 22:58:56 +0900
Message-ID: <20240903135857.455818-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sometime in the long long ago the m68k IRQ code was refactored
and the interrupt numbers for SCSI on this board ended up being
wrong and SCSI hasn't worked for a few decades...

The PCC adds 0x40 to the vector for its interrupts so they
end up in the user interrupts naturally, the kernel number
should be the kernel offset for user interrupt numbers +
the PCC interrupt number. Basically they are 0x40 off right now.

Fixes: 200a3d352cd5 ("[PATCH] m68k: convert VME irq code")
Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/m68k/include/asm/mvme147hw.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/include/asm/mvme147hw.h b/arch/m68k/include/asm/mvme147hw.h
index e28eb1c0e0bf..aa9bb31d1c27 100644
--- a/arch/m68k/include/asm/mvme147hw.h
+++ b/arch/m68k/include/asm/mvme147hw.h
@@ -93,8 +93,8 @@ struct pcc_regs {
 #define M147_SCC_B_ADDR		0xfffe3000
 #define M147_SCC_PCLK		5000000
 
-#define MVME147_IRQ_SCSI_PORT	(IRQ_USER+0x45)
-#define MVME147_IRQ_SCSI_DMA	(IRQ_USER+0x46)
+#define MVME147_IRQ_SCSI_PORT	(IRQ_USER+0x5)
+#define MVME147_IRQ_SCSI_DMA	(IRQ_USER+0x6)
 
 /* SCC interrupts, for MVME147 */
 
-- 
2.43.0

