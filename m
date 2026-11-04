Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793822163;
	b=5neb1ckTVhI9YrFbNzBEFvyVdfhXjEyq6o3ThttvyKQLOBsXbtzAO2IRbtWKC3CDIsLa
	 O1g9x5okexzFr8YHTDvqipqHpahmIblU3+wuUk9xXoWfLTID8ypKNhTj4ojEXupZ8Cpse
	 bi22dvKlw2+KjpyDBVLAXopsAGr72weh9/vCKqSLwkpAc5jNOTWi/PJ9EJMBmGuurRG7X
	 lgGiw0TEPIfDncQIb1XGDogG4E6P9RuJAOCR88dPIIH94uHqFIyH6DRof3p+ZXyWPyhXG
	 mlfvJt2wT7yPIR6QuuAkE6AJjsvWqPH4mPqnZl+x4OIEJPm5ambSoAEeF7eZ8u0enSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793822163;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=bCEpJCXGgk21zgMyVrJnsb9d3IAiyaFEBDru2XgYb4M=;
	b=GN76wwsVRAsBu3qt50ysdhWOgwPRD8lZarJWZ8K1WX9NaN7HxZg6xU98P6ZJewARJ3/A
	 C4GmApN+s8OZRT7wnXwovOMarBp81vaxTMwCBfJbxVYbcWgaBHlvX7UNVn+wWSbhtwZ5B
	 ZMp7tMdpeq5TvlAh9LglmsLDwfAfFTgES+IP4OrlcnYjucgkccYgl0QwnKafuDeUDw93y
	 h7TQsYZPDch644kKWXDJv/zg3fQ9MGDRXyn4dA7fJ7gtO2/B0QIphYbRcH/QTY08b9LFn
	 gi0jPhVkgLkUmQTzFKAbGkD6jboJTRvTwoYj+dDzp9scsGrqTxAUUkhMQtFJJ4Wjcrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n6uNIEN8;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA486078701
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Nov 2026 19:56:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AA486078701
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n6uNIEN8
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1015F40196;
	Wed,  4 Nov 2026 19:56:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB9F61F00919;
	Wed,  4 Nov 2026 19:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793822162;
	bh=bCEpJCXGgk21zgMyVrJnsb9d3IAiyaFEBDru2XgYb4M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=n6uNIEN8UtFFIaiDpvbvTTBdWrfLopeDookEM+XOfGJBmQaBLBud7PW4ZywRa4UqY
	 sj9lKf00u87t0rYyILLdTAzUShhG08ZdGf/Lzb6uT5y+NXjXXOrpjMTCCufRj/+vUf
	 qn2Hm5dCkKTQ/5xyNTYylulY92AYSZ+tzxPbaFXkvFnu/q327E+8W9jss69XVk/qWl
	 RFW6EwVAfNKvgEJ3eedNnGhh4txPJEwh75Q839TLwgEzuVUSv49ucfVtBinxI3hk3b
	 fb0M7feqk7mkAAGLRXxYscDizmCBmFG4sFYYV3OBo/qiimcnQoXdcT6kySNh1lRNIF
	 bhwX+vUqpJ/hg==
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
Subject: [PATCH RESEND v2 25/30] alloc_tag: let procfs own the seq_file of /proc/allocinfo
Date: Wed,  4 Nov 2026 20:55:48 +0100
Message-ID: <20261104-work-procfs-fs-v2-25-319e0f9a8aae@kernel.org>
In-Reply-To: <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
References: <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2428; i=brauner@kernel.org; h=from:subject:message-id; bh=w2e219TOPzYhqaNEYdOja/Iy2kqKR7KfDC/oRUWRjFA=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS97vFcddfCmyOAVbf9SsDD2QKqjkaTBOc97Z200n3GL K1V/52WdJSyMIhxMciKKbI4tJuEyy3nqdhslKkBM4eVCWQIAxenAExEm5mR4fL8sPeSEVKLCxs1 t6daZRx/N59v9c2uBvbciVVGFpzdXxj+itqIaCekhc3YHW/sfpNlJ0++MIP1I9HZqYuF7+sHn5n NCgA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

Declare the seq_operations and the size of the private state and let
procfs open and free the seq_file. ->proc_open() and ->proc_release()
only set up and destroy the ioctl lock now.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 mm/alloc_tag.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/mm/alloc_tag.c b/mm/alloc_tag.c
index 7d7ad6704953..697e44468ebc 100644
--- a/mm/alloc_tag.c
+++ b/mm/alloc_tag.c
@@ -152,27 +152,21 @@ static const struct seq_operations allocinfo_seq_op = {
 };
 
 /*
- * Initializes seq_file operations and allocates private state when opening
- * the /proc/allocinfo procfs entry.
+ * Initializes the private state when opening the /proc/allocinfo procfs
+ * entry. procfs opened the seq_file and allocated the state.
  */
 static int allocinfo_open(struct inode *inode, struct file *file)
 {
-	int ret;
-
-	ret = seq_open_private(file, &allocinfo_seq_op,
-			       sizeof(struct allocinfo_private));
-	if (!ret) {
-		struct seq_file *m = file->private_data;
-		struct allocinfo_private *priv = m->private;
+	struct seq_file *m = file->private_data;
+	struct allocinfo_private *priv = m->private;
 
-		mutex_init(&priv->ioctl_lock);
-	}
-	return ret;
+	mutex_init(&priv->ioctl_lock);
+	return 0;
 }
 
 /*
- * Cleans up the seq_file state and frees up the private state allocated in
- * allocinfo_open() when closing the /proc/allocinfo file descriptor.
+ * Undoes allocinfo_open() when closing the /proc/allocinfo file descriptor.
+ * procfs frees the seq_file and the private state.
  */
 static int allocinfo_release(struct inode *inode, struct file *file)
 {
@@ -180,7 +174,7 @@ static int allocinfo_release(struct inode *inode, struct file *file)
 	struct allocinfo_private *priv = m->private;
 
 	mutex_destroy(&priv->ioctl_lock);
-	return seq_release_private(inode, file);
+	return 0;
 }
 
 /*
@@ -475,9 +469,9 @@ static long allocinfo_compat_ioctl(struct file *file, unsigned int cmd,
 #endif
 
 static const struct proc_ops allocinfo_proc_ops = {
+	.proc_seq_ops		= &allocinfo_seq_op,
+	.proc_state_size	= sizeof(struct allocinfo_private),
 	.proc_open		= allocinfo_open,
-	.proc_read_iter		= seq_read_iter,
-	.proc_lseek		= seq_lseek,
 	.proc_release		= allocinfo_release,
 	.proc_ioctl		= allocinfo_ioctl,
 #ifdef CONFIG_COMPAT

-- 
2.53.0

