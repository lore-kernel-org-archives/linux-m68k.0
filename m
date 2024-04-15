Received: from wfout2-smtp.messagingengine.com (wfout2-smtp.messagingengine.com [64.147.123.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5341940875
	for <linux-m68k@lists.linux-m68k.org>; Mon, 15 Apr 2024 10:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713176348; cv=none; b=rjc6/TRJyTFzmF90eOpxjJP339qO5HjP27zCEZ7d2+8K7CdWuhwSJ/DQwM1Tdz6iMie7VNe278D5RrbUB+OoSbxoVSfOqAJLbpALZHs5gj2PNqKYLo+4+1PKIctUobternN5Bbmn97Dbi2nxRYIXm9vJWX+N2uQRApothz/jEys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713176348; c=relaxed/simple;
	bh=6nN6MbI77blLPCjE6giczrExAve9ukftMSZBYt5NhnA=;
	h=To:Cc:Message-Id:From:Subject:Date; b=Esek0rmjH9u74W7fuKnsYid0O3NiwE1bZP+47B/LrBRe5YZI015qFDlG0bx9Kq4ykRXpMFuLIwVUdyWALZ/CHr/qk6zoRB+RGa0oGQCgYLNn+i791Hou/zMGz+2UxyEqd4SBa3GWjYvPM2kMJVe5dMhsme/D8tervgH5U1Lnv1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=V7KAwH8M; arc=none smtp.client-ip=64.147.123.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="V7KAwH8M"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.west.internal (Postfix) with ESMTP id E6E981C00120;
	Mon, 15 Apr 2024 06:19:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 15 Apr 2024 06:19:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1713176343; x=1713262743; bh=Oqt8fo3dFnE04
	oUK/gwft0EY+mDrlDw2jWS7ZRY93hU=; b=V7KAwH8MVld6Fc3WqAE/45utTn2JA
	Vw1yjaZGkb0twK8JTI+EDPiJG2YEuY2GpLd3hd9KdO+AUNU5kLem+g5sUSbMKihd
	f34FmiuegqgZcOTneu18IHfHGOPm09I9WDLadfnlG0PgCGRYdkbaG6I2E+zt10fm
	0AIUpOyGrbx0fKhQPiKLC3oV4N4TzOvZlCg7Ogh8aO8HlOh6FQ+ee2RKEGFG5nQr
	O1qw8vVLwp7+igmlVYL9bHQQJV+f4wOpLNSwz6YmxlXPfshcNKM0I3ebcqSvz5ma
	g7L3XDwIxv2GEU6krvsVwf5iYKLw4hznVCUXoIdjusysF5rRvvUy9hyaQ==
X-ME-Sender: <xms:F_8cZiYSycHLoVtA7_PJvKK3T_axwQmTYW-nSRtX74U2n0qJ3CKR1g>
    <xme:F_8cZlb66B8vCnkwU5QTBihrboyPbMoTyDfIIILP_ghKOLbdcVG2F8Kj0rgWvVaOV
    SEjglIbr3xgRCdtBIY>
X-ME-Received: <xmr:F_8cZs8yxDk2ABBxuUHptJfLmNY296HflQ9m8o1GIyxGIEow83Nio92q7cZx0RBeM901In8mGESfvvNSLUZaBsC4etrRGtmsskY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudejvddgvdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepvfevkffhufffsedttdertddttddtnecuhfhrohhmpefhihhnnhcuvfhhrghi
    nhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrghtthgvrh
    hnpeehfffggeefveegvedtiefffeevuedtgefhueehieetffejfefggeevfeeuvdduleen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrg
    hinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:F_8cZkoI53vyJQADfWK8IQyAyEfV4D3APHQoJROW3IwO-tC6ulGHaQ>
    <xmx:F_8cZtrHTF_A3rFSjB-UR6Rg7aSQj8VvGLlDfBA97R1mZDMKG7z45g>
    <xmx:F_8cZiSQHVl2W_XSplX8nKCTI8qcR1YDb30OjFw1skGFn6kLrIJcUw>
    <xmx:F_8cZtpI5Axs0mlETaPxXVvXftUSbKq2Beoiq7M_vgq30WKBSc91GA>
    <xmx:F_8cZuAS97rpZdSKAYD-S0BE7IjwyssWHD7I1VUPEjf3i4MAMizRt_0N>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Apr 2024 06:19:00 -0400 (EDT)
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: linux-m68k@lists.linux-m68k.org
Message-Id: <e0f23460779e6d16e2633486ac4841790ef2aca0.1713176294.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [RFC PATCH] m68k: Handle put_user faults more carefully
Date: Mon, 15 Apr 2024 20:18:14 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

Running 'stress-ng --sysbadaddr -1' on my MC68040 system immediately
produces an oops:

    Unable to handle kernel access at virtual address f1c422fb
    Oops: 00000000
    Modules linked in:
    PC: [<00005a1a>] do_040writeback1+0xae/0x160
    SR: 2010  SP: 96087dc2  a2: 01500000
    d0: 00000000    d1: 014e8000    d2: 00000081    d3: 00000000
    d4: 00000481    d5: c043dfff    a0: 014e8000    a1: 00632fd5
    Process stress-ng (pid: 221, task=1b729d30)
    Frame format=7 eff addr=014e9eb8 ssw=0c81 faddr=c043dfff
    wb 1 stat/addr/data: 0001 00000481 c043dfff
    wb 2 stat/addr/data: 0081 c043dfff 2f746d70
    wb 3 stat/addr/data: 0005 014e9ed4 2f746d70
    push data: c043dfff 800daa70 00000000 014e9f1c
    Stack from 014e9ed4:
      2f740000 8017c000 014e9f10 00006830 00000081 c043dfff 2f746d70 2f746d70
      0081a000 00000400 c043dfff 800daa70 c043dfff 80016a20 00000003 014e9f88
      000026c8 014e9f1c 00000001 2f746d70 0081a000 00000400 c043dfff 0081afff
      c043dfff 01500000 00000001 ffffffff 00000000 20000046 41d67008 014e9f58
      04810005 00810045 c043dfff 014e9f84 2f746d70 c043dfff 2f746d70 c043dfff
      80016a20 8017c000 00000000 0081affb 00000005 014e9fc4 00128bc6 c043dfff
    Call Trace: [<00006830>] buserr_c+0x510/0x698
      [<000026c8>] buserr+0x20/0x28
      [<00128bc6>] sys_getcwd+0xc8/0x15a
      [<000027a2>] syscall+0x8/0xc
      [<0008800d>] sanity_check_segment_list+0x17/0x11e

    Code: 000c 0e90 1800 220f 0281 ffff e000 2041 <2228> 0008 0281 00ff
          ff00 67a4 6026 4280 122e 0013 206e 000c 0e10 1800 220f 0281

0000596c <do_040writeback1>:
    596c:       4e56 fffc       linkw %fp,#-4
    5970:       2f02            movel %d2,%sp@-
    5972:       202e 0008       movel %fp@(8),%d0
    5976:       4282            clrl %d2
    5978:       3400            movew %d0,%d2
    597a:       220f            movel %sp,%d1
    597c:       0281 ffff e000  andil #-8192,%d1
    5982:       2041            moveal %d1,%a0
    5984:       2228 0008       movel %a0@(8),%d1
    5988:       0281 00ff ff00  andil #16776960,%d1
    598e:       6600 0104       bnew 5a94 <do_040writeback1+0x128>
    5992:       4e7b 2000       movec %d2,%sfc
    5996:       4e7b 2001       movec %d2,%dfc
    599a:       0240 0060       andiw #96,%d0
    599e:       0c40 0020       cmpiw #32,%d0
    59a2:       6700 0084       beqw 5a28 <do_040writeback1+0xbc>
    59a6:       0c40 0040       cmpiw #64,%d0
    59aa:       6730            beqs 59dc <do_040writeback1+0x70>
    59ac:       4a40            tstw %d0
    59ae:       6752            beqs 5a02 <do_040writeback1+0x96>
    59b0:       4280            clrl %d0
    59b2:       220f            movel %sp,%d1
    59b4:       0281 ffff e000  andil #-8192,%d1
    59ba:       2041            moveal %d1,%a0
    59bc:       2228 0008       movel %a0@(8),%d1
    59c0:       0281 00ff ff00  andil #16776960,%d1
    59c6:       6600 0086       bnew 5a4e <do_040writeback1+0xe2>
    59ca:       7201            moveq #1,%d1
    59cc:       4e7b 1000       movec %d1,%sfc
    59d0:       4e7b 1001       movec %d1,%dfc
    59d4:       242e fff8       movel %fp@(-8),%d2
    59d8:       4e5e            unlk %fp
    59da:       4e75            rts
    59dc:       4280            clrl %d0
    59de:       322e 0012       movew %fp@(18),%d1
    59e2:       206e 000c       moveal %fp@(12),%a0
    59e6:       0e50 1800       movesw %d1,%a0@
    59ea:       220f            movel %sp,%d1
    59ec:       0281 ffff e000  andil #-8192,%d1
    59f2:       2041            moveal %d1,%a0
    59f4:       2228 0008       movel %a0@(8),%d1
    59f8:       0281 00ff ff00  andil #16776960,%d1
    59fe:       67ca            beqs 59ca <do_040writeback1+0x5e>
    5a00:       604c            bras 5a4e <do_040writeback1+0xe2>
    5a02:       4280            clrl %d0
    5a04:       222e 0010       movel %fp@(16),%d1
    5a08:       206e 000c       moveal %fp@(12),%a0
    5a0c:       0e90 1800       movesl %d1,%a0@
    5a10:       220f            movel %sp,%d1
    5a12:       0281 ffff e000  andil #-8192,%d1
    5a18:       2041            moveal %d1,%a0
    5a1a:       2228 0008       movel %a0@(8),%d1
    5a1e:       0281 00ff ff00  andil #16776960,%d1
    5a24:       67a4            beqs 59ca <do_040writeback1+0x5e>
    5a26:       6026            bras 5a4e <do_040writeback1+0xe2>
    ...

The cause is a deliberately misaligned access in the 'bad_end_addr' test
case in the 'sysbadaddr' stressor. The location being accessed here,
0xc043dfff, was contrived to span the boundary between a r/w anonymous page
and an unmapped page. The address was then passed to the getcwd syscall
which faulted in copy_to_user().

The fault for the mapped page appears to be handled okay -- up until
do_040writeback1() called put_user() which produced a second fault due to
the unmapped page.

Michael Schmitz helpfully deciphered the oops and explained the exception
processing leading up to it.

    "regs->pc does point to the PC in the format 7 frame which is the PC
    the fault was detected at, but not (in case of a writeback fault)
    the PC of the faulting instruction [that is, MOVES.L].

    "The writeback would still cross the page boundary, and fault if the
    unmapped page still isn't present. We would not see the PC of the
    movesl in that case, and fail to find the PC in the exception
    table."

One solution is to add a NOP instruction after the MOVES.L to flush the
pipeline and take the fault. That way, the PC value in the exception frame
becomes dependable so the exception table works.

Theoretically, there seems to be another bug in the existing code. If
the instruction following the MOVES faulted, then after the fixup,
execution would resume at the instruction which caused the fault. This
appears to be a loop. After this patch, that cannot happen.

---

In my testing, Aranym and Qemu were not affected by the bug. Perhaps that's
because these emulated 68040 CPUs are not pipelined (?)

No testing was done on MC68060. It would be nice to know whether stress-ng
causes an oops on that CPU too.

There is a similar oops on MC68030 that is not addressed by this patch.
It was rather more difficult to trigger (stress-ng was insufficient) but
it too can probably be solved by adding NOPs.

    Oops: 00000000
    Modules linked in:
    PC: [<004641dc>] __generic_copy_to_user+0x26/0x46
    SR: 2000  SP: bbc272eb  a2: 00ab4b20
    d0: 00000001    d1: 00000001    d2: 2f766172    d3: 0081a000
    d4: 00000400    d5: c0028fff    a0: 0081affb    a1: c0029003
    Process ba-index4-getcw (pid: 58, task=2be598c4)
    Frame format=B ssw=0739 isc=0801 isb=027c daddr=c0029000 dobuf=2f766172
    baddr=004641e0 dibuf=2f766172 ver=f
    Stack from 014e7f84:
      00000009 014e7fc4 00128bc6 c0028fff 0081aff7 00000009 00000400 00000000
      efafaeac ef9baa88 00986910 00c31600 00986910 00c16200 0081aff7 00000ff7
      c0028fff 000027a2 c0028fff 00000400 00000000 efafaeac ef9baa88 c0023e8c
      c002538c efafaea4 ffffffda 000000b7 00000000 0008c010 b1220080
    Call Trace: [<00128bc6>] sys_getcwd+0xc8/0x15a
      [<000027a2>] syscall+0x8/0xc
      [<0008c010>] cgroup_path_ns_locked+0xac/0xb6

    Code: 226e 0008 4a80 670a 2418 0e99 2800 5380 <66f6> 0801 0001 6706
          3418 0e59 2800 0801 0000 6706 1418 0e19 2800 241f 4e5e 4e75

004641b6 <__generic_copy_to_user>:
  4641b6:       4e56 0000       linkw %fp,#0
  4641ba:       2f02            movel %d2,%sp@-
  4641bc:       222e 0010       movel %fp@(16),%d1
  4641c0:       2001            movel %d1,%d0
  4641c2:       e488            lsrl #2,%d0
  4641c4:       7403            moveq #3,%d2
  4641c6:       c282            andl %d2,%d1
  4641c8:       206e 000c       moveal %fp@(12),%a0
  4641cc:       226e 0008       moveal %fp@(8),%a1
  4641d0:       4a80            tstl %d0
  4641d2:       670a            beqs 4641de <__generic_copy_to_user+0x28>
  4641d4:       2418            movel %a0@+,%d2
  4641d6:       0e99 2800       movesl %d2,%a1@+
  4641da:       5380            subql #1,%d0
  4641dc:       66f6            bnes 4641d4 <__generic_copy_to_user+0x1e>
  4641de:       0801 0001       btst #1,%d1
  4641e2:       6706            beqs 4641ea <__generic_copy_to_user+0x34>
  4641e4:       3418            movew %a0@+,%d2
  4641e6:       0e59 2800       movesw %d2,%a1@+
  4641ea:       0801 0000       btst #0,%d1
  4641ee:       6706            beqs 4641f6 <__generic_copy_to_user+0x40>
  4641f0:       1418            moveb %a0@+,%d2
  4641f2:       0e19 2800       movesb %d2,%a1@+
  4641f6:       241f            movel %sp@+,%d2
  4641f8:       4e5e            unlk %fp
  4641fa:       4e75            rts
---
 arch/m68k/include/asm/uaccess.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/m68k/include/asm/uaccess.h b/arch/m68k/include/asm/uaccess.h
index 64914872a5c9..44e52d8323e5 100644
--- a/arch/m68k/include/asm/uaccess.h
+++ b/arch/m68k/include/asm/uaccess.h
@@ -31,11 +31,12 @@
 #define __put_user_asm(inst, res, x, ptr, bwl, reg, err) \
 asm volatile ("\n"					\
 	"1:	"inst"."#bwl"	%2,%1\n"		\
-	"2:\n"						\
+	"2:	nop\n"					\
+	"3:\n"						\
 	"	.section .fixup,\"ax\"\n"		\
 	"	.even\n"				\
 	"10:	moveq.l	%3,%0\n"			\
-	"	jra 2b\n"				\
+	"	jra 3b\n"				\
 	"	.previous\n"				\
 	"\n"						\
 	"	.section __ex_table,\"a\"\n"		\
@@ -53,11 +54,12 @@ do {								\
 	asm volatile ("\n"					\
 		"1:	"inst".l %2,(%1)+\n"			\
 		"2:	"inst".l %R2,(%1)\n"			\
-		"3:\n"						\
+		"3:	nop\n"					\
+		"4:\n"						\
 		"	.section .fixup,\"ax\"\n"		\
 		"	.even\n"				\
 		"10:	movel %3,%0\n"				\
-		"	jra 3b\n"				\
+		"	jra 4b\n"				\
 		"	.previous\n"				\
 		"\n"						\
 		"	.section __ex_table,\"a\"\n"		\
-- 
2.39.3

