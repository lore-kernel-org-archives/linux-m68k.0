Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793821070;
	b=qUKXxxJj2/T2yuc7wki87P3jGYkPc8ucieoM0uYPOoz7GMeBs0RdFOEL1saAX5BJkUXk
	 dhHvUidPvDIZaiDXYDEwsICWeqNG0b3vwxAk90ezApjz78iV0tyKjQd12bh5lbBLXMfkj
	 yJX7pFL7+UGlVbjmkunKx0cJvBPM5jEfMwGVqpKfpzDBkdhReGjjcxmiVa0AJUdyVjPmp
	 5z6MrEe56vYqBa/Tvaw9JDDWtIvORA2NvrC4rAn59CBgsxkkU1BrZzM5y5mjue0dqgIGH
	 ybEVLiVOcNum/64WciyNf6BXaToqITN2wijvP/yp7IicGKTEf5N2BqBsb2D340e+TxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793821070;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=JUeWoKePwtQbwIaIqH9pLOo2XgGktDed7c18k0485G4=;
	b=4aluycPMfwLLBU2hnHbcRtm905vvHyVwwT10josKB3jkozQ8GJaYZEHNsVmHnbqRJz0v
	 kzEExRHi32IYt3uoy50n84lWTrgn20LYv3fdIcBRRUoXUYI5mqdiGqFE+r1bE/kdUkPJD
	 /1oQbg7J6SMj/J6KWiHtFuHJ2GFJfI8Kss0r6PpSUvZ+p+say7v0jfRv6tKAbvRcb9i3D
	 xKosTOOymtucZdvXziEH4BEDlmfauRE+s0FUlm6fH852/k0ZZ/2AXd2TSUVyiQMRa9JWx
	 4ihLrsrfz/TUvLMaZbayReSOGaTcawKfOo9Ny7bATSNXTDv/SImCP4BUz27zUo6TMIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IGC4y00A;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498196070F19
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Nov 2026 19:37:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 498196070F19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IGC4y00A
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0C9C741875;
	Wed,  4 Nov 2026 19:37:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 099291F00A02;
	Wed,  4 Nov 2026 19:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793821069;
	bh=JUeWoKePwtQbwIaIqH9pLOo2XgGktDed7c18k0485G4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IGC4y00AETc18leOOoiGNlJjI14uptUXwL1lAk39h5bFLDzozGmXP95FjcQk1ai3d
	 qHvAP6G/y59z8vruoDW5Y1VeWIGTKlWb3dS3NUkuiWuDTaM3k3qDR2DhBmAlAVa/1+
	 jkEC8ZsTOxq9kedteP9jaXc0YU1IKsX6hdj0bx6p0gNUMMcxE+pQQ/pK252kFB4GIS
	 hTq5UB6PWymKT/rN8RRkkmh+m3ZSylCXxhaihAqxEz2EOYZbBvhmLGNZuz6vL29QGa
	 VhgHDRMX/6Xwut4w4xO7r/ecc/JCMProqA/4Q644WrS17ADmUJzAwlPQ6KlQcm2EPd
	 PESuNHlL70alw==
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
Subject: [PATCH RESEND v2 08/23] powerpc/pseries: let procfs copy in writes
Date: Wed,  4 Nov 2026 20:37:35 +0100
Message-ID: <20261104-work-procfs-arch-v2-8-2aeb952c9597@kernel.org>
In-Reply-To: <20261104-work-procfs-arch-v2-0-2aeb952c9597@kernel.org>
References: <20261104-work-procfs-arch-v2-0-2aeb952c9597@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5534; i=brauner@kernel.org; h=from:subject:message-id; bh=R72k2XaBDNkNWoVo7wOLN896i1gM+zYb0aj1A9vFVUU=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS97vgWxbNt8wYWhvlH5RZK+OjxWGdnm7duUb1soNTor 3Rw5+3ijlIWBjEuBlkxRRaHdpNwueU8FZuNMjVg5rAygQxh4OIUgInkrmVk+MQl1Nv2KdDqueyX 08pFh+YVduR7t06b45nf4Rck/P9LDsN/n+PLK+08DBJ4p96cFfH166t5EqlFHC8yROYun/7XY7Y 9JwA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

Implement ->proc_write_buf() for lparcfg, ofdt and the vcpudispatch
files so procfs copies in what is written before it pins the entry, and
parse what was written from that copy. ofdt takes as much as
memdup_user_nul() could copy before since device tree updates can be
large.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 arch/powerpc/platforms/pseries/lpar.c     | 14 ++++++--------
 arch/powerpc/platforms/pseries/lparcfg.c  |  7 +++----
 arch/powerpc/platforms/pseries/reconfig.c | 22 ++++++++--------------
 3 files changed, 17 insertions(+), 26 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index 48fe0be71a89..dfd027cc9047 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -498,7 +498,7 @@ static void dtl_worker_disable(unsigned long *time_limit)
 	up_write(&dtl_access_lock);
 }
 
-static ssize_t vcpudispatch_stats_write(struct file *file, const char __user *p,
+static ssize_t vcpudispatch_stats_write(struct file *file, char *p,
 		size_t count, loff_t *ppos)
 {
 	unsigned long time_limit = jiffies + HZ;
@@ -509,8 +509,7 @@ static ssize_t vcpudispatch_stats_write(struct file *file, const char __user *p,
 	if (count > 15)
 		return -EINVAL;
 
-	if (copy_from_user(buf, p, count))
-		return -EFAULT;
+	memcpy(buf, p, count);
 
 	buf[count] = 0;
 	rc = kstrtoint(buf, 0, &cmd);
@@ -586,11 +585,11 @@ static int vcpudispatch_stats_display(struct seq_file *p, void *v)
 
 static const struct proc_ops vcpudispatch_stats_proc_ops = {
 	.proc_show	= vcpudispatch_stats_display,
-	.proc_write	= vcpudispatch_stats_write,
+	.proc_write_buf	= vcpudispatch_stats_write,
 };
 
 static ssize_t vcpudispatch_stats_freq_write(struct file *file,
-		const char __user *p, size_t count, loff_t *ppos)
+		char *p, size_t count, loff_t *ppos)
 {
 	int rc, freq;
 	char buf[16];
@@ -598,8 +597,7 @@ static ssize_t vcpudispatch_stats_freq_write(struct file *file,
 	if (count > 15)
 		return -EINVAL;
 
-	if (copy_from_user(buf, p, count))
-		return -EFAULT;
+	memcpy(buf, p, count);
 
 	buf[count] = 0;
 	rc = kstrtoint(buf, 0, &freq);
@@ -622,7 +620,7 @@ static int vcpudispatch_stats_freq_display(struct seq_file *p, void *v)
 
 static const struct proc_ops vcpudispatch_stats_freq_proc_ops = {
 	.proc_show	= vcpudispatch_stats_freq_display,
-	.proc_write	= vcpudispatch_stats_freq_write,
+	.proc_write_buf	= vcpudispatch_stats_freq_write,
 };
 
 static int __init vcpudispatch_stats_procfs_init(void)
diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
index cb3d96efb225..bda3cac1552b 100644
--- a/arch/powerpc/platforms/pseries/lparcfg.c
+++ b/arch/powerpc/platforms/pseries/lparcfg.c
@@ -687,7 +687,7 @@ static ssize_t update_mpp(u64 *entitlement, u8 *weight)
  * This function should be invoked only on systems with
  * FW_FEATURE_SPLPAR.
  */
-static ssize_t lparcfg_write(struct file *file, const char __user * buf,
+static ssize_t lparcfg_write(struct file *file, char *buf,
 			     size_t count, loff_t * off)
 {
 	char kbuf[64];
@@ -702,8 +702,7 @@ static ssize_t lparcfg_write(struct file *file, const char __user * buf,
 	if (count == 0 || count >= sizeof(kbuf))
 		return -EINVAL;
 
-	if (copy_from_user(kbuf, buf, count))
-		return -EFAULT;
+	memcpy(kbuf, buf, count);
 	kbuf[count] = '\0';
 	tmp = strchr(kbuf, '=');
 	if (!tmp)
@@ -798,7 +797,7 @@ static int lparcfg_data(struct seq_file *m, void *v)
 }
 
 static const struct proc_ops lparcfg_proc_ops = {
-	.proc_write	= lparcfg_write,
+	.proc_write_buf	= lparcfg_write,
 	.proc_show	= lparcfg_data,
 };
 
diff --git a/arch/powerpc/platforms/pseries/reconfig.c b/arch/powerpc/platforms/pseries/reconfig.c
index b543afbc1efb..d74a0710ec74 100644
--- a/arch/powerpc/platforms/pseries/reconfig.c
+++ b/arch/powerpc/platforms/pseries/reconfig.c
@@ -349,7 +349,7 @@ static int do_update_property(char *buf, size_t bufsize)
  * ofdt_write - perform operations on the Open Firmware device tree
  *
  * @file: not used
- * @buf: command and arguments
+ * @kbuf: command and arguments
  * @count: size of the command buffer
  * @off: not used
  *
@@ -357,26 +357,19 @@ static int do_update_property(char *buf, size_t bufsize)
  * whole nodes along with their properties.  Operations on individual
  * properties are not implemented (yet).
  */
-static ssize_t ofdt_write(struct file *file, const char __user *buf, size_t count,
+static ssize_t ofdt_write(struct file *file, char *kbuf, size_t count,
 			  loff_t *off)
 {
 	int rv;
-	char *kbuf;
 	char *tmp;
 
 	rv = security_locked_down(LOCKDOWN_DEVICE_TREE);
 	if (rv)
 		return rv;
 
-	kbuf = memdup_user_nul(buf, count);
-	if (IS_ERR(kbuf))
-		return PTR_ERR(kbuf);
-
 	tmp = strchr(kbuf, ' ');
-	if (!tmp) {
-		rv = -EINVAL;
-		goto out;
-	}
+	if (!tmp)
+		return -EINVAL;
 	*tmp = '\0';
 	tmp++;
 
@@ -392,13 +385,14 @@ static ssize_t ofdt_write(struct file *file, const char __user *buf, size_t coun
 		rv = do_update_property(tmp, count - (tmp - kbuf));
 	else
 		rv = -EINVAL;
-out:
-	kfree(kbuf);
+
 	return rv ? rv : count;
 }
 
 static const struct proc_ops ofdt_proc_ops = {
-	.proc_write	= ofdt_write,
+	.proc_write_buf	= ofdt_write,
+	/* what memdup_user_nul() could copy in */
+	.proc_write_size = KMALLOC_MAX_SIZE - 1,
 	.proc_lseek	= noop_llseek,
 };
 

-- 
2.53.0

