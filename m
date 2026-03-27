Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7163CE49D
	for <linux-m68k@lists.linux-m68k.org>; Fri, 27 Mar 2026 08:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774598467; cv=none; b=aGZ2K99KguLoaugzTvhtA/Oi5MLEMCUllEnGU4cEcaWA3kwmBzXoAjAUqoKs7n6M1KCRuRdfZ5G6kaN1KZK/mHa426gmtJvZN8C4theUksXyahq0r55pKCb4cyXdJp0i6rkTCX+Bk1j4UyfeK3XesDpOa9jN3M0S7PXIIE46of0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774598467; c=relaxed/simple;
	bh=b4EA7Cjd+Rmu3jUMpgHSoP8C+KLtgyFkpMfPCKIjeuM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nC3lhhFKiIFlKJDCGwtSF1DKuPOsB/mdPfwMo0pUaaII0TxvjPVxR86Zy4B5xNoDzmMpByNjnBVzjIjDAqpeOVzGwkc6TXg6SPw9ncxuG/+usl6/mFGtGAOH4R9VhpSzIFcoVEmHSv8m28YtET5vCyfYpAPNQcZIP+IfMOR9188=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Kvos50gM; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Kvos50gM"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-486fda2a389so14460125e9.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 27 Mar 2026 01:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774598459; x=1775203259; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QlVyZgwbk35jZ7E4LjSb7Hh9QtkNRjrn39+Y58oA5YM=;
        b=Kvos50gMn/frLPQre5ndx5zDGetNrtLlmwq73CpMzJAIoWDyPgA/yc+tTB3yASsdpB
         GLEYYElWq07gEdKiJa6+Yfnat++lIO0gpmTNt6SOlLRmc1UC5rFcpDVxyGOLu4SJMIVn
         548+rdBpOhe60XujakJCAWGpg7JOxttRkWSUmr52arHvdNZHa/xzNAa48GOpqk3kjLva
         rTh/9x0JOVdIK63ne7jeN4zmSXr3r9eyiCqASa/33Q1PmPPq4A+GPc2y/w900Bp3vKGG
         ZWd9zDKg8xjlgyoxXWczxaw9gjIwcELLmH6JaJvsHPAk/w7DPvqCG0yT1bxVPFcW3CVf
         e3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774598459; x=1775203259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QlVyZgwbk35jZ7E4LjSb7Hh9QtkNRjrn39+Y58oA5YM=;
        b=RDVNU7UnawhWQLvr1a3PEEqB93U0H0+Lc8MjDKA9UrmFSCyI6bp0NDyvba6rVlgXif
         HtmNSAs/IfkcbKVq0JK7qmfFsh0IMm6/cupsJL/G+uyMZzMG31AH2kOSfFSd1ZtlgvIi
         XI12qoSiZbMi8PDB9DrjLBXNT/v5xi4TnxKq0fOmCTzsbXUcVH9fgUjZAqf1iTY3zVUe
         /uwFG8F5zrMqKV9vagXeiYFSvxmOsa4hz6ICuxWRGwHs+cCWQEb4L663a3M/ow9U05NW
         arOUeb1wxpDJUEFwcDhmi/fnkDIWDwBp4NBphjlL9LoCiCAY+HB7kXxRwSCvnBwLaOwl
         Y/nQ==
X-Forwarded-Encrypted: i=1; AJvYcCVY9wgqaTmAxWSnALr8nZicsU/AJE49tis0QW1Xsdgl6xRgEwLXX2rXefg8iUPIfGjNqanLV7MpESIh@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yy82Wu1iYdM6oDLmC+LzyjZxcyxTKO15ASKfzRUXl2tHtPrVlY3
	E+dqNawcJvOKgu3uCQ7riHvU73FI9nnYg6VP0ZiBVDGrZLb+gqpXFZp7C8hVVB8qmfk=
X-Gm-Gg: ATEYQzx8KLW18piHUfdbZDETilqqrmJkVpmLTD6Nh+CbdvDWL2g/BqY7qmsPrxo5hKa
	fiSaqVFC7Z8bLZv/IJTCD4nIF6UAmWofKTxpndDPrsypaBWXk/w0ha0dRet2WPoKcEQZLdKJ/WU
	qRCICRJlwRN6zP0QcfXC/avtGKZ4zl5hzhnqo3AqKLzGvLJZ47/dwFtzfi/d9gEnXufqczhlnA3
	zNQKm3W57Pu9A581ELW+rISvoT/tz+ZdoWmPNx2dujSiJ6MnfU00Ff83a1MVZ3Y40XM1rdvv0SN
	JFuCL6FF4IQ9rwC+/q3I/eq9D0eg29uyV5tpSIpaCDfwQHgvUofu8j8Am+o8Uq2pYUX0HWOs99I
	9d4L43NQCnHprWPljjpktDDNO/noOxWD3H+9l+g8+Sww08elmr5kt3JGQwqcBxBVFNKAhZjFkd6
	U2s/0qY4vxi9+/RTQ/ARYHOlQv65CW6X0wYlFBACdA
X-Received: by 2002:a05:600c:5304:b0:485:f1d1:8f3d with SMTP id 5b1f17b1804b1-48727d67a43mr23844745e9.6.1774598458837;
        Fri, 27 Mar 2026 01:00:58 -0700 (PDT)
Received: from zovi.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48725fc4827sm12089735e9.11.2026.03.27.01.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 01:00:58 -0700 (PDT)
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
Subject: [PATCH 4/4] module, riscv: force sh_addr=0 for arch-specific sections
Date: Fri, 27 Mar 2026 08:59:03 +0100
Message-ID: <20260327080023.861105-5-petr.pavlu@suse.com>
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

Force sh_addr=0 for all riscv-specific module sections.

Link: https://sourceware.org/bugzilla/show_bug.cgi?id=33958 [1]
Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
---
 arch/riscv/include/asm/module.lds.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/module.lds.h b/arch/riscv/include/asm/module.lds.h
index 1075beae1ac6..9ced27c8ccb6 100644
--- a/arch/riscv/include/asm/module.lds.h
+++ b/arch/riscv/include/asm/module.lds.h
@@ -2,8 +2,8 @@
 /* Copyright (C) 2017 Andes Technology Corporation */
 #ifdef CONFIG_MODULE_SECTIONS
 SECTIONS {
-	.plt : { BYTE(0) }
-	.got : { BYTE(0) }
-	.got.plt : { BYTE(0) }
+	.plt 0 : { BYTE(0) }
+	.got 0 : { BYTE(0) }
+	.got.plt 0 : { BYTE(0) }
 }
 #endif
-- 
2.53.0

