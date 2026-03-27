Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CA03CE49F
	for <linux-m68k@lists.linux-m68k.org>; Fri, 27 Mar 2026 08:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774598466; cv=none; b=RkKFq4go0Xaf5MpXHa2Aj0i54TMxEF+oGdaPNfvImfHn+Va/CYWScTKGR2epjYMXRYEXyzx/OQd9ojPzFWsKt4UyEDbT43jLYiGn5z/TU+2JJj9yDOuOJzSLoEXrHlHOiI1qNEK6TusngZPDAiwztV9BK3uRhIzlnx4SE8Wvbbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774598466; c=relaxed/simple;
	bh=VuK/A2SKkIB8gq+5+JMkruh64JklcZWA+VF4xG65caU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uCRMzzf09vYzGoacr7S1B7H1NXhf9Wzb8+ntXEOnTj7WTbShbZdXL5qxDUOwjy5DPCmQq4YbEuEkrZR68NtSPpcq32whBzlFTDjjUuXkHBaSbHLNnYk2pJ0C5F5XOlstQ1yRRbyHJEHb9g42ozZeXKv0O6k7qkkAW0GahZ9VnJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fQtaaoYW; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fQtaaoYW"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43b87970468so1765212f8f.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 27 Mar 2026 01:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774598459; x=1775203259; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/maIRRXWsco2YLlNLQIg+54XR4CJ2LAx0k8sLQQpIyQ=;
        b=fQtaaoYW8MyAfERexYL6FgcxQ4MOdT2O0me4YdGgXTHV1A+NMliv+e6AUqndEERftk
         PfPuWbV4NKn1oOQqU4NLavxobzWYHfyHdHdpOfxpJY4hd9gt2qF5Bo7WQmS/QBtO1Ee8
         DkyYlfKP+vTAFQQKoKZQA2cCVc3TkVmE4sMhweuUHjCO36/Lp19Cswbq72cm/GKjWL2u
         sG7GqTpF93iW0GLV9x0pot4COwpU378Ni6VqwqeF/MNj62DSj5WsxB/rVshrh95V5ni3
         tVSITSSUan2u2bILmqajlicwx18gzZlqRrKBHdpPOImnUUFZLMxPZATX1F+urdlUMACW
         aDqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774598459; x=1775203259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/maIRRXWsco2YLlNLQIg+54XR4CJ2LAx0k8sLQQpIyQ=;
        b=cCfrPuYZNwc84CyUs9RAK/Io6TnzMLMFx4wXeLr3kNq4309dV5TMplGak6lsQNJ38F
         AR7yScoyOpRd1a5ukWO7oSnYuR3esfYp5XCuUwSrGIAtb9G/7SdMkwrdvzevzDFbZwdi
         yCe+7a0sOalya3S8rC8Bb7q0QQTmvc8P3HPpJvjpZXQtAHNz6RZFhnTV/IzqgXZI1YJg
         4xNQgGRbpOVnEiKjOqUgjZ/j6+1m7SsYhANsnUB1cmJ5YmqLzmL6uLHkMovY3rvoBXdu
         GFnOscmlWDx+M6r5xNYjzoLuDUlarPDYtNpZx2Y0hYT8w/UxVuWrtRWHsE7o+i/9zIHS
         ZpDw==
X-Forwarded-Encrypted: i=1; AJvYcCXnhK3imnDi2BTHxwr2RQALgoUFeZyl3O0cC+jNzgKDcV6JJMOkyS3Yan1esGLObNcNeEfDLAzdMokg@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzvOCZbaKwmG9di6U8S8w2oxU50HNXIPaLMvATg2bdoObrZUV14
	mTZtjt2TALnGQo37CK6olrI+bnZGXnkzuJbuU69xLnacKrUJo5sc/y5yq1R1WZGunsA=
X-Gm-Gg: ATEYQzyP1hXsSbH7rIRSPxJyfOFxgbs5S7RvisdY3qJO71AhLmsUrndX3VNiKlyKbZf
	5mP9g9Cg952dGE058paogz/B2hdXvQufFgaqt0l8aqnc0aF16PXDAJ/LYYKL/vtZPHXEBnJsJEB
	IcKjidh1t7kOB70kbUk0vXUDuEKc54meKcUopemAkJg0JCYfajoM+3Jv2cdHO1dc0XIbLeL3T5Q
	Knb0hsBXk0r+eh2BEtEPHnZ7AZ/wV8XbCSWUnQLYJx4OVxN1JAKMc1Nj9F4L/dkngYR/f5c2AbE
	lq5vhLCUx+zQl6IJuE5OxTR3N/itATikuykekraG24Co0lrDX+t61BWwX9p8gN+aluwYmcLCG2v
	YwyK31U9RlMCiY58ewLvo6H1AtMW37TfAkBdRooWpadkuYazrLa/O7DFH1Az0E6B0gOsR5j8iu3
	g7lHZVJq00+HAAWnE2BQK4Kz40wc/2taNkESsx7UnM
X-Received: by 2002:a05:600c:828a:b0:487:338:b4df with SMTP id 5b1f17b1804b1-48727d8818cmr22261095e9.15.1774598457203;
        Fri, 27 Mar 2026 01:00:57 -0700 (PDT)
Received: from zovi.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48725fc4827sm12089735e9.11.2026.03.27.01.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 01:00:56 -0700 (PDT)
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
Subject: [PATCH 2/4] module, arm64: force sh_addr=0 for arch-specific sections
Date: Fri, 27 Mar 2026 08:59:01 +0100
Message-ID: <20260327080023.861105-3-petr.pavlu@suse.com>
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

Force sh_addr=0 for all arm64-specific module sections.

Link: https://sourceware.org/bugzilla/show_bug.cgi?id=33958 [1]
Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
---
Note that the definition of .text.hot hasn't matched any input sections
since commit 1ba9f8979426 ("vmlinux.lds: Unify TEXT_MAIN, DATA_MAIN, and
related macros"), and even before that with CONFIG_LTO_CLANG=y.

The preceding comment also explains that the directive is necessary to
merge section groups. However, this approach seems suboptimal. A better
method would be to link modules using --force-group-allocation to retain
only one copy of each group.

I plan to look at this separately.
---
 arch/arm64/include/asm/module.lds.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/module.lds.h b/arch/arm64/include/asm/module.lds.h
index fb944b46846d..0b3aacd22c59 100644
--- a/arch/arm64/include/asm/module.lds.h
+++ b/arch/arm64/include/asm/module.lds.h
@@ -14,7 +14,7 @@ SECTIONS {
 	 * directive to force them into a single section and silence the
 	 * warning.
 	 */
-	.text.hot : { *(.text.hot) }
+	.text.hot 0 : { *(.text.hot) }
 #endif
 
 #ifdef CONFIG_UNWIND_TABLES
@@ -22,6 +22,6 @@ SECTIONS {
 	 * Currently, we only use unwind info at module load time, so we can
 	 * put it into the .init allocation.
 	 */
-	.init.eh_frame : { *(.eh_frame) }
+	.init.eh_frame 0 : { *(.eh_frame) }
 #endif
 }
-- 
2.53.0

