Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ACAEC77B7E
	for <linux-m68k@archiver.kernel.org>; Tue,  2 May 2023 06:49:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233468AbjEBGt2 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 2 May 2023 02:49:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233545AbjEBGt1 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 2 May 2023 02:49:27 -0400
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AAB91997
        for <linux-m68k@lists.linux-m68k.org>; Mon,  1 May 2023 23:49:26 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 7AEB55C0211;
        Tue,  2 May 2023 02:49:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 02 May 2023 02:49:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683010165; x=1683096565; bh=SvLoRJLKZSgurgWlavx1Ph/6ILHHbnzrAjK
        PuG8Z1TM=; b=kLzx1bsayITtiQwIFFAFTqbURtqW+zQn90BOuXITTs/vopKL7Y8
        BhuDkvy5yO2cGWOlsWPxCKn7HvK6JnuLRoIs8m/C+vNxNnt3R2sjrxNiAR4Xf0+d
        e5BfdtXGXTMxJzVjmBpP1byLi+NUP425r8GVBRu1pHuKi1p/Md8Dm62FrMkd39cA
        f31BAEZax+0CKfRnK4AFJojuEe3m8pgFERLKy7oi70pd76J/y/eFXV35FfcXEzmA
        3h/WManLPQN7mZGiJvKmNgdIS1j7IEbl0tgri43aJAuVm1YIaT7kMEpEYDIbNowq
        f6jA4Yy4SBIvLzwLW+w6lqoEdKR2g4GdgSg==
X-ME-Sender: <xms:dbJQZCsO3WLZ5gGVjVt_cbqkKe1jMdTbx4vkd9CON4nkfZiOL8w-ug>
    <xme:dbJQZHfGc1SpBLV1I1VXYm6Vad8zd-dofxKW0wyZ1tVeLCKjSnWxHQEeVimirrig0
    FINkWFKj28a2pZftCs>
X-ME-Received: <xmr:dbJQZNzCrhhkDVUqIFwyNyM7kewzjR-r1IJAxGYTrUA41vkl4pzZhMl4oCPGpd_R8W5Yo3GawCnmQdLimnwb6k_YjjeUCpM8WNM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedvhedgudduvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefvvefkjghfhffuffestddtredttddttdenucfhrhhomhephfhinhhnucfv
    hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
    htvghrnhepkeetheetjeehfeehffdvhfeuvddvleevuedujeffgffgvdeghfefleeuhedu
    ieeknecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpvghnthhrhidrshgsnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhthhgrihhnsehl
    ihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:dbJQZNMLLjU28qVsGIgHW3EFrCOau5FCorur1g4_WVFtp3lRCUJxCg>
    <xmx:dbJQZC9fAiCH2vzBBay4RkyYdWC9DkRPBd_XbUUzrY_LmlqM5cU9KQ>
    <xmx:dbJQZFVdwcT-OlSE7NexVPrmUZiZKJJbWnOrz0Lx_lrA-vcYObG-Zg>
    <xmx:dbJQZImeHVKFKcNthKlpiJDxa9VDCf5SW-8PFHrwf03IZYmYgmgS9Q>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 May 2023 02:49:22 -0400 (EDT)
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org,
        "Michael Schmitz" <schmitzmic@gmail.com>,
        "Andreas Schwab" <schwab@linux-m68k.org>
Message-Id: <8a32bd0afd8db890b60e48801fb4b24ddc398e96.1683010227.git.fthain@linux-m68k.org>
In-Reply-To: <cover.1683010227.git.fthain@linux-m68k.org>
References: <cover.1683010227.git.fthain@linux-m68k.org>
From:   Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH RFC 1/2] m68k: Don't deliver signals except at instruction
 boundary
Date:   Tue, 02 May 2023 16:50:27 +1000
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

From: Andreas Schwab <schwab@linux-m68k.org>

Signal delivery should only happen at insn boundaries, but due to the
way the 030 handles return from bus error exceptions (the insn is resumed,
not restarted like on the 040/060) the kernel may do it in the middle of
the faulting insn.

For example, a page fault can happen during execution of
        moveml %a2-%a3/%a5,%sp@-
This then produces a format 0xB exception frame containing an unreliable
USP value. That value gets used to calculate the location for a signal
frame and the end result is a corrupted the user stack.

This stack corruption was observed in dash (actually in glibc) where it
showed up as an intermittent "stack smashing detected" failure following
SIGCHLD signal delivery.

The failure was hard to reproduce because delivery of the signal races
with the page fault and because the kernel places an unpredictable gap
of up to 7 bytes between the USP and the signal frame, which is often
sufficient to prevent stack corruption.

Reported-and-tested-by: Stan Johnson <userm57@yahoo.com>
Link: https://lore.kernel.org/all/CAMuHMdW3yD22_ApemzW_6me3adq6A458u1_F0v-1EYwK_62jPA@mail.gmail.com/
Cc: Michael Schmitz <schmitzmic@gmail.com>
Cc: Andreas Schwab <schwab@linux-m68k.org>
Signed-off-by: Finn Thain <fthain@linux-m68k.org>
---
This is the same patch that Andreas sent, excepting a minor change to the
commentary and a 'fallthrough' statement.
Andreas, as the author, this will need your signed-off-by.
---
 arch/m68k/kernel/entry.S |  6 +++++-
 arch/m68k/kernel/traps.c | 10 ++++++++--
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/kernel/entry.S b/arch/m68k/kernel/entry.S
index 4dd2fd7acba9..77b558dad14b 100644
--- a/arch/m68k/kernel/entry.S
+++ b/arch/m68k/kernel/entry.S
@@ -117,7 +117,11 @@ ENTRY(buserr)
 	movel	%sp,%sp@-		| stack frame pointer argument
 	jbsr	buserr_c
 	addql	#4,%sp
-	jra	ret_from_exception
+	| deliver no signals if the fault occurred with an insn in progress
+	| (on the 020/030)
+	tstl	%d0
+	jeq	ret_from_exception
+	RESTORE_ALL
 
 ENTRY(trap)
 	SAVE_ALL_INT
diff --git a/arch/m68k/kernel/traps.c b/arch/m68k/kernel/traps.c
index a700807c9b6d..f535054d1e2a 100644
--- a/arch/m68k/kernel/traps.c
+++ b/arch/m68k/kernel/traps.c
@@ -751,8 +751,10 @@ static inline void access_errorcf(unsigned int fs, struct frame *fp)
 }
 #endif /* CONFIG_COLDFIRE CONFIG_MMU */
 
-asmlinkage void buserr_c(struct frame *fp)
+asmlinkage int buserr_c(struct frame *fp)
 {
+	int not_insn_boundary = 0;
+
 	/* Only set esp0 if coming from user mode */
 	if (user_mode(&fp->ptregs))
 		current->thread.esp0 = (unsigned long) fp;
@@ -793,8 +795,10 @@ asmlinkage void buserr_c(struct frame *fp)
 	  break;
 #endif
 #if defined (CPU_M68020_OR_M68030)
-	case 0xa:
 	case 0xb:
+	  not_insn_boundary = 1;
+	  fallthrough;
+	case 0xa:
 	  bus_error030 (fp);
 	  break;
 #endif
@@ -803,6 +807,8 @@ asmlinkage void buserr_c(struct frame *fp)
 	  pr_debug("Unknown SIGSEGV - 4\n");
 	  force_sig(SIGSEGV);
 	}
+
+	return not_insn_boundary;
 }
 
 
-- 
2.37.5

