Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BB84A8FDC
	for <linux-m68k@lists.linux-m68k.org>; Thu,  1 Oct 2026 09:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790845721; cv=none; b=TAsaeBA0h+oUTcVYlLcZC53GGiHE/B2S7d4J1JhKkRZLXO+QjaAQu8FZAzBcZ+l3+rvz5vvR4YZbdFm8bAJAOaPutn3eDvU3Cc1fwSkIHcvI2dIZ1PznIGOcLSHOnZd26GsgGfz2y0R+8GTSNlit5GKUZcBPtz6UMK1ZtHIyUwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790845721; c=relaxed/simple;
	bh=YrY088KwyZYHGvD36gVAcfUq9OLU9lr5ot/+GjZZurk=;
	h=To:Cc:Message-ID:From:Subject:Date; b=HR6mks4XEkBY/MVtfc/OFvun52A+3f/vXUJecmGmJVSmn7tICF9CNKZaUslbClAHgcn7UXPCnBErexUOAcJysy9uN7b5GY/g4iu4DBghgzduQnfZsLv88qtW6gKZeJwNmij5vj0yAg5l0UiXGtg1jREMQeN2JyDBJ4GeZmKo0VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ablHr1tZ; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ablHr1tZ"
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 105FAEC0102;
	Thu,  1 Oct 2026 05:08:37 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Thu, 01 Oct 2026 05:08:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1790845717; x=1790932117; bh=EKBz+lvbGiy6aI/0tUUTYofyi6Zj
	YZcjf/SPtH7j5u8=; b=ablHr1tZ33o86BwxXMUduu0aPPcMNgOOBcUzRTq19p4p
	tJfuJXAYSK6wTDfFCVEooonuhHy0dKnGR6/OMhxJlHJ7tCEncJol7dksKiL02F85
	lR90ofzLzE6D4W2FuSSyMi6hQeQ2K4H8eOWmVdu19Kwi3JRqs4gzz5Drg/3YnxA/
	rJje97EKfto//U42NoU/KAa2hUlsrNt9OMs/0dlkF7t4+pbbZt5GCPqGbDWgd7JY
	ELH/4NM3j+NkVKsapdFX1BYbCTxIVw552Z3w+2VvEzj/p/bIrPo+F6nnLoax6qUL
	eyZmebQDd826xmai+GeLwLOKfo94N74FKQYz8pwhcA==
X-ME-Sender: <xms:FCO-aoJq5s7A36fD4PiwENI_KWx6wShugo8o3caTFK6p1NFJ6G6akw>
    <xme:FCO-av6obvAKWcDjNfx-H7RyueL6wV8rGbJ-4AepKnLbrGqlzIU7v8FftzOK5GP7-
    ciOGrrkxM2c9doAWNAQ0IuswPm5sHgIhbd0h_i3gLpZc8DpUp6mYUg7>
X-ME-Received: <xmr:FCO-aryje0NpxmsHFm5u00vcY1jcnTypRvXwtzA06uAO9GOm4Rs1TjCQNdW2l9HiNpbqCbIswl78HBjIC99erswyw27KHX5Kl3A>
X-ME-Proxy-Cause: dmFkZTFft4YQ3KrDb4RFUHkBvCDozmsRPmhyZrYmQeFPL+BvOcW3+PSzVp93LtP+Tss1wJ
    mbrzP539n/rs/GOPtlfeoXMNV3KIOu6PtWitxh50D7j1Cs/UiFgmwnVYezMC5vMegj38J+
    8Yfy2Bu9+hCR1DQkRjyF5hdgkzksCP0Vc9fbfqL5DaT+EwFRMiQjZ35ka55fm/fIeQYH7n
    Keckv3xQ/iB4fctzf2OfZMZg9UGp4/Mlkqj10p/NR0DkAKa28LFL2LLBshhZh5I9NT4zwV
    tbwszl2eefoHKu3DB0WxHuhwFBlyE3HjnvZ3/zec6W4Y27DJF9DxYpc0+pG142lRxPqtYL
    Y2kOPcdMQwDiRlrbwHl6npdcPFqHZNOTAjw8cNVi/R/zjUukZ3cgjHpfsD+DEHmNSYy9U/
    +wkUmn9mNCQxW7kgdsMNTrYHix+zyexdZsOMbpGbQdDguPgM3xBb1DQjwQQ7LpSCDOwIvH
    Pw2enYNvgfvR1yG7PJC7bQMIutKKXY+ycdMqRzg9K2tHA3LF0dNTkiqZtS6BHFXuv5+/ZI
    /Sb/7Xz/RSkygl4iLoGwYgmJJkUXdhEIuoTIIxMFGtUr1jwC1T08yV4ZxU0OTu8u/Rj53/
    w+NOVxDIJKCbm068O+CuR05LTLUDcRzTdpDZdmMhZaiEB2TLYIRUz89QVn0w
X-ME-Proxy: <xmx:FCO-ajYgodQX2CxERvPPZXKQC-yUPfNAllrArZFaj1FhBE4zgsYS_A>
    <xmx:FCO-atREJj-CDiEA0zhcFhySNZ2V-rVgTP3F0_Vbnv6CnXGc2_URiQ>
    <xmx:FCO-atyGwPMx5m-ono-qr8U8-2NzmxpTsUSJw6metQ2F5PzD0g2s4Q>
    <xmx:FCO-an0h3UozpTcHuCqr6qdXcVDHwEq4H24EhMcGxhMekd1IjpqQrQ>
    <xmx:FSO-alpCoSNFLJfO9e9NQjayEJUpcxEyhMRhu1SOxJ01WSK-QrhmP9-R>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Oct 2026 05:08:35 -0400 (EDT)
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org,
    linux-kernel@vger.kernel.org
Message-ID: <88e752e0bca92c7b65533cc1b334052dd272f8ef.1790842086.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH RESEND] m68k: Handle put_user faults more carefully
Date: Thu, 01 Oct 2026 19:08:06 +1000
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

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Finn Thain <fthain@linux-m68k.org>
---
 arch/m68k/include/asm/uaccess.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/m68k/include/asm/uaccess.h b/arch/m68k/include/asm/uaccess.h
index 31d133faa45e..728a6dfb7414 100644
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
