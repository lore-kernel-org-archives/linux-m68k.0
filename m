Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793631222;
	b=ix1HHvM72blzuBjt6+Lcnc72pBYmmZ8hnZzsvEMZ5lXrcDG7KNatvU6c1UfPr79tdhfn
	 zrf/51Woie2JhY9D/dbghGFuuetnuGLc1tNEqBCsnn9aCjMRGZSAn1a3okXkK8udptVkK
	 LdiRxW+dBg6Hq4EMnG+ZeGKbU3c0V53n50WEc6q52iQRzvNW6mJEplJ7pvWl4gRYzVfnB
	 8GHvp9KjYTa6x8b2/L/bYM3gIScSJQsLgJcStqFjt6FqDhB1XJNeoBpXLp/CkP85+TrHo
	 L2Z4HxhxOsBnvUPvMXHjv+WFh/d29uu6S4I3eegoOay88vo2ChtfafyoKI3q/F1Z/cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631222;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=1qgL1NkV0P+SHvidYZZZVaI2a05IzcudOOYTRjrcE88=;
	b=fNA2W9bc9VwJHN5swKG242hllYQw9a8wnnLab8bOZfX2tM0KeYgmeeDxvEykPhBQL5gc
	 95PRInQY9TYo8iJdNxQxktE3RcGR6K/aJgjCkdLMCoUrXnDLoF41gm1iQp+5dCtZl3wYc
	 jFl2kxmq2Bb1UDwP3FtcNJgAbNKyio/yWKBVgN2T1PUDKbYTXIB3EqTcrxxzO78faE0QG
	 wfqtMjFDt6HROBUWIRz8N352fUq8YJKKO5lDPscj/VJEhRrcNYIaZa33n8EdEq7B4saBx
	 BztQO1MGSgWU6XwB5pBv1bMjkXAnsmPDw0V01ipgCJaIG0BMaV7TCBjdeRemkO/59hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B3KPtGIP;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512E7606E033
	for <linux-m68k@lists.linux-m68k.org>; Mon,  2 Nov 2026 14:53:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 512E7606E033
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B3KPtGIP
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 927EB602A8;
	Mon,  2 Nov 2026 14:53:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 625C81F00A16;
	Mon,  2 Nov 2026 14:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793631221;
	bh=1qgL1NkV0P+SHvidYZZZVaI2a05IzcudOOYTRjrcE88=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=B3KPtGIP7tGmYNWXeX+H1i7tzVg1QuBKxBa4wYZl9yFfxSPwV/nb6la4JTArPoEWx
	 ykM6GuLSG4T3qFKBXJYZCkJGC3vo8ibb5AaiCteOj34CmMoEHIQ9jN+136jYWHeTth
	 F1T67wbusbZFJFAB68aEdSrwP7ELsjghDN+oafO9DTOUCxgQLH239365ae129l0kUM
	 nRwyjSkChWEnrjfxrrWb5DyXYYNqiMK3X+fZLo7P3uKVMTCCcTjvGOV03/bfp2Z8WD
	 FOtEMf9oTbUWnSFUeeH5hrLQ9dj/aKDWVT6F7HwyJbdDISBaRlBZGt5VGMwbWH7Jme
	 DcXRqIaFfxaXw==
From: Christian Brauner <brauner@kernel.org>
Date: Mon, 02 Nov 2026 15:48:52 +0100
Subject: [PATCH RFC 12/16] proc: copy in writes to the network namespace
 entries before pinning
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-work-procfs-core-v1-12-75df35e4f8b8@kernel.org>
References: <20261102-work-procfs-core-v1-0-75df35e4f8b8@kernel.org>
In-Reply-To: <20261102-work-procfs-core-v1-0-75df35e4f8b8@kernel.org>
To: linux-fsdevel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
 Jann Horn <jannh@google.com>, Josef Bacik <josef@toxicpanda.com>, 
 Chris Mason <mason@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
 NeilBrown <neil@brown.name>, Eric Dumazet <edumazet@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
 Jonathan Corbet <corbet@lwn.net>, Christoph Hellwig <hch@lst.de>, 
 Greg Kroah-Hartman <gregkh@suse.de>, 
 Joel Granados <joel.granados@kernel.org>, Kees Cook <kees@kernel.org>, 
 Jan Kara <jack@suse.cz>, Jan Kara <jack@suse.com>, 
 linux-kernel@vger.kernel.org, linux-nfs@vger.kernel.org, 
 linux-acpi@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-um@lists.infradead.org, linux-wireless@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org, 
 ntfs3@lists.linux.dev, platform-driver-x86@vger.kernel.org, 
 coreteam@netfilter.org, kexec@lists.infradead.org, 
 linux-pci@vger.kernel.org, linux-sound@vger.kernel.org, 
 netfilter-devel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 ibm-acpi-devel@lists.sourceforge.net, jfs-discussion@lists.sourceforge.net, 
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-cifs@vger.kernel.org, linux-fbdev@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-mm@kvack.org, linux-sh@vger.kernel.org, 
 linux-usb@vger.kernel.org, samba-technical@lists.samba.org, 
 sparclinux@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
 linux-doc@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-atm-general@lists.sourceforge.net, Takashi Iwai <tiwai@suse.de>, 
 linux-input@vger.kernel.org, linux-raid@vger.kernel.org, 
 linux-ext4@vger.kernel.org, linux-modules@vger.kernel.org, 
 linux-debuggers@vger.kernel.org, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Chuck Lever <cel@kernel.org>
X-Mailer: b4 0.17-dev

proc_simple_write() already hands ->write() a kernel copy of what was
written but makes that copy with the entry pinned. Let procfs make it
before it pins the entry instead. That covers everything created with
proc_create_net_data_write() and proc_create_net_single_write(), the
afs files and the rxrpc stats.

So a write to a proc_create_net_single() file without ->write() can
fail with -EINVAL or -EFAULT now before proc_simple_write() gets to
refuse it with -EACCES.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 fs/proc/generic.c  | 15 ++++-----------
 fs/proc/internal.h |  2 +-
 fs/proc/proc_net.c |  4 ++--
 3 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/fs/proc/generic.c b/fs/proc/generic.c
index 7dc7df101286..83d273778a60 100644
--- a/fs/proc/generic.c
+++ b/fs/proc/generic.c
@@ -904,26 +904,19 @@ void proc_remove(struct proc_dir_entry *de)
 EXPORT_SYMBOL(proc_remove);
 
 /*
- * Pull a user buffer into memory and pass it to the file's write handler if
- * one is supplied.  The ->write() method is permitted to modify the
- * kernel-side buffer.
+ * Pass what was written to the file's write handler if one is supplied. The
+ * ->write() method is permitted to modify the buffer.
  */
-ssize_t proc_simple_write(struct file *f, const char __user *ubuf, size_t size,
-			  loff_t *_pos)
+ssize_t proc_simple_write(struct file *f, char *buf, size_t size, loff_t *_pos)
 {
 	struct proc_dir_entry *pde = PDE(file_inode(f));
-	char *buf;
 	int ret;
 
 	if (!pde->write)
 		return -EACCES;
-	if (size == 0 || size > PAGE_SIZE - 1)
+	if (size == 0)
 		return -EINVAL;
-	buf = memdup_user_nul(ubuf, size);
-	if (IS_ERR(buf))
-		return PTR_ERR(buf);
 	ret = pde->write(f, buf, size);
-	kfree(buf);
 	return ret == 0 ? size : ret;
 }
 
diff --git a/fs/proc/internal.h b/fs/proc/internal.h
index 80b346a3299d..ed22c6dfb0bf 100644
--- a/fs/proc/internal.h
+++ b/fs/proc/internal.h
@@ -317,7 +317,7 @@ static inline bool is_empty_pde(const struct proc_dir_entry *pde)
 {
 	return S_ISDIR(pde->mode) && !pde->proc_iops;
 }
-extern ssize_t proc_simple_write(struct file *, const char __user *, size_t, loff_t *);
+extern ssize_t proc_simple_write(struct file *, char *, size_t, loff_t *);
 
 /*
  * inode.c
diff --git a/fs/proc/proc_net.c b/fs/proc/proc_net.c
index fa485581d05e..cdeb2e025d2e 100644
--- a/fs/proc/proc_net.c
+++ b/fs/proc/proc_net.c
@@ -77,7 +77,7 @@ static int seq_release_net(struct inode *ino, struct file *f)
 
 static const struct proc_ops proc_net_seq_ops = {
 	.proc_open	= seq_open_net,
-	.proc_write	= proc_simple_write,
+	.proc_write_buf	= proc_simple_write,
 	.proc_release	= seq_release_net,
 };
 
@@ -186,7 +186,7 @@ static int single_release_net(struct inode *ino, struct file *f)
 
 static const struct proc_ops proc_net_single_ops = {
 	.proc_open	= single_open_net,
-	.proc_write	= proc_simple_write,
+	.proc_write_buf	= proc_simple_write,
 	.proc_release	= single_release_net,
 };
 

-- 
2.53.0

