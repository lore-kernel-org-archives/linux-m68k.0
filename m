Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3CC3C1961
	for <linux-m68k@lists.linux-m68k.org>; Fri, 27 Mar 2026 08:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774598467; cv=none; b=WF31b/S5oq0RFw7RyYA1HWDWJ7/eSeFFAG59mwdtNf+mMWTtWEiRAPV104EGp41seZICHFIAUAv2FY8xGxVXbd/ExPIJHvZcqBak9WBMkybOyd+kSsfleAHg6yubx26ss0irbVTaEX//lQZ6cCYqhROXbvD8wIVE3RG7SC7T8gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774598467; c=relaxed/simple;
	bh=JWfjR/RTCXmZyEk+4Tx2iEnYpR1e4qTFsejI1js9qmM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KES+891Q7GI3mwzi8UPispJrRAfOUaxSDreNFEW339vpMivv7n0sURwKKJxTdX2Dvu45bdkgDMZ7MuLnR4jhUTFE3zdxu4CzVzmuQJ21pNVHNUeJqplTP1NknhaTc72GcFGoqPOn5vlk2aZ5yoKJyeTGQjw8TtK69l1CTpDgnmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=A82P2CaB; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="A82P2CaB"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-486b9675d36so15983335e9.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 27 Mar 2026 01:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774598458; x=1775203258; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K4moBxHVs6SiILsKE/Pxveo5RaXduWTr95oeVQa3H18=;
        b=A82P2CaBJdywIoADnzT+CUt4VPzbcGGaNXMB4pqtOFv+HlKDespav3x57vOtATZ0Zu
         PkoNBxOVCKnJAol/Iqneoc7iQGcAyPy4zm0lcfLaLedCrih8yzlO767sDIDjUSi088PI
         o6wy23806u1yFb4NhtFeebJ+dWKE5fQZK0rL9J63xsmrG3JLJZxjE/wlyItLlBccucyQ
         +wMyJfGr+xpvKttdg5CwLWqp6F0TKPyz25FYs+VwPs6yUEnc07TzEasZfCHnbvScY7Ro
         F1saZGbm8pfD14ifOiGIeExJ9omXoX/1fnwLqVtgkVy/YJ3Aljp3ll7doIRPC1bXhGyC
         BCOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774598458; x=1775203258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K4moBxHVs6SiILsKE/Pxveo5RaXduWTr95oeVQa3H18=;
        b=lN2ADItZsjmlsbsOJIO6fjsNPZ+GNP9K7n3f4mRtI2Z1CEQ/vHGDIIny3RRIBP8PMw
         iumiNwQ5V6VIu1kUHILh8Y+eDwr9G85zqV4KmsaVsRVALxjbE5f17ay9dvKxOPIYH8F2
         00Xr7gAigs6v5Zr7xlxY92bs6I0hqp1Dc5E5uP3MQqkKaeh3C6p0uonhcferCwK4IFfm
         TANh0tkG3tYgFUqub2a+NVBS8JJn5umeq6xXt4XHDwWmz0slEZu/qsW27pnmaZvMmHUP
         mnznZ1gJEaPXbERMmXuON7v/WOpWimpXunWb8cQELEYRoddOQEMVjLf5kMstmQYPk9L0
         mBGQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6At8oHJ5HmRiJZ0vxAbxNum3gVzHxf+lUk47G0wz0eSgoJyd7sx5FLIDE3+u94jptH+ievvD8Etkr@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yx1xRohtg2Lprq/RGYrLKFB1f41opZQItP6Vav/1NtvCmPkyv7M
	GHyEcZdWj4YcHSrg2kZTyalVrT2kIAIhYVp14UUWJJra8sJrrl/oLcj+rrLxQyiOQqQ=
X-Gm-Gg: ATEYQzwRbCLWSTHuHFK56EfdTNPLyD0Mcn7E0wsFlbwLSY9uV6a76ipvZ5tXZBc5GZj
	nt9EJHCNNzFjwXGCP+WT0Qr32AXzEs43xMAq42Ute91WINaiCYBiU5eplaV/PFZqHXIpYLWAtCI
	+LB5AlHYO3jFcRYxWeqyVCqyiLMBe3l2O/E/hjZoda4vIu0fWe3Kjk4d4AH6P0c9ls88085/ti2
	YqvtyuEhiQ4OOYyE6+gmD9Xpe/Vo8HundppIdUgVZN+ZoJzGvIu595xFhkGFzSkCONByE3GzmBl
	H3kAmeP2/iSdZ877wPy4oUQTbjGDa6hqisOYX1HjEHcbvtE3UEWelZsJEvWAtS0QWfYWqATd0yB
	lQhpIuur19sIxexCz/HRM7dyKT/zjB3sQe2aND3YzfPFlGWUNKNvojdD3FbameDi6Oep5W9KQex
	NK0U7W4NJr4huI2wmhKnXH9uC5o5ZTZZFSpBwyPjyt
X-Received: by 2002:a05:600c:19cf:b0:487:1108:48bc with SMTP id 5b1f17b1804b1-48727ec7695mr24399785e9.17.1774598458048;
        Fri, 27 Mar 2026 01:00:58 -0700 (PDT)
Received: from zovi.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48725fc4827sm12089735e9.11.2026.03.27.01.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 01:00:57 -0700 (PDT)
From: Petr Pavlu <petr.pavlu@suse.com>
To: Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Sami Tolvanen <samitolvanen@google.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	linux-riscv@lists.infradead.org,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] module, m68k: force sh_addr=0 for arch-specific sections
Date: Fri, 27 Mar 2026 08:59:02 +0100
Message-ID: <20260327080023.861105-4-petr.pavlu@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327080023.861105-1-petr.pavlu@suse.com>
References: <20260327080023.861105-1-petr.pavlu@suse.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When linking modules with 'ld.bfd -r', sections defined without an address
inherit the location counter, resulting in non-zero sh_addr values in the
resulting .ko files. Relocatable objects are expected to have sh_addr=0 for
all sections. Non-zero addresses are confusing in this context, typically
worse compressible, and may cause tools to misbehave [1].

Force sh_addr=0 for all m68k-specific module sections.

Link: https://sourceware.org/bugzilla/show_bug.cgi?id=33958 [1]
Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
---
 arch/m68k/include/asm/module.lds.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/include/asm/module.lds.h b/arch/m68k/include/asm/module.lds.h
index fda94fa38243..fcd08689b282 100644
--- a/arch/m68k/include/asm/module.lds.h
+++ b/arch/m68k/include/asm/module.lds.h
@@ -1,5 +1,5 @@
 SECTIONS {
-	.m68k_fixup : {
+	.m68k_fixup 0 : {
 		__start_fixup = .;
 		*(.m68k_fixup)
 		__stop_fixup = .;
-- 
2.53.0

