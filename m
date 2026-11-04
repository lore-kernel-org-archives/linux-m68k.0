Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793821466;
	b=c0HY+v7aKaouWieFW47U2nc73KujJCdY362ADx9AnyRWcMvyGcv9ImYhiFnaCXlv9Ya4
	 ihXAZ0R87J3o808CQy4LpQMB/gZiW2En9h0j4y1iUKsSQZ244wSR04wwVZTh0b0jFXAvw
	 +KD2dzR76nLtryy8PkYvMik1j7S48XrtdRstbZDRUecwU3NH4f9EnR8vYr5HNXVZTC6KM
	 /Bvt51ynkTmyjD/MI+bQP6+6kZERgy6153VkeJ10nbXZDie7QevyCFDTDVrXdQFQBWvb8
	 S3sOke309SL403Vtx27CoKT8JA/or74yTwZrZcegxygOoRZv5RezYauuqwGbeO5nJ6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793821466;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=RGxB3CLuL3hdMOFW6c8rETuQc0/Gu93ks+OA3zHK0Kk=;
	b=UGPj8dLsQYJJxVtjadZLAXgzNKC6QH8vWsRyR5T510naCmAuUygQqoEgSxRy+3JOffy+
	 qfS7BW3cQlq9shmQayX7IGiCfY77rIeRyqpdk4LIVy63gl9HyRlzXmKtiDYb6pubRUrk+
	 yEZf2qPXtOWU36zQ24UFn9PVQXa1+0oucFo3RU9Yb1TZwWzYTnQGMQxfmfX+j6GyjmXFC
	 3eXZIahg+3Ykq1ct87Wc3H/1RMJqpKKMTvM/+uIs1datwSLJ+XXFTCHohxYg+Mx5jA35u
	 NEFZdVA1u7NjoN2/D9T591hTxZlQMMcTQnO5nTUcCEb/2ZEsyxqLeA+ogXmQ1oKmDSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HynF0hwX;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9802B60C16A1
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Nov 2026 19:44:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9802B60C16A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HynF0hwX
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E839260F13;
	Wed,  4 Nov 2026 19:44:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9144A1F00919;
	Wed,  4 Nov 2026 19:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793821464;
	bh=RGxB3CLuL3hdMOFW6c8rETuQc0/Gu93ks+OA3zHK0Kk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HynF0hwXz2ytbvRQ/tRwwiFgyWz0vIkPCQxUNQGSX/NnDGQ1w68NuKQ3Kbl+MqoQX
	 8J7oHXHcLTQG2lwNLxQCXX70LF0ZV8X7+sNuxCRB/h6LupRGDVaGgTpLhVB66N3rc6
	 tI4jBI+gZnk53Jn6xXJOB3T4pShCBRo0303YUYjU36zpeR5Fq1VBCTSBJgs9D7xNoL
	 nRM7Nf0ZRQUe280MUMB6gTrfEPRIGT2ideQc9QRKVPxb3VQzoUYiRRvvW4mXYoSbZK
	 CT7o3OoXqIatD6R9YkyrZxRNz94QoWOLCKEAfJ5VkH6HUvCBuSP/1PTuWytCnUt3iX
	 I33mD4o8jVx+w==
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
Subject: [PATCH RESEND v2 08/26] s390/dasd: let procfs copy in writes to /proc/dasd/statistics
Date: Wed,  4 Nov 2026 20:44:10 +0100
Message-ID: <20261104-work-procfs-drivers-v2-8-245e54e87116@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2121; i=brauner@kernel.org; h=from:subject:message-id; bh=tPoM7KW2jugAI3HBgjDAkvMMKrMKVevq5gq8BMZsIqc=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS97qqZsvLFCqNf+6XMazRbVi3d/ODSoR215t5nK5i4r bYImJcc6yhlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZjI84cM/wy2X+zn+HlNtd83 kD+IaZPCPqU9hps4WOckbNvx/OehSHlGhlOcc5yPTdmUf3fCaiuLkJ2aUg1lKVZe31ctszCW1p/ gyQMA
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

Implement ->proc_write_buf() so procfs copies in what is written before
it pins the entry, and parse the command from that copy. Commands longer
than PAGE_SIZE - 1 bytes are rejected now instead of cut at 64k.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 drivers/s390/block/dasd_proc.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/s390/block/dasd_proc.c b/drivers/s390/block/dasd_proc.c
index 86399427f01d..6c3bbb7dfe85 100644
--- a/drivers/s390/block/dasd_proc.c
+++ b/drivers/s390/block/dasd_proc.c
@@ -15,7 +15,6 @@
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/seq_file.h>
-#include <linux/vmalloc.h>
 #include <linux/proc_fs.h>
 
 #include <asm/debug.h>
@@ -247,17 +246,15 @@ static int dasd_stats_proc_show(struct seq_file *m, void *v)
 }
 
 static ssize_t dasd_stats_proc_write(struct file *file,
-		const char __user *user_buf, size_t user_len, loff_t *pos)
+		char *buffer, size_t user_len, loff_t *pos)
 {
 #ifdef CONFIG_DASD_PROFILE
-	char *buffer, *str;
+	char *str;
 	int rc;
 
-	if (user_len > 65536)
-		user_len = 65536;
-	buffer = dasd_get_user_string(user_buf, user_len);
-	if (IS_ERR(buffer))
-		return PTR_ERR(buffer);
+	/* strip linefeed */
+	if (user_len && buffer[user_len - 1] == '\n')
+		buffer[user_len - 1] = 0;
 
 	/* check for valid verbs */
 	str = skip_spaces(buffer);
@@ -296,13 +293,11 @@ static ssize_t dasd_stats_proc_write(struct file *file,
 		pr_info("The statistics have been reset\n");
 	} else
 		goto out_parse_error;
-	vfree(buffer);
 	return user_len;
 out_parse_error:
 	rc = -EINVAL;
 	pr_warn("%s is not a supported value for /proc/dasd/statistics\n", str);
 out_error:
-	vfree(buffer);
 	return rc;
 #else
 	pr_warn("/proc/dasd/statistics: is not activated in this kernel\n");
@@ -312,7 +307,7 @@ out_error:
 
 static const struct proc_ops dasd_stats_proc_ops = {
 	.proc_show	= dasd_stats_proc_show,
-	.proc_write	= dasd_stats_proc_write,
+	.proc_write_buf	= dasd_stats_proc_write,
 };
 
 /*

-- 
2.53.0

