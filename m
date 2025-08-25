Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7480B1DF73A
	for <linux-m68k@lists.linux-m68k.org>; Mon, 25 Aug 2025 04:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756095291; cv=none; b=lhrrQBJvrkdZZ+H58FGBbgLDX0nKNVYtuj+pS2HxmpxggpZ0mEvcC4IjvDH1j5HtSHN5WQUD+y3CUw4nu5TGw8w9vx3wXyQeq4EpZjhwFkQvyRSu4ITiHPbAa7Ml8qHhspfr+EVsMknaYa8GiIfoLrF9b8BNy+dn44rG7Ch8+AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756095291; c=relaxed/simple;
	bh=jRE0j/a3Blw5jBzPmdqmicKxGpOIJhBd9aEt46ekE8w=;
	h=To:Cc:Message-ID:From:Subject:Date; b=Efk7kmboze6KKoYtFbS0p0OkjNJsn+c0rmBZN18lvg2fT9GeXMe+TN/6/exWqqP/x/6V1KZdylmOnt9YywkT8PU8AzZ0924MS2LsO+18kJlyhE+RGwsye5RI06PMgQiCUu8iR4zZD5yn8cE2+bAZ6GewaUyZayy1b2QtHJab804=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Fl0SF4Be; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Fl0SF4Be"
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfout.stl.internal (Postfix) with ESMTP id 7953A1D00068
	for <linux-m68k@lists.linux-m68k.org>; Mon, 25 Aug 2025 00:14:49 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Mon, 25 Aug 2025 00:14:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1756095289; x=1756181689; bh=voARBgy3yx2HVaACbb8e7bteXCgR
	0SdI2PllfVi1VYk=; b=Fl0SF4BeiisWcPlmspx7uwHOhir+ReLubAtLfjQ4hlQy
	0WUykTC4UBnm20kXBcCWvtpLGr21djm1m1nH3YCOOlYeiLeO2SoQQSJBw4l5PPfO
	UV3gdd2Id3Q9YC5Mbm7+hvW5JCJPv4PlKKOEy4+A//fYqeJ6Ane5+fMpQE8z+m6r
	U6xZmhHSFC1jF+O93diNiCeXH2t2hPYqrWF5+K30D9onDtxhS718Ceyurw0sN+3Y
	zvzbJzqsoQqUf2yg1uxJDLoD12WFQ2ZWYmvcfKXhPGzXPSo7pki/9QPaXlilE+U4
	8D7NRwOM7QehCRvU7HKhQXPPON5TWIUabWotguPqWg==
X-ME-Sender: <xms:OeOraBDcEf1KBd5yLGCheuEFXaEa9Zzm-BTJ7q5lVPlA6XgQZXQhew>
    <xme:OeOraBh-MweHewUiugX82tay6fwZP88RpG-pKHWQQM9aqoct-eVp4bO352F_xU_J2
    Id8Cw6CRk2EJahYSkw>
X-ME-Received: <xmr:OeOraF_By8pjUxwXT8paoVK67BVtoA-08wnGCjwHHkZ3Q3xCgqM6gdH9MxCEAceSYcwwD7kRAFeoyZIy9FGEs-BIsG2reiGZw34>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddujedugeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepvfevkffhufffsedttdertddttddtnecuhfhrohhmpefhihhnnhcuvfhhrghinhcu
    oehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrghtthgvrhhnpe
    ekffejgfehheehkeekffffveekteevvddvveelhffgffetteefgfeutdehleetheenucff
    ohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrghdp
    nhgspghrtghpthhtohepuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhinh
    hugidqmheikehksehlihhsthhsrdhlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:OeOraN-kNa-3kDdkASpY44yADpqE_bcj1wF9ooKwtrH2i-it3g2uew>
    <xmx:OeOraOB5Nu3QYUNOof8qIqj5bV9enR5Ij4nH_xZh18IY_qH2Zng-RA>
    <xmx:OeOraNwtMJs3tLnyMwuSuWwhcZ01UfAmyLGFsq_yApwNbWkWkAdtUg>
    <xmx:OeOraDTOGkSSyzpmwHtee_cKUHKb3GLe1R8pRHqyiZ87VvBki4Cahw>
    <xmx:OeOraJEmP7bPQAqSBmqfymg6fGxd4n_fhm_o34ghpTyc04LYoMspCKhJ>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <linux-m68k@lists.linux-m68k.org>; Mon,
 25 Aug 2025 00:14:46 -0400 (EDT)
To: "Andrew Morton" <akpm@linux-foundation.org>,
    "Lance Yang" <lance.yang@linux.dev>
Cc: "Geert Uytterhoeven" <geert@linux-m68k.org>,
    "Masami Hiramatsu" <mhiramat@kernel.org>,
    "Eero Tamminen" <oak@helsinkinet.fi>,
    "Peter Zijlstra" <peterz@infradead.org>,
    "Will Deacon" <will@kernel.org>,
    stable@vger.kernel.org,
    linux-kernel@vger.kernel.org,
    linux-m68k@lists.linux-m68k.org
Message-ID: <7d9554bfe2412ed9427bf71ce38a376e06eb9ec4.1756087385.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH] atomic: Specify natural alignment for atomic_t
Date: Mon, 25 Aug 2025 12:03:05 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

Some recent commits incorrectly assumed the natural alignment of locks.
That assumption fails on Linux/m68k (and, interestingly, would have failed
on Linux/cris also). This leads to spurious warnings from the hang check
code. Fix this bug by adding the necessary 'aligned' attribute.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Lance Yang <lance.yang@linux.dev>
Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Eero Tamminen <oak@helsinkinet.fi>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will@kernel.org>
Cc: stable@vger.kernel.org
Reported-by: Eero Tamminen <oak@helsinkinet.fi>
Closes: https://lore.kernel.org/lkml/CAMuHMdW7Ab13DdGs2acMQcix5ObJK0O2dG_Fxzr8_g58Rc1_0g@mail.gmail.com/
Fixes: e711faaafbe5 ("hung_task: replace blocker_mutex with encoded blocker")
Signed-off-by: Finn Thain <fthain@linux-m68k.org>
---
I tested this on m68k using GCC and it fixed the problem for me. AFAIK,
the other architectures naturally align ints already so I'm expecting to
see no effect there.
---
 include/linux/types.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/types.h b/include/linux/types.h
index 6dfdb8e8e4c3..cd5b2b0f4b02 100644
--- a/include/linux/types.h
+++ b/include/linux/types.h
@@ -179,7 +179,7 @@ typedef phys_addr_t resource_size_t;
 typedef unsigned long irq_hw_number_t;
 
 typedef struct {
-	int counter;
+	int counter __aligned(sizeof(int));
 } atomic_t;
 
 #define ATOMIC_INIT(i) { (i) }
-- 
2.49.1

