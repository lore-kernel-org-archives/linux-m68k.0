Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793631062;
	b=u3M3dHMhsUt8l5vcBeNj0JIhWK+LEohNmbkLnX3hSeTpSSD31vcrK3ohDbkqjaK1n/A9
	 styQAhZcLLenO2AI79JvUcECXrzVcR/UrKu64C6wYseRvuDrEma//HlIfHYzMhGL1PCGA
	 zjnzdm6bZpges46avH6dy5e7b+vFsb5n1F1SzuqdHnqBtZhxRZq7i9b+EB2VUCbak8WHP
	 UIOqq3U+qIpM7vaHeUZBY+RY0YGv+hVVAvxnCTwioKz3BW8Z3d/mGbCMQPbX2OXi630Xy
	 lbL0NIy7YVQjPLxeTBCrmKpPj922PumWX+BGM63jI9MSx/3k3lT6WQOCRDwJ/v2feUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631062;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=iNga88T+PVpZfmycjurDSPkD9sK5xR0SX7kfbe+Tx54=;
	b=3pwo/Y5N8/pezGF+eM3+LTYE6yDz8ur4GQ0HDfZcPe/PimgmUSHHlLrOqhlQjji1R6NJ
	 iTTkkmA9msVFs9pHX7E1NWqqdphnXqsGio5GMxxQmNhH8wLVLkLS2/ByWnS1KtSR+74I0
	 rUi0571RynxRcUC1IRvKzW0xuxeI1P5XvIH8+v2fB3hRyMr+bai2sqS63LnDwZudlKrD5
	 FhQcK1uZQ755MudSpdluqpHmk3OXUi9kvi4HxBTyQgO+FgjHrRoyozmnNQqlz6K6WVUJW
	 Cile84QYRz/0QRskH3LFOP539QYZKMbKPJllrYqHondc94H+ni0IQzJ4UP4BcJAQKQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HAfEog47;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435CA606B90E
	for <linux-m68k@lists.linux-m68k.org>; Mon,  2 Nov 2026 14:51:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 435CA606B90E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HAfEog47
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7725E6025A;
	Mon,  2 Nov 2026 14:51:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F0841F00A20;
	Mon,  2 Nov 2026 14:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793631061;
	bh=iNga88T+PVpZfmycjurDSPkD9sK5xR0SX7kfbe+Tx54=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=HAfEog47xda8zTdFMvaAY8UduaibQbmV5xxRBJ0191OlQqt2XydHGZFtrSXUNbS58
	 AFtT00ZqBbfVJ/H/XjgGtIZDGDle82Pa+tLqZ8FQyxzXDykVFW4+gDpHKY+tRzFlIw
	 YK6e8OsM0kDvZDoN8nl4W7r6Syhu+TVQ07b4x+H0xeJkJuUzcBSQBDtmTErPW6xGGD
	 OXD3SZC4tYwy0PvCMkPLOtkiB76JNpNZOV81oGLnAyA/hYKEjzUYYgs5lsCvafcDSS
	 XOjHy+nXg5pWeHaWMYPWeuKt5azway4LiOnI7RzIv1EzsUvbR06rvuDChMCv/TCU6X
	 LHOWdM7kjMyMQ==
From: Christian Brauner <brauner@kernel.org>
Date: Mon, 02 Nov 2026 15:48:46 +0100
Subject: [PATCH RFC 06/16] proc: let procfs own the seq_file of
 DEFINE_PROC_SHOW_ATTRIBUTE() files
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
Message-Id: <20261102-work-procfs-core-v1-6-75df35e4f8b8@kernel.org>
References: <20261102-work-procfs-core-v1-0-75df35e4f8b8@kernel.org>
In-Reply-To: <20261102-work-procfs-core-v1-0-75df35e4f8b8@kernel.org>
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

Declare the show function and let procfs open the seq_file.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 include/linux/seq_file.h | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/include/linux/seq_file.h b/include/linux/seq_file.h
index dc0e8c62d9e0..b813b7e63d89 100644
--- a/include/linux/seq_file.h
+++ b/include/linux/seq_file.h
@@ -233,16 +233,8 @@ static const struct file_operations __name ## _fops = {			\
 }
 
 #define DEFINE_PROC_SHOW_ATTRIBUTE(__name)				\
-static int __name ## _open(struct inode *inode, struct file *file)	\
-{									\
-	return single_open(file, __name ## _show, pde_data(inode));	\
-}									\
-									\
 static const struct proc_ops __name ## _proc_ops = {			\
-	.proc_open	= __name ## _open,				\
-	.proc_read	= seq_read,					\
-	.proc_lseek	= seq_lseek,					\
-	.proc_release	= single_release,				\
+	.proc_show	= __name ## _show,				\
 }
 
 static inline struct user_namespace *seq_user_ns(struct seq_file *seq)

-- 
2.53.0

