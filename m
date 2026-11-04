Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793822362;
	b=S9TASzKZ6vobMiY+q/LYVOavZQh7AhfkJWGqZYPNrDqzjx8yaIDrpC5HxrYFbcYN4gMd
	 xQ3cztL+l4OdzBu4E/tasT2OjP1vH91zcErSHTogZu1bz6UQ050w2+pO79nsajlAbcIWA
	 giBTD8Ja4ezlSqvOWdnUkf7nCsRtG5BTu6XwVPx8fF7FAWMlXqniGdiHB/uCB3/USO9+R
	 RCFqGC0GFntgP4xgXNcqnwrik1dIUl/WNQKWPY5jVL7c1fyZjD5oA/0jmXxtFIROzFKOW
	 pGYCrTiC/to+fjc0PUXyvkZEvaDxljzrsI1gz8pVCsfEowid+hCvmB01PuTeaCqiE7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793822362;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=fxIBhh7BKiMVxtDmu4/U+E0RVHzkWKjhatO8Mz/jm1g=;
	b=qURKy1vu2IU7beyQg3T6EgDQm+891qyLYLEY2F2AzM0By4uEqhfyEDjbd0GqScSk4Vx7
	 xgg+tQHGldKk8mhLr11lR20OHqghuvQZ8OA94spjXMk2Xn13yru5Ojm/90HMfVEFeD5BN
	 8pO8401ZkjHiAxpchQHqfYTRQ3wWqGE8uQ6f6s/8Ft+aXmNIhgHDa0mKfN/eaRWx+xE8t
	 /PpsmUTttuJOE5HzZbSLfk+egnZ8uRGOiA0VqabYjIp4uQ0HaZPixBO7/KI6s43H4WNTe
	 0ossl9rPlPAI6xx5CMwdEk0+NMA7CGFG9C8eoFpQ+HLWlNdGJfqpEvwmIQDzHzxBrTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cG3jfP4l;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E29B60EA98E
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Nov 2026 19:59:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E29B60EA98E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cG3jfP4l
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 979586154C;
	Wed,  4 Nov 2026 19:59:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FF811F000C1;
	Wed,  4 Nov 2026 19:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793822361;
	bh=fxIBhh7BKiMVxtDmu4/U+E0RVHzkWKjhatO8Mz/jm1g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cG3jfP4ltLZ0emEodeqGyV0F81UQdOK9veUjoQYm4vphxyhicVcIAruAa+hQZp+vv
	 LuOy8c/zGjrkusiVcA2VvKJPewsxQtOI7YmD/bcmyRhjnxtsLluEEVPgV3DQNWk47/
	 mSdpjmiWy5tp6Q3PNAMQqcpNrwMMBVMexQqgPaJs3Iy/UBHTYwpQM+Lc5KFKqelFF1
	 ody93CB96hEImqNd69y/UCjV7GfX81amWcZ+7LnqODBl023Evc/9fAIcSNlwwSooaK
	 2T20X1BwYkngzdsHGxYvyb9SWZRkV/ciSqqkihKqF4dLUBJm1YcXlGUFPGXCxWvkvY
	 4eJobVyd6CS9A==
From: Christian Brauner <brauner@kernel.org>
To: linux-fsdevel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Jann Horn <jannh@google.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Chris Mason <mason@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	NeilBrown <neil@brown.name>,
	Eric Dumazet <edumazet@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Jonathan Corbet <corbet@lwn.net>,
	Christoph Hellwig <hch@lst.de>,
	Greg Kroah-Hartman <gregkh@suse.de>,
	Joel Granados <joel.granados@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Jan Kara <jack@suse.com>,
	linux-kernel@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	netdev@vger.kernel.org,
	ntfs3@lists.linux.dev,
	platform-driver-x86@vger.kernel.org,
	coreteam@netfilter.org,
	kexec@lists.infradead.org,
	linux-pci@vger.kernel.org,
	linux-sound@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	ibm-acpi-devel@lists.sourceforge.net,
	jfs-discussion@lists.sourceforge.net,
	linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-cifs@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-mm@kvack.org,
	linux-sh@vger.kernel.org,
	linux-usb@vger.kernel.org,
	samba-technical@lists.samba.org,
	sparclinux@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-doc@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-atm-general@lists.sourceforge.net,
	Takashi Iwai <tiwai@suse.de>,
	linux-input@vger.kernel.org,
	linux-raid@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-debuggers@vger.kernel.org,
	"Christian Brauner (Amutable)" <brauner@kernel.org>,
	Chuck Lever <cel@kernel.org>
Subject: [PATCH RESEND v2 06/13] SUNRPC: let procfs own the seq_file of the cache content file
Date: Wed,  4 Nov 2026 20:59:07 +0100
Message-ID: <20261104-work-procfs-net-v2-6-221e2437fed1@kernel.org>
In-Reply-To: <20261104-work-procfs-net-v2-0-221e2437fed1@kernel.org>
References: <20261104-work-procfs-net-v2-0-221e2437fed1@kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1629; i=brauner@kernel.org; h=from:subject:message-id; bh=psvvZ7JIZLE0CRNp8kUfwlc9JvUIb4uUwK5YCFxYJEI=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS97tM6n7F9Us5PDZO+pQGKZ6Zs1PCcwb/5cVO9pcRsm 2mK1t//dpSyMIhxMciKKbI4tJuEyy3nqdhslKkBM4eVCWQIAxenAEwkZiUjw8UVnRyhZ297By25 0hTRu+CuzNW6RbKizFpOAUYq+3ujLRkZjva/ZpdLVCpwYrJbpltzfc1blUefGwUv7OU14v60a1o EOwA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

Declare the seq_operations and let procfs open and free the seq_file of
/proc/net/rpc/<cache>/content. ->proc_open() and ->proc_release() only
take and drop the module reference and set up ->private now. The
rpc_pipefs file is unchanged. Reading the procfs file then no longer
holds up its removal when the network namespace goes away.

Acked-by: Chuck Lever <cel@kernel.org>
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 net/sunrpc/cache.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/net/sunrpc/cache.c b/net/sunrpc/cache.c
index 1ceaea7e01b9..007521e8a57f 100644
--- a/net/sunrpc/cache.c
+++ b/net/sunrpc/cache.c
@@ -1606,24 +1606,28 @@ static const struct proc_ops cache_channel_proc_ops = {
 	.proc_release	= cache_release_procfs,
 };
 
+/* procfs opens the seq_file */
 static int content_open_procfs(struct inode *inode, struct file *filp)
 {
 	struct cache_detail *cd = pde_data(inode);
 
-	return content_open(inode, filp, cd);
+	if (!cd || !try_module_get(cd->owner))
+		return -EACCES;
+	((struct seq_file *)filp->private_data)->private = cd;
+	return 0;
 }
 
 static int content_release_procfs(struct inode *inode, struct file *filp)
 {
 	struct cache_detail *cd = pde_data(inode);
 
-	return content_release(inode, filp, cd);
+	module_put(cd->owner);
+	return 0;
 }
 
 static const struct proc_ops content_proc_ops = {
+	.proc_seq_ops	= &cache_content_op,
 	.proc_open	= content_open_procfs,
-	.proc_read	= seq_read,
-	.proc_lseek	= seq_lseek,
 	.proc_release	= content_release_procfs,
 };
 

-- 
2.53.0

