Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793632087;
	b=APYA/PkAQwMa0rregdxF18At1s+qSrElNbSx34vygKzkPl4xt4S1ouVEIIHZI3Z2p5V7
	 v8keiXj27F61EEmWDfTUs9cB37+FwfVZ5kAGnGsTq7azg2h1VB/1gcGOGxwo47EZxzJd8
	 X32EZyN7Ljw1/017XIUTNu4j3JGdFCuH+d1/UZK5LngP4uPuci8rFYxajZoEWyjAWy7ip
	 kkvy0svX8mDEOrGMVYJUXEuYyfU2aEBDfC7+mGAjt3tNR6EUoHDGF5Brimpqa0zRZTeTn
	 wROz4WaETf1HUW/froL/dp/ATNuW5dJgp6MN4ThZ26Ht0ZuitTqrcFW3qYUM3ASbm4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632087;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=6VXp+nvPq44Iibfd7M3dnZqyMxw2lTQeTkLffGnpGI8=;
	b=craPn9HxT7Xtb2m4RvSMMh5Mf84Z4uQ6fXp4KLy9vi46F3svNOviFUpiGOktnQqMXJOv
	 Fm3DCCWykJsVyXV8H6METlSKesZXtcWFnyGNGSZY3ediWNEEFF6B07WsaJmOdZ/w1QUN+
	 kMdns8dfonYgJ4KiOwPXWhXeD9FNDy5HgGzR2M9oC6axBa8AUeBiBUkg4Eh2pHYypLjRc
	 WFSKU3NE3D29PMCIBHxbRXJloHhOB6z2t/udCpFfvHW4R9b0H4FOdR2eE+uVSUphXDOer
	 nQeHGHkDMsp5z243+Vq573vA6qL9lzvAwwiG6ATy9hE/EKt8oBeKgEESZiQBzBH5XMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IJsS4rxO;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F7B60A0FFF
	for <linux-m68k@lists.linux-m68k.org>; Mon,  2 Nov 2026 15:08:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50F7B60A0FFF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IJsS4rxO
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 18A8C43267;
	Mon,  2 Nov 2026 15:08:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E8D31F00A1B;
	Mon,  2 Nov 2026 15:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793632087;
	bh=6VXp+nvPq44Iibfd7M3dnZqyMxw2lTQeTkLffGnpGI8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=IJsS4rxOrw0evPnx89c/k4QBxYWHpvmf5bC5nkZvS9heIkdiPMQ9+UGLYAqwXCeRo
	 01xMhphWRq3Aq5SpmzQFwBYXFYqXKEaXV7aEPiCoGMFOQNxw7pWWisGb5yaQPmI5Sh
	 tp1LULK9tthAvY5/hntPoT0wfDOVWswz1/lwzqVDgSpYEcKIVZ8JMYeE0wU54k61kO
	 ToCwYStQ9aor3WEDfPrJ5VAU7p1igwmg/9f/J70vTmuPCQCbfb4H8bgp2jfpfxr9Bw
	 Lja5YKZ94jQYHKXWFN6sFWb+EV8QZMwi+q9qWB4+h7zvBC2rh/ZxyN51W+VcpcOFR+
	 oDn8HTPgDHHnA==
From: Christian Brauner <brauner@kernel.org>
Date: Mon, 02 Nov 2026 16:01:46 +0100
Subject: [PATCH RFC 19/22] platform/x86: thinkpad_acpi: let procfs copy in
 writes
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
Message-Id: <20261102-work-procfs-arch-v1-19-c9492ab08480@kernel.org>
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
/proc/acpi/ibm/* before it pins the entry, and hand that copy to
->write(). procfs already rejects writes larger than PAGE_SIZE - 1
bytes.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 01e4c980fad6..b4f253da9536 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -881,33 +881,25 @@ static int dispatch_proc_show(struct seq_file *m, void *v)
 }
 
 static ssize_t dispatch_proc_write(struct file *file,
-			const char __user *userbuf,
+			char *buf,
 			size_t count, loff_t *pos)
 {
 	struct ibm_struct *ibm = pde_data(file_inode(file));
-	char *kernbuf;
 	int ret;
 
 	if (!ibm || !ibm->write)
 		return -EINVAL;
-	if (count > PAGE_SIZE - 1)
-		return -EINVAL;
 
-	kernbuf = memdup_user_nul(userbuf, count);
-	if (IS_ERR(kernbuf))
-		return PTR_ERR(kernbuf);
-	ret = ibm->write(kernbuf);
+	ret = ibm->write(buf);
 	if (ret == 0)
 		ret = count;
 
-	kfree(kernbuf);
-
 	return ret;
 }
 
 static const struct proc_ops dispatch_proc_ops = {
 	.proc_show	= dispatch_proc_show,
-	.proc_write	= dispatch_proc_write,
+	.proc_write_buf	= dispatch_proc_write,
 };
 
 /****************************************************************************

-- 
2.53.0

