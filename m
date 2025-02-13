Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF9420766B
	for <linux-m68k@lists.linux-m68k.org>; Thu, 13 Feb 2025 07:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739431331; cv=none; b=ss9PV3qV4Dz6iJuLH3PnUpahTS/Q/XxNXK2j1d1vpl2tjJ6eJ2iiM/b3lJhoXRn3aB+HlQMx+QpDGWePjDaLPYWe7zI+y3VNGz3j3Dnns80a1MMyneWjiUQ0w9YA9Vrlrr0z40xN8MwnKUKzQ5xFfZa/sClv4RAcI/aNk/FzOf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739431331; c=relaxed/simple;
	bh=KelfrUEDKn1STr/uyl6Wn/gXFShtj7LS2NXx40teaXU=;
	h=Date:Message-ID:From:To:Cc:Subject; b=aLB8QSwiBc4sMzS3CCKEGNA0TUqzCSuuoGegZLGTDLz/GdUCYWj588DoI56Y5MlbRrmroUxjxoUt0t4p9IYgO2Xg6nDhFSjlUxp3amL0Etzy8npIE/nAbffSpwmQMZ5wZhMj4u5K+zR5pyeYLqjLsiQzMU86piNwVyI4G9b9olc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NCnPkeyW; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NCnPkeyW"
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfout.stl.internal (Postfix) with ESMTP id 50DA81140117;
	Thu, 13 Feb 2025 02:22:07 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Thu, 13 Feb 2025 02:22:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1739431327; x=1739517727; bh=2pmDU7e3MlYtu8haZn4roILPX83I
	3ITd6BRmfCF1ljE=; b=NCnPkeyWuYqnLUVRRM/2BjjO/aut3wdSYbvmE/bmQayy
	37FdRgRAigoARZJ7xuAsS62jXaSBezF08C7lg1BzXU1pnlW+fzGqVV7XZP9FGI0d
	f96YrvtplKc1v0u1OlvS2v/KhHLcxwFHtPjJnxyfazy7maYDMxBI/d3N+nI3Stry
	wNCB+OBBLIj7tFmvXhAcBKCYJr0BkDiQ6wbG2G8oOIdZhJ6HpTZBMdrstTh2TItE
	B0Uzmany2dUSvAmv46dLWfhbheutJnnLy8eHpDtmOwoQQMBtlBMn+E1d+zs2/fsZ
	YhEfa7vW1kDPncNuov1rYsRB5onE7nr8TqUC/KBojw==
X-ME-Sender: <xms:np2tZ7VE47isYrzIy1xBw6QGGEG9Tq2IRZDOlaLOkf9JipiW7sRLGQ>
    <xme:np2tZzn7UH0l30jd-1MfXNMAK5wwzniH2Y38BmCXNMl3wOFbvLtNV_xVPGW-s-idh
    DpiobeQoMBEfjmAuIk>
X-ME-Received: <xmr:np2tZ3aFHBsnU7qT4IFT6IgDMoNny0sP62BJiPO8ih9oNsbReD0CPVe2MLuz7ue_a6e3ioOn98csoepz7X3_a1-ifz7tI2XjhZw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegieduhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffkffhvfevufestddtjhdttddttdenucfhrhho
    mhephfhinhhnucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
    eqnecuggftrfgrthhtvghrnhepiedugfduhffgheekjeekffduueejudevffehiedtledt
    tdekveekuefhvdfftedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghinheslhhi
    nhhugidqmheikehkrdhorhhgpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpoh
    huthdprhgtphhtthhopehulhhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihgr
    mhdrhhhofihlvghtthesohhrrggtlhgvrdgtohhmpdhrtghpthhtohepshgthhhmihhtii
    hmihgtsehgmhgrihhlrdgtohhmpdhrtghpthhtoheptghiphdquggvvheslhhishhtshdr
    tghiphdqphhrohhjvggtthdrohhrghdprhgtphhtthhopehlihhnuhigqdhmieekkheslh
    hishhtshdrlhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:np2tZ2VDuMwqO1as86tX1RYcLSYdV9s3IkjTUrSOeK-WlQoWGS643A>
    <xmx:np2tZ1k0YaoaaF_oWg9h7zQHTdivaPeSTTMacQhMl1inKJM_omimgw>
    <xmx:np2tZzfcXdECzgE-XeZxZkWqk-RfBZHRfJmdJWlOsgD8awvOL9HHrA>
    <xmx:np2tZ_G-IaB2s41_gRrgNti2BExqHuWS_DmJRFo5bkS7FKnGZNUzxA>
    <xmx:n52tZ-DatzZz6JgrFXekduxMVD5a2kLeUJaZ1zBEeoC1Iugn9jz1HQuh>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Feb 2025 02:22:03 -0500 (EST)
Date: Thu, 13 Feb 2025 18:21:56 +1100
Message-ID: <9a7bb5ad805dbb1c8a67186f04500474@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
To: Ulrich Hecht <uli@kernel.org>
Cc: Liam Howlett <liam.howlett@oracle.com>, Michael Schmitz <schmitzmic@gmail.com>, cip-dev@lists.cip-project.org, linux-m68k@lists.linux-m68k.org
Subject: [PATCH 4.4.y-cip] m68k: Add missing mmap_read_lock() to sys_cacheflush()
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

From: Liam Howlett <liam.howlett@oracle.com>

[ Upstream commit f829b4b212a315b912cb23fd10aaf30534bb5ce9 ]

When the superuser flushes the entire cache, the mmap_read_lock() is not
taken, but mmap_read_unlock() is called.  Add the missing
mmap_read_lock() call.

Fixes: cd2567b6850b1648 ("m68k: call find_vma with the mmap_sem held in sys_cacheflush()")
Signed-off-by: Liam R. Howlett <Liam.Howlett@Oracle.com>
Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Link: https://lore.kernel.org/r/20210407200032.764445-1-Liam.Howlett@Oracle.com
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
[ mmap_read_lock() open-coded using down_read() as was done prior to v5.8 ]
Signed-off-by: Finn Thain <fthain@linux-m68k.org>
---
 arch/m68k/kernel/sys_m68k.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/m68k/kernel/sys_m68k.c b/arch/m68k/kernel/sys_m68k.c
index 6363ec83a290..38dcc1a2097d 100644
--- a/arch/m68k/kernel/sys_m68k.c
+++ b/arch/m68k/kernel/sys_m68k.c
@@ -388,6 +388,8 @@ sys_cacheflush (unsigned long addr, int scope, int cache, unsigned long len)
 		ret = -EPERM;
 		if (!capable(CAP_SYS_ADMIN))
 			goto out;
+
+		down_read(&current->mm->mmap_sem);
 	} else {
 		struct vm_area_struct *vma;
 
