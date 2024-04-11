Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED7213BADC
	for <linux-m68k@vger.kernel.org>; Thu, 11 Apr 2024 03:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712806600; cv=none; b=gsnAjMxnNkNDvtAXNFzCzv6aIN6hZyuonJENR7Lfjk0DBNWjdtbKIwYHvNZ4ekA9ELVl/wOQbHPVKpXiDVn//mwmLEzbJpvizMYSBUW7G7Vm4hoDkYOFHiM6OJAuQkxuKoHYtYdR/ZwGBYls92ogn7qxBbfn98FsNByiOoe3Qm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712806600; c=relaxed/simple;
	bh=a2DRbjVgBv+GT9QdhTM4FvFxyil+8AZ14CjbmFKA+4U=;
	h=From:To:Cc:Subject:Date:Message-Id; b=qMG2w1pySesRnvFWA0dslt0xdOU8quvGrdPyn9JKnqWSVNWK+Q7KqNVZ2WIrI2TV3myuDj64MgRAEMe1onhH1zlwI+o5NZAl/lXX4EKoGbO8QWC1klvZNElZ6IDEgVW5lXTOXQNZ8LjLr90i8RKqjtpYK6ttkjEgiRtIsbOcfxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=afWku5hH; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="afWku5hH"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6e6b22af648so314220b3a.0
        for <linux-m68k@vger.kernel.org>; Wed, 10 Apr 2024 20:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712806598; x=1713411398; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0yHxhdFARDcGj3BUAtYCNq9IbgHSRjhesHj7wIWRdo=;
        b=afWku5hH9B08MnvZeHX3Hw4dGMEWszUlmkB5NBt204V2vWN99Ay6AuCX9R2HE51y03
         1tzIqvQlHxJqEyftLC9uZoVUSAzH3uZVH1ssYicx5VEX0cjmC7LyDcVXJeQVafO5rd5g
         7Y/IhYPTF73yWGDAfJ6gyHHUqrgcAUFQ9BG35J1wlOt/VPN+mkEEZKmAlSwiJUtF0toC
         b+xlLRW3F/+aau+AtTPA7ZYTh2AN1gIE4fwv0nUZXGEJyip9bLRVxj9WhSbvOEgGcZEi
         SLYTMECKHc/LvdADH0h80fmwZT47usj2aCckdwnlzhpMZmWMAWEg/NDF6NXhPW2yGUXJ
         dKQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712806598; x=1713411398;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e0yHxhdFARDcGj3BUAtYCNq9IbgHSRjhesHj7wIWRdo=;
        b=ni4nuFJzCM8kPs7KfFCVhQLTrHfATACKoxTjS2t1U10iA7lg4PDCtuPvPOx++EJ0HT
         Q11GreQc84r8hVMsbusAICs4CRlx5GgRdNwoVLYb/i1IAHHe1CeH5WhkGANhYmHdI/FP
         J0a2+2QFZfS+DOaitUoTharxi+QmlQdYXccjDBUnylVGNe8OUfsbRwyBF8ZKrXvIfn1W
         2gsLl6SFONzp9XDUpheyF7X8Q6cnRT65IYR4ssdl6ZPGGTXzpt1UQLaqL5oMynqqJa5/
         Rtb5KrO/vllsVApW5XSHFlNC6UuOJkz9skatdTHbk0I38SyD+AC3bdw1F/pITCkKKoCY
         vfhw==
X-Gm-Message-State: AOJu0Yz9mFAuUOXhq/DUVPQ69oLWLFTbcGDT5qVC1uaEmUC6RV67v6AR
	DnyoCCTjCc7yOX1GWYbSIloBG7fQ7yOfHTpYSwlsFYtNHaV+WOcU
X-Google-Smtp-Source: AGHT+IH9Oqxv8tyTyj7/VNYU545lMdeWIcSlcAWL30ijyZgou5sOr8xymBxwnom5uVTmSePdFpFtPA==
X-Received: by 2002:a17:902:e811:b0:1e3:cb8d:e28f with SMTP id u17-20020a170902e81100b001e3cb8de28fmr1932691plg.31.1712806597913;
        Wed, 10 Apr 2024 20:36:37 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (222-152-175-63-fibre.sparkbb.co.nz. [222.152.175.63])
        by smtp.gmail.com with ESMTPSA id i5-20020a17090332c500b001e546a10c50sm298162plr.286.2024.04.10.20.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 20:36:37 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
	id 9C17C360312; Thu, 11 Apr 2024 15:36:33 +1200 (NZST)
From: Michael Schmitz <schmitzmic@gmail.com>
To: linux-m68k@vger.kernel.org,
	geert@linux-m68k.org
Cc: schmitzmic@gmail.com,
	Guenter Roeck <linux@roeck-us.net>,
	Finn Thain <fthain@linux-m68k.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	stable@kernel.org,
	linux-m68k@lists.linux-m68k.org
Subject: [PATCH RFC] m68k: fix spinlock race in kernel thread creation
Date: Thu, 11 Apr 2024 15:36:31 +1200
Message-Id: <20240411033631.16335-1-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

Context switching does take care to retain the correct lock
owner across the switch from 'prev' to 'next' tasks. This does
rely on interrupts remaining disabled for the entire duration
of the switch.

This condition is guaranteed for normal process creation and
context switching between already running processes, because
both 'prev' and 'next' already have interrupts disabled in their
saved copies of the status register.

The situation is different for newly created kernel threads.
The status register is set to PS_S in copy_thread(), which does
leave the IPL at 0. Upon restoring the 'next' thread's status
register in switch_to() aka resume(), interrupts then become
enabled prematurely. resume() then returns via ret_from_kernel_thread()
and schedule_tail() where run queue lock is released (see
finish_task_switch() and finish_lock_switch()).

A timer interrupt calling scheduler_tick() before the lock is
released in finish_task_switch() will find the lock already taken,
with the current task as lock owner. This causes a spinlock
recursion warning as reported by Guenter Roeck.

As far as I can ascertain, this race has been opened in commit
533e6903bea0 ("m68k: split ret_from_fork(), simplify kernel_thread()")
but I haven't done a detailed study of kernel history so it
may well predate that commit.

Interrupts cannot be disabled in the saved status register copy
for kernel threads (init will complain about interrupts disabled
when finally starting user space). Disable interrupts temporarily
when switching the tasks' register sets in resume().

Note that a simple oriw 0x700,%sr after restoring sr is not enough
here - this leaves enough of a race for the 'spinlock recursion'
warning to still be observed.

Tested on ARAnyM and qemu (Quadra 800 emulation).

Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Finn Thain <fthain@linux-m68k.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: stable@kernel.org # 3.6
Cc: linux-m68k@lists.linux-m68k.org
Link: https://lore.kernel.org/all/07811b26-677c-4d05-aeb4-996cd880b789@roeck-us.net
Fixes: 533e6903bea0 ("m68k: split ret_from_fork(), simplify kernel_thread()")
Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
---
 arch/m68k/kernel/entry.S | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/kernel/entry.S b/arch/m68k/kernel/entry.S
index 9933679ea28b..681c008270dc 100644
--- a/arch/m68k/kernel/entry.S
+++ b/arch/m68k/kernel/entry.S
@@ -446,7 +446,9 @@ resume:
 	movec	%a0,%dfc
 
 	/* restore status register */
-	movew	%a1@(TASK_THREAD+THREAD_SR),%sr
+	movew	%a1@(TASK_THREAD+THREAD_SR),%d0
+	oriw	#0x0700,%d0
+	movew	%d0,%sr
 
 	rts
 
-- 
2.17.1

