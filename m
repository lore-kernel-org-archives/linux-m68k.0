Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793631781;
	b=V1Z+yliri9sgdrYOVLcKxtbZq5xy7sa6N3j49TMI3ktQyxRztWLdfgKYtfpwlVU+HAgW
	 FvkTQjTBT+kb3JFeE8NqxmM3u93/FL6os0HFEE89PTixFVIBSoFIBf4EpUP85rjS03TA2
	 c6PTpUSEnQADN5G58WBckVAGNomjqGdCx5i1WFxftpgX0RXP1S8e33V1r5r4tMvUDOXUc
	 3lcB7wAtJNaBxR1IkhJEslHgnRCDDX16GTY494wCX3VLTExRkL88NgByKzmqTA0x66LrC
	 0UcrfTb2feSMdfql1L+916qyhy20S0WABwxzGK6JCsixMKVmsaZY6eR6atKF/SGh+hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631781;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=wEPnWAoxjJOkMqmLZaf/U9t0SZ8y5Jr9Z0MZeAu0+Kc=;
	b=22AEjaI6K2iXJLIpTssxWs8obpWTrkMiXKSGr4Ybn2mSY6+eCGpy3uSbpjUXpBf7c/wz
	 zn/x9JWCfBIxac2MzHqKcu+o7X8YAUg1QK2RT8gztpc3n7sbaMbLx0QaxOAg047fLtuLw
	 vP4+0zbERMGCgR/ClPlvC6JDD35ESm2dGX5quc/LD2zrDvQ9R/fi47qaLqWDIZh3gTv/i
	 WtEBj04lUZqH0dnpCrIVJma0pthTASICyLZIdngr4FbrsEazyQEbSyvlYu44KRMclv8nr
	 wQdYxGHoZsWfBRejA3b8mwJ4XA8/rvK8SFJHxBak4suYIQ32i17EOOJrjvtQ5UPmEug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ht8IvPAW;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E926360824EF
	for <linux-m68k@lists.linux-m68k.org>; Mon,  2 Nov 2026 15:03:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E926360824EF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ht8IvPAW
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 09B946022F;
	Mon,  2 Nov 2026 15:03:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 993D81F00A1C;
	Mon,  2 Nov 2026 15:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793631779;
	bh=wEPnWAoxjJOkMqmLZaf/U9t0SZ8y5Jr9Z0MZeAu0+Kc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Ht8IvPAW4mof6T3nGFwGbeVcaglGOl5mlj1CVqepMvEvFGz+8PKgoWLHL9+bJs9L7
	 53v2AQN+tBMkiLzgkeml7gGU+OB8Qm2CYhl3PTcPVXGN5OADSQkZJx/YRkKTS8i052
	 B5XpuKPR4lfAkar6kmgYTuxdr92sz56IZFvIKuF1+wppZQEyaU5GTMiW0VyOvuqR23
	 IRN/l76vPa7aqwWxy1j21njn6oagnIsGH3fmLYqTV/WDWTC2VC/h/xgzC3mEcucqJ4
	 Ga/T8yFZ4NOj4fhKsZdAeiJjq2g3w2I4SHbAhfhyRvJrP9tLFJXFNtfFbKv/jX0P31
	 EU9eTVpIjSIzQ==
From: Christian Brauner <brauner@kernel.org>
Date: Mon, 02 Nov 2026 16:01:31 +0100
Subject: [PATCH RFC 04/22] m68k/bootinfo: let procfs copy out reads of
 /proc/bootinfo
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
Message-Id: <20261102-work-procfs-arch-v1-4-c9492ab08480@kernel.org>
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
 arch/m68k/kernel/bootinfo_proc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/kernel/bootinfo_proc.c b/arch/m68k/kernel/bootinfo_proc.c
index 857fa2aaa748..4936cf44e86a 100644
--- a/arch/m68k/kernel/bootinfo_proc.c
+++ b/arch/m68k/kernel/bootinfo_proc.c
@@ -19,15 +19,15 @@ static char bootinfo_tmp[1536] __initdata;
 static void *bootinfo_copy;
 static size_t bootinfo_size;
 
-static ssize_t bootinfo_read(struct file *file, char __user *buf,
+static ssize_t bootinfo_read(struct file *file, char *buf,
 			  size_t count, loff_t *ppos)
 {
-	return simple_read_from_buffer(buf, count, ppos, bootinfo_copy,
+	return memory_read_from_buffer(buf, count, ppos, bootinfo_copy,
 				       bootinfo_size);
 }
 
 static const struct proc_ops bootinfo_proc_ops = {
-	.proc_read	= bootinfo_read,
+	.proc_read_buf	= bootinfo_read,
 	.proc_lseek	= default_llseek,
 };
 

-- 
2.53.0

