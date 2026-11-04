Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793822348;
	b=lr8pwyibIaH7kEQf1eiDhCVMnf8o5tjR6LVjHdOV2aK9s+cF/GIWCuTuDEwTG3cMj+ez
	 YerGUmNzx8eIe6TS8tt1BPKpmJyDlec56uO1k6sjcxRRB9Cf2GBqJW8hbt6oKQe7Rv6Jl
	 rUZgjg/2ImuVbqo4NAPlkp8WlxStTLMyfrIj7lGQ1mk3nlcmjwMfMSiVHoFiCFavvkZvj
	 FPn4H103SsPIhGJzdvvMuU90nlrX/Om2dnoGTegVCvFCoDzwvrDC/YrRGPO+J6axzBc/b
	 syWuNVQNWtw+eW3/oPzCdsNNB1POXZz2BcB0dtuWRdXFNLpmabhw50O6gMH2Gy50Zmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793822348;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=Q3KuHwYfVxA2BKW9aXWNrUpzpjPKgJiiNONww6sd1HY=;
	b=GR6zoQLyAfAtrFR0R2ou/ajjZBfLOk6h5bK6qto06iaZQK0enbB/a1Aj9I7ApBTFrL9O
	 x3yBlnGau4F+MD71FNpoxxQ5Ogo1PSIgwF7SHTJ+4ZNyYIbIqcpKpZ+3SaXGICt41+WpV
	 +0b/yrL9ZXY2DMq+4DhiKn+hG4qI4mKM43U/OhP7t5m3QhXF3tvdiTuFxOKSv54tnXD9G
	 tf8I7UZ6zZWjCQWd0qypV1dfxGP0/OtnSFMrPplzhQLVSsCaTzpXoB/U0eRsi4Ljkg3qS
	 Lbhp7Xpy+G8ywBQNFQdliXCF8zjnXzkJPtqjBX5LlfwHeiZiSqOwGFoho1NJbcOPJlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KuEw75ZJ;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF98C60E9CC6
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Nov 2026 19:59:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF98C60E9CC6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KuEw75ZJ
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0EC6C61DDE;
	Wed,  4 Nov 2026 19:59:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 044D51F00919;
	Wed,  4 Nov 2026 19:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793822346;
	bh=Q3KuHwYfVxA2BKW9aXWNrUpzpjPKgJiiNONww6sd1HY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KuEw75ZJhJWFk4/5j/u2bOa+7AhH2+fwulBHYqhzPzRCBHuO79mUpmvrjD0ahvKTk
	 tMMZB0uhduFqD7adhZiOSmSX6H7pUU+Iz/7fWtjCvnMrG3tjuNjl57qfHN8JLiB+Oq
	 Rm3Oh0NCtCkqXkQz/53JQM+5nP4aVm6NoL6aw41ZGwVH+gIjQScKsibl7t28PMzX8J
	 Relz0swIFmj1/UzelogqSD10+6zvUTgti41r7AxT6l0SRAeqLuXeHIz+lQBCMEudJ8
	 D0gnjIUhzk1S8cbTK7duy1QIkzoOq9EjAM3ep+eRVQ08x7iwdviy9H2Isj/FwB5UIH
	 +hsUDCjAUPclg==
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
Subject: [PATCH RESEND v2 05/13] netfilter: xt_recent: let procfs copy in writes
Date: Wed,  4 Nov 2026 20:58:52 +0100
Message-ID: <20261104-work-procfs-net-v2-5-221e2437fed1@kernel.org>
In-Reply-To: <20261104-work-procfs-net-v2-0-221e2437fed1@kernel.org>
References: <20261104-work-procfs-net-v2-0-221e2437fed1@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1724; i=brauner@kernel.org; h=from:subject:message-id; bh=gfCX4go650si/jmePs4ghyuoQlNEiWKnWuOHaoexE2I=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS97tPgfnpmuaqac2LLJosupqrIeQbiDbdNDT4dmvzo/ DFR21+WHaUsDGJcDLJiiiwO7Sbhcst5KjYbZWrAzGFlAhnCwMUpABPpn8vIMOlw/R+eP/7CM+xs f+8t/fr+Wv4HSZ077vpfLO+H/1bx0WL4n5Sf/jFhe7/3hinn+vZsSZ0htMuiNFR9e88x7jnfa+s e8QAA
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

Implement ->proc_write_buf() so procfs copies in what is written to
/proc/net/xt_recent/<table> before it pins the entry, and take the
address from that copy. The removal of a table runs under recent_mutex
and doesn't wait for a writer that faults on its buffer anymore. Writes
larger than PAGE_SIZE - 1 bytes fail with -EINVAL now.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 net/netfilter/xt_recent.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/net/netfilter/xt_recent.c b/net/netfilter/xt_recent.c
index a43fff5308da..72407eeaa9a6 100644
--- a/net/netfilter/xt_recent.c
+++ b/net/netfilter/xt_recent.c
@@ -553,8 +553,7 @@ static int recent_seq_open(struct inode *inode, struct file *file)
 }
 
 static ssize_t
-recent_mt_proc_write(struct file *file, const char __user *input,
-		     size_t size, loff_t *loff)
+recent_mt_proc_write(struct file *file, char *input, size_t size, loff_t *loff)
 {
 	struct recent_table *t = pde_data(file_inode(file));
 	struct recent_entry *e;
@@ -568,8 +567,7 @@ recent_mt_proc_write(struct file *file, const char __user *input,
 		return 0;
 	if (size > sizeof(buf))
 		size = sizeof(buf);
-	if (copy_from_user(buf, input, size) != 0)
-		return -EFAULT;
+	memcpy(buf, input, size);
 
 	/* Strict protocol! */
 	if (*loff != 0)
@@ -625,7 +623,7 @@ static const struct proc_ops recent_mt_proc_ops = {
 	.proc_seq_ops	= &recent_seq_ops,
 	.proc_state_size = sizeof(struct recent_iter_state),
 	.proc_open	= recent_seq_open,
-	.proc_write	= recent_mt_proc_write,
+	.proc_write_buf	= recent_mt_proc_write,
 };
 
 static int __net_init recent_proc_net_init(struct net *net)

-- 
2.53.0

