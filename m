Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE792D7DD3
	for <linux-m68k@lists.linux-m68k.org>; Tue,  7 Oct 2025 09:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759829019; cv=none; b=fhJrlz9nl/J5Recz6CyeRuW8qyS4He99HOQLXrjvZmfVONjpgX2Bn70i+Ul62rm2iPm2FwJEXUJDSAHtfY3jw9A9pnFxj05bWY0/fBsfbrfeRbHO5wnDggbUzAbM/f68yLooyw1Ne/d9QPTALlre1Q+a7hVaOoiTgLH/7TKltjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759829019; c=relaxed/simple;
	bh=U4GkNtp5nOav2nmyt8vVluDERiX84m/g+t6fg257pzk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hQqOqPS7Y9xpeyGyqkJz/LdPuYsKqb7jCvC6sbnsULbtp8NiZzg69xZKGjboCyEvcBtXCLsiddXq6kqnbVc+DwIJtFfWPcc3uWm3prfP8sZw0RH6wNRhR8/slFduDhfGzkFJmn928C2KAFxFhM/Lo7bn6Q3H7FadmWORAiJ5Nlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=exFH9opR; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="exFH9opR"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so4922297b3a.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 07 Oct 2025 02:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1759829017; x=1760433817; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F9DzUNgYrybOaCJXzvxFTfL7BnySvd74Sjls907O7gc=;
        b=exFH9opRcgLZcbyGu33MZD0r1yvrdtnCqXaY3sTX3be1soDO0aTjO3jkNZRS7TzkEl
         z+TJKzRrjN/DBvYskkrqp6TsBt+AQIomUOf4uPyBciBNOg0hipwnK88GX20KIv4m7Uzc
         qarxZnyJFzShrNHJWDcrDsFTa75wqkLaR9eoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759829017; x=1760433817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F9DzUNgYrybOaCJXzvxFTfL7BnySvd74Sjls907O7gc=;
        b=YvvPmVaLLFtZhEZklwF7D7mj6jVh2v0EGmKORakbhnxEu3QrsL16ddbK2FVKTaPD1m
         Bf9IJqRJUojE0Pn2hen5sByUIoiL4jiNdYVZ6KoK2SwlhmlzpaMNwaIRwrafVMYgwETW
         MponZyQbv6kXwL+tTbOoGCY/ll76IUkFTq5Zaf4UI3mj9B/LQQIDihN0MO25nLCYQRDq
         3SAZpyhevXaW8/2HOzn7+svaJkv/dND8qzFFaxvT6noUFiKx8zed9B3l4/cNU2V/VPWv
         R0eAkibFPYxW4hFjEkB4DUPkko0fSlbcyWmKauToHwCSJS642I3KHtCtNzILLCqjNGLB
         Tm+w==
X-Gm-Message-State: AOJu0YwUE4HpH2ry0Uy80ulDLkWcFlUkuO5po8DmC0syfXsQIFv1Q+LV
	1HZ7ZR7qtHdLB6bpccD3hu4w0Cb7skcfgDQGg3VOU/y00lCPqy2hOL+ZTbn/2iUQhEfpBq+BoOl
	jPHD/69k=
X-Gm-Gg: ASbGncu0TV/8yV+87rPGGNx+xZepGA44jqpW3eNyXZVB/Z7VAK215O6ikDUqnJ9Noxh
	YzNkj3vmumiVRIUC8fJnVh/HvGJ7O5Ro1XdfjxAa1deH5H88n/AOCu3HuJWrbte0B34H57BL56G
	DO+gX3O6bB2XZxR0vSW04jZxxhVa5oEEpCgW7LYswP0V2u2xZli0mhjP/QCiR0MFN1jFCb8XVFy
	55cQeQSG2Ui9E23YkDoxRyRZ60cPRj+HKIuJbgAjyZ1cXETDjYvE84ZQjFa63vDJn/P37ontLNw
	rE3hclG1NBoHE5d986oDk8o9SnO1inR4qbLXtm2IHicsvhk59CDF+lKpuL4JlQMsamNUTio5aqj
	4Zk998r4Z7zbBYocLu/weIhkVqnPQMEvJLSDjV86p5ZUF5E0dJZ7qchlx/KHhy8xKDIDnPbUU57
	HEczIBKlqtTfWUeGPZUATnO76vNijsB/S+5hc=
X-Google-Smtp-Source: AGHT+IEwApYE4bcVoj0TdA/p3fC9MzhC83ylm4Bt3jZjLY09+Fp8yf60U6Us/aOsm75FFyq+QvCLWA==
X-Received: by 2002:a05:6a20:e30b:b0:2ce:67b2:3c41 with SMTP id adf61e73a8af0-32d96db80dfmr3802640637.5.1759829017271;
        Tue, 07 Oct 2025 02:23:37 -0700 (PDT)
Received: from kinako.work.home.arpa (p1522181-ipxg00c01sizuokaden.shizuoka.ocn.ne.jp. [122.26.198.181])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-78b01f99acesm15123273b3a.5.2025.10.07.02.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 02:23:36 -0700 (PDT)
From: Daniel Palmer <daniel@thingy.jp>
To: linux-m68k@lists.linux-m68k.org,
	linux-pci@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@thingy.jp>
Subject: [RFC PATCH 2/5] m68k: Increase number of IRQs for Amiga to allow for PCI
Date: Tue,  7 Oct 2025 18:23:10 +0900
Message-ID: <20251007092313.755856-3-daniel@thingy.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251007092313.755856-1-daniel@thingy.jp>
References: <20251007092313.755856-1-daniel@thingy.jp>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to the comment the Amiga has 24 interrupts but I needed
4 more to allocate irqs for the 4 PCI interrupts.

Signed-off-by: Daniel Palmer <daniel@thingy.jp>
---
 arch/m68k/include/asm/irq.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/include/asm/irq.h b/arch/m68k/include/asm/irq.h
index 2263e92d418a..ec944dc27710 100644
--- a/arch/m68k/include/asm/irq.h
+++ b/arch/m68k/include/asm/irq.h
@@ -24,7 +24,9 @@
 #define NR_IRQS 72
 #elif defined(CONFIG_Q40)
 #define NR_IRQS	43
-#elif defined(CONFIG_AMIGA) || !defined(CONFIG_MMU)
+#elif defined(CONFIG_AMIGA)
+#define NR_IRQS (32 + 4)
+#elif !defined(CONFIG_MMU)
 #define NR_IRQS	32
 #elif defined(CONFIG_APOLLO)
 #define NR_IRQS	24
-- 
2.51.0

