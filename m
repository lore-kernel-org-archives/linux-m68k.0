Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793821629;
	b=FPnB0EAUp33D3TE+zwIa4MMdGtxmFTI6O0cs1g4VLedWbM7t3tuiZmrhAwIi0tXt1hIT
	 sPEMHqoCqCZt0y5IqwZ9hK7Yg7pAfW8vDEXiKyONWirdjgiLbUnDmYzX47rBV83wErdor
	 Ph5mLON0RZ3VAppSzWFD8cib54r0lcCo7g0vx+PfqG3JvnnYaMOqSK74WRUHdozbJeB8w
	 HV6uNFTnBF+wIGNR+VKUCqjzfnT0/IFp/BfwB7fKp5uphKrOjpj+D+MpYoGge2EebSyKB
	 anRBmXdWP/o5rkRA50KGcHmE2XTl8TVydCQveYgJDXMrxmFpW/X8Erj60rnBWXanWWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793821629;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=zft31zEOyoxpoaQra2tyBUnsx6CBcNbPccBHjIcKUVg=;
	b=SCUqfio2J1WeAq1da50ckekudU/G7qxG8HCqobvPWZK71Oh16mghG0nwNDDbr5QCnbE+
	 zUD8dtJl9en0Ct6KO0DS7C9Er2O4SPlHoSN4kVPSQe4S7ZUTNqnsp8owXLrynXD5EorSy
	 S+aPowO48jq0ux/zUpQ23bcDyC63ThMZq1TvpubH5bR8cmhg9Qv95MEbqtxlWEi8YQo1E
	 kVGqWnfg4Sio+Iv/Vo1V22I/r55kSISzVKmCdnH0Uj2c56S1PbalMOuzU4WeuVPxHfy/w
	 c98gghEZ8htv49kxFO+DVvs1G5k4rvIQtF31Hce/5AzUlKzJC8vjfRMtfvDkpN6QxKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RajwCGCh;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9ED606AB34
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Nov 2026 19:47:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB9ED606AB34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RajwCGCh
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5CF4D60F12;
	Wed,  4 Nov 2026 19:47:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18A421F00919;
	Wed,  4 Nov 2026 19:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793821628;
	bh=zft31zEOyoxpoaQra2tyBUnsx6CBcNbPccBHjIcKUVg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RajwCGChuwyoqoZXwpUtB63CnfJNCXfYV3MXWhfQVc5Ev6XMozMwlvc6X98vleQyv
	 f9HzBE4v113NX/e1l78y5ttqcWo69gQcs6Ww+sQGKZ3cLiPEcmIedv9Dr8Fupfzesw
	 W2qdod9xWoMSOmx1XAyg2z9rNs/8Jv2qrPox1n/Zc4FZI6mKO77lTmc1CJ+0psYuJ3
	 GAD2h5/aLL7ToIPisurMJ320J6bxgj0LUdPq4xrjzKapKKfnTHEzSVwuWV6kBmMycE
	 p8oPLiWRZfJASR8Mhh1/kUIyHucEcqRy1EkK1gmQTe3G+tur6Iu40MBhi/iT5cSWMY
	 VmRs6TTIcG5Ww==
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
Subject: [PATCH RESEND v2 19/26] wifi: ipw2x00: let procfs copy in writes to the debug level
Date: Wed,  4 Nov 2026 20:46:53 +0100
Message-ID: <20261104-work-procfs-drivers-v2-19-245e54e87116@kernel.org>
In-Reply-To: <20261104-work-procfs-drivers-v2-0-245e54e87116@kernel.org>
References: <20261104-work-procfs-drivers-v2-0-245e54e87116@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1605; i=brauner@kernel.org; h=from:subject:message-id; bh=SZl2laNUZYNGFN2sYGUP5fs3tBGCqMuq/D28k7CZWwo=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS97up6Oev4hMLPxsZ2136FuR12SNXk+zJzkV2eLvcbC +ML1Vevd5SyMIhxMciKKbI4tJuEyy3nqdhslKkBM4eVCWQIAxenAEzkxyZGhh+zNh/MzVMol5A7 Oltna15SsRRnwKr/s7+v+ix/vNn+yDaG/x5P3yxp3xP3fKd4vL9mjb/e893xlTemrnQuFzt//Ms bC34A
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

Implement ->proc_write_buf() so procfs copies in what is written before
it pins the entry, and parse the level from that copy. Writes larger
than PAGE_SIZE - 1 bytes fail with -EINVAL now, and a buffer that can't
be read fails with -EFAULT instead of looking like it was written.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 drivers/net/wireless/intel/ipw2x00/libipw_module.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/intel/ipw2x00/libipw_module.c b/drivers/net/wireless/intel/ipw2x00/libipw_module.c
index 15d9a5efb581..08cc0d7f57c1 100644
--- a/drivers/net/wireless/intel/ipw2x00/libipw_module.c
+++ b/drivers/net/wireless/intel/ipw2x00/libipw_module.c
@@ -216,14 +216,13 @@ static int debug_level_proc_show(struct seq_file *m, void *v)
 }
 
 static ssize_t debug_level_proc_write(struct file *file,
-		const char __user *buffer, size_t count, loff_t *pos)
+		char *buffer, size_t count, loff_t *pos)
 {
 	char buf[] = "0x00000000\n";
 	size_t len = min(sizeof(buf) - 1, count);
 	unsigned long val;
 
-	if (copy_from_user(buf, buffer, len))
-		return count;
+	memcpy(buf, buffer, len);
 	buf[len] = 0;
 	if (sscanf(buf, "%li", &val) != 1)
 		printk(KERN_INFO DRV_NAME
@@ -236,7 +235,7 @@ static ssize_t debug_level_proc_write(struct file *file,
 
 static const struct proc_ops debug_level_proc_ops = {
 	.proc_show	= debug_level_proc_show,
-	.proc_write	= debug_level_proc_write,
+	.proc_write_buf	= debug_level_proc_write,
 };
 #endif				/* CONFIG_LIBIPW_DEBUG */
 

-- 
2.53.0

