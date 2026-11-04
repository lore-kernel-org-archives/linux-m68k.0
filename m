Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793821391;
	b=K7lEALxbjJfALJS7fD7EcLFo1NLseJHelFg0pxu9VtqiL0ejQCczr/LjSFBbATVUcWd5
	 jfDq3vEzmUh9ahz6hfnK/uD0WBQwIeOJA7tweUI3ByswHva+qSXWtZ6JBBNlOPDAl0AKg
	 w6T2qsvfly6CMw8rAM0P+7y5ubnSHZ/VPwPOxgveeJHgvd0UpBIsNS+4HqJkTuDoIiAGA
	 G5ZLih3/vhjbwgZNoqehXweBjpafXpsO83e+1/W+/nq/rJzpco98wiYynIV0f39Zl8Z7C
	 WBEkeogH7q1x3Dl3heYhmo30Ayddni00L1JZiPvoddfVd/ldvPwdPo7g+KxoD6tLojg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793821391;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=vqkxnch8qakIwUVP+9QJA5QeGLg7HpbhcDTmIF75pEs=;
	b=Ru4E7P9wKxVdI5NsXsaL+yiw6OXXPof8ZpwoYnKukas3S5+Rh41tCQLPmnVx8hQXWJnD
	 a62E/4NxpBGBhYa/6mJUunMO3x11Y1K7cK+3+8wBqD0M/K+W97/iSKOv4A8+kXovev5rj
	 5Ofr8ri7a0LXekaziDbHC3UZQaAO23BvpNXu5wOqPyo6F/RR6D7NadPomE9vvs3BvU/yq
	 i5KqD639XB+o2KUejkT+ekkjyZq2YSmhgPCYmx64RleEY2R2mP/Z8h7lLwAxag20u34WF
	 oDGDQ+MJ3mH+QVT4dVFCaqmHEU95B6FSMyABoDjEJWi9Yfhd8VxB5JHmgjDLqwRaMiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NFupU1rs;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35512607031B
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Nov 2026 19:43:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35512607031B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NFupU1rs
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EA55343590;
	Wed,  4 Nov 2026 19:43:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D174B1F000C1;
	Wed,  4 Nov 2026 19:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793821390;
	bh=vqkxnch8qakIwUVP+9QJA5QeGLg7HpbhcDTmIF75pEs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NFupU1rsFN26uYyirSpy7lFw664I+g703aMbJGP14Bae8+IhtR1KZcpCy5pdfPvMw
	 eV/2lBYEER+x1ZleUxLp7sD4d71dwM9dIy6LqnYceAMqDaXbDyZm9eAyIxvw4CZ/zw
	 cL0lQa1+LhuyYV8RPMrhtaCZQdVkmeCOGe9Gdjg6JKWj1oo+B4rwwcNJJZSZ97bpQ+
	 ZCUOUvVHmdEIToX0OugSV/yJ7Ok+GTvHw6HO0EWJbZSEzDaJxJrnp2ZDpD3fDUV7mJ
	 KbZm/VwBsDiiDXD5PZdNyV52+UmubW1d60Nh97+JH1pD4lkNt+RcBs+FCN//W2HPve
	 8OGziJyI9UIlA==
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
Subject: [PATCH RESEND v2 03/26] PCI/proc: let procfs copy in config space writes
Date: Wed,  4 Nov 2026 20:42:56 +0100
Message-ID: <20261104-work-procfs-drivers-v2-3-245e54e87116@kernel.org>
In-Reply-To: <20261104-work-procfs-drivers-v2-0-245e54e87116@kernel.org>
References: <20261104-work-procfs-drivers-v2-0-245e54e87116@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3416; i=brauner@kernel.org; h=from:subject:message-id; bh=FHhIortRJiKYhZazrarBsz8LKuG1O3uAWYPgQRTjmaQ=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS97ipbd2aJ7totIq+iew42TZ73tN+H7Rjntr0y7q9bn iqKvEn26yhlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZiI0lpGhskhIdpTXxn2X1+v 5tcotHx+77XQvl3hnbJzvA3uziu8v5zhD+cfrvnz0tvOrTVaZiYb88BDz/rzsT1fFDfO3fJhwru ZsUwA
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

Implement ->proc_write_buf() so procfs copies in what is written before
it pins the entry, and write the config space from that copy with
get_unaligned_le16() and get_unaligned_le32() instead of get_user().

The copy holds at most PCI_CFG_SPACE_EXP_SIZE bytes. Larger writes come
up short with PROC_ENTRY_SHORT_WRITES, like they did before because
they were cut at the end of the config space.

A buffer that can't be read used to write zeroes to the config space and
report success. It fails with -EFAULT now and nothing is written.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 drivers/pci/proc.c | 32 +++++++++++---------------------
 1 file changed, 11 insertions(+), 21 deletions(-)

diff --git a/drivers/pci/proc.c b/drivers/pci/proc.c
index e0dc70123f82..d420353ee2b3 100644
--- a/drivers/pci/proc.c
+++ b/drivers/pci/proc.c
@@ -16,6 +16,7 @@
 #include <linux/security.h>
 #include <linux/panic.h>
 #include <linux/sched.h>
+#include <linux/unaligned.h>
 #include <asm/byteorder.h>
 #include "pci.h"
 
@@ -114,8 +115,8 @@ static ssize_t proc_bus_pci_read(struct file *file, char __user *buf,
 	return nbytes;
 }
 
-static ssize_t proc_bus_pci_write(struct file *file, const char __user *buf,
-				  size_t nbytes, loff_t *ppos)
+static ssize_t proc_bus_pci_write(struct file *file, char *buf, size_t nbytes,
+				  loff_t *ppos)
 {
 	struct inode *ino = file_inode(file);
 	struct pci_dev *dev = pde_data(ino);
@@ -145,51 +146,38 @@ static ssize_t proc_bus_pci_write(struct file *file, const char __user *buf,
 		nbytes = size - pos;
 	cnt = nbytes;
 
-	if (!access_ok(buf, cnt))
-		return -EINVAL;
-
 	pci_config_pm_runtime_get(dev);
 
 	if ((pos & 1) && cnt) {
-		unsigned char val;
-		get_user(val, buf);
-		pci_user_write_config_byte(dev, pos, val);
+		pci_user_write_config_byte(dev, pos, *buf);
 		buf++;
 		pos++;
 		cnt--;
 	}
 
 	if ((pos & 3) && cnt > 2) {
-		__le16 val;
-		get_user(val, (__le16 __user *) buf);
-		pci_user_write_config_word(dev, pos, le16_to_cpu(val));
+		pci_user_write_config_word(dev, pos, get_unaligned_le16(buf));
 		buf += 2;
 		pos += 2;
 		cnt -= 2;
 	}
 
 	while (cnt >= 4) {
-		__le32 val;
-		get_user(val, (__le32 __user *) buf);
-		pci_user_write_config_dword(dev, pos, le32_to_cpu(val));
+		pci_user_write_config_dword(dev, pos, get_unaligned_le32(buf));
 		buf += 4;
 		pos += 4;
 		cnt -= 4;
 	}
 
 	if (cnt >= 2) {
-		__le16 val;
-		get_user(val, (__le16 __user *) buf);
-		pci_user_write_config_word(dev, pos, le16_to_cpu(val));
+		pci_user_write_config_word(dev, pos, get_unaligned_le16(buf));
 		buf += 2;
 		pos += 2;
 		cnt -= 2;
 	}
 
 	if (cnt) {
-		unsigned char val;
-		get_user(val, buf);
-		pci_user_write_config_byte(dev, pos, val);
+		pci_user_write_config_byte(dev, pos, *buf);
 		pos++;
 	}
 
@@ -337,9 +325,11 @@ static int proc_bus_pci_release(struct inode *inode, struct file *file)
 #endif /* HAVE_PCI_MMAP */
 
 static const struct proc_ops proc_bus_pci_ops = {
+	.proc_flags	= PROC_ENTRY_SHORT_WRITES,
 	.proc_lseek	= proc_bus_pci_lseek,
 	.proc_read	= proc_bus_pci_read,
-	.proc_write	= proc_bus_pci_write,
+	.proc_write_buf	= proc_bus_pci_write,
+	.proc_write_size = PCI_CFG_SPACE_EXP_SIZE,
 	.proc_ioctl	= proc_bus_pci_ioctl,
 #ifdef CONFIG_COMPAT
 	.proc_compat_ioctl = proc_bus_pci_ioctl,

-- 
2.53.0

