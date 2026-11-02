Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793629783;
	b=Qf1W2MnsUKGLeLFK/EXZ2JNLvM+3rfXV1IvRtDYO+KhLmNMzX0rW6C7I/cm7iShS3YZ2
	 WpyIW4bLNBaz+YPJ005Il+8cad316ftXzQ2Rssi8SJ/5hH9AStQ/+UTM3oTEBLgS+YgXA
	 IpbOBB5Hf1YNKC1kEfiaRuj9w1CbgaQ6mBomqr4weUlZ443Rqdeo+I8ur22OuD4qzApeO
	 yrTADVYDzPnmcvUSAVo+cNApVPhHHNh3CzYJopLXL+GSS3aNeqeBztpYtCKS/+b+ya4ol
	 htqd7a15nVfD1O09aUSMI0la6BIxgGHGaq+nQq+0rMu216pLZ2/pPr7MJcn80fx/3TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629783;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=ic+85LCmRwOCXD9XrptIkWWgbAusIpJ/j/j/KpoPCSM=;
	b=ftsOI3x4BYcgFMZzTNGa/F2ULCrbLfNXTlGAfvOi/2vlb7l77FGCehfPoxxYbUcpVhe5
	 mNbHJ6rUJti1TVaFrLWq5lJp4Is/fVzsCKAqJS6D9zrWzxXo0K2Pstt2box1Hlt3o2vEP
	 qrefy/cQodssm47TMmu7EhAYy9a1fcKr4wPCuJtQNzvd7jwPENqmlfybkmMGG9bopDcwJ
	 quUovgcY2WV18vwlxuPt3+n7l8huvRic6YBhMyhMa0YFAZ0ls50KCSzL9H1l7wo7mvvVV
	 L/jlf0FXLTB/OF8Hqa2WVNMBeSHtiRmYdcWyuP0a81l1GAOQF9tKuG2CJk7lH6oToLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cpiq3IqJ;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62FF6070D87
	for <linux-m68k@lists.linux-m68k.org>; Mon,  2 Nov 2026 14:29:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D62FF6070D87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cpiq3IqJ
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1E91B60EF2;
	Mon,  2 Nov 2026 14:29:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A15B1F00A16;
	Mon,  2 Nov 2026 14:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793629781;
	bh=ic+85LCmRwOCXD9XrptIkWWgbAusIpJ/j/j/KpoPCSM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=cpiq3IqJzE0jLDTsXK0hhQpT+1tSBJ0m7UHl7jwVgF1Fv4mj9x0h0BFZHMrAfCVa5
	 iewk6s7JCm0+gwRTm/kjqgkW4YiueXz1TIntYMKngDzC+ACNgbHQBWvInviI1KRtgv
	 oJz0vOiQG4c8Pbk4iFmvmDh2ZQ6QwxvGwZS6AAmLbVz1ZAlyFcC8D8rCv7m/yTSEu4
	 1vD4TCJ+dg9PvxhYYplMdQDJY8+AFuovGaLfiL4La8TbkUrkcL9SeYhMCfsPHBpZLk
	 c+TBML64gtkfFA/ZyGQfZtD060MB4GYjnWd84w2qELeu1iAHFSJ2lpD4cFIe3OBakQ
	 pRII2n9i/Aq1w==
From: Christian Brauner <brauner@kernel.org>
Date: Mon, 02 Nov 2026 15:21:48 +0100
Subject: [PATCH RFC 33/38] proc: sysctl: copy to and from userspace without
 holding the table
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
Message-Id: <20261102-work-procfs-bugfixes-v1-33-59422ed3e465@kernel.org>
References: <20261102-work-procfs-bugfixes-v1-0-59422ed3e465@kernel.org>
In-Reply-To: <20261102-work-procfs-bugfixes-v1-0-59422ed3e465@kernel.org>
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
 Chuck Lever <cel@kernel.org>, stable@vger.kernel.org
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3702; i=brauner@kernel.org;
 h=from:subject:message-id; bh=OKHYY6G5p6tdI3fThR8iqjZq4Cu2ed8jbKwsRQr4+FI=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS9mJOjqsfwdP26aUFGgi5C6r2yG2bHan4r+X3s7GyXV
 WxXvQoDOkpZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTACYy4TIjw7uI6fuc5flCf+Zm
 5zW+q5zWPcdB1K3g9IT5Dob+Sj9nMTD8M73HuT7LtvqMxe4/c10XFfduOPPAQlnpxaaCg3+5lgu
 KcwAA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

proc_sys_call_handler() grabs the table, copies in what is written,
calls the handler and copies what it produced out to userspace before
it lets go of the table again. Unregistering a table waits until nobody
uses it anymore. So a reader or writer whose copy faults for as long as
it wants, with userfaultfd or a stalled FUSE mapping, keeps
unregister_sysctl_table() waiting, and its callers like to hold locks
while they do that. addrconf unregisters the ipv6 sysctls of a device
with RTNL held, so a stalled read of /proc/sys/net/ipv6/conf/<dev>/mtu
holds up every RTNL user until the reader gives up.

Copy in before grabbing the table and copy out after letting go of it,
like procfs and kernfs do for their files. The buffer is ours, nothing
needs the table for the copies.

That moves the allocation and the copy in before the permission check.
A write that can't be copied in, or a request that is too large, now
fails with -EFAULT or -ENOMEM where it used to fail with -EPERM.

Fixes: 330d57fb98a9 ("[PATCH] Fix sysctl unregistration oops (CVE-2005-2709)")
Cc: stable@vger.kernel.org
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 fs/proc/proc_sysctl.c | 50 ++++++++++++++++++++++++++++----------------------
 1 file changed, 28 insertions(+), 22 deletions(-)

diff --git a/fs/proc/proc_sysctl.c b/fs/proc/proc_sysctl.c
index 38b61887b59c..2150cf842919 100644
--- a/fs/proc/proc_sysctl.c
+++ b/fs/proc/proc_sysctl.c
@@ -602,14 +602,36 @@ static ssize_t proc_sys_call_handler(struct kiocb *iocb, struct iov_iter *iter,
 		int write)
 {
 	struct inode *inode = file_inode(iocb->ki_filp);
-	struct ctl_table_header *head = grab_header(inode);
 	const struct ctl_table *table = PROC_I(inode)->sysctl_entry;
+	struct ctl_table_header *head;
 	size_t count = iov_iter_count(iter);
 	char *kbuf;
 	ssize_t error;
 
-	if (IS_ERR(head))
-		return PTR_ERR(head);
+	/* don't even try if the size is too large */
+	if (count >= KMALLOC_MAX_SIZE)
+		return -ENOMEM;
+	kbuf = kvzalloc(count + 1, GFP_KERNEL);
+	if (!kbuf)
+		return -ENOMEM;
+
+	/*
+	 * Copy in before grabbing the table and copy out after letting go of
+	 * it. Unregistering the table waits for us and a copy that faults can
+	 * take as long as userspace wants.
+	 */
+	if (write) {
+		error = -EFAULT;
+		if (!copy_from_iter_full(kbuf, count, iter))
+			goto out_free_buf;
+		kbuf[count] = '\0';
+	}
+
+	head = grab_header(inode);
+	if (IS_ERR(head)) {
+		error = PTR_ERR(head);
+		goto out_free_buf;
+	}
 
 	/*
 	 * At this point we know that the sysctl was not unregistered
@@ -624,28 +646,15 @@ static ssize_t proc_sys_call_handler(struct kiocb *iocb, struct iov_iter *iter,
 	if (!table->proc_handler)
 		goto out;
 
-	/* don't even try if the size is too large */
-	error = -ENOMEM;
-	if (count >= KMALLOC_MAX_SIZE)
-		goto out;
-	kbuf = kvzalloc(count + 1, GFP_KERNEL);
-	if (!kbuf)
-		goto out;
-
-	if (write) {
-		error = -EFAULT;
-		if (!copy_from_iter_full(kbuf, count, iter))
-			goto out_free_buf;
-		kbuf[count] = '\0';
-	}
-
 	error = BPF_CGROUP_RUN_PROG_SYSCTL(head, table, write, &kbuf, &count,
 					   &iocb->ki_pos);
 	if (error)
-		goto out_free_buf;
+		goto out;
 
 	/* careful: calling conventions are nasty here */
 	error = table->proc_handler(table, write, kbuf, &count, &iocb->ki_pos);
+out:
+	sysctl_head_finish(head);
 	if (error)
 		goto out_free_buf;
 
@@ -658,9 +667,6 @@ static ssize_t proc_sys_call_handler(struct kiocb *iocb, struct iov_iter *iter,
 	error = count;
 out_free_buf:
 	kvfree(kbuf);
-out:
-	sysctl_head_finish(head);
-
 	return error;
 }
 

-- 
2.53.0

