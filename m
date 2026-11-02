Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633552;
	b=aRL7ZMsdCBf72obR3yFLDI8x8AhONRtPEXsxwSD6wnPepoFXe70+kxk8L8pgUU8OlQZp
	 xYj7cE8X2H7sZepXVDU2jjHEiPp9qqoq/SEn5zAwkwM265fZ6K4OdsTAgykGVtK8MyRvN
	 ZD0etwPojses4xImLWYuBovP5Poq55glAQvlj+/6uqJ5adliMexyonAyPQHNbRxjrqowK
	 9QT+J6IDDB2uuXwXlb00CgEI8aOKGDoKmJMTKwfdcW5NsF0MPdTBsmsYXmMfh7MPmDsIQ
	 qOIqSx52qnHcaBfz4r8/b1w1831lLB6ooP6KUFoYzQXSM0WA87VIP32cRl6ZmFbE+mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633552;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=j0XEj0YD19hajZrTiSL4Hx5oTZ822IFleoT2hqE8QNQ=;
	b=spcWkXI9lxxHKZodl3K1UeOb7Eu8UJsk1NDGT/IXd99g6Iwlibck58mGkyBJujcH11wX
	 vVkTmkm7KZtHB7ayhFOzthmcQHl8I/z9XvWPAQbBrPv514ioj8VHtnI26pO+X1ADoWN9n
	 /u7CaYcrGqYtK+TKfet5Cd2Tt17JETGH3krvZDyMu+oQHbMC82WVvVA5n8Bjj5qmg7W7k
	 I+dabjKUKALIQL3blPw69ztsY2UJxFjMYJk+CJLxJOQTKxJHDUp6bHnXxTfrGcAGjp49N
	 Jim87P3fuO6Rp7Ay9ULrWfc1+H1TOkO0dHYiarizF4Gs3RMFrkBCO82yIG5ViKoxveQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WOtNUR7A;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA49608763A
	for <linux-m68k@lists.linux-m68k.org>; Mon,  2 Nov 2026 15:32:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DA49608763A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WOtNUR7A
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E4D2142E35;
	Mon,  2 Nov 2026 15:32:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 714811F00A1A;
	Mon,  2 Nov 2026 15:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793633551;
	bh=j0XEj0YD19hajZrTiSL4Hx5oTZ822IFleoT2hqE8QNQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=WOtNUR7ANTbV8Aq+NS5tB7HOgtUYtUFBrHUduOMXGSrvyvVh49FKtJAtPA79xEdKK
	 bWLuxrK34vw5XvQe2Ses1fW882zwHJNi0DTpIw4mOgryVfyh06j3VgDnExsFIakuQ5
	 myUaZwuXJOiUD0AVpk0r2EDdW+XFBxyBcKxkzbyxcSh7mpU9vIC53YIaLvGKA95Tv5
	 l0wnd9SE3I99/RpnQwpcxyDZJh+XRZ7Gez9UyXhApoK8ws1dteMc6OckWGLtrOFM+7
	 gV/vEgFiiBUWN/JNUdIJHozxukOMKP9vkwq6miFhFVRTjftdm1zZuN9/BGNHxbp7GI
	 sMgsvoriwacXQ==
From: Christian Brauner <brauner@kernel.org>
Date: Mon, 02 Nov 2026 16:07:19 +0100
Subject: [PATCH RFC 05/11] netfilter: xt_recent: let procfs copy in writes
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
Message-Id: <20261102-work-procfs-net-v1-5-982104a4f592@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1724; i=brauner@kernel.org;
 h=from:subject:message-id; bh=m6dNErjBjmz9XKGa3rT6vumTNxSZMRjmxs3KBefnnQ8=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS9WG7ccSQ+KU5P1WO9/aOk9EeM4vLnjsV0vNLouKtsy
 VSiVh/SUcrCIMbFICumyOLQbhIut5ynYrNRpgbMHFYmkCEMXJwCMBGms4wMX9eu8Tt9WbzpS8+D
 b9e3s2i/FAvXOGvYKGJYVuMb/Oy2IcM/vbLA/s/ikvwyn4PDDs4pne0p8eNi9MxKj7iwnmCdYhF
 uAA==
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Implement ->proc_write_buf() so procfs copies in what is written to
/proc/net/xt_recent/<table> before it pins the entry, and take the
address from that copy. The removal of a table runs under recent_mutex
and doesn't wait for a writer that faults on its buffer anymore. Writes
larger than PAGE_SIZE - 1 bytes fail with -EINVAL now.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 net/netfilter/xt_recent.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/net/netfilter/xt_recent.c b/net/netfilter/xt_recent.c
index b771cc463aab..306557f25daf 100644
--- a/net/netfilter/xt_recent.c
+++ b/net/netfilter/xt_recent.c
@@ -553,8 +553,7 @@ static int recent_seq_open(struct inode *inode, struct file *file)
 }
 
 static ssize_t
-recent_mt_proc_write(struct file *file, const char __user *input,
-		     size_t size, loff_t *loff)
+recent_mt_proc_write(struct file *file, char *input, size_t size, loff_t *loff)
 {
 	struct recent_table *t = pde_data(file_inode(file));
 	struct recent_entry *e;
@@ -568,8 +567,7 @@ recent_mt_proc_write(struct file *file, const char __user *input,
 		return 0;
 	if (size > sizeof(buf))
 		size = sizeof(buf);
-	if (copy_from_user(buf, input, size) != 0)
-		return -EFAULT;
+	memcpy(buf, input, size);
 
 	/* Strict protocol! */
 	if (*loff != 0)
@@ -625,7 +623,7 @@ static const struct proc_ops recent_mt_proc_ops = {
 	.proc_seq_ops	= &recent_seq_ops,
 	.proc_state_size = sizeof(struct recent_iter_state),
 	.proc_open	= recent_seq_open,
-	.proc_write	= recent_mt_proc_write,
+	.proc_write_buf	= recent_mt_proc_write,
 };
 
 static int __net_init recent_proc_net_init(struct net *net)

-- 
2.53.0

