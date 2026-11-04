Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826847;
	b=mrS5kHWUoauce40Z6ZvqB3/mau5JnfixjpDdI4ZJdGtcXb3wszAFfZ00gyCECuWnXc+f
	 jw+qOKCWeBt2uphsnNNQLxnQDRtN3BGQWQoZXGD777pJvXudIyMS7fHDap11JOv9hE/E9
	 HX2CklyfT/nbDrgqT89zAYOvtbjd52uUcLhsxA1JB83VH2Pz5tCRYYou7x7k9Jhs77e/0
	 0/rkfQKX3v7G9dNHTmeeYMs8DUNrTiik/ZC2LnR4FbdjC4TauNkJW5PxXv8N7u7iplYAD
	 jlTH8sv7F7nn8C5WhGX7xc0lxbb84auAlqK3XkMiNrzus5vHavnqbEIECtUqQhDROEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826847;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=pmnFGMOE2v1+F0PJGOHw4Gdli7q7gPuktrXwX9LNfoQ=;
	b=4A2tTMRL/Q4+rJg51goNDpH6pEbB50Oipzx1JOl9pK251pnYVntQ5RcjcyfKVTTARMy5
	 tWSC8Hc4zBKYhnaU424hodmyrVoMDsAq14ufNoB3nmNfqd3N7vRwjlxXdR4jxfwINtFt8
	 C5KCuRNwkoRB+9UgNzxNqiwvsogH35qTSISjtqPav5T6Kag0Edb1jMnM+TD3K6o0HTtfH
	 PGmbc1wT7kSCaUETLBGGcLx/Nwcij3H4Mnp9O5nux4bWPlo4PR2t3AvivYlombE03Szej
	 IB4Dajv7EyzSgnyRS7JNEdUzh8G49YuEU1GwYaSYkHlvytNN9YWdRybNR44xV57wuew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HDqRrYE5;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFE360B1435
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Nov 2026 21:14:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BFE360B1435
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HDqRrYE5
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 12C6D43A2A;
	Wed,  4 Nov 2026 21:14:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED3161F00A16;
	Wed,  4 Nov 2026 21:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793826845;
	bh=pmnFGMOE2v1+F0PJGOHw4Gdli7q7gPuktrXwX9LNfoQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HDqRrYE5SVW+uz41qBUdlkd/AOD1buzc7yItKvdItI4h8/KuGepVfYio6GPLtiP+J
	 fJ+d4qHm1iNZ/NDis/KF73HhMgppcwATjDAXFRShJfdyGVij/MvKpTe6tFtKF741Vv
	 9yp+EZP4p3+D40HqIzZkbNueee34dY/20SfSqgn7hMRMXKqxj+niSBoAZb0ACNJwD5
	 svjcjblOGDnpwrFFpcVVC8ty8x1qq0lEfDdas7ia8TH66801cLAyTfvtLHFeDvwr5b
	 wnb5hluHHKL8qJsYPeHy3t4IGfFFNO/QeKXi/O6wCL4MG4JyRwvT2v3Tf1yj0HE3IE
	 HkKfxGaP/VkNg==
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
Subject: [PATCH RESEND v2 11/13] samples/kfifo: let procfs copy in writes
Date: Wed,  4 Nov 2026 22:13:51 +0100
Message-ID: <20261104-work-procfs-net-v2-11-221e2437fed1@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3950; i=brauner@kernel.org; h=from:subject:message-id; bh=wqPh89nrehb8eXTwTved41pSSj+cx0NGgazKeJSdQJg=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS97jOYLqMh//ThRIEnvPOqE4X+CB0XWpFzR35zdGxZZ Orh2Zc1O0pZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTACZSsJ7hv7tH6Z8s80W8RROO rN/N/UIp0stetDs498C/PTpXF150cGL4Z+evlr2YbcZl0dpm/huN/+I/eGm9CCnf3nXvVeRZRhs PTgA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

Implement ->proc_write_buf() so procfs copies in what is written before
it pins the entry, and put that copy into the fifo with kfifo_in()
instead of kfifo_from_user(). Writes larger than PAGE_SIZE - 1 bytes
fail with -EINVAL now. kfifo_from_user() cut a record to 255 bytes,
what the one byte that holds its length can say, so the record sample
keeps doing that with PROC_ENTRY_SHORT_WRITES.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 samples/kfifo/bytestream-example.c |  9 +++------
 samples/kfifo/inttype-example.c    | 10 ++++------
 samples/kfifo/record-example.c     | 12 ++++++------
 3 files changed, 13 insertions(+), 18 deletions(-)

diff --git a/samples/kfifo/bytestream-example.c b/samples/kfifo/bytestream-example.c
index 4ae29a12cc8a..8c58fb46a2bf 100644
--- a/samples/kfifo/bytestream-example.c
+++ b/samples/kfifo/bytestream-example.c
@@ -110,20 +110,17 @@ static int __init testfunc(void)
 	return 0;
 }
 
-static ssize_t fifo_write(struct file *file, const char __user *buf,
+static ssize_t fifo_write(struct file *file, char *buf,
 						size_t count, loff_t *ppos)
 {
-	int ret;
 	unsigned int copied;
 
 	if (mutex_lock_interruptible(&write_access))
 		return -ERESTARTSYS;
 
-	ret = kfifo_from_user(&test, buf, count, &copied);
+	copied = kfifo_in(&test, buf, count);
 
 	mutex_unlock(&write_access);
-	if (ret)
-		return ret;
 
 	return copied;
 }
@@ -148,7 +145,7 @@ static ssize_t fifo_read(struct file *file, char __user *buf,
 
 static const struct proc_ops fifo_proc_ops = {
 	.proc_read	= fifo_read,
-	.proc_write	= fifo_write,
+	.proc_write_buf	= fifo_write,
 	.proc_lseek	= noop_llseek,
 };
 
diff --git a/samples/kfifo/inttype-example.c b/samples/kfifo/inttype-example.c
index e4f93317c5d0..c5d16b815e73 100644
--- a/samples/kfifo/inttype-example.c
+++ b/samples/kfifo/inttype-example.c
@@ -103,20 +103,18 @@ static int __init testfunc(void)
 	return 0;
 }
 
-static ssize_t fifo_write(struct file *file, const char __user *buf,
+static ssize_t fifo_write(struct file *file, char *buf,
 						size_t count, loff_t *ppos)
 {
-	int ret;
 	unsigned int copied;
 
 	if (mutex_lock_interruptible(&write_access))
 		return -ERESTARTSYS;
 
-	ret = kfifo_from_user(&test, buf, count, &copied);
+	copied = kfifo_in(&test, (const int *)buf, count / sizeof(int)) *
+		 sizeof(int);
 
 	mutex_unlock(&write_access);
-	if (ret)
-		return ret;
 
 	return copied;
 }
@@ -141,7 +139,7 @@ static ssize_t fifo_read(struct file *file, char __user *buf,
 
 static const struct proc_ops fifo_proc_ops = {
 	.proc_read	= fifo_read,
-	.proc_write	= fifo_write,
+	.proc_write_buf	= fifo_write,
 	.proc_lseek	= noop_llseek,
 };
 
diff --git a/samples/kfifo/record-example.c b/samples/kfifo/record-example.c
index e4d1a2d7983c..dcc749247c64 100644
--- a/samples/kfifo/record-example.c
+++ b/samples/kfifo/record-example.c
@@ -117,20 +117,17 @@ static int __init testfunc(void)
 	return 0;
 }
 
-static ssize_t fifo_write(struct file *file, const char __user *buf,
+static ssize_t fifo_write(struct file *file, char *buf,
 						size_t count, loff_t *ppos)
 {
-	int ret;
 	unsigned int copied;
 
 	if (mutex_lock_interruptible(&write_access))
 		return -ERESTARTSYS;
 
-	ret = kfifo_from_user(&test, buf, count, &copied);
+	copied = kfifo_in(&test, buf, count);
 
 	mutex_unlock(&write_access);
-	if (ret)
-		return ret;
 
 	return copied;
 }
@@ -155,8 +152,11 @@ static ssize_t fifo_read(struct file *file, char __user *buf,
 
 static const struct proc_ops fifo_proc_ops = {
 	.proc_read	= fifo_read,
-	.proc_write	= fifo_write,
+	.proc_write_buf	= fifo_write,
 	.proc_lseek	= noop_llseek,
+	/* kfifo_from_user() cut a record to what its length byte holds */
+	.proc_flags	= PROC_ENTRY_SHORT_WRITES,
+	.proc_write_size = U8_MAX,
 };
 
 static int __init example_init(void)

-- 
2.53.0

