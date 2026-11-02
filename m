Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793632037;
	b=JS3o1fl1usGUM9ciqtKeFVUZ2nysAviXoZ6RcPmZKGhZIisSNn7jGTg8Mn3nuyzBqz9R
	 BgvUXG7pK8ONtpF1/LPosBvaD76OTQy4cmODZMJwJwAWoMFmnA2N/nWyc7yzO0AuHZ7P2
	 i7uPXU4s2cBn6IOxtMFOjNcrqwz0Hgc9Q4StQZqgOeb4gbT2jJakF/qa8KB2L8m/bvYWO
	 Ap2onocOlBubY7fEet3UBE8kIUyYZvyXn3h7TLPEvVbJrvOc9rVVR8+CtnLf90j11EwjV
	 cv0QbETakqqJZ6ZohmAFtyvo+KFH36XhI5XApFCxzvzf+wBhsAGu7g4bGqQ/EO7aG4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632037;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=mGdLlGj/NJAJr68kXbSPslaJvhomImSQvB5hgldkHFg=;
	b=XYhItRpr8/5j3wGEsRdCili7Nt5GxF+pymTDM/bohQzu7ynyeF+HoNu7kIJ8Hi52Uo9F
	 FU9p971tbDU0HUI2GBuAeCuwHx/IKCjaZSAtgRhWcYwSVfaRSdGxVbWoBu/K693jrk9w3
	 Wca4ne/xAXl+pyT/SW74L6zA4BA+iFrJiMo+HtSpF/kKs2u6mPuTUw31pqahyDczNWt/U
	 ySGg6ueVzlQP33uYeLd+cltYgT0qNgIVjct3m1k3afzW6dTMaqT7iLDEwm64i+HqaWo0D
	 n1CfjAdD2uZ7CtGyeeAkMyyElwuqY2Ar53aAFWBNKhXfwIy1eBCC2qfRGPVO1VhEgXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IzlZDjTa;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8CB609FD86
	for <linux-m68k@lists.linux-m68k.org>; Mon,  2 Nov 2026 15:07:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D8CB609FD86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IzlZDjTa
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6FF48605C9;
	Mon,  2 Nov 2026 15:07:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B26C51F00A16;
	Mon,  2 Nov 2026 15:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793632036;
	bh=mGdLlGj/NJAJr68kXbSPslaJvhomImSQvB5hgldkHFg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=IzlZDjTao7VjuIjRRsnw52RX/0AjF/WBmgT4NSpXmtjt4TJbN8zegt24j5DOlUa3Z
	 44pMabJRvDCRlnweMnKPhfJPYcWc+E6OtpWq1y0Ac43VD4FbMRQP9qey5otxK1q5PL
	 oT9zsk1HsUa3Ue3zXl6S6BVtFghJKXFiWTJwHmxl0PE/8ztq9iyqz6BcdrpCZDdpYi
	 3XtzkYqJlHCU6ToIaLkgAjRlsjmuFBtw97UNIAceQYdi00vVfKPn4AuQDU9qRHk19M
	 URA4zqhN0uKI8rAUpyUb++ZQsVmLXvF7KAChG6Fit1JA/MDvvneOl/7dLgJJZyJ32o
	 yDuj9+i1oCVEA==
From: Christian Brauner <brauner@kernel.org>
Date: Mon, 02 Nov 2026 16:01:43 +0100
Subject: [PATCH RFC 16/22] xtensa: simdisk: let procfs copy out reads
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
Message-Id: <20261102-work-procfs-arch-v1-16-c9492ab08480@kernel.org>
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

Implement ->proc_read_buf() so procfs copies what is read to userspace
after it unpinned the entry.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 arch/xtensa/platforms/iss/simdisk.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/xtensa/platforms/iss/simdisk.c b/arch/xtensa/platforms/iss/simdisk.c
index b2f9e7f3ade3..b597d8642e8a 100644
--- a/arch/xtensa/platforms/iss/simdisk.c
+++ b/arch/xtensa/platforms/iss/simdisk.c
@@ -234,7 +234,7 @@ static int simdisk_detach(struct simdisk *dev)
 	return err;
 }
 
-static ssize_t proc_read_simdisk(struct file *file, char __user *buf,
+static ssize_t proc_read_simdisk(struct file *file, char *buf,
 			size_t size, loff_t *ppos)
 {
 	struct simdisk *dev = pde_data(file_inode(file));
@@ -250,7 +250,7 @@ static ssize_t proc_read_simdisk(struct file *file, char __user *buf,
 	len = scnprintf(temp, PAGE_SIZE + 2, "%s\n", dev->filename ?: "");
 	spin_unlock(&dev->lock);
 
-	len = simple_read_from_buffer(buf, size, ppos, temp, len);
+	len = memory_read_from_buffer(buf, size, ppos, temp, len);
 	kfree(temp);
 	return len;
 }
@@ -280,7 +280,7 @@ static ssize_t proc_write_simdisk(struct file *file, char *buf,
 }
 
 static const struct proc_ops simdisk_proc_ops = {
-	.proc_read	= proc_read_simdisk,
+	.proc_read_buf	= proc_read_simdisk,
 	.proc_write_buf	= proc_write_simdisk,
 	.proc_write_size = PAGE_SIZE,
 	.proc_lseek	= default_llseek,

-- 
2.53.0

