Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8908153824
	for <linux-m68k@lists.linux-m68k.org>; Wed, 22 Jan 2025 08:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737535681; cv=none; b=Ir4S1G7BJ2wAn34ev4qYAASJ6fxaa/x8JpHYMf3wKUcE2d1lEKIa07huZGWTWjd5EKh+xZqRl6vMaw4N+MqFFTX8ckIfjWZiel7w7Sa7G6hXZF9Izn2JRsSULXcAmCYE+02pY/m0aaso0Xi9SUHRZ4pwibPKLak3pPFgfCArTnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737535681; c=relaxed/simple;
	bh=PBw+2l4k/U/8zjU5cemT5owgK8Rdjbs+7eB+L9/Ycbc=;
	h=Date:Message-ID:From:To:Cc:Subject; b=ldcRoH79qzYZPNxQi4H5zZC5LNZLpFlb4lUHR3e45X+ubcBfPZ1hJFh5y5DCZJQe+amTfX4ow/REv+SGZjz5AezONkyg4uXR2u8Q5kfsZwc7mf4AfX7FMhy9+rvKvsPASeMkB5ksP8SAGBxhm9QKSl8c8enKj1J/2LRqlIGyUaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=m8FxBIqD; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="m8FxBIqD"
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id EE24D11401B8;
	Wed, 22 Jan 2025 03:47:58 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Wed, 22 Jan 2025 03:47:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1737535678; x=1737622078; bh=r29dMPQRv+Gn3SilhPT9HklbBYac
	hEKIULVz8FVwt98=; b=m8FxBIqD8AFx7QDjZKK09qEyoeP8JSHS9J24rTlRDaTh
	YX9nVwE1MIrRJe/lM7O5StPm5Ie2w3qeWJNDYROB8YAoBtUUZXNdapgPNh1MtLGM
	o2cJ7xGrxf0tYOVrhlGn3qe41Zugacl4175g+Cp5IdP1WRS7/WKyE15ZwZIJ5aSU
	UNmaVGVO1CFM9vAhhQUgHkSPoRZ70HtTfAOemvH4FWAUMuvggDOHDpGaeBgHARNr
	lc/Tmqryy2H4IdfORIMg5vNVv03M/ioKk0zKXwA/sEAl3ypjuyHA46w5ew0Cp7dw
	S2ODsLL4Np8EdNSejRQILzB2Xc76qSFvLkZYSEaJvw==
X-ME-Sender: <xms:vrCQZ6UOq3u7jqcfUJE4ODxVrzeJSxfHiT12uYKskoIRK63sra9NSQ>
    <xme:vrCQZ2mWDzXdVSc8CvZ3w8pREdwMqhf48x_hOTjY1FbwKzjbvNAxCtvnvdvtNOrrp
    K0CaQ0ukMc4nUVLpIM>
X-ME-Received: <xmr:vrCQZ-a48UZEF5_yPgIQrTGCepPaTt_z_hb1QwOwkK979k69VkyBsCQLhF55xTeqz8iahz_e1p-IRti3j51NaJAU-igej_cEgxw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejfedguddvvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffkffhvfevufestddtjhdttddttdenucfhrhho
    mhephfhinhhnucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
    eqnecuggftrfgrthhtvghrnhepheetuddufffgfeekkeejudeivdfgfedtleetkeduleek
    ueefhfevueekkeeftdeinecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpvghnthhrhi
    drshgsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    fhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrghdpnhgspghrtghpthhtohephedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepshhtrggslhgvsehvghgvrhdrkhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepghgvvghrtheslhhinhhugidqmheikehkrdhorhhgpd
    hrtghpthhtohepvhhirhhoseiivghnihhvrdhlihhnuhigrdhorhhgrdhukhdprhgtphht
    thhopehlihhnuhigqdhmieekkheslhhishhtshdrlhhinhhugidqmheikehkrdhorhhgpd
    hrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:vrCQZxXK9Y1izOnWDIf3lWDLTaKKyVG71fqjY0Sh95MIZWW9mWTheA>
    <xmx:vrCQZ0mt1QLwMsxqRRuL6Y2TM9sVpkM4HPKRPhokHZX5IYFIepchxQ>
    <xmx:vrCQZ2f63LykdBitRqeK-9fXb5UKlAj_ngZhqKLp0b7BtD1z6YKXiA>
    <xmx:vrCQZ2G5oI48qEuGz-c96RPHP98iOOJLY2oxQyzlDk9M5sbNKI-OZA>
    <xmx:vrCQZ1Cz0ZT_Azkj8Lwq2Je-6buv1h8_sjHngF-lNS0wY36y9OooHMvr>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jan 2025 03:47:56 -0500 (EST)
Date: Wed, 22 Jan 2025 19:47:50 +1100
Message-ID: <8073f191a5759ba3bf582e4f88fde267@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
To: stable@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Al Viro <viro@zeniv.linux.org.uk>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5.10.y] m68k: Update ->thread.esp0 before calling syscall_trace() in ret_from_signal
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

From: Al Viro <viro@zeniv.linux.org.uk>

[ Upstream commit 50e43a57334400668952f8e551c9d87d3ed2dfef ]

We get there when sigreturn has performed obscene acts on kernel stack;
in particular, the location of pt_regs has shifted.  We are about to call
syscall_trace(), which might stop for tracer.  If that happens, we'd better
have task_pt_regs() returning correct result...

Fucked-up-by: Al Viro <viro@zeniv.linux.org.uk>
Fixes: bd6f56a75bb2 ("m68k: Missing syscall_trace() on sigreturn")
Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
Tested-by: Michael Schmitz <schmitzmic@gmail.com>
Reviewed-by: Michael Schmitz <schmitzmic@gmail.com>
Tested-by: Finn Thain <fthain@linux-m68k.org>
Link: https://lore.kernel.org/r/YP2dMWeV1LkHiOpr@zeniv-ca.linux.org.uk
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Finn Thain <fthain@linux-m68k.org>
---
 arch/m68k/kernel/entry.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/m68k/kernel/entry.S b/arch/m68k/kernel/entry.S
index 417d8f0e8962..0d03b4f2077b 100644
--- a/arch/m68k/kernel/entry.S
+++ b/arch/m68k/kernel/entry.S
@@ -182,6 +182,8 @@ ENTRY(ret_from_signal)
 	movel	%curptr@(TASK_STACK),%a1
 	tstb	%a1@(TINFO_FLAGS+2)
 	jge	1f
+	lea	%sp@(SWITCH_STACK_SIZE),%a1
+	movel	%a1,%curptr@(TASK_THREAD+THREAD_ESP0)
 	jbsr	syscall_trace
 1:	RESTORE_SWITCH_STACK
 	addql	#4,%sp
