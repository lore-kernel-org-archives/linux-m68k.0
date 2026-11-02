Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793632894;
	b=nD1D/Ul7HSEK6TEfVwMl7AfJ5ROJ5FK3OT+XbrZZktFL673iCI7O7IDp1g6JPXt/thop
	 iEQbo+eVK1xA/nR2nHVieDVy1lVBqFsYiVv3LQKXaf1MLdPtTllyj3+ejK20O9QKFWRzy
	 8onRbvmkD6nITUE31X6mMTUHu/y4+0uLu1GuPoNSrYD9aOM6jY5yEfwbgil8FAATOTtwV
	 71yCsmIitERSmXrDmqUsGQ3MHv/BtmGhMlk+63LlydyA4uznp2o0tQu95HMAIw4r1RjNO
	 tTlAl2qHruNCA5rKD1jEQLlDDkS2TrobK047AqYFGhlUqr6vb9sagDsAJnSUhZ5Z9qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632894;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=u/RXCBD8nlX7BDzbpngWHwWfgPDQj7BVrPXrBF7wCv8=;
	b=nsgCaMXdizAgphbPzOQWhaBa3rb4nusjCJ1iv9a3MbbYe/M66gsFR3PpYKw6aoAkzhKE
	 J5FU3n1wMl94g9JvHF0t/wz73FKVQq8BdRUpU28QO7JHE3+qzYKJHTJM82hKj33oIrjgt
	 2m4+z/+GPJQmVLjS/6bOhfie1z0TeSE3R4IqQIv7gVfa3gl49N3q821XfPkJ6WYknq5/N
	 2/UcPGocHXZ6qmtnzlHXLoda6ftz87atUChtFUZ9/iYcR15PWUvEmWg2pjrqR7NnW4gFO
	 5hMOd9ISfc8V27/zbA7VUaK01xmYc9fcWrBSE4QHP9yCGXXMxY0nTkv1KRUsMXv5a/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lzeuR62X;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB1460804A9
	for <linux-m68k@lists.linux-m68k.org>; Mon,  2 Nov 2026 15:21:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDB1460804A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lzeuR62X
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0575160620;
	Mon,  2 Nov 2026 15:21:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9FC41F00A16;
	Mon,  2 Nov 2026 15:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793632892;
	bh=u/RXCBD8nlX7BDzbpngWHwWfgPDQj7BVrPXrBF7wCv8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=lzeuR62XFqOGUep6G0u/OgAm/OWRPnnvn8erL4ZU4coYsOJSODUSp+a+2jQzM89Na
	 wls04y7KzCTFwf5dsKwoGQq4HsQJB+8Q/tyIUmNqi21phOIu62KpYImTlB0ls6aGae
	 miRfVbxr3JZPL8lWk8CynKdRTAwmaRBTeg+t7O77J1JsURjyW/dH2I6mYOgaUrqxwj
	 7KTrFfx3AkzJndWmhJ/H+my8YK+kelSQ4n+wOAuAD5nl7vHyDdtVgll57DDfY53FmE
	 lZ2Bqq8ccnEcF5eVt6EqwlmszCQGg+ZSpjDAYPYr+Ujd6ANt6wT/4OLvqxEhsJ83lT
	 c5mbm06d3Q7qw==
From: Christian Brauner <brauner@kernel.org>
Date: Mon, 02 Nov 2026 16:07:16 +0100
Subject: [PATCH RFC 06/27] nfsd: let procfs own the seq_file of
 /proc/fs/nfs/exports
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
Message-Id: <20261102-work-procfs-fs-v1-6-d09a996317b3@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1348; i=brauner@kernel.org;
 h=from:subject:message-id; bh=Og6i2j2RItYkKcPNuUOPBq0fveLG9Ax2TG7f5E6VSxk=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS9WG7kVLY5MLm6OZ2xjUVJp9EoIqQs8Har0dvS4Du/G
 zkXh5h3lLIwiHExyIopsji0m4TLLeep2GyUqQEzh5UJZAgDF6cATCTOhZFh8mS2HN0Vqp439x5e
 2xeUd91V5e/Pzuqia7+Lj7wzdlPPYWTYZ8Q7MynkzsRjgb7VR/ifa84RfBwlO7dAjOFb++Stxc7
 8AA==
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Declare the seq_operations and let procfs open and free the seq_file.
->proc_open() and ->proc_release() only set up ->private and take and
drop the reference to the network namespace now. Reading the file then
no longer holds up its removal.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 fs/nfsd/nfsctl.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/fs/nfsd/nfsctl.c b/fs/nfsd/nfsctl.c
index f8ce3c0fb077..5b2782f9dbbd 100644
--- a/fs/nfsd/nfsctl.c
+++ b/fs/nfsd/nfsctl.c
@@ -1407,16 +1407,23 @@ MODULE_ALIAS_FS("nfsd");
 
 #ifdef CONFIG_PROC_FS
 
+/* procfs opens the seq_file */
 static int exports_proc_open(struct inode *inode, struct file *file)
 {
-	return exports_net_open(current->nsproxy->net_ns, file);
+	exports_net_init(current->nsproxy->net_ns, file->private_data);
+	return 0;
+}
+
+static int exports_proc_release(struct inode *inode, struct file *file)
+{
+	exports_net_put(file->private_data);
+	return 0;
 }
 
 static const struct proc_ops exports_proc_ops = {
+	.proc_seq_ops	= &nfs_exports_op,
 	.proc_open	= exports_proc_open,
-	.proc_read	= seq_read,
-	.proc_lseek	= seq_lseek,
-	.proc_release	= exports_release,
+	.proc_release	= exports_proc_release,
 };
 
 static int create_proc_exports_entry(void)

-- 
2.53.0

