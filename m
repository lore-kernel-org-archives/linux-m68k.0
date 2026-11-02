Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793632477;
	b=5qdZRYKj+W5HRdlDagIZDKhu/IG0q4dg1Hb+aZxuS38gB4Zb8rOSf7IHRC6Vnj9U34F0
	 5DHKb4JMEZYKbjf75LaJR6Gg1X87k8kqnq2bUes5oraDihq7g1u0sXXEek2Cb0j8lGPtA
	 uADieyGGyXAjfIUA9wa/4mJHkx3DDkKkFbLIxFgtX/Uf/c+jJClyBl1RtsfdfldFCyAW9
	 xLw7ZEkhZp2tFo+PYQby2bA+VHco5HJr7YadtS+r0AdC2a6RDNv6E6Rewg82KOI/vsx1k
	 HD9Gl7YPXsAV3qQO5fJN0Cvbe/suXw+r8lhvcVXpFTcYhQdZD0v58ewMSdTcHzFoI3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632477;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=ClNRz/kRlLxFCzx32+9FVAcbIhgPE+GVqUynSQSCrm4=;
	b=mVH3z8NfjuM5zTfn/Zv06KVQ/YYNYy6PjFXgMYSBfiPS/O8Id+HiFgy4WRA+tsT55kHj
	 xoFoG58DhRaeII7aY8BJTQ3LqtvTEXTbPen1xoPGg+SQp0ybBMTU3sxyuxBLA1qsX6PQF
	 /SEXrIHOPPP38gMtexN0v62c9db+gJMkbI+KcbJRUlKrPXKpVwJOQE8C8OqT4rZ8O9bHs
	 hBwxr9IwrMYTYuftJ91HglGgcWv53FIpbTZgkoEuIzm+p+AbOe6FWIVRizVlJscqvy3OQ
	 X29Qtki0VEL9jyihkBBBIUJiPNCsDGcBgAildvLvIcZo/hQISrtCHYpv9iRN80kpTFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QHFOrs5T;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF76D60B328F
	for <linux-m68k@lists.linux-m68k.org>; Mon,  2 Nov 2026 15:14:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF76D60B328F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QHFOrs5T
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0D82A60627;
	Mon,  2 Nov 2026 15:14:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E51E61F00A17;
	Mon,  2 Nov 2026 15:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793632475;
	bh=ClNRz/kRlLxFCzx32+9FVAcbIhgPE+GVqUynSQSCrm4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=QHFOrs5TpHpo0M5R/FfZ1ou8JGe4vsZ6cA/Hi393fx1BxX5IT5o4flelNXsYEXbE9
	 vynnBOwvEgghDbKEFxBD372pa+SwW8x0NGdMYbCse3kzzNveXnPAdVohl8yxS5NJs4
	 3excMQXr6T5ACjipWAjM243eKSbSoi6d16BYCMEK6QVhsklDRevfPXj3KIgQmn5uPJ
	 LZb4wVnkhoqe1laPMLMGYfVrzfbSiC1JXQPw3VBhRO6fCYMUcXexMRS4g13lbVrz81
	 DepT7s422YBCQXEEEk7d+FgsSC3stLOiMHy9D0lHpcwxe4kj0+zJyTLCnY18Ca9szE
	 Xhc9IT8ucAXuw==
From: Christian Brauner <brauner@kernel.org>
Date: Mon, 02 Nov 2026 16:07:20 +0100
Subject: [PATCH RFC 13/23] scsi: sg: let procfs copy in writes
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
Message-Id: <20261102-work-procfs-drivers-v1-13-a994bd4d3b1a@kernel.org>
References: <20261102-work-procfs-drivers-v1-0-a994bd4d3b1a@kernel.org>
In-Reply-To: <20261102-work-procfs-drivers-v1-0-a994bd4d3b1a@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2854; i=brauner@kernel.org;
 h=from:subject:message-id; bh=JvNn9BiAujB73ykVLFuVWE/fT8/HBZYijRncXc4d9K0=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS9WG7QvpbRg3P21cqJ8ja/jDbycj3eZxhYsFFhyvyCU
 9Jr5m792VHKwiDGxSArpsji0G4SLrecp2KzUaYGzBxWJpAhDFycAjCRezmMDGdFpl5cZz2xV6VK
 67ro+4sRqiHvTXWiV/ytnnPXy7w9S4mR4UuS786S182/LwXZn3kWWap7OH/GKcMfobE/OF7euZe
 9ihEA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Implement ->proc_write_buf() for allow_dio and def_reserved_size so
procfs copies in what is written before it pins the entry, and parse
the number from that copy.

kstrtoul_from_user() looked at the first 66 bytes of whatever was
written. Now the whole write is parsed, and anything larger than
PAGE_SIZE - 1 bytes fails with -EINVAL from procfs before the
capability check.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 drivers/scsi/sg.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/scsi/sg.c b/drivers/scsi/sg.c
index c7386fbe5580..87569e302f26 100644
--- a/drivers/scsi/sg.c
+++ b/drivers/scsi/sg.c
@@ -2287,18 +2287,18 @@ sg_get_dev(int dev)
 #ifdef CONFIG_SCSI_PROC_FS
 static int sg_proc_seq_show_int(struct seq_file *s, void *v);
 
-static ssize_t sg_proc_write_adio(struct file *filp, const char __user *buffer,
+static ssize_t sg_proc_write_adio(struct file *filp, char *buffer,
 			          size_t count, loff_t *off);
 static const struct proc_ops adio_proc_ops = {
 	.proc_show	= sg_proc_seq_show_int,
-	.proc_write	= sg_proc_write_adio,
+	.proc_write_buf	= sg_proc_write_adio,
 };
 
 static ssize_t sg_proc_write_dressz(struct file *filp, 
-		const char __user *buffer, size_t count, loff_t *off);
+		char *buffer, size_t count, loff_t *off);
 static const struct proc_ops dressz_proc_ops = {
 	.proc_show	= sg_proc_seq_show_int,
-	.proc_write	= sg_proc_write_dressz,
+	.proc_write_buf	= sg_proc_write_dressz,
 };
 
 static int sg_proc_seq_show_version(struct seq_file *s, void *v);
@@ -2359,7 +2359,7 @@ static int sg_proc_seq_show_int(struct seq_file *s, void *v)
 }
 
 static ssize_t 
-sg_proc_write_adio(struct file *filp, const char __user *buffer,
+sg_proc_write_adio(struct file *filp, char *buffer,
 		   size_t count, loff_t *off)
 {
 	int err;
@@ -2367,7 +2367,7 @@ sg_proc_write_adio(struct file *filp, const char __user *buffer,
 
 	if (!capable(CAP_SYS_ADMIN) || !capable(CAP_SYS_RAWIO))
 		return -EACCES;
-	err = kstrtoul_from_user(buffer, count, 0, &num);
+	err = kstrtoul(buffer, 0, &num);
 	if (err)
 		return err;
 	sg_allow_dio = num ? 1 : 0;
@@ -2375,7 +2375,7 @@ sg_proc_write_adio(struct file *filp, const char __user *buffer,
 }
 
 static ssize_t 
-sg_proc_write_dressz(struct file *filp, const char __user *buffer,
+sg_proc_write_dressz(struct file *filp, char *buffer,
 		     size_t count, loff_t *off)
 {
 	int err;
@@ -2384,7 +2384,7 @@ sg_proc_write_dressz(struct file *filp, const char __user *buffer,
 	if (!capable(CAP_SYS_ADMIN) || !capable(CAP_SYS_RAWIO))
 		return -EACCES;
 
-	err = kstrtoul_from_user(buffer, count, 0, &k);
+	err = kstrtoul(buffer, 0, &k);
 	if (err)
 		return err;
 	if (k <= 1048576) {	/* limit "big buff" to 1 MB */

-- 
2.53.0

