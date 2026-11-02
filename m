Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793632851;
	b=4eAT+ryNn7mJdDDXLtP648oqOpR5Sbhog05Ffz4G8uGG3+atPjdT2EzWvf5lDzYCNxRQ
	 vyNv8thdHI2cBDxZ5Qy2wTtvAgfOxVBKTNtdT+hB8tAzSgtoVouORS8fd/O+bCY8eFXiK
	 4vl44M+l79XhoY1pd0J5kFoKZ+6nak303EH05AXwH/LBQuDqN2c8srlN/o2G5bVAAN2yA
	 4CoToO1haBYoNOqeCbxFW/5GJyY906FXivXJFOSKrtHUBHNGKNt2ayhuStAxN56yYtZL8
	 oqbbJUrbbJyVCxx4TadlWoEsm0AzcHPPl0e6wkisxaftxq5QsvKpFrTcubmzHtTfTKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632851;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=vVBne5gselOZS7qaEMuXaEvBAuXwNF+VXq/xDlGRpv8=;
	b=eqog06ctRHsXP0fEBXKRQgL+0kykyHyrHCdXkPE3dIQ4g0jAK/oo+s6n9RRsRgtr8E+H
	 dpPkCbilrHPO6TurqPT8nbrSYJTstpPM9gaCgiswiLk4ydfrYpyZ/wnukw/d3EvpDzJA2
	 nBOFxXHDQV9emoYXQZkXMeEiOWJkav8siE65zDxRWMpho0/5F/n7lAvi+fzbLsfa78BbF
	 kConbtDqVL4qirFrBSExmy8687Ds/SZ13vUzOfyvuJoxQuQs5DdYeLHyVB24aFkY0rUjG
	 fH8TIGwrTpk93UFOfjS9lENmJ4DSuTM+xBENFk3rT4KPrUInyGKvoS1QmdZqyU2c1OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="gr5d/R5Q";
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F966096D69
	for <linux-m68k@lists.linux-m68k.org>; Mon,  2 Nov 2026 15:20:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11F966096D69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gr5d/R5Q
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 26A9060623;
	Mon,  2 Nov 2026 15:20:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74D411F00A16;
	Mon,  2 Nov 2026 15:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793632849;
	bh=vVBne5gselOZS7qaEMuXaEvBAuXwNF+VXq/xDlGRpv8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=gr5d/R5QulyTLxLD3/MAYMmLMYbT35xK6aId1t52Eow8QSEABCm8rzX4k2Z5I8Uv+
	 UD3L6bdcCyDENgjDUaRYaIjBpv9KifSo7KdKtRyWAroMom4KY5WF+Ln9EUR/OU8bIw
	 cfIbJFU0gkdeaQcslP0HV9lJfr+zxpqlFkl/tfWZ6xjZPkExH482FMNrcXoifnZDpb
	 BBMpFNPyNBOQcsBD+Cr7KjsIhvpuH/wA12Pa4HnVFFk/4VUZAo7SAy5riWBb7UiSlV
	 k2iUhU3k2r67F3NXxANMDiQuT8gkSLpR87qwXkRQSfThiB+qYgkMJbi1jVvEbOj1vw
	 BbGpsyobrAFbw==
From: Christian Brauner <brauner@kernel.org>
Date: Mon, 02 Nov 2026 16:07:14 +0100
Subject: [PATCH RFC 04/27] lockd: let procfs copy out reads of
 nlm_end_grace
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
Message-Id: <20261102-work-procfs-fs-v1-4-d09a996317b3@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1257; i=brauner@kernel.org;
 h=from:subject:message-id; bh=eZ2kMMEIgx0JCcy46KFAm+0lqPvZbTWW97pZVUITElw=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS9WG74O2799hNsR6IfK5pKSQjHJsw/YPHc0p7/jSlHm
 OeZhvliHaUsDGJcDLJiiiwO7Sbhcst5KjYbZWrAzGFlAhnCwMUpABPZ/ImR4eZSzSvCL/kZRC1V
 N2gkpD259yrLxz9novylvNjbUvvXtzEyLO2o59UOLix8XXD14rToR6HSd+5s+1rF8C/DcQqPudp
 iTgA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Implement ->proc_read_buf() so procfs copies what is read to userspace
after it unpinned the entry.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 fs/lockd/procfs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/lockd/procfs.c b/fs/lockd/procfs.c
index 47949bec7a09..34a7c3705bb6 100644
--- a/fs/lockd/procfs.c
+++ b/fs/lockd/procfs.c
@@ -40,7 +40,7 @@ nlm_end_grace_write(struct file *file, char *buf, size_t size, loff_t *pos)
 }
 
 static ssize_t
-nlm_end_grace_read(struct file *file, char __user *buf, size_t size,
+nlm_end_grace_read(struct file *file, char *buf, size_t size,
 		   loff_t *pos)
 {
 	struct lockd_net *ln = net_generic(current->nsproxy->net_ns,
@@ -51,12 +51,12 @@ nlm_end_grace_read(struct file *file, char __user *buf, size_t size,
 	resp[1] = '\n';
 	resp[2] = '\0';
 
-	return simple_read_from_buffer(buf, size, pos, resp, sizeof(resp));
+	return memory_read_from_buffer(buf, size, pos, resp, sizeof(resp));
 }
 
 static const struct proc_ops lockd_end_grace_proc_ops = {
 	.proc_write_buf	= nlm_end_grace_write,
-	.proc_read	= nlm_end_grace_read,
+	.proc_read_buf	= nlm_end_grace_read,
 	.proc_lseek	= default_llseek,
 };
 

-- 
2.53.0

