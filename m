Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7344C2231C
	for <linux-m68k@vger.kernel.org>; Tue, 16 Apr 2024 20:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713299814; cv=none; b=Z4w6G51UU2qXCFXrjBee/xOz7yNTwrSB6gOMfr8RzxNMdhqsohOzpNdzMXaFDNDae+B9p1acIxtOXH6Ok7RH1S1Gtsnz67LY8W5vLhZB9tcrqTI5JJuuRj4gty6t/oTK0ArOXdr4DGSKDbWEyz49P5pQXC5W8LBa62XfpFZ/hMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713299814; c=relaxed/simple;
	bh=i1RpESy58abUYCTzeg4RrUVJLMeN8WYwcbtPFHpsXwI=;
	h=From:To:Cc:Subject:Date:Message-Id; b=sIYv+55yVcM0tRkp/p6PZZERqiBJ9V3EmOiWUH9C6KeZ/J+ufFZVn2YXv3X4JsE8+QnUYb77gBB2yj5qRDNba2vengrl8YCddk5ulZ7uZRIauUPfgwmULSCazldhjNduD5UQZR8h8TKIcliekR0Ld9JLQ2M9nG/aty3Fia+vfWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F/LIW3WD; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/LIW3WD"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2a2f82ded89so3193046a91.1
        for <linux-m68k@vger.kernel.org>; Tue, 16 Apr 2024 13:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713299812; x=1713904612; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5eEfRXRltAM0zGEEEjHREWwXg8zjXVlrKI6AGqKgoGk=;
        b=F/LIW3WDKqQWCh34vCMBVtVccLRfP+i+3L5dSFjLKxXqsLBOayEUQ2nk2/olJV2/oI
         zNjIA5EEBIh+TTaNP5hfAJvU1RwaNj17L0bdqpvrtmB+67fY2FbmSJNcDzXjBI6IsvOI
         jElCLFVvWjFQvNcHKDA6PmfynVGx8ATsP2D/C77lWuO0uACZCIWY23Ddanhw1C8Myj+6
         P0yJNeTO2ASdP9lap7+6Ep38s8ijj8jZ9b2AkwH+XanYuzKHqrmF2rLbmvi62LyHwBZh
         dzehecyKN/JbUwXCdjYuNRSPdZw3EhFGYd4kYkNNtSUKDvhjtdESLP/KdQ5JYsTLjbwF
         kYEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713299812; x=1713904612;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5eEfRXRltAM0zGEEEjHREWwXg8zjXVlrKI6AGqKgoGk=;
        b=eMhFPpXNDPywhBY4XuqKJWVtSc04mWF1xHkw3DUBziGdJLlJhToFH/HSftaoTShaE0
         YPByo15dK8zyw+XxVJEzkiNwoP6cBdDUhBZMm+2tpkPfMLS8AuZsMt9mM0U+JEcQIHBC
         8ZyFDJvFgfAY+GUzh1UVpV8Us2EKucDgq1G6AplfuMzK5+Xipdl413tp49MNIx9QoAjD
         rP8PN0uAi2NhRAN1dJNy3yCF162qzjIkclZ1y149lixS+YeccUhPKeRAETeo/FRK1qFz
         r66dWp42I2h1UvMNv5BGtY4DGwzA12vApPZ8YKwCpyyOEL4k0TEZZlluJeNwoNhjT9h7
         qwMw==
X-Gm-Message-State: AOJu0Yx4uqhErZdyFSWx6XTHCYalMDlw9S3lmjRdkP83cHO6+ELrUzqw
	u+pKkEoe7tLlYs1Upre/rigCYtQo+SlwBV0fv6onh7p+qUYLCHIEtN4yXw==
X-Google-Smtp-Source: AGHT+IGiIXp0WWPZZAlbJR98oPZdwkaHhy26j/Sh4e1+uzp8oHkQMwx75uNL7tBWxIQEZOKlwIfYcg==
X-Received: by 2002:a17:90a:e50e:b0:2a5:6e51:eebd with SMTP id t14-20020a17090ae50e00b002a56e51eebdmr14966736pjy.23.1713299811587;
        Tue, 16 Apr 2024 13:36:51 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (222-152-175-63-fibre.sparkbb.co.nz. [222.152.175.63])
        by smtp.gmail.com with ESMTPSA id m15-20020a17090b068f00b0029b59bf77b4sm9844pjz.42.2024.04.16.13.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 13:36:51 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
	id 62DEF36027A; Wed, 17 Apr 2024 08:36:46 +1200 (NZST)
From: Michael Schmitz <schmitzmic@gmail.com>
To: linux-m68k@vger.kernel.org,
	geert@linux-m68k.org
Cc: schmitzmic@gmail.com,
	Finn Thain <fthain@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org
Subject: [PATCH RFC] m68k: Handle __generic_copy_to_user faults more carefully
Date: Wed, 17 Apr 2024 08:36:43 +1200
Message-Id: <20240416203643.3390-1-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

As mentioned by Finn Thain in his patch to improve put_user
exception handling on 040, a similar problem exists on 030
processors.

A moves instruction that crosses a page boundary from a
mapped page into an unmapped one will cause a mid-instruction
bus error exception (frame format b), with the PC pointing
two instructions past the faulting movesl instruction.

Our exception handling in __generic_copy_to_user only covers
the instruction immediately following the faulting one. As
a result, fixup_exception in send_fault_sig does not detect
this case, and cause send_fault_sig to oops.

Addition of a NOP does avert the fault in this case also.

I have tested this fault scenario with a transfer beginning
at a single byte at the end of a mapped page only, which IMO
does violate m68k alignment rules. I cannot remember ever
seeing such faults reported from conforming software before.

Fault Oops:

[3432825.940000] Unable to handle kernel access at virtual address 45e80efc
[3432826.000000] Oops: 00000000
[3432826.040000] Modules linked in: ne 8390p
[3432826.110000] PC: [<003217de>] __generic_copy_to_user+0x22/0x40
[3432826.150000] SR: 2200  SP: 3ae57f7e  a2: 00781db0
[3432826.200000] d0: 00000002    d1: 00000002    d2: 2f686f6d    d3: 009d7000
[3432826.250000] d4: 00000400    d5: c0014fff    a0: 009d7ff6    a1: c0015003
[3432826.310000] Process badaddr (pid: 7538, task=94e249df)
[3432826.350000] Frame format=B ssw=0739 isc=6706 isb=0001 daddr=c0015000 dobuf=2f686f6d
[3432826.420000] baddr=003217d8 dibuf=2f686f6d ver=f
[3432826.460000] Stack from 00c7df88:
[3432826.460000]         0000000e 0010f1b6 c0014fff 009d7ff2 0000000e 00000400 c0014fff c0014fff
[3432826.460000]         00000400 00674cd0 00da76c0 00674cd0 0073bbd0 009d7ff2 00000ff2 effffc4c
[3432826.460000]         000026c6 c0014fff 00000400 c0014fff c0014fff 00000400 80002dec effffcec
[3432826.460000]         80002db0 000000b7 000000b7 00000000 0208c00b 91700080
[3432826.690000] Call Trace: [<0010f1b6>] sys_getcwd+0xfe/0x11c
[3432826.750000]  [<000026c6>] syscall+0x8/0xc
[3432826.790000]
[3432826.830000] Code: 226f 0008 4a80 670a 2418 0e99 2800 5380 <66f6> 0801 0001 6706 3418 0e59 2800 0801 0000 6706 1418 0e19 2800 241f 4e75 2f02

Disassembly (from a different kernel image but same code, fault PC 0x1a3476 here):

001a3454 <__generic_copy_to_user>:
  1a3454:       2f02            movel %d2,%sp@-
  1a3456:       222f 0010       movel %sp@(16),%d1
  1a345a:       2001            movel %d1,%d0
  1a345c:       e488            lsrl #2,%d0
  1a345e:       7403            moveq #3,%d2
  1a3460:       c282            andl %d2,%d1
  1a3462:       206f 000c       moveal %sp@(12),%a0
  1a3466:       226f 0008       moveal %sp@(8),%a1
  1a346a:       4a80            tstl %d0
  1a346c:       670a            beqs 1a3478 <__generic_copy_to_user+0x24>
  1a346e:       2418            movel %a0@+,%d2
  1a3470:       0e99 2800       movesl %d2,%a1@+
  1a3474:       5380            subql #1,%d0
  1a3476:       66f6            bnes 1a346e <__generic_copy_to_user+0x1a>
  1a3478:       0801 0001       btst #1,%d1
  1a347c:       6706            beqs 1a3484 <__generic_copy_to_user+0x30>
  1a347e:       3418            movew %a0@+,%d2
  1a3480:       0e59 2800       movesw %d2,%a1@+
  1a3484:       0801 0000       btst #0,%d1
  1a3488:       6706            beqs 1a3490 <__generic_copy_to_user+0x3c>
  1a348a:       1418            moveb %a0@+,%d2
  1a348c:       0e19 2800       movesb %d2,%a1@+
  1a3490:       241f            movel %sp@+,%d2
  1a3492:       4e75            rts

Cc: Finn Thain <fthain@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Link: https://lore.kernel.org/all/e0f23460779e6d16e2633486ac4841790ef2aca0.1713176294.git.fthain@linux-m68k.org
Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
---
 arch/m68k/lib/uaccess.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/arch/m68k/lib/uaccess.c b/arch/m68k/lib/uaccess.c
index 7646e461aa62..48643ef46900 100644
--- a/arch/m68k/lib/uaccess.c
+++ b/arch/m68k/lib/uaccess.c
@@ -60,20 +60,23 @@ unsigned long __generic_copy_to_user(void __user *to, const void *from,
 
 	asm volatile ("\n"
 		"	tst.l	%0\n"
-		"	jeq	4f\n"
+		"	jeq	5f\n"
 		"1:	move.l	(%1)+,%3\n"
 		"2:	"MOVES".l	%3,(%2)+\n"
-		"3:	subq.l	#1,%0\n"
+		"3:	nop\n"
+		"4:	subq.l	#1,%0\n"
 		"	jne	1b\n"
-		"4:	btst	#1,%5\n"
-		"	jeq	6f\n"
-		"	move.w	(%1)+,%3\n"
-		"5:	"MOVES".w	%3,(%2)+\n"
-		"6:	btst	#0,%5\n"
+		"5:	btst	#1,%5\n"
 		"	jeq	8f\n"
+		"	move.w	(%1)+,%3\n"
+		"6:	"MOVES".w	%3,(%2)+\n"
+		"7:	nop\n"
+		"8:	btst	#0,%5\n"
+		"	jeq	11f\n"
 		"	move.b	(%1)+,%3\n"
-		"7:	"MOVES".b  %3,(%2)+\n"
-		"8:\n"
+		"9:	"MOVES".b  %3,(%2)+\n"
+		"10:	nop\n"
+		"11:\n"
 		"	.section .fixup,\"ax\"\n"
 		"	.even\n"
 		"20:	lsl.l	#2,%0\n"
@@ -85,10 +88,13 @@ unsigned long __generic_copy_to_user(void __user *to, const void *from,
 		"	.align	4\n"
 		"	.long	2b,20b\n"
 		"	.long	3b,20b\n"
-		"	.long	5b,50b\n"
+		"	.long	4b,20b\n"
 		"	.long	6b,50b\n"
 		"	.long	7b,50b\n"
 		"	.long	8b,50b\n"
+		"	.long	9b,50b\n"
+		"	.long	10b,50b\n"
+		"	.long	11b,50b\n"
 		"	.previous"
 		: "=d" (res), "+a" (from), "+a" (to), "=&d" (tmp)
 		: "0" (n / 4), "d" (n & 3));
-- 
2.17.1

