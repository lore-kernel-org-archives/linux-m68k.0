Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A355916DC36
	for <linux-m68k@lists.linux-m68k.org>; Fri, 27 Sep 2024 03:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727408714; cv=none; b=hAPqCcU9MFNZ3ZATiFfVriQmq94yFgbrxU62sgvb9a4nc/GE378p9VKpaUd4wQPUUKkH6XAOqN3LHHPoE4xAY5/mXyizBMvBxrBLpc0nHsu5/7s4EkUUSPmGTt5uhsmp+qOpY92EzVw/0F/8HASAgWd7fbrp+MWee3kQoiJghoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727408714; c=relaxed/simple;
	bh=laR3GaIYP/1dQsPUb4S2tQL7Wh+ZvTi97dSqvdSAVks=;
	h=To:Cc:Message-Id:From:Subject:Date; b=mwqSyIEDbr0yAffIFD5Bj7ZGa/yr0EaUPsjLU8hD2AnPyIB+ybWnm4jwzHyMcWYTzNoyXYM5wD8vBvSf3y7TTotuG3v9oon+vzD8KFhsMiqp5WpmIaPqZaGjq3LF0wruD7BDRuhLEdQatyDruGmW6owAspYiRS1zDozwLp8E9DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ajWu+0M3; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ajWu+0M3"
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id D564C13806CE;
	Thu, 26 Sep 2024 23:45:09 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Thu, 26 Sep 2024 23:45:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1727408709; x=1727495109; bh=xvIOoVNdCIUN2
	sDi7Y458trd8VLcKgk2LPdONTFFCOo=; b=ajWu+0M3zxRvDztNz2i8ZjTuofqcw
	Gp5hAwP3ohvpDf8yz9Uf5pC55O19lJuAveBQBKuB27prfJ5OA5z2MQl+Dcm/um4r
	or5NLNZ/de1a3bpHM+SqkUVD1jJxQfEkLNW7GPFzQTXlrCIoIm1jaZrVJdBeOKYx
	AlLgMLlV1j9HdeYy9ZlkBV3kmUBCrLnXF5wN8D6Q4o228zO1ZsZvtt19n5UGeYmT
	Afnf75n+oHG8g99mL/QrkbhqEnL6Ac7ypDDQndTzelPevRC8KkPNHLAN8Y4rsWJG
	Q9z+QplTGPOitOUkNJ2Ak/niTHqyv+VWA1aqw2TuuKTQQL5MoQgNXLB1Q==
X-ME-Sender: <xms:RSr2ZrZf-1XFmDgy5H7y3RxuOQyNmDrp5fv9LbAhOxHbNlEozuxGmA>
    <xme:RSr2ZqZgw8uvqOIQWzRiFHafuag6fUn5_T7xu7DBB0rkmiz7XwqzBNud8CFu1aALU
    h9zskWy9QroqdSd760>
X-ME-Received: <xmr:RSr2Zt-ibU_-niP3yN67HFyElrk4CnBuawMiOxkKB0oDIjSmGJFBSUYECFzySfUOz_W4a_DPsPLCWddHEKS7BcM9nXjz0gM3SBs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddtkedgjeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepvfevkffhufffsedttdertddttddtnecuhfhrohhm
    pefhihhnnhcuvfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqe
    enucggtffrrghtthgvrhhnpeehvdfhheduvddvvdelhfelhfefvefhjedvhedtvdeiieei
    gfekhefhgfeugeffveenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhskhgvlhgvth
    honhdrshgsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrghdpnhgspghrtghpthhtohephe
    dpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshhtrggslhgvsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkhdrohhrghdprhgtph
    htthhopegvsghivgguvghrmhesgihmihhsshhiohhnrdgtohhmpdhrtghpthhtoheplhhi
    nhhugidqmheikehksehlihhsthhsrdhlihhnuhigqdhmieekkhdrohhrghdprhgtphhtth
    hopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:RSr2Zhofeh50k06Qnb8RpdqZKsMKjfcYOT9wf-ci-UCa_vJ3xOGBzg>
    <xmx:RSr2ZmpeLCZxh--J5asGjUhuei0Fo032YmCO3Y5HMHKlcjSJnzv6wQ>
    <xmx:RSr2ZnQLVpRVvO-wjmKrzaGhXMKAcdvb98egaStfVQiiyefM_TKAkQ>
    <xmx:RSr2ZuqpehAdWBZSTgKYcc9i3uWKVhrHfBn_qy7fQRT5DRIjV8XwGw>
    <xmx:RSr2ZvnLG4lXHNNgqIsnbOoGMCAjxUpmqB4sGWfF--Byh-kqO4x3QDgM>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Sep 2024 23:45:06 -0400 (EDT)
To: stable@kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
    Eric W. Biederman <ebiederm@xmission.com>,
    linux-m68k@lists.linux-m68k.org,
    linux-kernel@vger.kernel.org
Message-Id: <c724e2559cd26dc1e5e629b03ec8e3005e99251f.1727408413.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH] signal/m68k: Use force_sigsegv(SIGSEGV) in fpsp040_die
Date: Fri, 27 Sep 2024 13:40:13 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

From: Eric W. Biederman <ebiederm@xmission.com>

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

Cc: stable@kernel.org # <= 5.14.y
v1: https://lkml.kernel.org/r/87a6m8kgtx.fsf_-_@disp2133
Link: https://lkml.kernel.org/r/87tukghjfs.fsf_-_@disp2133
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: "Eric W. Biederman" <ebiederm@xmission.com>
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
-- 
2.39.5

