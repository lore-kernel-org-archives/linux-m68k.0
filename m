Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793631979;
	b=QtgzJtlV0fq5Wp3Usco92/s1upt3nS08HwCc0a8iIduETd4i9dgg8AlNs3vMOPGlxboF
	 5ywtnzUdDDXGRkf7MaBRYysOHkBCpcYIyfnWronvuWN4i9EQCzLj9Y8jVyYmfiI7p8gXu
	 Q8+EnS1BjboWJ1EZAmL9p2I41vSRNRx525rmY+IRDdwEr5PpPR0we23Y1hl6PjAOot/Yh
	 yUPBmWS289jyYh8lXIxg1Elt+NiqrVe3iVZ1yYNy2teSvadjRr4iLglN097llPPK+Griu
	 p3PjKKNTgPI0Q+tXt9S69ICWU7RjRhZ4vi4SsaDnWsoXdJT6QH4BdrDgo1J6zNc30TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631979;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=OLir7M9bUqyYwhZJ8zktlBEIF8q4TgFqxNnhzWbUGpI=;
	b=qaOLV4HNr7z7Rw/1hOB/9YvS4B9iYCwCPxagUe8xjVsULDIFxF6azhS+VAV2jU18cw1Y
	 vqHan1+lGVlWyST7HtjY/rVGyVj8O7zCItq3eJs2VcCBb44xAYyeKibzGPAJrcx8oT0/y
	 Ap4G/4d5+F+QZlv/2Sj2Oi7gMWQqTIH2CQS/UokQ6GQjTW/gjyjmTwnXozesQsKmdpUcq
	 1gg6Tw6IBU9y9wL8VBAQp6nxKBro9wOVN79y2fRlP9HroTH3gEMJFICjhzbN5Xic4XFC+
	 F8qX8tyhbNMDpiFiy1WC7nqHF8FbtGobnT7+MuHqg86BNG8HnRoTczF5Y+iikXp+Jdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DXh2wTXC;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310616087604
	for <linux-m68k@lists.linux-m68k.org>; Mon,  2 Nov 2026 15:06:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 310616087604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DXh2wTXC
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2C7FD6091C;
	Mon,  2 Nov 2026 15:06:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46D671F00A18;
	Mon,  2 Nov 2026 15:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793631977;
	bh=OLir7M9bUqyYwhZJ8zktlBEIF8q4TgFqxNnhzWbUGpI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=DXh2wTXC5VH77hnNnBlykaDhaUktPNfk5KXDpgV/7gXuYGd3odp2PAnlkIjkJcfwQ
	 o9sxUl0dG/poWSGN79w2hy79MhM+2ztMpCOszGkOriShPgsszxRZ3ZRol64cXOqv2A
	 8eMmQU21JeKaxaR8/PkbA3dv0fEzY8Yy9ptwbGLqD9ZhBkx9YpAOAdrNHRRRoTVx07
	 W+r1ujTQggO56FKWxnPRth4ymfmLY/JbPNj9rdkw26qWgcW6WoX2cQIQ4o12qUFDB+
	 qh+O9CiaFL8rKOi7/exZPrc7xKe5i7H2dzyzLS2B7MYRkTDDfrAkgu/6EfP23mzFom
	 VD4IVD7SeTZBQ==
From: Christian Brauner <brauner@kernel.org>
Date: Mon, 02 Nov 2026 16:01:41 +0100
Subject: [PATCH RFC 14/22] x86/mtrr: let procfs copy the ioctl arguments of
 /proc/mtrr
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
Message-Id: <20261102-work-procfs-arch-v1-14-c9492ab08480@kernel.org>
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

Implement ->proc_ioctl_buf() so procfs copies the arguments in before
it pins the entry and back out after unpinning it. The native and the
32-bit commands encode their arguments and share one table.
mtrr_ioctl() reads and fills procfs' copy, also in the 32-bit layouts.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 arch/x86/kernel/cpu/mtrr/if.c | 79 +++++++++++++++++++++++++------------------
 1 file changed, 46 insertions(+), 33 deletions(-)

diff --git a/arch/x86/kernel/cpu/mtrr/if.c b/arch/x86/kernel/cpu/mtrr/if.c
index 038e2dc38797..9c33c0428dfe 100644
--- a/arch/x86/kernel/cpu/mtrr/if.c
+++ b/arch/x86/kernel/cpu/mtrr/if.c
@@ -149,7 +149,7 @@ mtrr_write(struct file *file, char *buf, size_t len, loff_t * ppos)
 }
 
 static long
-mtrr_ioctl(struct file *file, unsigned int cmd, unsigned long __arg)
+mtrr_ioctl(struct file *file, unsigned int cmd, void *arg)
 {
 	int err = 0;
 	mtrr_type type;
@@ -157,7 +157,6 @@ mtrr_ioctl(struct file *file, unsigned int cmd, unsigned long __arg)
 	unsigned long size;
 	struct mtrr_sentry sentry;
 	struct mtrr_gentry gentry;
-	void __user *arg = (void __user *) __arg;
 
 	memset(&gentry, 0, sizeof(gentry));
 
@@ -170,13 +169,11 @@ mtrr_ioctl(struct file *file, unsigned int cmd, unsigned long __arg)
 	case MTRRIOC_SET_PAGE_ENTRY:
 	case MTRRIOC_DEL_PAGE_ENTRY:
 	case MTRRIOC_KILL_PAGE_ENTRY:
-		if (copy_from_user(&sentry, arg, sizeof(sentry)))
-			return -EFAULT;
+		memcpy(&sentry, arg, sizeof(sentry));
 		break;
 	case MTRRIOC_GET_ENTRY:
 	case MTRRIOC_GET_PAGE_ENTRY:
-		if (copy_from_user(&gentry, arg, sizeof(gentry)))
-			return -EFAULT;
+		memcpy(&gentry, arg, sizeof(gentry));
 		break;
 #ifdef CONFIG_COMPAT
 	case MTRRIOC32_ADD_ENTRY:
@@ -187,27 +184,21 @@ mtrr_ioctl(struct file *file, unsigned int cmd, unsigned long __arg)
 	case MTRRIOC32_SET_PAGE_ENTRY:
 	case MTRRIOC32_DEL_PAGE_ENTRY:
 	case MTRRIOC32_KILL_PAGE_ENTRY: {
-		struct mtrr_sentry32 __user *s32;
+		struct mtrr_sentry32 *s32 = arg;
 
-		s32 = (struct mtrr_sentry32 __user *)__arg;
-		err = get_user(sentry.base, &s32->base);
-		err |= get_user(sentry.size, &s32->size);
-		err |= get_user(sentry.type, &s32->type);
-		if (err)
-			return err;
+		sentry.base = s32->base;
+		sentry.size = s32->size;
+		sentry.type = s32->type;
 		break;
 	}
 	case MTRRIOC32_GET_ENTRY:
 	case MTRRIOC32_GET_PAGE_ENTRY: {
-		struct mtrr_gentry32 __user *g32;
+		struct mtrr_gentry32 *g32 = arg;
 
-		g32 = (struct mtrr_gentry32 __user *)__arg;
-		err = get_user(gentry.regnum, &g32->regnum);
-		err |= get_user(gentry.base, &g32->base);
-		err |= get_user(gentry.size, &g32->size);
-		err |= get_user(gentry.type, &g32->type);
-		if (err)
-			return err;
+		gentry.regnum = g32->regnum;
+		gentry.base = g32->base;
+		gentry.size = g32->size;
+		gentry.type = g32->type;
 		break;
 	}
 #endif
@@ -312,19 +303,17 @@ mtrr_ioctl(struct file *file, unsigned int cmd, unsigned long __arg)
 	switch (cmd) {
 	case MTRRIOC_GET_ENTRY:
 	case MTRRIOC_GET_PAGE_ENTRY:
-		if (copy_to_user(arg, &gentry, sizeof(gentry)))
-			err = -EFAULT;
+		memcpy(arg, &gentry, sizeof(gentry));
 		break;
 #ifdef CONFIG_COMPAT
 	case MTRRIOC32_GET_ENTRY:
 	case MTRRIOC32_GET_PAGE_ENTRY: {
-		struct mtrr_gentry32 __user *g32;
+		struct mtrr_gentry32 *g32 = arg;
 
-		g32 = (struct mtrr_gentry32 __user *)__arg;
-		err = put_user(gentry.base, &g32->base);
-		err |= put_user(gentry.size, &g32->size);
-		err |= put_user(gentry.regnum, &g32->regnum);
-		err |= put_user(gentry.type, &g32->type);
+		g32->base = gentry.base;
+		g32->size = gentry.size;
+		g32->regnum = gentry.regnum;
+		g32->type = gentry.type;
 		break;
 	}
 #endif
@@ -393,14 +382,38 @@ static int mtrr_open(struct inode *inode, struct file *file)
 	return 0;
 }
 
+static const struct proc_ioctl_arg mtrr_ioctl_args[] = {
+	PROC_IOCTL_IOC(MTRRIOC_ADD_ENTRY),
+	PROC_IOCTL_IOC(MTRRIOC_SET_ENTRY),
+	PROC_IOCTL_IOC(MTRRIOC_DEL_ENTRY),
+	PROC_IOCTL_IOC(MTRRIOC_GET_ENTRY),
+	PROC_IOCTL_IOC(MTRRIOC_KILL_ENTRY),
+	PROC_IOCTL_IOC(MTRRIOC_ADD_PAGE_ENTRY),
+	PROC_IOCTL_IOC(MTRRIOC_SET_PAGE_ENTRY),
+	PROC_IOCTL_IOC(MTRRIOC_DEL_PAGE_ENTRY),
+	PROC_IOCTL_IOC(MTRRIOC_GET_PAGE_ENTRY),
+	PROC_IOCTL_IOC(MTRRIOC_KILL_PAGE_ENTRY),
+#ifdef CONFIG_COMPAT
+	PROC_IOCTL_IOC(MTRRIOC32_ADD_ENTRY),
+	PROC_IOCTL_IOC(MTRRIOC32_SET_ENTRY),
+	PROC_IOCTL_IOC(MTRRIOC32_DEL_ENTRY),
+	PROC_IOCTL_IOC(MTRRIOC32_GET_ENTRY),
+	PROC_IOCTL_IOC(MTRRIOC32_KILL_ENTRY),
+	PROC_IOCTL_IOC(MTRRIOC32_ADD_PAGE_ENTRY),
+	PROC_IOCTL_IOC(MTRRIOC32_SET_PAGE_ENTRY),
+	PROC_IOCTL_IOC(MTRRIOC32_DEL_PAGE_ENTRY),
+	PROC_IOCTL_IOC(MTRRIOC32_GET_PAGE_ENTRY),
+	PROC_IOCTL_IOC(MTRRIOC32_KILL_PAGE_ENTRY),
+#endif
+};
+
 static const struct proc_ops mtrr_proc_ops = {
 	.proc_show		= mtrr_seq_show,
 	.proc_open		= mtrr_open,
 	.proc_write_buf		= mtrr_write,
-	.proc_ioctl		= mtrr_ioctl,
-#ifdef CONFIG_COMPAT
-	.proc_compat_ioctl	= mtrr_ioctl,
-#endif
+	.proc_ioctl_buf		= mtrr_ioctl,
+	.proc_ioctl_args	= mtrr_ioctl_args,
+	.proc_nr_ioctl_args	= ARRAY_SIZE(mtrr_ioctl_args),
 	.proc_release		= mtrr_close,
 };
 

-- 
2.53.0

