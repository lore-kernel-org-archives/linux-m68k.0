Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E3579D8
	for <linux-m68k@vger.kernel.org>; Mon,  5 Feb 2024 02:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707100365; cv=none; b=spRvkgLEZkQR35pD5gLtN3T17MToEqjJRVS7WtClGKsWzVwNr8Jb/9C8HzRibG9HxIYYkjcKM6RzyCkkrwAW+/7RLaCI9LsGFsllwbjSm34NmuKxUJarAVLqb8s7HdYlLV/rgWNOzmypvQ0wsM/v6ofWZ9q0pW/ikNUIbzpesL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707100365; c=relaxed/simple;
	bh=aYoRNslxnnZ1s6WLN9L1+hKwzDPE4KsHkHkKwk2xi+s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=Ak8w199A6L42Ve7oA8bjGuMhFog816Msw/1DwhsTGVAS6vd5mZpH6qL00Xc8KJroyeyO9OZYMDQj4h38y6oO4ThhmJtdy+Zs4z+qlhTgfs0VBTyOItor6i119Q0EOViLn5HBQSO3eHF/MfWbOh8veQ9J5eROIpMu0fGLNC5q9Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RashcNku; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RashcNku"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-295ff33ae32so3307861a91.2
        for <linux-m68k@vger.kernel.org>; Sun, 04 Feb 2024 18:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707100363; x=1707705163; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mOl0pV+g3EvEKg0hpTHF9ImyVqRWqRd0TOgKsYhPTRg=;
        b=RashcNkuBqx3MQgjo3BZcRAPFHJqxq2h6xO+hftDgcQVBLqbLGIOOLBw79nILryZ08
         ETdOfMqMOCAE1+Q6GlzOSkmQqsWZI1rH7zxHpsFT1jaV0IQLYIKLTWetwGHMMyc087ja
         jgubL+h/vD6yIRj5iBV19e+/virURhtEnsFqf9hrmGkgGEEnu0MROsAJK4390CFGF4XE
         zyiMBZSnu4/LZCnPw8eZ3Pe9CuoUVYkrYEJlv0yQPdM9sF+ZytMEk/Eti1ih3Dgv3Fel
         f1vXYaQ9Z1nq9SBD3s6CH+GpM3AB7UkbunI2UX+aXrT1q2Tt4i3GidndDW+duLBIpQhy
         tK6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707100363; x=1707705163;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mOl0pV+g3EvEKg0hpTHF9ImyVqRWqRd0TOgKsYhPTRg=;
        b=FHhZmkKeaWQl+wIxgp8yimUURKu3lzxONYJ99mciYLKzw556PW+fdfQOlgUEfMcEbT
         430BTklXbpDLaBpYWN0IpH13fhSf2rCuYzSMNjgbyIkUHlUdON1nhZ/SA260ih1PiVTL
         Srp3wTZ/r7wLEZ2N6AUivBQ1e71tXAKZm/qWx6RASAkpY8v8tUZuilN7oT84f/p41thC
         +Lq6iYbJKfW69dv329YWqwucJSqtgVeGM65tzkIxy343rBFUO2UvKPTONOV4cIjJN9By
         fYvyYX/XkVHM+QtldIs2lomP00YZqhqUbq9hLogZPaSA+IweG0T6vHbwe73UCdS6Fcqf
         7HGA==
X-Gm-Message-State: AOJu0YzNO2VUrW8SpRc5ckR6oBQBkmb9MqfjJHWkj7UfH//I1MBYvI9n
	Ds7cEWXBFPXbr+DKBXh1b4FeS8s27sKdA/p/oe1EUVb2qxgOUj0cHIhp2ew9
X-Google-Smtp-Source: AGHT+IEp8/+WZaDvp6igiSvqTEWkiK27OeOkYBFPJytALiXxECwqMD+GlXd7Pq2jDzd4+Tvy+fnHYg==
X-Received: by 2002:a17:90a:4a85:b0:296:44f1:e19e with SMTP id f5-20020a17090a4a8500b0029644f1e19emr6452453pjh.22.1707100363647;
        Sun, 04 Feb 2024 18:32:43 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWAWg0KdoUsG8lM261VeLvdMJAM2HcNpOHPa735B3JWhtva9kkq9fHV74mJARrEqt4sksfRKxfh1PBnrlV+bWPW5krbX3CQe+BwP2Pg1BAQP23s2CPUBDNaWIefuQqdzUiB4rKYddfP2OVcdmqFtRmC2KHqmNTcK9ycQM/qqX4t/1iV
Received: from xplor.waratah.dyndns.org (125-236-136-221-fibre.sparkbb.co.nz. [125.236.136.221])
        by smtp.gmail.com with ESMTPSA id j6-20020a170902c3c600b001d932f1b92bsm5099466plj.289.2024.02.04.18.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Feb 2024 18:32:42 -0800 (PST)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
	id 38D5536032D; Mon,  5 Feb 2024 15:32:39 +1300 (NZDT)
From: Michael Schmitz <schmitzmic@gmail.com>
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org,
	uli@fpond.eu,
	fthain@linux-m68k.org,
	viro@zeniv.linux.org.uk,
	Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH RFC v2 2/8] m68k: Only force 030 bus error if PC not in exception table
Date: Mon,  5 Feb 2024 15:32:30 +1300
Message-Id: <20240205023236.9325-3-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240205023236.9325-1-schmitzmic@gmail.com>
References: <20240205023236.9325-1-schmitzmic@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

__get_kernel_nofault() does copy data in supervisor mode when
forcing a task backtrace log through /proc/sysrq_trigger.
This is expected cause a bus error exception on e.g. NULL
pointer dereferencing when logging a kernel task has no
workqueue associated. This bus error ought to be ignored.

Our 030 bus error handler is ill equipped to deal with this:

Whenever ssw indicates a kernel mode access on a data fault,
we don't even attempt to handle the fault and instead always
send a SEGV signal (or panic). As a result, the check
for exception handling at the fault PC (buried in
send_sig_fault() which gets called from do_page_fault()
eventually) is never used.

In contrast, both 040 and 060 access error handlers do not
care whether a fault happened on supervisor mode access,
and will call do_page_fault() on those, ultimately honoring
the exception table.

Add a check in bus_error030 to call do_page_fault() in case
we do have an entry for the fault PC in our exception table.

I had attempted a fix for this earlier in 2019 that did rely
on testing pagefault_disabled() (see link below) to achieve
the same thing, but this patch should be more generic.

Tested on 030 Atari Falcon.

Reported-by: Eero Tamminen <oak@helsinkinet.fi>
Link: https://lore.kernel.org/r/alpine.LNX.2.21.1904091023540.25@nippy.intranet
Link: https://lore.kernel.org/r/63130691-1984-c423-c1f2-73bfd8d3dcd3@gmail.com
Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Link: https://lore.kernel.org/r/20230301021107.26307-1-schmitzmic@gmail.com
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/kernel/traps.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/kernel/traps.c b/arch/m68k/kernel/traps.c
index 6c9ca24830e9..c547140b8325 100644
--- a/arch/m68k/kernel/traps.c
+++ b/arch/m68k/kernel/traps.c
@@ -29,6 +29,7 @@
 #include <linux/init.h>
 #include <linux/ptrace.h>
 #include <linux/kallsyms.h>
+#include <linux/extable.h>
 
 #include <asm/setup.h>
 #include <asm/fpu.h>
@@ -549,7 +550,8 @@ static inline void bus_error030 (struct frame *fp)
 			errorcode |= 2;
 
 		if (mmusr & (MMU_I | MMU_WP)) {
-			if (ssw & 4) {
+			/* We might have an exception table for this PC */
+			if (ssw & 4 && !search_exception_tables(fp->ptregs.pc)) {
 				pr_err("Data %s fault at %#010lx in %s (pc=%#lx)\n",
 				       ssw & RW ? "read" : "write",
 				       fp->un.fmtb.daddr,
-- 
2.17.1

