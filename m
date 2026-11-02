Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633465;
	b=YuO9+nfiBjeAo0vHyNozZ44D/WoND480pOpEiiENtMk3Pz+hMkSs5tOMTvOAEUWyBQ5M
	 ThqYsBialC6fRlhYUDJjJnoF61TmX/oLC3xHf/KP9yxQ7KNh1ghpkEMFfC8vRacu75zHD
	 uJ4anFq0Hhf2IINpNqPuaR1NEzKCcPQIziCcBCJgHmQbK/QtOiD3xVooflOZHZ8EkCi3m
	 cdkc5oIGJuF5yriZ8oe5mA/CStxtjoEPgIbxTBzR8W/cLY7b0tX1ereRtR7cvtUaDQoFw
	 QE3ig6+oUAjmtwhHnp8Wc8h/ifxX3ycmReTV2Y/nF/My2P1xsqMU1jUT3txqCm9ldGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633465;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=8JYviDqoWsEGN3uNb5Mh66eaw6snQ2TUUnHcmJoMJ80=;
	b=5YNIFIOvTmIJSMNwzAPzhdC/gI8SsEH5xBP+pz7RCyManAxlNCEsYRN7xi73MFeWKFKc
	 YBB/wvIS71hb4S5NmhB+6+eY8GIH6exYjQwEpIvKi/+Zu68tZnaCgdz46HPqTu94ZGHqU
	 SNeamaebOVQCEAsqwSQoGt0dBFhwni9OGy8hr0Lk+sg2Ay8BM+xUZToBhZTOTZDgCQ7hU
	 hcTxK77m+OidWg18WP37Opxg6BxzPU8phxhUbSDlhtrm0wt+uuilmTI7HTfWvNbl+jq9A
	 V5fUcsZe49nS/IDZeNNveIGzKemCgzKuO1RnjKCyMeyniL5F+4WJnWKbKd6hUC/jOFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ScTRyul4;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB515609D831
	for <linux-m68k@lists.linux-m68k.org>; Mon,  2 Nov 2026 15:31:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB515609D831
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ScTRyul4
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EA5E660DB6;
	Mon,  2 Nov 2026 15:31:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6FC01F00A16;
	Mon,  2 Nov 2026 15:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793633463;
	bh=8JYviDqoWsEGN3uNb5Mh66eaw6snQ2TUUnHcmJoMJ80=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ScTRyul4UqS1mWJvOzmwvwPQ//Itx9TsdsxsJwGYb3Gmm/J0WkPfUMLBfXwRwQRsr
	 Nim+Y+d24g3hKICsmz4+hJ76wRo71Zgu8JYSNQex1bY6jYxc4yR4NIKTkU/b0bzekF
	 oTZ8Mqaf/qJiOTrQ3fVHdV5XUUZFZ9Rv79SVAaVRi4pTwuCDqET0rxCczTm7RhsOI9
	 GL2XYnYI3rKEga2Ls6G2iIhPzet32Cl17pJvVFcx5D8ihh7MkSTm+FLpZqjgFDVWCL
	 7PucMdluq4M256zUScAZVO6B7k8GrovbDY4lddqqcnnXFtmxqpelNIoflJ7mv/9GqF
	 EQVHm3m/21Cfg==
From: Christian Brauner <brauner@kernel.org>
Date: Mon, 02 Nov 2026 16:07:15 +0100
Subject: [PATCH RFC 01/11] atm: let procfs copy out reads of the device
 files
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
Message-Id: <20261102-work-procfs-net-v1-1-982104a4f592@kernel.org>
References: <20261102-work-procfs-net-v1-0-982104a4f592@kernel.org>
In-Reply-To: <20261102-work-procfs-net-v1-0-982104a4f592@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1517; i=brauner@kernel.org;
 h=from:subject:message-id; bh=gPjf1XFsI8l/uiq7gtBYaOS5PIZm1WCyT/xvmcgXYrk=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS9WG78cE1u8seuk/K3unk+6P7jWeW5b87CvLufg14ar
 jS+H74/oKOUhUGMi0FWTJHFod0kXG45T8Vmo0wNmDmsTCBDGLg4BWAis2UYGeay2p/6sZbx0Dzp
 lNKfYqc/nLPyU7XaNW1f+AvTfu35FjsYGdonXm11v5fkNuWfeN7rc08f7rarf8sV6GTp9Xk23+y
 Xx3kB
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Implement ->proc_read_buf() so procfs copies what is read from
/proc/net/atm/<dev> to userspace after it unpinned the entry. The
drivers' ->proc_read() keep filling their page.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 net/atm/proc.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/net/atm/proc.c b/net/atm/proc.c
index ca0fc6b90998..cea930b4b840 100644
--- a/net/atm/proc.c
+++ b/net/atm/proc.c
@@ -30,11 +30,11 @@
 #include "resources.h"
 #include "common.h" /* atm_proc_init prototype */
 
-static ssize_t proc_dev_atm_read(struct file *file, char __user *buf,
+static ssize_t proc_dev_atm_read(struct file *file, char *buf,
 				 size_t count, loff_t *pos);
 
 static const struct proc_ops atm_dev_proc_ops = {
-	.proc_read	= proc_dev_atm_read,
+	.proc_read_buf	= proc_dev_atm_read,
 	.proc_lseek	= noop_llseek,
 };
 
@@ -246,7 +246,7 @@ static const struct seq_operations vcc_seq_ops = {
 	.show	= vcc_seq_show,
 };
 
-static ssize_t proc_dev_atm_read(struct file *file, char __user *buf,
+static ssize_t proc_dev_atm_read(struct file *file, char *buf,
 				 size_t count, loff_t *pos)
 {
 	struct atm_dev *dev;
@@ -267,8 +267,7 @@ static ssize_t proc_dev_atm_read(struct file *file, char __user *buf,
 			length = -EINVAL;
 	}
 	if (length >= 0) {
-		if (copy_to_user(buf, (char *)page, length))
-			length = -EFAULT;
+		memcpy(buf, (char *)page, length);
 		(*pos)++;
 	}
 	free_page(page);

-- 
2.53.0

