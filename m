Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793819936;
	b=CbXB9FajXwQp7kaoqDYs9QrJSW2mJbKQ0tut00W8l7eLENQ3ovja5TpTZlIWlKfouWIw
	 Ss5cq2sLzrmolnQZmpkqcq4s10bh9I8v1NYtQWfv7njxbITIu6BWhme3VEaFN7fdH04VV
	 n14yfKEYGQlxRdn6yLzSIqZ0J/9mHG7lJcQ7FFxVLUuMNkOffOD00/FxhMpysHAtejxbk
	 VJlEPkluiI5h1f1sdTsgjCkAzdnoBa/zPyMLOwNnz/Hue2QKpBB9GdVpe+hzoZXPnMkUC
	 a8n0MW5i2sTjH5/GkqL4uJY0hVLwHYgJYFXsFEJs3VMMm5WX1RaxMiQ2YPSu8jl6Sjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793819936;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=88D9snc5Fvfzc1+bIGylCXCzBagXIGxBtzK0BL7vNTc=;
	b=ncaNkxRB5c40olFt8sCUomF5gVH6cd7Y1+VO6CxPnRgVw0YQO8K15z1J01j3uWQIbUz6
	 /j5A7dfKyMwWHGIkWKFy1ABHgJNby87gbKye13q1qGUNhvUJhb2f0EkMIQlwL1vgDx5sw
	 ohgHs0+iQoKHl9Agi76sY0qE1k+LaDqaBiIvBEWDX9MSQXyWPt0RtKdDgrxhf1oTgPwF6
	 oOnGUac8r3M1oASeHz0PmcFcPBgBDAWS9fPdJDt9OZG0A8nRgu3PmZ93nfILd8IU63IbN
	 6KuCYAqMXSro/59lxFoWRl2tzvWS2P6VatM8G9Ou+KR+HNe2wv0CEmsQYJv/IpaWl1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GmEE1dbl;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F5B606A335
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Nov 2026 19:18:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81F5B606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GmEE1dbl
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 540EC43AE6;
	Wed,  4 Nov 2026 19:18:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BB631F000C1;
	Wed,  4 Nov 2026 19:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793819935;
	bh=88D9snc5Fvfzc1+bIGylCXCzBagXIGxBtzK0BL7vNTc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GmEE1dblrL6P3slUDpoeGQBfKRlZceqbttyL3CdBYJ2HAmZ9lajl7o6aomohjTG+O
	 JTa2xT0UeQwIgbWO0as8ILC2qonsH/MA+HbfcPcLDu6enbEF3xp9x5MarktZI1cLNN
	 p49gpXsJRwhljLb1NoANyo0ZebStjoK1MQAOZ8SsuOmEWt9/Va7qy18DmNx/CKuVDD
	 F61rqLrBCLbspjHBFEQrO4v5WSYQC3TxQQVgqakQ7sCvVAsMm5tshbmCStW23Fb73C
	 HKw2C65QpNc+TsBCBKm/WrFquDZj8ghfTEOupR23/RjXQvAJZnpFNNP1XldO5G4qvo
	 qTnFbXsGFvmcw==
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
Subject: [PATCH RESEND v2 11/51] sparc: led: consume the whole write
Date: Wed,  4 Nov 2026 20:18:41 +0100
Message-ID: <20261104-work-procfs-bugfixes-v2-11-021c84d852e0@kernel.org>
In-Reply-To: <20261104-work-procfs-bugfixes-v2-0-021c84d852e0@kernel.org>
References: <20261104-work-procfs-bugfixes-v2-0-021c84d852e0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1161; i=brauner@kernel.org; h=from:subject:message-id; bh=5p0zMz40BbKdivFQo1NNbyIz4tkvEi3yC5tXL4aXaeU=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS9bryxTr/f46JN2aT7fqoMIobterOLr517VZK2/eVbF pMTq1cadJSyMIhxMciKKbI4tJuEyy3nqdhslKkBM4eVCWQIAxenAExk6Q5GhpeRX3yP6jdm/nBn TDpmVrDk42u3AsOCWcVRi54YHnqrX8zIcGmRdthP9Rql7VIfc5K5Jlq/vCTExLioUWxJ93Lnjfk ujAA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

led_proc_write() looks at the first eight bytes of a write and returns
that many, so a writer that loops until everything is written, stdio
does, sends the rest as a second command. That one is unknown and
switches the LED off. Return the whole count, the rest is ignored.

Fixes: ee1858d3122d ("[SPARC]: Add sun4m LED driver.")
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 arch/sparc/kernel/led.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/sparc/kernel/led.c b/arch/sparc/kernel/led.c
index 9b53ac1fe533..a1478de9fe5d 100644
--- a/arch/sparc/kernel/led.c
+++ b/arch/sparc/kernel/led.c
@@ -68,6 +68,7 @@ static int led_proc_open(struct inode *inode, struct file *file)
 static ssize_t led_proc_write(struct file *file, const char __user *buffer,
 			      size_t count, loff_t *ppos)
 {
+	size_t len = count;
 	char *buf = NULL;
 
 	if (count > LED_MAX_LENGTH)
@@ -102,7 +103,7 @@ static ssize_t led_proc_write(struct file *file, const char __user *buffer,
 
 	kfree(buf);
 
-	return count;
+	return len;
 }
 
 static const struct proc_ops led_proc_ops = {

-- 
2.53.0

