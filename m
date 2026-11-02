Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793632790;
	b=BFTa1uGDnKtOrm7JKOS5FmIwrufIzGRIsisCm4g+4likOvkdiqYBiXmwUZvbBrZsk1PT
	 LOyVLp/GCXyyykv5PjG8un0TTVjbGUhVQJBv1K0ET4uazJOoeBUUHhnNTXOkpEdJXYIrS
	 /00H88kL7YKDciVp9T4z93KbCNM8OCrSXTORDPWz6/ubpW6qh7OvGJtbblaUXWdDRN5nH
	 e2ZNl0qNhfGkJFvp34QuszRSGPXz54Wcq9rliBCmQg0InsvVoEvcWt7YxhcpyHRAD/3bp
	 kyAR3wO4sAxx5vvEg3ZnONkKsN7XSFBB7ZyTjzzdxsnmrmqrxHCo7FigL8LiR8MCsdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632790;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=o8L0vvGY5Km24xgHgPbylEP8c5DuS625RCEauDmBOHw=;
	b=r0STizXF2xSwEPWchsK+gS4dWwoBgLjRMG31mKVvFlMPlb+roObRN6TbyFGRdYzWjNGy
	 s6VWh6Cam9uFJRLRJ3phXogtYj+tFXluZpw2up4Or7ctqvZMs1QCLyMStMRzbZLgTnEMQ
	 TM2TiH/DFvUKQ11Qr6+MGBJ3uQjvnrcaKfbjUdffM6M3s7MVid6qu7LEuPPS4GK5NhpMU
	 SpczArJPGj4sQePoCFU99Q6M7WoCEMT+CmUuDI6ZmR+Ke5l3T8BEVWqxselkwQWlDdI/F
	 vSt9RTJmIMI94OJ75phEXo/b6twNxIu3fUQmaDwfg1k98Vnlbf7EZPVkmAsTrXKyzjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FISzkgiD;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B26F6070D87
	for <linux-m68k@lists.linux-m68k.org>; Mon,  2 Nov 2026 15:19:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B26F6070D87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FISzkgiD
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3FCFA60A4F;
	Mon,  2 Nov 2026 15:19:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC6A21F00A1C;
	Mon,  2 Nov 2026 15:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793632788;
	bh=o8L0vvGY5Km24xgHgPbylEP8c5DuS625RCEauDmBOHw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=FISzkgiD/yGuvR5vmXFKZeW9WfMgEMNzsKuSLgjo5EcXuoWsQeOK9E+zoYez94iwP
	 kd6gyDs+JBsqALh51n9A8+QTvp0EtTnI1VuAQVToT3JauFOAYWcitc4Ij8VOStoQHW
	 HHtZ3oepjBq45VLaZrj+hF2sTz5wHN/lLPiI7eNqaF7rYYCqUQ/+mzk+bSyv7sw/P2
	 0Gtuci3mXrlYHF3T4dLdAjX8+3RrsfMa0Ybz3rc2hywNaARmKsDWWKsP2DPHejgwhY
	 CSyzQiOBTaMPhT4NH/NFnIcCftSoSwRNaEqIAiartqZhauq2wH7uX/8R0Gi2xJOmu4
	 rQ5tXNgRbeYdA==
From: Christian Brauner <brauner@kernel.org>
Date: Mon, 02 Nov 2026 16:07:11 +0100
Subject: [PATCH RFC 01/27] jbd2: let procfs own the seq_file of the info
 file
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
Message-Id: <20261102-work-procfs-fs-v1-1-d09a996317b3@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2318; i=brauner@kernel.org;
 h=from:subject:message-id; bh=4wXeP/X63evRQ0XlRmaO+RfgvVw7qBYaC3PXgCgMk/I=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS9WG74e18U46btbmdaLFZySH/a4bJqy6EXrWETf+nEX
 czabLYjsqOEhUGMi0FWTJHFod0kXG45T8Vmo0wNmDmsTCBDGLg4BWAiiRcZfvz/JWB5uf7z1qfa
 eR5bDib8Y7/02ydhzb6jJ8MZJrVNc2VkmBYey/3mL2tK5+xlRYFcaYV+5zS/m7WkLC2MPxt0YDU
 PKwA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Declare the seq_operations and the size of the session state and let
procfs open and free the seq_file of /proc/fs/jbd2/<dev>/info.
->proc_open() only takes the snapshot of the statistics now and
->proc_release() frees it. Reading the file then no longer holds up its
removal when the journal goes away.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 fs/jbd2/journal.c | 33 +++++++++------------------------
 1 file changed, 9 insertions(+), 24 deletions(-)

diff --git a/fs/jbd2/journal.c b/fs/jbd2/journal.c
index 3a4f3f613ead..1e4f4e95a00e 100644
--- a/fs/jbd2/journal.c
+++ b/fs/jbd2/journal.c
@@ -1173,51 +1173,36 @@ static const struct seq_operations jbd2_seq_info_ops = {
 	.show   = jbd2_seq_info_show,
 };
 
+/* procfs opened the seq_file and allocated @s */
 static int jbd2_seq_info_open(struct inode *inode, struct file *file)
 {
 	journal_t *journal = pde_data(inode);
-	struct jbd2_stats_proc_session *s;
-	int rc, size;
+	struct jbd2_stats_proc_session *s = ((struct seq_file *)file->private_data)->private;
+	int size = sizeof(struct transaction_stats_s);
 
-	s = kmalloc_obj(*s);
-	if (s == NULL)
-		return -ENOMEM;
-	size = sizeof(struct transaction_stats_s);
 	s->stats = kmalloc(size, GFP_KERNEL);
-	if (s->stats == NULL) {
-		kfree(s);
+	if (s->stats == NULL)
 		return -ENOMEM;
-	}
 	spin_lock(&journal->j_history_lock);
 	memcpy(s->stats, &journal->j_stats, size);
 	s->journal = journal;
 	spin_unlock(&journal->j_history_lock);
-
-	rc = seq_open(file, &jbd2_seq_info_ops);
-	if (rc == 0) {
-		struct seq_file *m = file->private_data;
-		m->private = s;
-	} else {
-		kfree(s->stats);
-		kfree(s);
-	}
-	return rc;
-
+	return 0;
 }
 
 static int jbd2_seq_info_release(struct inode *inode, struct file *file)
 {
 	struct seq_file *seq = file->private_data;
 	struct jbd2_stats_proc_session *s = seq->private;
+
 	kfree(s->stats);
-	kfree(s);
-	return seq_release(inode, file);
+	return 0;
 }
 
 static const struct proc_ops jbd2_info_proc_ops = {
+	.proc_seq_ops	= &jbd2_seq_info_ops,
+	.proc_state_size = sizeof(struct jbd2_stats_proc_session),
 	.proc_open	= jbd2_seq_info_open,
-	.proc_read	= seq_read,
-	.proc_lseek	= seq_lseek,
 	.proc_release	= jbd2_seq_info_release,
 };
 

-- 
2.53.0

