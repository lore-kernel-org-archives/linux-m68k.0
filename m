Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7D23CE487
	for <linux-m68k@lists.linux-m68k.org>; Fri, 27 Mar 2026 08:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774598464; cv=none; b=ZpzyfKP02nigkdn9OyWg0mIgl6qZ7i/o0sXgubdc/w6340RzHD95TSDsA9joom04W9huvSbZqRK9J28EVeHPYh3B7NBbqe06EvhSFdgsr3RcbUgCanmMHEz8SnNnLlDPf121OkoAab/AMwlfjTNQJNbYsLFVRCTYRFmj6JqsUow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774598464; c=relaxed/simple;
	bh=R5/wNfEI166VxEYxX5DKzfd4I8QXDSJZsCGNJsyOgQc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MzBIxzPRvQjVlF9Xw7LemlR0BaWH/ctofsdPT34o3zF/qob+7kLnnG4+UvcydNE1nlPuz8Fh6ehLcipUt/N8ReEG+puGZqjRbYEixZ9NhdvNbTIlw4VMgoh0gd+jplVlllo0kwU7/CqzMHDljR2sxuEy0wOvLeDaacBmKWcEBwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=QzpQWALc; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="QzpQWALc"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-483487335c2so19482975e9.2
        for <linux-m68k@lists.linux-m68k.org>; Fri, 27 Mar 2026 01:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774598456; x=1775203256; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2HryrWoWtiuMl3LNqbcdlk98yeRL5cKfDbuBDTCXl6o=;
        b=QzpQWALcHyVm1QB6LbqJH7/pN5jx24hXioYNyuN9cUtx1saMVoQFa188o8m+3Lszlv
         441uEGPlm30hnrNq+N3p428mvJDpKTFoweFAdxjWtBiahO2q0SxrkNpUSNSaawo1gq2F
         5yzwhnagLROmAO8BQdwJaDvdJhkLNy31/XIceyPqb+OjDG6Ty/Q4Hc0qPU+Fc0IrDHWp
         QN/Y/82+5n6jQQRysIQ2xc3T1O7t8WYxQAPs5Z2XgIrt4ya881AZ409XbYtFGyCy85IO
         J8/V6h+lN8hvdEquyBwGky7rSfhZJJxo9QuF9DqUtpjIM/F90Mv2oH+irfF3WbnAGHYw
         kI3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774598456; x=1775203256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2HryrWoWtiuMl3LNqbcdlk98yeRL5cKfDbuBDTCXl6o=;
        b=TZjVOY9wn3ST4wjwABWF/l9Utc+6aJbxthlSTx9fUh1f1vhXcND8uELSyhqAeez2NT
         kVa62wWws784dJbiY+gJ0wjpUfMPmCuDpTuSYhWWbGKtmWdsvQht19cdQZKIXxUNJmDA
         qCHle3xasKcGRjKtkK1RLKzUs+2niOYdrXlHdLeKoRcIJrwQhA5TtO/YdgtUhcAs4Lne
         EDwjCqWzy75+3/JpIPtXkiLlL942x9DE7WLv7t+f2RCGvNPLi99zBBHN+nhgUeNIN3oL
         Feb/CnrBWNaHVr3iDk4zZgBmVbEeeXqH2Oq2Voehf7o78DRjakAui+VsmYsLeKvqavNt
         T/Sg==
X-Forwarded-Encrypted: i=1; AJvYcCWf6w7KX6EE7E3FyPNs2HRLaZr8FzulEP22IfJztRp15LoZPlyunHp4PtTpmZgNEpyUp85niYWl6Ujj@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyLd3CACUfbZL7JZFDM4e0XqlxNOnHcxY5vmQ09rowDgLnT+Jox
	7CPNyNQnmjRqZGHGnnO1hAROECrTAO2CHDtE0cxcMi60AAl/Ph90z7Q4zMl2OgM/al8=
X-Gm-Gg: ATEYQzyZi3HgVIIBhvkOl3BIGDjv7PPLdq5yqJt2eB10Fw7gCANN9+HoKJRagWaFQuG
	jLvPRpfR3YptsV+z1Xz8Rh/0NMpavzCXy+R4+r+OlnrbFiX3TDkPBxiPlH+pu02u/2nOJrJ+Rb9
	IUWjxKZKwuYewdOgHiTnz5kZPxgelni8aaSdHDzC+8rHecDHxF91Tb7WR/cfgphZ8CvpgbpEtUw
	fcuyTZqx0+FHM2DawWQWVoyn60ohdP22671BOLQG/7nueOXoHhLeoDqrClFSK90sjYgYewA/25w
	7hDuh/f37yGa2s/Xi+89h904O7TFF6eTtZIRlAMNWwu2ua0uyMYeVSZvguJGSt5xl4XyKtDF/EJ
	EdhGNRJL/LTzPpz77SfVIpSEwpc7K+lDnc2iyHCf+HK6AvohPAxB30Nnh5Y42CE3EiS/aftmu4H
	JBpKSrs8D4qaJMsK0fl3qF1bsWgzgTzjJLt1OrqWNN
X-Received: by 2002:a05:600c:5249:b0:487:386:3714 with SMTP id 5b1f17b1804b1-48727f7bb08mr24460995e9.17.1774598456054;
        Fri, 27 Mar 2026 01:00:56 -0700 (PDT)
Received: from zovi.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48725fc4827sm12089735e9.11.2026.03.27.01.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 01:00:55 -0700 (PDT)
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
Subject: [PATCH 1/4] module, arm: force sh_addr=0 for arch-specific sections
Date: Fri, 27 Mar 2026 08:59:00 +0100
Message-ID: <20260327080023.861105-2-petr.pavlu@suse.com>
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

Force sh_addr=0 for all arm-specific module sections.

Link: https://sourceware.org/bugzilla/show_bug.cgi?id=33958 [1]
Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
---
 arch/arm/include/asm/module.lds.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/include/asm/module.lds.h b/arch/arm/include/asm/module.lds.h
index 0e7cb4e314b4..f9ad774b2889 100644
--- a/arch/arm/include/asm/module.lds.h
+++ b/arch/arm/include/asm/module.lds.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #ifdef CONFIG_ARM_MODULE_PLTS
 SECTIONS {
-	.plt : { BYTE(0) }
-	.init.plt : { BYTE(0) }
+	.plt 0 : { BYTE(0) }
+	.init.plt 0 : { BYTE(0) }
 }
 #endif
-- 
2.53.0

