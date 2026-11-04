Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793819877;
	b=gsKVRPg0+WGHiiwVrniRI3rUV9Dd+1SmUzryfM6BO75UvJRjnrmRJtNMgLFTlsys7L8Y
	 5rT9CRDv/wPZGhXS9RMP1Y0pmLn0fbeDwcZlEt1MlZVUUGtENtUkY3M7Afd6APTisk33i
	 xtLVGE+ij9o0ZIngBy3dCR0RehXMfGg4nWOaQq3QyGoVf/R35Ys1wWwf+xnjHNH/+M4aA
	 D9zsNn2Zd0az+37E5Gt/045m0XhRNf3cgf6zCtkCGOmUgVqFh7BGMHluOU4K/9c7MCSXr
	 9GbpUhiBuTSQawnLOu6VUyiIa8u7XOzuWE0F6/M7oj8F/oWmJiZFr9wCT77hSPfRq/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793819877;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=Bp2DPgSMAVNPpocNHMMHSMxcgQhQwNKqaFQNAmEUdgU=;
	b=b32uqBU6mle6QyNdnPObSlDTZThWp+MgjJTzTCrFHXUh3a4dUYK3gcgb9zzx2IijrFLe
	 KXxa+z9J4V5DioWLzkTSeYLdziuYKxEN5Jztl5l8+jwK9fFMdbYdnA7HC32VFzzNYK+am
	 0F7+41NSiZwcxAIYZtq8drDFF6M3GluXuv+ngNt1DRpnN9J7o2Gmh41Un82xoEpmyy24d
	 D40Rqs+s1Sn7RkiUG+59Otzm9oD5Hg8wfpu3Ht4Y6Z0Tp5IFr/LJatzPC0LBQc+mSpA66
	 cRryHqBFM0AbJPQjBjnlML9GoFiy3jzxSk3dVTw3A3QreyNvpuzX/lavrUD2rNEDVTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="onbfdV/H";
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA7D606A31B
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Nov 2026 19:17:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DA7D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=onbfdV/H
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 27F1C412AF;
	Wed,  4 Nov 2026 19:17:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 496051F000C1;
	Wed,  4 Nov 2026 19:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793819877;
	bh=Bp2DPgSMAVNPpocNHMMHSMxcgQhQwNKqaFQNAmEUdgU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=onbfdV/HTacMnVbqXJ+FWmQQPtyp9R0J4UgJy9QwpRXMNAUpXq4U5MgLOpJJmdqil
	 A0IpzV3lIP35dJV6mQZjczsBbIm16npn5PD8YgolOlJ1tMWq4drLkt1BRme9A6hdpk
	 hU7if+GjyblRW+XhOHwJUvOM5bncZ4wy7T8dJkSSmoqVJFYODR5oteYh/K8C4sjSv7
	 T90fJXFV4MCDOisGIN4JIrvvLoPWPs3/TneCCv2v3EeHxNcbD6g2Laj9xr6GhUYSzJ
	 UbZZpN0HIrsvDaR+/nImX8hLuzR+la3jElQ0/AQag/TzZMVgu2cf2gdOENudtrxOC7
	 u98wrpF2+gfGQ==
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
Subject: [PATCH RESEND v2 07/51] lockd: don't hand out the terminator of nlm_end_grace
Date: Wed,  4 Nov 2026 20:17:43 +0100
Message-ID: <20261104-work-procfs-bugfixes-v2-7-021c84d852e0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=879; i=brauner@kernel.org; h=from:subject:message-id; bh=tKzHzMLxBoW/zY681xcBM67Jqe2y1s4JEAk9OycZ8F8=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS9brz82W5pn1bu8jVTxGdEXE56r5qmzRPmKXZbfpl5N e9UmTVSHaUsDGJcDLJiiiwO7Sbhcst5KjYbZWrAzGFlAhnCwMUpABN5aMHwv1BmWTKrQaW1pau+ y7lc/V6hFSvly7z1GnL9Bfe/by3pYGSYdlT+a0yoMVdMgqbeooRHhxKrFq9gfqp47glfRsvFU/e YAQ==
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

nlm_end_grace_read() answers with "Y\n" or "N\n" from a three byte
buffer and hands out all three bytes, the terminating NUL included.
Leave the NUL out.

Fixes: d68e3c4aa416 ("lockd: add a /proc/fs/lockd/nlm_end_grace file")
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 fs/lockd/procfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/lockd/procfs.c b/fs/lockd/procfs.c
index a01f08c8c2f3..74f7ab77535a 100644
--- a/fs/lockd/procfs.c
+++ b/fs/lockd/procfs.c
@@ -57,7 +57,7 @@ nlm_end_grace_read(struct file *file, char __user *buf, size_t size,
 	resp[1] = '\n';
 	resp[2] = '\0';
 
-	return simple_read_from_buffer(buf, size, pos, resp, sizeof(resp));
+	return simple_read_from_buffer(buf, size, pos, resp, sizeof(resp) - 1);
 }
 
 static const struct proc_ops lockd_end_grace_proc_ops = {

-- 
2.53.0

