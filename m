Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793632126;
	b=eCY/tPbE6uAWRtDz/RgqpSd6S8jJSPj7hg1TLKp4baaadhNoZFBRWovZfaP6S4Izr+Uf
	 CTFInAPHGs2j4x37cgFIQDVjquzMdqA6lYeurnMkIdYgjUvRfHQE5STtWa5F059gGhyh7
	 VQ4FvAe4MhVr5iwMio7N/rsE5W38nY8OqupEec0X/DNWIJP889rxDJE9BeJmy/eNo5qaC
	 rXlBeTQz5j1dAri9pOTsubMfoe33X7mAxgywCmtc424Ms/iHnNJieKv6r4DoAXPARcMrt
	 tt3RmicochCyXZk9CJJSqrw9j8za9dzUtPi2y03Ac+ojEKnDKUBypSrCC9fMlKZFmhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632126;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=zr7obOUiLNzJ4M2rJicyi/Ze6HCzMDPfBdGpZnrgFfM=;
	b=INRX7L/SCOq9J1nsIHptAGIRJhJ+7bkItK4GA/uQgCEViDsLeIyf1WXNMPfJoziFSE5e
	 yKRAGRLFhU5tP8Tw0vlhz79hDWL8gzBEHmd8etw9ZHDTa+lbxHfVruJR3y8Vmi3X1guzm
	 ZLUe0MxAe+S7CRNjqyN3U0Ke7LFINq+5/D4O9KkQu20TAR4tmq0k0JoJnGILCu8O5txNR
	 UCxgYm7G892jvChwhBFkdEmJ0lN0HE7bNItDduC0n7RV2BHd/xPxqYu+bPHUMzlaehOfh
	 Iy5G7tGq7EEuvq+Ca3slfLxtT9gj86RFn9DsvnY3qWc/gNtsPltr2Fslt1TuzXA6yQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kEGAtuEw;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18CC60A9A5A
	for <linux-m68k@lists.linux-m68k.org>; Mon,  2 Nov 2026 15:08:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D18CC60A9A5A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kEGAtuEw
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 28A32600DB;
	Mon,  2 Nov 2026 15:08:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B133F1F00A1A;
	Mon,  2 Nov 2026 15:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793632124;
	bh=zr7obOUiLNzJ4M2rJicyi/Ze6HCzMDPfBdGpZnrgFfM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=kEGAtuEwvTMgDuPbyzJeFLVaUSWvZkCX/wUBabr5CM+BjM76qvrrMDRwKN+aUpp0M
	 LwULw5zP7H3bcIRxCu2+BVsEU4zGp6OX1M94GYtTzJYZ1Sv0pAvkktXo+Zb0As3XcC
	 7Tm5eTy1em1aicRexVm3TwZLua7XOaqJGZGjekvzyZG3iJISitPVfI4Rb1C6HoqO15
	 zds1p1eADnGHiS7upjctx8NMqWH7A7NsO/n5J+MjqWiNif9k5AGi+lAXG6mfYJREeh
	 /tq8fM2qbOInntFHxnk7n1aXVsuVbuc+aacS++TfSOw8xPUMY5Re+hh0DhYh68pv/r
	 SxGHP8KpJ8aAQ==
From: Christian Brauner <brauner@kernel.org>
Date: Mon, 02 Nov 2026 16:01:48 +0100
Subject: [PATCH RFC 21/22] PNP: pnpbios: let procfs copy in writes
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
Message-Id: <20261102-work-procfs-arch-v1-21-c9492ab08480@kernel.org>
References: <20261102-work-procfs-arch-v1-0-c9492ab08480@kernel.org>
In-Reply-To: <20261102-work-procfs-arch-v1-0-c9492ab08480@kernel.org>
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

Implement ->proc_write_buf() so procfs copies in what is written to
/proc/bus/pnp/<node> before it pins the entry, and take the node data
from that copy. A node with more than PAGE_SIZE - 1 bytes of data can't
be written anymore. I don't think there are any.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 drivers/pnp/pnpbios/proc.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/pnp/pnpbios/proc.c b/drivers/pnp/pnpbios/proc.c
index 14632a8d0da0..00163aedd738 100644
--- a/drivers/pnp/pnpbios/proc.c
+++ b/drivers/pnp/pnpbios/proc.c
@@ -171,7 +171,7 @@ static int pnpbios_proc_show(struct seq_file *m, void *v)
 	return 0;
 }
 
-static ssize_t pnpbios_proc_write(struct file *file, const char __user *buf,
+static ssize_t pnpbios_proc_write(struct file *file, char *buf,
 				  size_t count, loff_t *pos)
 {
 	void *data = pde_data(file_inode(file));
@@ -191,10 +191,7 @@ static ssize_t pnpbios_proc_write(struct file *file, const char __user *buf,
 		ret = -EINVAL;
 		goto out;
 	}
-	if (copy_from_user(node->data, buf, count)) {
-		ret = -EFAULT;
-		goto out;
-	}
+	memcpy(node->data, buf, count);
 	if (pnp_bios_set_dev_node(node->handle, boot, node) != 0) {
 		ret = -EINVAL;
 		goto out;
@@ -207,7 +204,7 @@ out:
 
 static const struct proc_ops pnpbios_proc_ops = {
 	.proc_show	= pnpbios_proc_show,
-	.proc_write	= pnpbios_proc_write,
+	.proc_write_buf	= pnpbios_proc_write,
 };
 
 int pnpbios_interface_attach_device(struct pnp_bios_node *node)

-- 
2.53.0

