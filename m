Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793821130;
	b=Ox+Vvtlf9lUESqlia5cHUnMsEFgD0EM4qDocbnHt8AsXY5oxEFsdS2vC8GthBoQKJXDW
	 +FglsG7aNE5QWoT0KUn78ju4hPb1UiJuz0S8c8mp2IRdDz39gCzmIeAEwzQZw7Ow4ngiB
	 h1536u0ztZOdAeh7wegQX3/1VF1Tg7QWN37yCsOWPW4UYYQTP1es2vUHFAWPOjPOAtw5C
	 GVgNyGCvutQm4r+ICgDMJNpvX2xGqBV55awwtbYtNaO3Xia0TI/hqMHlD7Pnfw8IJhEud
	 zFlE5AsNGnfXmhONLuiV7Bulr8rUpd7kj0/iOP9qGTsS3W71TqirkKROdcAIM7a+rDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793821130;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=/usm8OdHJAbA2hfj2koEwGvMkvG3A+8dTBDDaCx7vxs=;
	b=qB+F1lX+90AVd5U0ZWgVApR9FtDvkBqttv71O3Pft6IKDeFJRAqe2HWTMgepVbBHKtO3
	 XFBg9PPaHvKOh+J/N02soVzI9/rEoUSJfjxBgFHPVHVaYcx4g49seDOTJ28HvfZnKhAB1
	 34thUQaaxDZ8WskDUz0hwuvzi8DZPWnDynQqXHYmgW6Pwyk4BXcec9NLrz5m7vlI+PyWo
	 +anRuVG+FStx8hjyCRP7osp4NPvSlcC8dKlsurElFJ7sWdxNr7QHU98LW9gjvIxmT7DM6
	 nS+1mcCtxx8LZbF9q9yoFG5Wg9eMbqOgyHmymAcchOvG/upE7nBqnEKA/N1GlbpQ+hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VG9aD16B;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BEF608079F
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Nov 2026 19:38:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2BEF608079F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VG9aD16B
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4F6F643751;
	Wed,  4 Nov 2026 19:38:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 054E61F00919;
	Wed,  4 Nov 2026 19:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793821129;
	bh=/usm8OdHJAbA2hfj2koEwGvMkvG3A+8dTBDDaCx7vxs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VG9aD16BipFA7tZuupqgRtwFap9WcbchfWvSLq945hir63gYqXdpi80vOAxoJ6uPM
	 cGHQCLmBx2ftZtapYkLEZ01PDmHVVJJ6TxDs2YfkhL4Tz3whK38cqBsbSJLqCyBYf+
	 gBDBJ8A+zDWtTGWfh0XzkkbqrUQFGel+TcOUKlppnZVQjC+jU8B4Zk2c26ZwwjfYtv
	 t2JAQgGes6iwh+TO5a+TpZU2REcYYU954SbfBpwomyUlI9AGoe10aNZpzCVlgu4/Ap
	 mcCAmdx4loPFchYrvpr2CApq9ZKm/4TYtC5Q45UDzuVte6ccEDB3+w2Nw0bEL49v9f
	 TtPtWfNEAs+XA==
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
Subject: [PATCH RESEND v2 12/23] um: let procfs copy in writes
Date: Wed,  4 Nov 2026 20:38:34 +0100
Message-ID: <20261104-work-procfs-arch-v2-12-2aeb952c9597@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2448; i=brauner@kernel.org; h=from:subject:message-id; bh=hbsAC6NXcgHJtASZof1yKKfWcOI33KFILjWjYjO2r50=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS97vjdKe7M5N/Jdq7B56hA/YL9IjOVLyw8Oc9bq+xt/ 5wFLV4KHaUsDGJcDLJiiiwO7Sbhcst5KjYbZWrAzGFlAhnCwMUpABM5XcnI8LBv1xbhm9Vn913c +zjG1zQpPqn9s9bnOVH7lmW1ZC7a5sXIsNf3qtTiWZ5719z8tKH1Bvu/k4F1O179z0idHcB3w2/ WTS4A
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

Implement ->proc_write_buf() for the mconsole and exitcode files so
procfs copies in what is written before it pins the entry. Writes larger
than PAGE_SIZE - 1 bytes fail with -EINVAL now.

exitcode parses procfs' copy as is, so it no longer stops at the first
six bytes of what is written.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 arch/um/drivers/mconsole_kern.c | 11 ++---------
 arch/um/kernel/exitcode.c       | 14 ++++----------
 2 files changed, 6 insertions(+), 19 deletions(-)

diff --git a/arch/um/drivers/mconsole_kern.c b/arch/um/drivers/mconsole_kern.c
index f01b7d8a07bc..a4370470286f 100644
--- a/arch/um/drivers/mconsole_kern.c
+++ b/arch/um/drivers/mconsole_kern.c
@@ -769,21 +769,14 @@ static int __init mconsole_init(void)
 __initcall(mconsole_init);
 
 static ssize_t mconsole_proc_write(struct file *file,
-		const char __user *buffer, size_t count, loff_t *pos)
+		char *buf, size_t count, loff_t *pos)
 {
-	char *buf;
-
-	buf = memdup_user_nul(buffer, count);
-	if (IS_ERR(buf))
-		return PTR_ERR(buf);
-
 	mconsole_notify(notify_socket, MCONSOLE_USER_NOTIFY, buf, count);
-	kfree(buf);
 	return count;
 }
 
 static const struct proc_ops mconsole_proc_ops = {
-	.proc_write	= mconsole_proc_write,
+	.proc_write_buf	= mconsole_proc_write,
 	.proc_lseek	= noop_llseek,
 };
 
diff --git a/arch/um/kernel/exitcode.c b/arch/um/kernel/exitcode.c
index c71657df38f5..8f76e3b20c18 100644
--- a/arch/um/kernel/exitcode.c
+++ b/arch/um/kernel/exitcode.c
@@ -32,18 +32,12 @@ static int exitcode_proc_show(struct seq_file *m, void *v)
 }
 
 static ssize_t exitcode_proc_write(struct file *file,
-		const char __user *buffer, size_t count, loff_t *pos)
+		char *buffer, size_t count, loff_t *pos)
 {
-	char *end, buf[sizeof("nnnnn\0")];
-	size_t size;
+	char *end;
 	int tmp;
 
-	size = min(count, sizeof(buf) - 1);
-	if (copy_from_user(buf, buffer, size))
-		return -EFAULT;
-	buf[size] = '\0';
-
-	tmp = simple_strtol(buf, &end, 0);
+	tmp = simple_strtol(buffer, &end, 0);
 	if ((*end != '\0') && !isspace(*end))
 		return -EINVAL;
 
@@ -53,7 +47,7 @@ static ssize_t exitcode_proc_write(struct file *file,
 
 static const struct proc_ops exitcode_proc_ops = {
 	.proc_show	= exitcode_proc_show,
-	.proc_write	= exitcode_proc_write,
+	.proc_write_buf	= exitcode_proc_write,
 };
 
 static int make_proc_exitcode(void)

-- 
2.53.0

