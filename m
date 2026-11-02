Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633659;
	b=UrXRuYoayGeVLoAkXMFIEMLf4ND13sv6TDYAEY0zYrG4LkFgZP8e2suPmE73RCrq65YU
	 dbYfbYcFzi9froiixwL4r120Z7EuaLkkx19qIs/kSGcoLrfedTeRytJlpaTzWeHLbL0ye
	 OuR3sO7i8YktIjUDQkT4BkN61Ogz2mloibQO4qqtpBe0/2zsZhnKdkvmM7TuRQsa7QADV
	 Y1jZPql578hG0E8h0YVtIgE+4UeBJXxUhD5ZsGocdyyAOm3bR02MSYP72Vl12MCZ1aeMm
	 6D50CVy334fMVmXjzZ3SZ+ns0NkV85ujthRi8PqwK1baEwJH78tRTyi09J2aAqWSu4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633659;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=qehvQbejNsYpKxVFyBI5cuXL4HJf/COjdUqE20q/KJk=;
	b=PFhTqBvWpYhl/ZTF0W7vF37zREgwAX2BEhhV2gBWwQTpZLChwHt0S86j1Pd5ApGLru6G
	 f7f+J7klEw7bAiiCw1CJ7aX7uPGPRYvVYpkJzlYSZqeC5O9zChocYOHmawcsaIRrYisaN
	 tpD5lkAYokbFfr8LjMWGeHoUXg4R0ufrXzrw5zBScRCmctKhhRYsAgtytp+TCoWPtELTy
	 f7Hd0CvKs0bYD9I3AOAKZ3Ca6q+sRn+yGUdS+HyDnP9ifjiyjHHCo++/k/wTXwbQPerlo
	 1Tu9oqip5S9VAr+koPFE0XXmJG/IePjDXUQlNUDsXYHXpg2nDrJMJ7k6AmF1WDkaJRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I3018NSM;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D4860DC655
	for <linux-m68k@lists.linux-m68k.org>; Mon,  2 Nov 2026 15:34:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25D4860DC655
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I3018NSM
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 85AB76060E;
	Mon,  2 Nov 2026 15:34:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 145791F00A18;
	Mon,  2 Nov 2026 15:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793633658;
	bh=qehvQbejNsYpKxVFyBI5cuXL4HJf/COjdUqE20q/KJk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=I3018NSMJ3JeeEZNHYpZOzTSTVjGE8V8mC3rxWyFrnFm/O6e0BQPqvYOSnqdWvMzS
	 FhRSnHG1Pz7M0jO3MB5OdMthxumcYZHGwgiesNL3clkwgcHDbIz9ja6O+6lu5gGJLA
	 PzRRVogMLoBdbC/vCygybRlSjZMHZHAZaGNWRN3uCoSd+5c4+7VtRVNL7l73qL+q+I
	 R83v2alIXJL0sOz6U1nmnu9cdG/yNEzCQaZx+lsQYDDUzsXFMYUp8cWRAgyEt0tsOr
	 4L2nbLK8eTjSuQksbl4N5zsJeumCILIO4kqk140gii9/aZ6MFm+VMeLb271ZSnrk1N
	 d4I4WeWG/J0hg==
From: Christian Brauner <brauner@kernel.org>
Date: Mon, 02 Nov 2026 16:07:23 +0100
Subject: [PATCH RFC 09/11] SUNRPC: drop the ioctl of the procfs channel
 files
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
Message-Id: <20261102-work-procfs-net-v1-9-982104a4f592@kernel.org>
References: <20261102-work-procfs-net-v1-0-982104a4f592@kernel.org>
In-Reply-To: <20261102-work-procfs-net-v1-0-982104a4f592@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1522; i=brauner@kernel.org;
 h=from:subject:message-id; bh=Ud9Y4QQyL+X4JWta5uPxcGegk5a98S++PodDMQ4oF1M=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS9WG7S/nf10r1xa3IYtmm0TBAouXddfcmhZUb+it52U
 20nX9pxoKOUhUGMi0FWTJHFod0kXG45T8Vmo0wNmDmsTCBDGLg4BWAi4WcYGXpLayZN/hhya+/z
 ysCf6/y1yhbKurD+W7OU58ipKVLTDMUYGc6eCmt4GKApJHKg5Ubmioa6i3H1f+olLqZ4VW318Nh
 xigUA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

do_vfs_ioctl() answers FIONREAD for regular files with i_size - f_pos
before it gets to the file's ->unlocked_ioctl(). The channel files are
regular files, so cache_ioctl_procfs() has never seen FIONREAD and only
ever failed other commands with -EINVAL. Drop it. Other commands fail
with -ENOTTY now.

The rpc_pipefs channel files are regular files as well.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 net/sunrpc/cache.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/net/sunrpc/cache.c b/net/sunrpc/cache.c
index 81a3f0068f36..d242b6f33cbc 100644
--- a/net/sunrpc/cache.c
+++ b/net/sunrpc/cache.c
@@ -1596,15 +1596,6 @@ static __poll_t cache_poll_procfs(struct file *filp, poll_table *wait)
 	return cache_poll(filp, wait, cd);
 }
 
-static long cache_ioctl_procfs(struct file *filp,
-			       unsigned int cmd, unsigned long arg)
-{
-	struct inode *inode = file_inode(filp);
-	struct cache_detail *cd = pde_data(inode);
-
-	return cache_ioctl(inode, filp, cmd, arg, cd);
-}
-
 static int cache_open_procfs(struct inode *inode, struct file *filp)
 {
 	struct cache_detail *cd = pde_data(inode);
@@ -1624,7 +1615,6 @@ static const struct proc_ops cache_channel_proc_ops = {
 	.proc_write_buf	= cache_write_procfs,
 	.proc_write_size = CACHE_DOWNCALL_MAX,
 	.proc_poll	= cache_poll_procfs,
-	.proc_ioctl	= cache_ioctl_procfs, /* for FIONREAD */
 	.proc_open	= cache_open_procfs,
 	.proc_release	= cache_release_procfs,
 };

-- 
2.53.0

