Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB95F230D08
	for <linux-m68k@lists.linux-m68k.org>; Fri, 16 May 2025 09:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747387671; cv=none; b=LKW+71ayRJ18NVsXdtPMkKcTUEiLk8RCRfjs1LOLo/e3mzd0mZhpr0wNeAyi2sLeqs9MANJnE3xz98pUcxoUThyccK6waT9cHzB+FvLGbupu/DwXZt89i0TgItB0nG5jLr90n3jlHQkfkST+/z4p9UBxaN0FBGsI1/yr+qglDEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747387671; c=relaxed/simple;
	bh=z/X55CJ4Amiz0wZbkHt0gq98rMad9RgnWcfw7QI1kL4=;
	h=Date:Message-ID:From:To:Cc:Subject; b=bOblCSkVVBOPcg+YLFSXiqYZ7GLDqMc9nDBHB+jZMNL2lsWqNVTLytMZBHw3iQCo4hs81FVRGqnn8DsuxOdQi12gadv1Nc5m3C1p+vgHshWD54ofPvKPwPsg8Qn5sGUryZKGqOpinQI8Cmd44he22NygKo5E8u/JGUapQZDy/o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hA912So5; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hA912So5"
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 4471A1380417;
	Fri, 16 May 2025 05:27:46 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Fri, 16 May 2025 05:27:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1747387666; x=1747474066; bh=Kpjd1dlpYPRSKTDwyzlMgPlazmO2
	anW6vzHpGHs+Oh4=; b=hA912So5ClnzbPClaC8NbxtYoJCiS+3BkXsTTosZvPGx
	KxC7MuxOpIykSodpezlaz2Mn4trZIXB6zQn2NPwk4NiqiqX/FiGbzMj2KpudAVCV
	GcyoW0FpzslZTblj/+tsqGAft4tVcUluUkxy8E6+7hPdEjdAr//CT89DBjwrBkMH
	SjQKeaDF9EZ9wZFyAef8dSBmAQod/3OrFL/xynahuRJGfLv9DDbUXHH+R6cyMpJE
	GWUcAP3bfRSoaPIINGe3inq79g/ViLg1gOnRiDtRJmYWfKhzmj1sFgagwDXTKl9G
	gzhr096eQowfBUeID/j7e9DHxpg2g2Dvdpc7egCHQw==
X-ME-Sender: <xms:EAUnaHkfIMmb_EHZ0NK2wqZ-pVqrvtjX3819vC1p_2OWF7seqTQkTg>
    <xme:EAUnaK04driUOW4-6iYDwToIrKpbTu30hf2XkAiNeY3kEl6b6M0e2IOlDvWKWV-1z
    P01RPZp23_5KP5FbYg>
X-ME-Received: <xmr:EAUnaNrnHf4C-57JyiT58aY8SnJCqguFHysG_xLgBqsZnPbR1wDbcwRMvWxjTwrMUGFM8Sgybs5GWCjbS6sEpNfTKJl8gzJGzfo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefuddvfeekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffkhffvvefusedttdhjtddttddtnecuhfhr
    ohhmpefhihhnnhcuvfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorh
    hgqeenucggtffrrghtthgvrhhnpedthfeluddujeejgfdvteefieejtdefueekudetueff
    ueevjeeiveehgfelueffffenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhskhgvlh
    gvthhonhdrshgsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrghdpnhgspghrtghpthhtoh
    epiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepnhhosghuhhhirhhouddrihif
    rghmrghtshhusehtohhshhhisggrrdgtohdrjhhppdhrtghpthhtohepphgrvhgvlhesug
    gvnhigrdguvgdprhgtphhtthhopegvsghivgguvghrmhesgihmihhsshhiohhnrdgtohhm
    pdhrtghpthhtohepshgthhhmihhtiihmihgtsehgmhgrihhlrdgtohhmpdhrtghpthhtoh
    eptghiphdquggvvheslhhishhtshdrtghiphdqphhrohhjvggtthdrohhrghdprhgtphht
    thhopehlihhnuhigqdhmieekkheslhhishhtshdrlhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:EAUnaPn_5B424QGthSJFLAscFvja3TmYWr84LY47wTOANgXjYbwQzQ>
    <xmx:EQUnaF13Sgk1ewVeYDzzFgexWU39zPaAGlKiy1B7Io_E0EBCHuYlUg>
    <xmx:EQUnaOv8lAzvW2s4GAfcRyHTK70veswGzA_G330PynRvkYLbSp-D0A>
    <xmx:EQUnaJVj7JveIgies1YAnBKxAJ0JVUQK6gVY0BHcCU1KV5bFn6SgDQ>
    <xmx:EgUnaLUojtlx9f33YS2aTDeDwp5Z_PK34N81DnTWlDWa2XF9uQ41qK-D>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 16 May 2025 05:27:43 -0400 (EDT)
Date: Fri, 16 May 2025 19:28:12 +1000
Message-ID: <288cd2e42b6d4cbf77822cce3b348d6f@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Pavel Machek <pavel@denx.de>
Cc: Eric W. Biederman <ebiederm@xmission.com>, Michael Schmitz <schmitzmic@gmail.com>, cip-dev@lists.cip-project.org, linux-m68k@lists.linux-m68k.org
Subject: [PATCH RESEND 4.19.y-cip] signal/m68k: Use force_sigsegv(SIGSEGV) in fpsp040_die
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

From: "Eric W. Biederman" <ebiederm@xmission.com>

[ Upstream commit a3616a3c02722d1edb95acc7fceade242f6553ba ]

In the fpsp040 code when copyin or copyout fails call
force_sigsegv(SIGSEGV) instead of do_exit(SIGSEGV).

This solves a couple of problems.  Because do_exit embeds the ptrace
stop PTRACE_EVENT_EXIT a complete stack frame needs to be present for
that to work correctly.  There is always the information needed for a
ptrace stop where get_signal is called.  So exiting with a signal
solves the ptrace issue.

Further exiting with a signal ensures that all of the threads in a
process are killed not just the thread that malfunctioned.  Which
avoids confusing userspace.

To make force_sigsegv(SIGSEGV) work in fpsp040_die modify the code to
save all of the registers and jump to ret_from_exception (which
ultimately calls get_signal) after fpsp040_die returns.

v2: Updated the branches to use gas's pseudo ops that automatically
    calculate the best branch instruction to use for the purpose.

v1: https://lkml.kernel.org/r/87a6m8kgtx.fsf_-_@disp2133
Link: https://lkml.kernel.org/r/87tukghjfs.fsf_-_@disp2133
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: "Eric W. Biederman" <ebiederm@xmission.com>
[ Pass 'current' to force_sigsegv() as was done prior to v5.3 ]
Signed-off-by: Finn Thain <fthain@linux-m68k.org>
---
 arch/m68k/fpsp040/skeleton.S | 3 ++-
 arch/m68k/kernel/traps.c     | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/fpsp040/skeleton.S b/arch/m68k/fpsp040/skeleton.S
index 31a9c634c81e..081922c72daa 100644
--- a/arch/m68k/fpsp040/skeleton.S
+++ b/arch/m68k/fpsp040/skeleton.S
@@ -502,7 +502,8 @@ in_ea:
 	.section .fixup,"ax"
 	.even
 1:
-	jbra	fpsp040_die
+	jbsr	fpsp040_die
+	jbra	.Lnotkern
 
 	.section __ex_table,"a"
 	.align	4
diff --git a/arch/m68k/kernel/traps.c b/arch/m68k/kernel/traps.c
index 35f706d836c5..c6f18dc5884b 100644
--- a/arch/m68k/kernel/traps.c
+++ b/arch/m68k/kernel/traps.c
@@ -1155,7 +1155,7 @@ asmlinkage void set_esp0(unsigned long ssp)
  */
 asmlinkage void fpsp040_die(void)
 {
-	do_exit(SIGSEGV);
+	force_sigsegv(SIGSEGV, current);
 }
 
 #ifdef CONFIG_M68KFPU_EMU

