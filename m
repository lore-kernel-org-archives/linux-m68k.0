Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84E58C77B7E
	for <linux-m68k@archiver.kernel.org>; Tue,  2 May 2023 06:49:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbjEBGti (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 2 May 2023 02:49:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233439AbjEBGtg (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 2 May 2023 02:49:36 -0400
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF9701A6
        for <linux-m68k@lists.linux-m68k.org>; Mon,  1 May 2023 23:49:35 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 295895C021B;
        Tue,  2 May 2023 02:49:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 02 May 2023 02:49:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683010175; x=1683096575; bh=oayuJxCfeTnRy+ySnnEQWW19hsYLM3dIaLu
        Eybqxkdo=; b=jf1Qg7cy8BQwNSXCRFZ4Zr0n2Knq8eQLlwAav0CG+aleDBNRccm
        waihM4fBcdO4yZWFt6XjxdQ3vIy0OIzT6uztNDscPAw3znkQG+YROZyjr4+BpX8T
        VhE2/4zAwumYTYErgeOn/FVgzsh2QDN18d4P/V//yTHfIjndXA1I4NCynmi/Cds8
        IPEPG5v/UDWqDyfaRJvP8VZ+a8xoO0X2S1HZ3/xi/XXDXejFbv7c4VhGiVK+mais
        tSUhKkrmHlF4+QSPlx2PeZUCyDwPY5iAHEm9NirnVjsGNjfevuvo6x2/xcA43Fpx
        Avfxe9iDK334PKcZIfryV4sCHP5SGLu4pLQ==
X-ME-Sender: <xms:frJQZOYK3IQE-tl6rsPo_WHfhIoGMKM90gkNdFdbGn30rp8bXvk2xQ>
    <xme:frJQZBZkeQuqtlCkAnBFQn-BAyY_vnCzhVcP8i_o9rhJXH_nHIB_cS9lb_EX4WcZq
    JiNB7uqu6fQlZN3Jgo>
X-ME-Received: <xmr:frJQZI-5Q0IMdkmzz5EiRGKzc22FfXQHtEeSD5NIf5U2M9tSPQQs5cVD2Ns69ofal_bY9BzEywa4hK9IPvmVxBF3QN7_LdUvnv8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedvhedgudduvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefvvefkjghfhffuffestddtredttddttdenucfhrhhomhephfhinhhnucfv
    hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
    htvghrnhepheekudffheejvdeiveekleelgeffieduvdegleeuhfeuudegkeekheffkefg
    gfehnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhugidqmheikehk
    rdhorhhg
X-ME-Proxy: <xmx:frJQZAroQ2aHwbnxRBTujfOromLNEzZLf6gI-8VVGk_cSmZmlQVtrw>
    <xmx:frJQZJqM3l5zoVUk-9hQLvtQCdE37s0Ee4SrSSTMIcX00n2Mdwhlfg>
    <xmx:frJQZOTV8gEYKeBbeBZFjUnDP-RWj2b5cUTNMLvO0LRSYCf9eSCTmg>
    <xmx:f7JQZKAqqDY48lpkG-0Wg5kFCVRG1vSCKEaVzyhCVYleJLvUJa2U0g>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 May 2023 02:49:32 -0400 (EDT)
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org,
        "Michael Schmitz" <schmitzmic@gmail.com>,
        "Andreas Schwab" <schwab@linux-m68k.org>
Message-Id: <f94a7736c10bc4f256bef5b826419faacb297f4a.1683010227.git.fthain@linux-m68k.org>
In-Reply-To: <cover.1683010227.git.fthain@linux-m68k.org>
References: <cover.1683010227.git.fthain@linux-m68k.org>
From:   Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH RFC 2/2] m68k: Make allowance for signal delivery following an
 address error
Date:   Tue, 02 May 2023 16:50:27 +1000
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

The 68030 Users Manual says that address errors occur immediately they
are detected during instruction prefetch. The instruction pipeline allows
prefetch to overlap with other instructions which means an address error
can be taken during execution of a different instruction.

Both a bus error and an address error may produce a format 0xB exception
frame. Regarding those frames, the UM says the PC contained therein has
the "address of instruction in execution when fault occurred -- may not be
the instruction which generated the faulted bus cycle".

In the bus error case, the USP in that frame is not reliable (like the
PC). We should not rely on it in the address error case. The address error
case always produces a SIGBUS. That signal may be caught and the
exception fixed up. If a debugger or emulator were to do so, this patch
would theoretically prevent user stack corruption.

Cc: Michael Schmitz <schmitzmic@gmail.com>
Cc: Andreas Schwab <schwab@linux-m68k.org>
Link: https://lore.kernel.org/linux-m68k/20230429080410.8993-1-schmitzmic@gmail.com/
Co-developed-by: Michael Schmitz <schmitzmic@gmail.com>
Signed-off-by: Finn Thain <fthain@linux-m68k.org>
---
Michael, as co-developer, this will need your signed-off-by.
---
 arch/m68k/kernel/signal.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/m68k/kernel/signal.c b/arch/m68k/kernel/signal.c
index b9f6908a31bc..8aeafbb083f7 100644
--- a/arch/m68k/kernel/signal.c
+++ b/arch/m68k/kernel/signal.c
@@ -858,11 +858,16 @@ static inline int rt_setup_ucontext(struct ucontext __user *uc, struct pt_regs *
 }
 
 static inline void __user *
-get_sigframe(struct ksignal *ksig, size_t frame_size)
+get_sigframe(struct ksignal *ksig, struct pt_regs *tregs, size_t frame_size)
 {
 	unsigned long usp = sigsp(rdusp(), ksig);
+	unsigned long gap = 0;
 
-	return (void __user *)((usp - frame_size) & -8UL);
+	if (CPU_IS_020_OR_030 && tregs->format == 0xb)
+		/* USP is unreliable so use worst-case value */
+		gap = 256;
+
+	return (void __user *)((usp - gap - frame_size) & -8UL);
 }
 
 static int setup_frame(struct ksignal *ksig, sigset_t *set,
@@ -880,7 +885,7 @@ static int setup_frame(struct ksignal *ksig, sigset_t *set,
 		return -EFAULT;
 	}
 
-	frame = get_sigframe(ksig, sizeof(*frame) + fsize);
+	frame = get_sigframe(ksig, tregs, sizeof(*frame) + fsize);
 
 	if (fsize)
 		err |= copy_to_user (frame + 1, regs + 1, fsize);
@@ -952,7 +957,7 @@ static int setup_rt_frame(struct ksignal *ksig, sigset_t *set,
 		return -EFAULT;
 	}
 
-	frame = get_sigframe(ksig, sizeof(*frame));
+	frame = get_sigframe(ksig, tregs, sizeof(*frame));
 
 	if (fsize)
 		err |= copy_to_user (&frame->uc.uc_extra, regs + 1, fsize);
-- 
2.37.5

