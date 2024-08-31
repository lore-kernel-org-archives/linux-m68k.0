Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F5C44C97
	for <linux-m68k@lists.linux-m68k.org>; Sat, 31 Aug 2024 17:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725125892; cv=none; b=AappGh1Pkzvh27KLHWIH7kZKmHSjBV67ThDw+u1KhZ+nYZq2BcSs+l9ISUpDEpx67WeoKur+IPz93jdlhmNy5d3qSOeyj44/2LY0Y5iG53aO6xQxGrQxbtL0vo6YNsgWrw7HpTu0CnSWZSGdYCSpJ/XG9W7IdeBdCgHyonbI0F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725125892; c=relaxed/simple;
	bh=EOcY+L8D4N7IBlwX0Odqgg3/L91yrzTPjC+Iku5hHNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CfHurF9LTDCdO55OXwY4kcH25Gh6YjAllXaueH9fOjrMemYwZH8NyRMSHgrLcdQHbwCEu3nli5HU5Ap7M463RPTQfF5Szo4V7nr/qJf1WmPE8WZgdpt+J9pfxL5zvM1MZH9etjsYVZGKMQtOVrDVnNxRN/NbNhQoeJIABCW0KKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=FohSGsEr; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="FohSGsEr"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2d8815ef6d2so984718a91.0
        for <linux-m68k@lists.linux-m68k.org>; Sat, 31 Aug 2024 10:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1725125890; x=1725730690; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nluqqBb+BAUW3mwcol/Wa1SYLfCHE6NgsvZ2crcUy8o=;
        b=FohSGsErKTjcN8n2Tdi32znalDgn8LF8/NPUihQkM1+tQr+C6w+7amYcTLnxfyh9aB
         VtyNbbluLevzQYd+ZCDucCjVGY86f1HheDvu1KpiEain85xPV3v5oceD9afO0fFBoo0k
         Ad58W/NEBK24w2cFvYC7zF89H5JP4YzE9K8aw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725125890; x=1725730690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nluqqBb+BAUW3mwcol/Wa1SYLfCHE6NgsvZ2crcUy8o=;
        b=vYL/OOKToQxJKPXcxZNpQuUEWNeU08wQPydxCiFssQL7+x7i4QVa3XEe6KuYx2em8e
         JVeBj5X2RwWZU0VUQb4OZLvm6rFFHh803RfVJFVA0lK0sdahPNoxXcb+7i8OWbROQwH/
         vf6Tu33cAz/U5CIGiEMlA8zf0qYWPGlIbNPYMjV4knjKhADqrjVU3ldMyfq3FMX2gWg9
         iBD0BWpoJowFMQy76kiqJDGxuzxV88x3J4ssxdHTUrnJix6Xvz69WAiyRspSIbpdhWaW
         +2HPHEnYX2efOU4w816pe3ZJqpY7IxRC84iQJCBNyP3pYDWYdnjJxIVikpwh5yjwiJbu
         T3UQ==
X-Gm-Message-State: AOJu0YyfseP4MpRPQp2r0hPHe0VLT8LCzHaB5iZV6Z9MdLWo2Kzps45l
	uft3XzQtHptlGxpgdQDYdRFaOvL0wDQCBYQJ/94efTvZRRS3+NlDsqDFCmndgo0vtB6K4GNDm3+
	0rko=
X-Google-Smtp-Source: AGHT+IE2Ffi11EGA/F9QwFJuoATtmqMyPnnYYlONozuFnraNZlN1i0q9MYJpYkbzcWvGRQnANbW9/g==
X-Received: by 2002:a17:90a:51c4:b0:2c2:df58:bb8c with SMTP id 98e67ed59e1d1-2d85619f138mr10586174a91.18.1725125889573;
        Sat, 31 Aug 2024 10:38:09 -0700 (PDT)
Received: from shiro.work.home.arpa (p1980092-ipxg00g01sizuokaden.shizuoka.ocn.ne.jp. [153.201.32.92])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2d89fb0aa0dsm1469187a91.18.2024.08.31.10.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Aug 2024 10:38:09 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
To: linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org,
	geert@linux-m68k.org,
	gerg@linux-m68k.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH] m68k/mvme147: Fix console for mvme147
Date: Sun,  1 Sep 2024 02:38:02 +0900
Message-ID: <20240831173802.2805586-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit a38eaa07a0ce ("m68k/mvme147: config.c - Remove unused functions"),
removed the console functionality for the mvme147 and it never got put
back and/or wired up again.

Put the console write function back and wire it up like mvme16x does
so it's possible to see Linux boot on this fine hardware once more.

Fixes: a38eaa07a0ce ("m68k/mvme147: config.c - Remove unused functions")
Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/m68k/kernel/early_printk.c |  3 +++
 arch/m68k/mvme147/config.c      | 37 +++++++++++++++++++++++++++++++++
 arch/m68k/mvme147/mvme147.h     |  6 ++++++
 3 files changed, 46 insertions(+)
 create mode 100644 arch/m68k/mvme147/mvme147.h

diff --git a/arch/m68k/kernel/early_printk.c b/arch/m68k/kernel/early_printk.c
index 3cc944df04f6..260179d2ed93 100644
--- a/arch/m68k/kernel/early_printk.c
+++ b/arch/m68k/kernel/early_printk.c
@@ -14,6 +14,7 @@
 
 
 #include "../mvme16x/mvme16x.h"
+#include "../mvme147/mvme147.h"
 
 asmlinkage void __init debug_cons_nputs(const char *s, unsigned n);
 
@@ -24,6 +25,8 @@ static void __ref debug_cons_write(struct console *c,
       defined(CONFIG_COLDFIRE))
 	if (MACH_IS_MVME16x)
 		mvme16x_cons_write(c, s, n);
+	else if (MACH_IS_MVME147)
+		m147_scc_write(c, s, n);
 	else
 		debug_cons_nputs(s, n);
 #endif
diff --git a/arch/m68k/mvme147/config.c b/arch/m68k/mvme147/config.c
index 8b5dc07f0811..d62a0be13796 100644
--- a/arch/m68k/mvme147/config.c
+++ b/arch/m68k/mvme147/config.c
@@ -32,6 +32,7 @@
 #include <asm/mvme147hw.h>
 #include <asm/config.h>
 
+#include "mvme147.h"
 
 static void mvme147_get_model(char *model);
 extern void mvme147_sched_init(void);
@@ -185,3 +186,39 @@ int mvme147_hwclk(int op, struct rtc_time *t)
 	}
 	return 0;
 }
+
+static void scc_delay(void)
+{
+	int n;
+	volatile int trash;
+
+	for (n = 0; n < 20; n++)
+		trash = n;
+}
+
+static void scc_write(char ch)
+{
+	volatile char *p = (volatile char *) M147_SCC_A_ADDR;
+
+	do {
+		scc_delay();
+	} while (!(*p & 4));
+	scc_delay();
+	*p = 8;
+	scc_delay();
+	*p = ch;
+}
+
+void m147_scc_write(struct console *co, const char *str, unsigned int count)
+{
+	unsigned long flags;
+
+	local_irq_save(flags);
+
+	while (count--)	{
+		if (*str == '\n')
+			scc_write('\r');
+		scc_write(*str++);
+	}
+	local_irq_restore(flags);
+}
diff --git a/arch/m68k/mvme147/mvme147.h b/arch/m68k/mvme147/mvme147.h
new file mode 100644
index 000000000000..a6611b540bb2
--- /dev/null
+++ b/arch/m68k/mvme147/mvme147.h
@@ -0,0 +1,6 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+struct console;
+
+/* config.c */
+void m147_scc_write(struct console *co, const char *str, unsigned int count);
-- 
2.43.0

