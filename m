Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C04B3CD8C6
	for <linux-m68k@lists.linux-m68k.org>; Fri, 27 Mar 2026 08:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774598462; cv=none; b=obl1KiTad2VEMRMx2tVyr9WMUvaBO8p9XzoDPkxjTrCBM7TPKexskxTp3NhoLScfkLxDlMSUVP2RtwlO4ky2nQWUka7O5pU+0ewwI+Cc4kuIeGThO7Fe0d0EM1ug1vh14Gc3JF4yEsgmwDjNFsSzA7UWrPoFw1l3KCXHAUM3MJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774598462; c=relaxed/simple;
	bh=W07Ke74xlJ9FViATMy7TNPyWUyJiXufTMF7faALrZ6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kkr9VmiqRszhb448agtwsk+xkKj4WLObU66M+hdddTbnO9U5EIQ9luDe2gYqvlZ6FFJ8T1+vYvj/Hl5ytrszDK1T9BrH9hbiiDfUV3QhtquR7K18bYDEVQzH6fJt8fgNadR7Tr/LWpbni49orhaZ+kN0jqPlI6Bto+KFCWQLhag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=WK70DkuC; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="WK70DkuC"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-486fba7ce4cso18453725e9.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 27 Mar 2026 01:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774598455; x=1775203255; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VdbZVRP/Ak929baCc2EeOgVlzDU6Wbl9p0jTnb7CIGk=;
        b=WK70DkuCaIbqy7rB8mhPxrSRvzXzO5p7h59oDBPii4kyhZfEpt5opRbCQkdo8u/f22
         R8lWKrquurx5FbBegbTxw4p0OzB92blFyvmJtOZmreuz3o4fBrStlv59p4HDgUAPkNR8
         rjIFYL3urFHrLhxQRRtNG/uLXXfMgG7EuZcDDvbd9NCGBpzCFJPo5sED6ukVbEWM6mcS
         Shhhlb5m3i6GT8GGLbq1CDdmdYAz1ZJ0SUzBn/5LksHmw0WQgwse4a8MN9vJX5JGqZjz
         dM3bJN+jOwSQsPzzjQlGzOH+k3Ex+VSC4PBd3rHRLSBxWtVwXWcoXP3PYYUwpYvrboql
         Zi7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774598455; x=1775203255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VdbZVRP/Ak929baCc2EeOgVlzDU6Wbl9p0jTnb7CIGk=;
        b=sBLcrYX6ZcqzYpvYKHmivQp788Q1M7I0CStO3D7BsgdVRuMOt54fNSpHVrw2ZWpP0K
         vP563FcYIXBgUS6BbY0DextolpNxgJ8QVal2yj7FxFJbc+603JIF4+b/4dxa4mEWVOoy
         v0FHLJFD42fmiQlXQqRvRVQm3vf/kofDjLJGzl2z9sRY/oF6PiQU9cGJgJhT+A7rmugx
         h3XqkwLh0Lw9JIaUoy/ayhfwJPnYR84m2nQlQudqOjDgaQ3zFfy+nFPnwLXwylxUq9pZ
         tKKWYu+17JCiYR0B8FNBjkjGQb3LnXli6bBKyu37bth0rEvyghb4msC2J/VRyxVr9J69
         3EEg==
X-Forwarded-Encrypted: i=1; AJvYcCUErC+9fSOaUVdx4nMfS+EAmZ+nYIX9jNTLkC9JfcbfrqEaX/SQGk4Z3RBtfq4cq9OIFh4wsQDZ6atJ@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwcNMjX8RQf/4KrpfZho/Fz+8LivjLerDG6YI5R+wC8kUO3m3CV
	hrhmHvZQlvnTvKfS49uVACljkvLB2R+zoHoJYvZobevChSBx8PwhOwMCMAEp9vrsugE=
X-Gm-Gg: ATEYQzzzDmIHhoVEx3wQQTqHTPZsLrpjyUkcQVZnZ0Hs+297ZuI7tEWI5p7tXpoLzym
	VJqUjO4t1szZ8AtY0IXp9wHtW6m2JQBZ89zSAgR9h+/GkpTufZ8A+khqaY18Jqyas9G6vmlJ+e2
	c62PE803w3WnYwNwafCQrHWkTlVXxJ1zlteCr4RwsPXnbBSZzviraERlKUHP+ob6jsxlex9mAn9
	DeKRzD86xFskCRxv9pvSJ4Ydit6PTfIO68u6e1u69+E2sLyCuDtwK3W/oBrsOdvLv+3zbg8oxyE
	Zvv+NSkQfzE/8VMPUAGUeeTPSRDRh3oveFSE5bPT3x5X0h+evDxTM9PlgHh5NW5hraCddUUNLeH
	eXM+5ToB7cwl/YukuZpZFyQN+n/o5nAlGNNvI0kQgmKhGS2TslkUX9o+MMwzpbBT3uohRWLJJ2Y
	xG8GbXf/8RU1De5PtkEsxFQUxRluugYswRIeahT8SEqsCVDXIRKUI=
X-Received: by 2002:a05:600c:8b6e:b0:487:716:2fa9 with SMTP id 5b1f17b1804b1-48727e883c4mr23399585e9.13.1774598455233;
        Fri, 27 Mar 2026 01:00:55 -0700 (PDT)
Received: from zovi.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48725fc4827sm12089735e9.11.2026.03.27.01.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 01:00:54 -0700 (PDT)
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
Subject: [PATCH 0/4] module: force sh_addr=0 for arch-specific sections
Date: Fri, 27 Mar 2026 08:58:59 +0100
Message-ID: <20260327080023.861105-1-petr.pavlu@suse.com>
X-Mailer: git-send-email 2.53.0
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

Joe Lawrence previously addressed the same issue in the main
scripts/module.lds.S file [2] and we discussed that the same fix should be
also applied to architecture-specific module sections. This series
implements these changes.

The series can later be merged through the modules tree, or individual
patches can be applied through the architecture-specific trees.

[1] https://sourceware.org/bugzilla/show_bug.cgi?id=33958
[2] https://lore.kernel.org/linux-modules/20260305015237.299727-1-joe.lawrence@redhat.com/

Petr Pavlu (4):
  module, arm: force sh_addr=0 for arch-specific sections
  module, arm64: force sh_addr=0 for arch-specific sections
  module, m68k: force sh_addr=0 for arch-specific sections
  module, riscv: force sh_addr=0 for arch-specific sections

 arch/arm/include/asm/module.lds.h   | 4 ++--
 arch/arm64/include/asm/module.lds.h | 4 ++--
 arch/m68k/include/asm/module.lds.h  | 2 +-
 arch/riscv/include/asm/module.lds.h | 6 +++---
 4 files changed, 8 insertions(+), 8 deletions(-)


base-commit: c369299895a591d96745d6492d4888259b004a9e
-- 
2.53.0

