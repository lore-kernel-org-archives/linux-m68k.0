Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793821822;
	b=cqCjl2fPIOt4o8jyIOrh3a77ldwVlTODdMoRWVBKA/sVJNJEH7MF+GvZ/di9siOheLRr
	 O/sdHcDl2XEp6/+LFyXC/dfRP8/JuYEA5qwyXWIVLbt8ik5GBgHFOICqvK5wAxkP8X92w
	 JSScJ3fjqgQBZq9FGO3VoURAXhIDsAXezv6PyxQqjcg54PWknzLvgEVe84qhMWT5Th2N3
	 7X99ZrXOYxGfl3J4XGGOKhOQaJauC6j9jq9chMFszLeEe/ACkvFPjL+ymYYQWJ9OKRU6B
	 DxTi1aQ42RnGHNhOBqZ3paopif8frUQpwWwy+UwdFTCCNngkC6f7GbHE0ZQjsyDWGmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793821822;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=gDybWaXH0yVqSHGh6cSao1kY+huQ+XTPXQ1Vld4D+UM=;
	b=fwesQtFNqU27vrlonv2jbeM/jl95GJ29Q7d8loWXQm0sdRI/DipLeH8+KJ5O/KwEltiN
	 YzDhoXzVrXJh35dayaWZMgYJuNxTCDng9g9mCi+5bBfNg39fAuptIzy5VZYZfrsoQVbQ7
	 lbMsYTbOmTrAW9ayRIdJRkKaMHLBom+bHkpU7w/QozpC/Ol3pNE/E929s1sV+iVz9HA1E
	 24KCrZL5xDHH3+kTOO3WNcin60X68jhaMfgdTspMJ2PciGvh+3c8RZf/3AlNuZgWD17bG
	 G/IfxTdyRZEUKgFuv6SDG9fL4cU1tT4UHQe/pgR5gla3WAE7vbOP3CHqFvyE/8fjaYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ViWv5liE;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599B3609176F
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Nov 2026 19:50:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 599B3609176F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ViWv5liE
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2B36B60F38;
	Wed,  4 Nov 2026 19:50:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF5EE1F000C1;
	Wed,  4 Nov 2026 19:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793821820;
	bh=gDybWaXH0yVqSHGh6cSao1kY+huQ+XTPXQ1Vld4D+UM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ViWv5liEfHdMHPO8R1wapbcJqOA3zpGPpbB02hMT5/E0508nWx30DxqIPL6KtEmgU
	 u+pmFn3FsOd19p4MgLsNq//oFD4EhVxfbRb3hFQDajUha4PG308MHKfbBxuQRI2T+1
	 gpfAFci1AHyTvujOOroEbIobGBHWkRbja9thyu+sIlV6GnLkbKj+7KO+0ZAH32xVH8
	 iBv7uhmdL2bAAOXVUHaVgSNDhqWBsAdgXyxjuxMQt4FvbC+ZMkyYx1jsvDEISH0f4o
	 af3/XVxyIwOpd+kA2KJQBzwNtAgTJZ+nIEKqRvJiOre/ZrMnKSk9pNUZKOAQUsYWh4
	 hiwj+uPWiEFJg==
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
Subject: [PATCH RESEND v2 02/30] jfs: let procfs copy in writes to the loglevel file
Date: Wed,  4 Nov 2026 20:50:06 +0100
Message-ID: <20261104-work-procfs-fs-v2-2-319e0f9a8aae@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1370; i=brauner@kernel.org; h=from:subject:message-id; bh=izEZyN2ciF2azWBwOiarD7rxdH5SrLb74RUgxhmuQ3M=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS97tGJzso6nn/w61mbive7Xqy3zX3zdMnSHJ2eBVw3m Q2DcmIjOkpZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTACZyciEjw/nFJ7zrmRr3TTvN 7yT61kBSiuve9sV8G24zvhXijXX584zhr/RSZtXdspF7F/LOFVzmc/vt+qo5X9YsanqxkXF3yLP QUzwA
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

Implement ->proc_write_buf() so procfs copies in what is written before
it pins the entry, and take the level from that copy. Writes larger than
PAGE_SIZE - 1 bytes fail with -EINVAL now and so do empty writes, which
looked at a byte that wasn't written before.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 fs/jfs/jfs_debug.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/fs/jfs/jfs_debug.c b/fs/jfs/jfs_debug.c
index 5eb35b0d420f..e1c0211a6a32 100644
--- a/fs/jfs/jfs_debug.c
+++ b/fs/jfs/jfs_debug.c
@@ -23,13 +23,10 @@ static int jfs_loglevel_proc_show(struct seq_file *m, void *v)
 	return 0;
 }
 
-static ssize_t jfs_loglevel_proc_write(struct file *file,
-		const char __user *buffer, size_t count, loff_t *ppos)
+static ssize_t jfs_loglevel_proc_write(struct file *file, char *buffer,
+		size_t count, loff_t *ppos)
 {
-	char c;
-
-	if (get_user(c, buffer))
-		return -EFAULT;
+	char c = buffer[0];
 
 	/* yes, I know this is an ASCIIism.  --hch */
 	if (c < '0' || c > '9')
@@ -40,7 +37,7 @@ static ssize_t jfs_loglevel_proc_write(struct file *file,
 
 static const struct proc_ops jfs_loglevel_proc_ops = {
 	.proc_show	= jfs_loglevel_proc_show,
-	.proc_write	= jfs_loglevel_proc_write,
+	.proc_write_buf	= jfs_loglevel_proc_write,
 };
 #endif
 

-- 
2.53.0

