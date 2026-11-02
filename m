Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633214;
	b=MJ3xUR11FxMNB01Xq2GdddWz9lxlZoyK7ENCQhMcgi56DfY0nOU6FPQnR2c09XPKZUKT
	 BKuWG8AVvfE2yGDwePm+yTNowPmJ8LGD5TF91jahgy+v2bRr//f2vL5NonW7upqfxlwlo
	 wtiYhxBu3/m9wI/hrLPLqVjDeGtUDxalPvUlejC52Iki+v9JeTdVJvhHiZImmf7437J0T
	 gqm3OTY4U4g8goGOw0FQegZz60Pygd3cKnKh912wAuWPO8ev/ADDgHrxI0ptscVQ0miYb
	 4x2zqFFPYZ8/rmsMgiBaUs10/2dGJmDTqvyXtiMD1QmkCPxCz9FT9GQLIU6mWB6UGaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633214;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=5GRAUZH2kX1HsIdPeFBozE83iEr60/LUxZUEqoYcqBA=;
	b=W/MPxqYuT56ClYW5No2o9T3Yb1dWzjpCAp09BnwqZjGKxCN8mF+N1rs7BQu1wHKtioPt
	 n8k98F92BFNAwg/udIdQbXYR835yQTjyANnKlS0V5tDGKD4xgf5GLFhaKLTWzPeOvlYLR
	 hmJjzqP393OYwmxurwpYCVF/hrPVgiug3CzJ1h6N0qD1FQOPjU1l6/97j7ibA1qbID5y+
	 KAq+27e71+j3TZBrK+m03Ofx/1Z6K9OhGbUAcgPvtL6BiMdJ3D1ey8sTpJhnESyUy33XH
	 gw+6J2WelHlXB+6sYD/1UhwV1B2KkqNSSoczB1lpCq7Dw9z4fBuGwk7xWL2H0e/YcyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nYBs0GAF;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CDC6083E06
	for <linux-m68k@lists.linux-m68k.org>; Mon,  2 Nov 2026 15:26:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06CDC6083E06
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nYBs0GAF
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C642B404E4;
	Mon,  2 Nov 2026 15:26:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96FDA1F00A16;
	Mon,  2 Nov 2026 15:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793633213;
	bh=5GRAUZH2kX1HsIdPeFBozE83iEr60/LUxZUEqoYcqBA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=nYBs0GAF8b3S0eatIZoAhddTaBQQ/i0CrcM92EglgsZZbWpy731ExatrOh40qewLF
	 Lp8S7Rrut+eO6q6LdIfOUD8IT/maYnyF1DBExnOFJG7mwcNuHGN5jv9pNZ9AuWREId
	 lnOMTthrQoRObRBolVjhYcHCSAlAi4r+kE39L/TCDTKs5S84hkUHNI6KoriDtYwBpI
	 U0fE3C6vht9Hwk8FIpEHBtzNae5orDp4ap1DfxmedQEVe2FH237hpiNUepRwcWVPa9
	 eKW1KUqWkYD6wrjns7QIlZcwyB9vCaN2c35pIVU6Iu87SgiaL5+rLK2WDEDvulHZL8
	 tBantGPOqqkGQ==
From: Christian Brauner <brauner@kernel.org>
Date: Mon, 02 Nov 2026 16:07:30 +0100
Subject: [PATCH RFC 20/27] module: procfs: let procfs own the seq_file of
 /proc/modules
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
Message-Id: <20261102-work-procfs-fs-v1-20-d09a996317b3@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1665; i=brauner@kernel.org;
 h=from:subject:message-id; bh=flwsY9W3AwD1el1fvMS4MRjAzw7empBDyCTwiYsv/MA=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS9WG50+lPbWr8TO3/XJX642z+55KDeRh0pIW9bi1VZ/
 MvKft0s7ChlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZiIpwUjwwyex5oMWjNmXVW1
 TDi5fH3+9vUsj5XnVPa/nJM/5XDQTDNGhsPvYp7dK/9aPKFSfO5H07Jd/XPz+O2FRZWOr7PQyLs
 rzAIA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Declare the seq_operations and let procfs open and free the seq_file.
->proc_open() only decides whether to hide the addresses now.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 kernel/module/procfs.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/kernel/module/procfs.c b/kernel/module/procfs.c
index 90712aa9dd13..a759bd916df7 100644
--- a/kernel/module/procfs.c
+++ b/kernel/module/procfs.c
@@ -117,31 +117,24 @@ static const struct seq_operations modules_op = {
 };
 
 /*
- * This also sets the "private" pointer to non-NULL if the
- * kernel pointers should be hidden (so you can just test
+ * procfs opens the seq_file. This sets the "private" pointer to non-NULL
+ * if the kernel pointers should be hidden (so you can just test
  * "m->private" to see if you should keep the values private).
  *
  * We use the same logic as for /proc/kallsyms.
  */
 static int modules_open(struct inode *inode, struct file *file)
 {
-	int err = seq_open(file, &modules_op);
+	struct seq_file *m = file->private_data;
 
-	if (!err) {
-		struct seq_file *m = file->private_data;
-
-		m->private = kallsyms_show_value(file->f_cred) ? NULL : (void *)8ul;
-	}
-
-	return err;
+	m->private = kallsyms_show_value(file->f_cred) ? NULL : (void *)8ul;
+	return 0;
 }
 
 static const struct proc_ops modules_proc_ops = {
 	.proc_flags	= PROC_ENTRY_PERMANENT,
+	.proc_seq_ops	= &modules_op,
 	.proc_open	= modules_open,
-	.proc_read	= seq_read,
-	.proc_lseek	= seq_lseek,
-	.proc_release	= seq_release,
 };
 
 static int __init proc_modules_init(void)

-- 
2.53.0

