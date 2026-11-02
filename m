Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633133;
	b=4zu5KuHIIdn4WD9sSWToGY364yegL7m07/XVpd9gaYuCoIdrXNhIbSNRSU8JQsB3ay9f
	 bxUFjZ6XVdMR0defX3jpDquWcs/wLNHEiIHPy5ZZlumxeHj+2wAo305o4nf6Zd2wbHw3U
	 PtuI1bOiqYBBj7w2+Lr90TCLnY8USYHvIZ8f0wdTMqbJchffikMrKfjEyztP8DxC+N44i
	 +zs+IWgqxdLVYW4/lJyMtz11NPKWllPwqCQHkz7xx9LafZ3CKB+k8UNCKPPIgTvgHuUhp
	 zY0JyaKHZPfIecjvKGf3YvsDH/cfocYIDCLmZZbTfF/AAyCUQdCK5Spm/YaC7jaAhTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633133;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=el6PFkO3xcLBJA86iuA3itBWUpq/ZBw6RIw3oM8RbD0=;
	b=1lAOUG8kiXnMHftuYW5guFfcQe7A6HZZ/OIkdHmay88R3M+c/KFFim8Sr2edXvUd1SgT
	 SNDCfUn/B5O64lZ+tfofNIZxoilQAxSiZtCHIk/9fREBQCVMguul3Ek3KBhbhtzfz8kch
	 KK+0Cnj8hNv1jQc22hMVOj1ZLO1H/owWqX0HsWhczl+7nAdEyF4eYgE878clABvQqadD7
	 zbHjWkgUw8hkHi12wdpVIW+rtfMk34ysAnFhWtdSIKpNuFSKMkucloYcFIC7venoTiYMn
	 GbzH5+PmV0Ih+/gkSyhWH70iNpa0MiwxnDK1wqtNvZSqmiL56onews/knHWR6xczC5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="UIWGBig/";
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE6360716D0
	for <linux-m68k@lists.linux-m68k.org>; Mon,  2 Nov 2026 15:25:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FE6360716D0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UIWGBig/
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C7E5C41A9D;
	Mon,  2 Nov 2026 15:25:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B18D61F00A17;
	Mon,  2 Nov 2026 15:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793633132;
	bh=el6PFkO3xcLBJA86iuA3itBWUpq/ZBw6RIw3oM8RbD0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=UIWGBig/hERSv8UC2SBY2/AHoKZwbp+vwJFVHzMXkPYGqF9dt5+0EHsg4lTeFLkeY
	 CX0dkWtDTbDh5piV0+jALeqJO7PUPJCWq1rupoLvRrR9hiV3ruK5lQ5JOwWAGeI3m9
	 WHFwZ3fPrTC2yVGxGOTIiQVUBriwWhb2Nv/E2ooxajbFUJ7ShCeNadjFtrTnu8oFHf
	 xwdUD2zrQXvpkIQ0+Qui98P3kjE0XPPvTcVbSYvw3ebU20McuSBsFpLwx/BeWQxlQ8
	 9LtMFh6B4imtlAnC4skherstPQYyR/MSLL3rf0G6z64tTDIw/TLE29S7Z0kORviOLo
	 N/TEiOL6+fxLg==
From: Christian Brauner <brauner@kernel.org>
Date: Mon, 02 Nov 2026 16:07:26 +0100
Subject: [PATCH RFC 16/27] sched/psi: let procfs own the seq_file of the
 pressure files
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
Message-Id: <20261102-work-procfs-fs-v1-16-d09a996317b3@kernel.org>
References: <20261102-work-procfs-fs-v1-0-d09a996317b3@kernel.org>
In-Reply-To: <20261102-work-procfs-fs-v1-0-d09a996317b3@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2971; i=brauner@kernel.org;
 h=from:subject:message-id; bh=nkKdnljsMnki7Ruy8D8hScsbrXYOUFXONWdXZYhGvI8=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS9WG40a+nMGLu2+z9eheoKh0w5ullw+0k5Y81bXIHrm
 k3i/y2o6ShlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZjIhQCGvxKS9lN+rOr+uvCY
 g43mie7/U77u6rTN7Zd/x/ExmrlJaCLDf8eDZ2sYnGNzPy0zajRR3fOy/on3y7yddT/K6nOLk54
 ZsAIA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Declare the show functions and let procfs open and free the seq_file of
/proc/pressure/*. That makes the open functions unnecessary and
->proc_release() only destroys the trigger now.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 kernel/sched/psi.c | 38 +++++---------------------------------
 1 file changed, 5 insertions(+), 33 deletions(-)

diff --git a/kernel/sched/psi.c b/kernel/sched/psi.c
index 7c5381423334..bcb8bf4e0b69 100644
--- a/kernel/sched/psi.c
+++ b/kernel/sched/psi.c
@@ -1535,21 +1535,6 @@ static int psi_cpu_show(struct seq_file *m, void *v)
 	return psi_show(m, &psi_system, PSI_CPU);
 }
 
-static int psi_io_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, psi_io_show, NULL);
-}
-
-static int psi_memory_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, psi_memory_show, NULL);
-}
-
-static int psi_cpu_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, psi_cpu_show, NULL);
-}
-
 static ssize_t psi_write(struct file *file, const char __user *user_buf,
 			 size_t nbytes, enum psi_res res)
 {
@@ -1635,31 +1620,25 @@ static int psi_fop_release(struct inode *inode, struct file *file)
 	struct seq_file *seq = file->private_data;
 
 	psi_trigger_destroy(seq->private);
-	return single_release(inode, file);
+	return 0;
 }
 
 static const struct proc_ops psi_io_proc_ops = {
-	.proc_open	= psi_io_open,
-	.proc_read	= seq_read,
-	.proc_lseek	= seq_lseek,
+	.proc_show	= psi_io_show,
 	.proc_write	= psi_io_write,
 	.proc_poll	= psi_fop_poll,
 	.proc_release	= psi_fop_release,
 };
 
 static const struct proc_ops psi_memory_proc_ops = {
-	.proc_open	= psi_memory_open,
-	.proc_read	= seq_read,
-	.proc_lseek	= seq_lseek,
+	.proc_show	= psi_memory_show,
 	.proc_write	= psi_memory_write,
 	.proc_poll	= psi_fop_poll,
 	.proc_release	= psi_fop_release,
 };
 
 static const struct proc_ops psi_cpu_proc_ops = {
-	.proc_open	= psi_cpu_open,
-	.proc_read	= seq_read,
-	.proc_lseek	= seq_lseek,
+	.proc_show	= psi_cpu_show,
 	.proc_write	= psi_cpu_write,
 	.proc_poll	= psi_fop_poll,
 	.proc_release	= psi_fop_release,
@@ -1671,11 +1650,6 @@ static int psi_irq_show(struct seq_file *m, void *v)
 	return psi_show(m, &psi_system, PSI_IRQ);
 }
 
-static int psi_irq_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, psi_irq_show, NULL);
-}
-
 static ssize_t psi_irq_write(struct file *file, const char __user *user_buf,
 			     size_t nbytes, loff_t *ppos)
 {
@@ -1683,9 +1657,7 @@ static ssize_t psi_irq_write(struct file *file, const char __user *user_buf,
 }
 
 static const struct proc_ops psi_irq_proc_ops = {
-	.proc_open	= psi_irq_open,
-	.proc_read	= seq_read,
-	.proc_lseek	= seq_lseek,
+	.proc_show	= psi_irq_show,
 	.proc_write	= psi_irq_write,
 	.proc_poll	= psi_fop_poll,
 	.proc_release	= psi_fop_release,

-- 
2.53.0

