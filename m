Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793822303;
	b=jWG3+eJflo9FAH6zVA8jZ84urckd5tTb5cMGm9VoM0+ohJkyIrXyRTqKlf6R0EtriQx9
	 6dS8swOEwGP7Kq/nloxmskqNIlK19ubQEB1ZedFE06q1pwTYsNM43yLGsNIsdo0nVki85
	 CUxXqqGaMyBSA4imO5SsSlKSvIyuizlr/Nkynee3L3OeUWDFrhTwxPIjOalgh3KGkWJyR
	 t7ypAlZJSy9UnMk+vDW/kqsmTK4uGQSViAjam7eVFeoaACRo5mBaMFFyQdMq3RtCIN0MM
	 3BooVwtcbskjDUdodYL0lSgL3BKANNMSmbR0n/5kAq9Ddn3zZYMDhlks70geHQXP6vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793822303;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=vwjxO3TYvy6WGJQYdN5saH6B1iVdIocyydf/9B8LfXQ=;
	b=KLzLv1DxZOQaY10yJum8EUV73ayw7JHqZcSic8uD7Hc8I/8yzFxE3AWy+7ldVLSz3WL3
	 HRwhzRVqyjkNXoSr+IsPjdLut40HVamq7odj2QLu1E0Wrwj/NxucY/wUtVl4Yb5bKTvvi
	 rvehLLq6SXvemzcpsTgZgaU+zsHSImzLxYrLEGQ0BqYjptcogeC/a3JecUBCwVRzhMldx
	 qIjg1ONxKMr2Zqd/hMB+nUn+fWuRAE4sFv19Js4YLwtQemY+iNBvbh60RsJ3HV5k7Pmpz
	 cfYOlfVFCsphpFfzguVVI8+xfsWZNKNh48yH4GZmov/cD4SL39Cc2+s21auTprWkWzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gs5GVn7P;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D62606D4D2
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Nov 2026 19:58:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64D62606D4D2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gs5GVn7P
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2CCC341E4F;
	Wed,  4 Nov 2026 19:58:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 443461F0093A;
	Wed,  4 Nov 2026 19:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793822303;
	bh=vwjxO3TYvy6WGJQYdN5saH6B1iVdIocyydf/9B8LfXQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Gs5GVn7PVZyaHxQYP1oX1TlJKCs3atmjJ7YDkZGohYKM8gAGNVV9VT9s37IvLT63p
	 L4L5EC1cjQvvtlvaNLN0gxqkT0/JHX+G8Jskr1+i5iT/1BEoXTgOvTBU2JoiVX9QJn
	 SVcwPycBujDMI11yUPUBwIZob9xvtdHom3bNPfdTI6rcdnhnR9XEYbVnGufjUjHyY5
	 XS9Zten/fLmAjd1NEGRd3O5Jj7NFk3hoVCpRY/0FlbIUHIKxjpKo/CyBBcBbqFFOah
	 Yl3b+onZRchWRKJM5w0VJoHNNmoc2XKJUSt61/Af1LESg+Z9BzGmnqiHsRNVJ2UfrB
	 Y73jnPC+BIspQ==
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
Subject: [PATCH RESEND v2 02/13] l2tp: let procfs own the seq_file of /proc/net/pppol2tp
Date: Wed,  4 Nov 2026 20:58:09 +0100
Message-ID: <20261104-work-procfs-net-v2-2-221e2437fed1@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1918; i=brauner@kernel.org; h=from:subject:message-id; bh=/g5R4n0Ms+FYrKqMM/T6cxyrF8YI/t11/rZZuOTaMss=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS97lPdVvdYzebqhhVnXpw8xDvHsuzZ4RnqoW8ipiutf T4/NK+VsaOUhUGMi0FWTJHFod0kXG45T8Vmo0wNmDmsTCBDGLg4BWAiFR8Z/rtd/L6gwWtGUN41 FW63f2knOZOaTxXGXHuqJqJe7TlP+xMjw4k/LBOnuz10aXA54HTj1Qv+RZ4dDHz6dapLw8s5Ofu 5GAA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

Declare the seq_operations and the size of the iterator state and let
procfs open and free the seq_file. ->proc_open() only takes the
reference to the network namespace now and ->proc_release() drops that
and the references the iterator holds. Reading the file then no longer
holds up its removal.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 net/l2tp/l2tp_ppp.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/net/l2tp/l2tp_ppp.c b/net/l2tp/l2tp_ppp.c
index 4f311d473a64..499e37eb788a 100644
--- a/net/l2tp/l2tp_ppp.c
+++ b/net/l2tp/l2tp_ppp.c
@@ -1596,21 +1596,17 @@ static const struct seq_operations pppol2tp_seq_ops = {
 	.show		= pppol2tp_seq_show,
 };
 
+/* procfs opened the seq_file and allocated @pd */
 static int pppol2tp_proc_open(struct inode *inode, struct file *file)
 {
-	struct net *net = pde_data(inode);
-	struct pppol2tp_seq_data *pd;
+	struct seq_file *seq = file->private_data;
+	struct pppol2tp_seq_data *pd __maybe_unused = seq->private;
+	struct net *net;
 
-	net = maybe_get_net(net);
+	net = maybe_get_net(pde_data(inode));
 	if (!net)
 		return -ENXIO;
 
-	pd = __seq_open_private(file, &pppol2tp_seq_ops, sizeof(*pd));
-	if (!pd) {
-		put_net(net);
-		return -ENOMEM;
-	}
-
 #ifdef CONFIG_NET_NS
 	pd->p.net = net;
 	netns_tracker_alloc(net, &pd->p.ns_tracker, GFP_KERNEL);
@@ -1633,13 +1629,13 @@ static int pppol2tp_proc_release(struct inode *inode, struct file *file)
 #else
 	put_net(&init_net);
 #endif
-	return seq_release_private(inode, file);
+	return 0;
 }
 
 static const struct proc_ops pppol2tp_proc_ops = {
+	.proc_seq_ops	= &pppol2tp_seq_ops,
+	.proc_state_size = sizeof(struct pppol2tp_seq_data),
 	.proc_open	= pppol2tp_proc_open,
-	.proc_read	= seq_read,
-	.proc_lseek	= seq_lseek,
 	.proc_release	= pppol2tp_proc_release,
 };
 

-- 
2.53.0

