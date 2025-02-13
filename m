Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA651FAC42
	for <linux-m68k@lists.linux-m68k.org>; Thu, 13 Feb 2025 07:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739431466; cv=none; b=YGCGOeAzA9Zp0HAGd/dFwMFatyunBU6O31Zgiv8wd3p/NWn84M/GLQOgcu1PtUG50Sfdd/7LURG5NwCKHnsGcuUkBI05PIXynQIzJPRIdZoiYtFK7wFaB6GNdjJbW4Xs10PkIYug7Yjr0TThssr38M1HOVfygG6KIGmouN9FdW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739431466; c=relaxed/simple;
	bh=KelfrUEDKn1STr/uyl6Wn/gXFShtj7LS2NXx40teaXU=;
	h=Date:Message-ID:From:To:Cc:Subject; b=B4oBBulnjJozRGXYsk/8SH7pyyyFS5X+Zdd8SkL45eqlQTokpp8wVsqNe6HbMTpXyGyxtpMUx83o4TvHtsltzLgxNPPQEbEG86tFM0mAIsJqnwiSTXfToLuzRvG7l+PctnK+KDqz01kUMCMqls/vhbg3Yi41xGCdMb1kfTrlfNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=so42F6pg; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="so42F6pg"
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 6DE79114011B;
	Thu, 13 Feb 2025 02:24:23 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Thu, 13 Feb 2025 02:24:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1739431463; x=1739517863; bh=2pmDU7e3MlYtu8haZn4roILPX83I
	3ITd6BRmfCF1ljE=; b=so42F6pgFJmKgE2BnJzzi6QiryasCskNzwwuwgozVHdX
	3tHYVIZZCTbyCqSVwHG7l2Ipx+x6I1LOQy1f5p2vwho/caTZdT+IwQeZlt1xJgJO
	yTisi+LncJmWDGRP/PmxARJ5NE+QcR9g+WD9mFm8Tb55XSD/19iUbjYLN6qL8wrS
	2xGXQ8k/YprkwD/1JzUk13BZQ85naVGwM6gKEJtv77zpFQKspu88wO/ndrl4pNcz
	xhOXmBxp2/EBWBxEyYwcIEMHqCk5QBT9SKpifUsnr8SkXuY+YCmENAYopMWJ6Iw7
	WuqaXNpddO04bTNoaP+uKBSmRU8SdNvK3EWug49mLw==
X-ME-Sender: <xms:Jp6tZ3ydtIgaKAqCCHK7C6Or9TE5zcBfzuo97K0zXBiToW6zcjPmww>
    <xme:Jp6tZ_SRqnjJYDZ4oA9DcTQ9nxPL9hExHAvOeSnAV3zGiwY-4xbQ-zdipQKFsQqnW
    oBpCbbXj0_q_oJ-An0>
X-ME-Received: <xmr:Jp6tZxW1EbxVL-chywyqcGcgFcQlQ3IxGXf0k2hUyFxIvThSKYVcJPrhAa1Qb52gJ8Mm3e5wwqAUaBoLpHZvk7Yi28miy4I0iEs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegieduiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffkffhvfevufestddtjhdttddttdenucfhrhho
    mhephfhinhhnucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
    eqnecuggftrfgrthhtvghrnhepiedugfduhffgheekjeekffduueejudevffehiedtledt
    tdekveekuefhvdfftedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghinheslhhi
    nhhugidqmheikehkrdhorhhgpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpoh
    huthdprhgtphhtthhopehnohgsuhhhihhrohdurdhifigrmhgrthhsuhesthhoshhhihgs
    rgdrtghordhjphdprhgtphhtthhopehprghvvghlseguvghngidruggvpdhrtghpthhtoh
    eplhhirghmrdhhohiflhgvthhtsehorhgrtghlvgdrtghomhdprhgtphhtthhopehstghh
    mhhithiimhhitgesghhmrghilhdrtghomhdprhgtphhtthhopegtihhpqdguvghvsehlih
    hsthhsrdgtihhpqdhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhei
    kehksehlihhsthhsrdhlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:Jp6tZxhkemblVhba-C_fldQwrKbbNXI7PsG1kKqTj5HWtj_laGONHw>
    <xmx:Jp6tZ5Dybeo2746kzYWlZhURDaERDUlYlijylLfKXDNihJby_hl7Ow>
    <xmx:Jp6tZ6JDZJYl_3UABWmC8AKLt30WBKrMb6OS9SZPa-xPpf4DzxdyNw>
    <xmx:Jp6tZ4DpaWUgr6fSIKF4otUyxyZrOjWRBNvfCP9J5KNWHaaRk_EjzQ>
    <xmx:J56tZ84ZmC0bl_rpr15XSaB3NZWaaMttdWq4f4nGXDe8gEsTKKsvWeC2>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Feb 2025 02:24:21 -0500 (EST)
Date: Thu, 13 Feb 2025 18:24:12 +1100
Message-ID: <d93cfb463e8c2abc324309367c591644@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Pavel Machek <pavel@denx.de>
Cc: Liam Howlett <liam.howlett@oracle.com>, Michael Schmitz <schmitzmic@gmail.com>, cip-dev@lists.cip-project.org, linux-m68k@lists.linux-m68k.org
Subject: [PATCH 4.19.y-cip] m68k: Add missing mmap_read_lock() to sys_cacheflush()
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
 
