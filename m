Received: from fhigh2-smtp.messagingengine.com (fhigh2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B069A2D
	for <linux-m68k@lists.linux-m68k.org>; Sun, 11 Aug 2024 00:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723335235; cv=none; b=GcJ1S34KsIzteeoibjXTsN9Ho63Chojk+YXqKbo4ifNwvTte09nI9JZCGLUoMCKU37hPNtf5ugXcSe0zeDgNuSUcT8aax/Hsr+FE6y0AaULB8whXNKvGh3USRBLp8gUaFsd7dT62GgZgPb7Fqr9XHcO4YOKZPntuTDrj1KpuSq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723335235; c=relaxed/simple;
	bh=cowJQfiDDVlOVSXxfvYoFDidpicz3RI5/vmjQXYLfCo=;
	h=To:Cc:Message-Id:From:Subject:Date; b=rCfYAXHatScHKPZ7leZ59e0TdtEMiYKCatRWwCNToBDG3/i881MLxCk5bjycB6efUCehENEC4IoyfxgzzLGLKrOfcLHyPl/Wshdhn5gE2QbLwx17A1hN90jS2peIupqSE+AfmbwaBwNKz3spLvamVbw6q2uSkHjHnZ0yS3mZk14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=uaTLXXt3; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="uaTLXXt3"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id C03C3114C2AA;
	Sat, 10 Aug 2024 20:13:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Sat, 10 Aug 2024 20:13:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1723335233; x=1723421633; bh=bxMGoKXycPFPw
	5bnHotmJYai6CfMkuRulgDaUjgKP+Q=; b=uaTLXXt33vznMfbqAY0RpLgmgZCa9
	uHLkZXlKCrDgR+2iAfdZi1K+J96oN5uWMEGaQe5PI+/i3TeYYssNElFZ4evvhxYt
	7WlgF+qyZOeqwRjMZ2fUM0UzYsrfJK43WOQEyTcoLGSqMB7cH7ZNlry6U/Xri96T
	h0M0pSDwD85Sz8Je6jO7gHleUPeJAhAntZ4wCuZBELHdzPUIM99HRBJPqcM9KJQt
	SSoVHeZmmzt3QwMo08pQLR/gf5GpUwMFkI1PcdEMcmlLz8gQDCpn6K5RCzUHeB28
	M6bV7fD9+gEpQqA0E6CX+9aF0/czDaYXsgvLCybSVVUocx9penD2LS4/w==
X-ME-Sender: <xms:QQK4Zj_53Ib33_p8tU0PzOn0w0gnjpikmHCx1aeSSMARHT-0DTzDaw>
    <xme:QQK4ZvvVDqQ5qLl5nS4bV526DSTyhxpQb8WexbUaUQVorIUhCVeoKM25eOltXk0MP
    cz4wSJjqsNmMslZSZQ>
X-ME-Received: <xmr:QQK4ZhD2VBP_AgEFz6S_qWuo-g-RhHJIDf2p2BJCVG03kT0slmIgC-NJ_Tth3R1U_qOX11DztwporhtlFcOVb_J9YiNYNnMxtew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrleejgdefgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefvvefkhffuffestddtredttddttdenucfhrhhomhep
    hfhinhhnucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqne
    cuggftrfgrthhtvghrnhepffeuieelgeffgedtheevfeekffevffeiudegfeevuedvtedt
    feeiffelgfetgeeunecuffhomhgrihhnpeguvggsihgrnhdrohhrghenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhu
    gidqmheikehkrdhorhhgpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuth
    dprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthho
    pegsrhgruhhnvghrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgvghrgheslhhinh
    hugidqmheikehkrdhorhhgpdhrtghpthhtohepuhhsvghrmhehjeeshigrhhhoohdrtgho
    mhdprhgtphhtthhopehlihhnuhigqdhmieekkheslhhishhtshdrlhhinhhugidqmheike
    hkrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhn
    vghlrdhorhhg
X-ME-Proxy: <xmx:QQK4ZveQ4otFQEGH23IJ4jwxPdzAFS8lU5aB-5VGSdcN5CGkIOmgbQ>
    <xmx:QQK4ZoNnrS_DmR5RwORATmrKNYZQ1TKWD-_8-D5O2PULCXkIggcnMQ>
    <xmx:QQK4Zhlhf59YlO_HkFTYllapEzv0ZgOg0RIVdah6L6-B18kLRDrvpQ>
    <xmx:QQK4ZitfIv4Ywea7QZab3ueu-s0NsNoJxiBeGCAsPUICzCB5S7m4AA>
    <xmx:QQK4Zn3gxZPlEmCXa0gFSnkgLIGndymPNFtm2uzRTxhIvRYev47vazdV>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 10 Aug 2024 20:13:52 -0400 (EDT)
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Christian Brauner <brauner@kernel.org>,
    Greg Ungerer <gerg@linux-m68k.org>,
    Stan Johnson <userm57@yahoo.com>,
    linux-m68k@lists.linux-m68k.org,
    linux-kernel@vger.kernel.org
Message-Id: <3463f1e5d4e95468dc9f3368f2b78ffa7b72199b.1723335149.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH v3] m68k: Fix kernel_clone_args.flags in m68k_clone()
Date: Sun, 11 Aug 2024 10:12:29 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

Stan Johnson recently reported a failure from the 'dump' command:

  DUMP: Date of this level 0 dump: Fri Aug  9 23:37:15 2024
  DUMP: Dumping /dev/sda (an unlisted file system) to /dev/null
  DUMP: Label: none
  DUMP: Writing 10 Kilobyte records
  DUMP: mapping (Pass I) [regular files]
  DUMP: mapping (Pass II) [directories]
  DUMP: estimated 3595695 blocks.
  DUMP: Context save fork fails in parent 671

The dump program uses the clone syscall with the CLONE_IO flag, that is,
flags == 0x80000000. When that value is promoted from long int to u64 by
m68k_clone(), it undergoes sign-extension. The new value includes
CLONE_INTO_CGROUP so the validation in cgroup_css_set_fork() fails and
the syscall returns -EBADF. Avoid sign-extension by casting to u32.

Cc: Stan Johnson <userm57@yahoo.com>
Reported-by: Stan Johnson <userm57@yahoo.com>
Closes: https://lists.debian.org/debian-68k/2024/08/msg00000.html
Fixes: 6aabc1facdb2 ("m68k: Implement copy_thread_tls()")
Signed-off-by: Finn Thain <fthain@linux-m68k.org>
---
Changed since v1:
 - Cast to u32 instead of using lower_32_bits() as suggested by Geert.
Changed since v2:
 - Commit log ammended with -EBADF instead of -EBADFD.
---
 arch/m68k/kernel/process.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/kernel/process.c b/arch/m68k/kernel/process.c
index 2584e94e2134..fda7eac23f87 100644
--- a/arch/m68k/kernel/process.c
+++ b/arch/m68k/kernel/process.c
@@ -117,7 +117,7 @@ asmlinkage int m68k_clone(struct pt_regs *regs)
 {
 	/* regs will be equal to current_pt_regs() */
 	struct kernel_clone_args args = {
-		.flags		= regs->d1 & ~CSIGNAL,
+		.flags		= (u32)(regs->d1) & ~CSIGNAL,
 		.pidfd		= (int __user *)regs->d3,
 		.child_tid	= (int __user *)regs->d4,
 		.parent_tid	= (int __user *)regs->d3,
-- 
2.39.5

