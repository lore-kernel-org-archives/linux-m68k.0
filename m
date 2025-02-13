Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FDF1FAC42
	for <linux-m68k@lists.linux-m68k.org>; Thu, 13 Feb 2025 07:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739431484; cv=none; b=VeJUBOl7Ik9HAGgckhd/ryz+jdyoQDQIU23Rq59PrBIFOyheA2aypgymLB3F4VFcWMXrurarNvKgGBW2+uJCLRpd6Jx4pY6zxoHHlza5cwxGe7c5rp6MU1mfJ5C63WTHMyWCw9FNJohSiMMbiWi2TTCKYFx6al67w8j+ryoOPOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739431484; c=relaxed/simple;
	bh=z/X55CJ4Amiz0wZbkHt0gq98rMad9RgnWcfw7QI1kL4=;
	h=Date:Message-ID:From:To:Cc:Subject; b=AphNJixJF+6ELPHL3FVLrNgoPAL8djoarHAjWgk/J9TR0PfRj9DRD0YOnOgwDjZtkrrpHMVjoeyEdLPc1pBqLMjzACxbxcmr9UPUkPORux2FTUflA0bCrN/7t+d3fxvGL8chLkLVEYntXpwo9QQ3MjnTRx/IDR53dSQRLrGVGc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JLXTCSQT; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JLXTCSQT"
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B501E25401EB;
	Thu, 13 Feb 2025 02:24:41 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Thu, 13 Feb 2025 02:24:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1739431481; x=1739517881; bh=Kpjd1dlpYPRSKTDwyzlMgPlazmO2
	anW6vzHpGHs+Oh4=; b=JLXTCSQTwymWH67p4RTvIiEGC/3eBUBvch9tnwY9BktP
	5jlp4C7NM7grf8n3X1THozL9WFdhdcIRrzFTt5wHBjX5QwpCp4F6qVjykw9BX+mu
	dZMm8GJdcu5g/hxjH9FKZyITWGlVr3v2igptHJtJpAu6YI7S2gCj0oFLghnBAuh7
	MHgS65MqbvQa/1+KG796ZtKJl4e0Q5uAaXmY5uFE5NDVpxVN4VeDe8z8OshZtKto
	X5+fwB5U0UndEVB8WZx3vd2R8RelySUM8kukBR9wnLlLhAY8XlAzMErvoi521KZe
	2rMK9Qok+Nyhb8iHOiuW9DMeHNVUGlSxSeWw1/mcTQ==
X-ME-Sender: <xms:OZ6tZwhnFPwyXPN5Rghm3S1f5P4OAUg7T-VrGokFo_h6otWGoz1Hpw>
    <xme:OZ6tZ5Aql9wGWBsDZJ-CwItFkEF01-KFFZa_uv1ARrYkYKwawU0oiXeZRWgN3i8yE
    7XrvrVW_PZfttpItJk>
X-ME-Received: <xmr:OZ6tZ4HXutAXtvtU_pt20v_Edg3ZLLrSeyYFv0VxZUsRL9P_rAvD__c-7sAdlsB5fwr0UMEd3FintghAf1e7Er3Y53Z9wsyJmKM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegieduiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffkffhvfevufestddtjhdttddttdenucfhrhho
    mhephfhinhhnucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
    eqnecuggftrfgrthhtvghrnheptdfhleduudejjefgvdetfeeijedtfeeukeduteeuffeu
    veejieevhefgleeuffffnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpshhkvghlvg
    htohhnrdhssgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgpdhnsggprhgtphhtthhope
    eipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehnohgsuhhhihhrohdurdhifigr
    mhgrthhsuhesthhoshhhihgsrgdrtghordhjphdprhgtphhtthhopehprghvvghlseguvg
    hngidruggvpdhrtghpthhtohepvggsihgvuggvrhhmseigmhhishhsihhonhdrtghomhdp
    rhgtphhtthhopehstghhmhhithiimhhitgesghhmrghilhdrtghomhdprhgtphhtthhope
    gtihhpqdguvghvsehlihhsthhsrdgtihhpqdhprhhojhgvtghtrdhorhhgpdhrtghpthht
    oheplhhinhhugidqmheikehksehlihhsthhsrdhlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:OZ6tZxQU-4o8CHVU0NzSFwUbeYFprWVfZRKzBNL14JxFELJLiycVQQ>
    <xmx:OZ6tZ9xIpddfzy8N6U1OB6VmZ2y1CY3TZqtxayBtsl8KnKkO9hRylg>
    <xmx:OZ6tZ_5JjMT6XrEVde8sCYxHXSmUkPfO-5IWIzFLOSyFOenj_DVmlA>
    <xmx:OZ6tZ6xG-6aPDc6x_yi7nIq9sJsOZGo-b0rR49tjj4y9LwyXQZ1TTw>
    <xmx:OZ6tZwqJVlighZRQBBVTdttnBxiOoIg8IokNreQ-ed7wAojQ7uELKbaU>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Feb 2025 02:24:38 -0500 (EST)
Date: Thu, 13 Feb 2025 18:24:34 +1100
Message-ID: <365a4f78cfdfbb5cbccae64e14539742@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Pavel Machek <pavel@denx.de>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>, Michael Schmitz <schmitzmic@gmail.com>, cip-dev@lists.cip-project.org, linux-m68k@lists.linux-m68k.org
Subject: [PATCH 4.19.y-cip] signal/m68k: Use force_sigsegv(SIGSEGV) in fpsp040_die
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
