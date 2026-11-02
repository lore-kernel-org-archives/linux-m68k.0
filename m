Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793632575;
	b=mL+Tx2BLt4LeW677Rgcpc6/w9kAYqYF1JDcPrbDQNdzWHA+hhY6WdCtF0/qO4AF5xuMd
	 Nwv3d21fHQEdLExzmSwyerKv5FLg8GwIqX8T4y0eJayw7zgryLt0LnNGJr8RKh9bgbqo9
	 Zmwpnkj5by6/1JNE2K/avGUAWFX0aenwvBxiPWzL+BQWAdG3zRbJByOs65zHlkF4rufM4
	 6aZ9oabg3rzw2uGNhu6kSXPvMnGb7WtHrFLP+j4QaJNeyvWBh7itFHV3uDW1xO/HQYaYL
	 c7OhssZjwMjM6dFHfYJASGKQdKRUaTlESK6qnbwJhfCXfAsc3tbotChdcaNQM0pMikQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632575;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=goLGxFor5aDHmq+/63YZ7VsFVk0WPo8/IlwPxf0/q/E=;
	b=sbalMofIkU+HrMjCoFnRsimq3eblEt50FDIKAyaNkh6jS0+gOMHV4/Xn4DN4NbSRCFpn
	 mJmfNcy8LDM2YipLtH3Jy3lYtQStkfuQVJWAmyHo6Nihu/D7xJ1pquwZutcPnRsQIiEL8
	 lNYzqTYyhz1pDSA16i2U7qJx+OfAmaHgolU7bgWxCqRaIsQlwRnZ5PpZ/TppTTEsradfW
	 D/mj6xY3RBXdCxsW9LZVIHX3jYootVdoi5Pt9oxIOrhdZ3h277ZsvL3w9IS9m6m1GU0qm
	 4BJ7kVGEMKElaKXvf7PAa9FZNSaV3SOaad+5X72WYVdDJI/Z5bRnK0F5Np0wWz3ANXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ej70vPT/";
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F54607B7B9
	for <linux-m68k@lists.linux-m68k.org>; Mon,  2 Nov 2026 15:16:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30F54607B7B9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ej70vPT/
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F0CD442A88;
	Mon,  2 Nov 2026 15:16:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B757A1F00A16;
	Mon,  2 Nov 2026 15:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793632574;
	bh=goLGxFor5aDHmq+/63YZ7VsFVk0WPo8/IlwPxf0/q/E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ej70vPT/y7NrhBgRnVeJZJCWCJCY4Ir+tDI0qb3+EynguB83LrhQsFn2l3M5OZtXE
	 2VH+S87/JA3tEOQ5oF6NbafdeM5dvCGs7k+Pl66iGGY0VzHGdvfeTuOHMGET++saO9
	 8CMGsO+isRtfapDtsUOvJJ1+uTuGk8RHjvFSx0T6P4hnrtLPTR2SSKodt/mLQIBmk2
	 SzbEgwffy1kv1xXhMujkkGK8afuda14vw1NrfhyqY3qJhPF7pdO3kkpnpsfKhmpNYh
	 jxGaC2jmsD4TftiMbXuIK38lcVEqXr7YxWPTdZiDHhvMHLfLf4/cExgZfn7c5HC9H0
	 J+psMOIMcn0fQ==
From: Christian Brauner <brauner@kernel.org>
Date: Mon, 02 Nov 2026 16:07:24 +0100
Subject: [PATCH RFC 17/23] usb: gadget: function: rndis: let procfs copy in
 writes
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
Message-Id: <20261102-work-procfs-drivers-v1-17-a994bd4d3b1a@kernel.org>
References: <20261102-work-procfs-drivers-v1-0-a994bd4d3b1a@kernel.org>
In-Reply-To: <20261102-work-procfs-drivers-v1-0-a994bd4d3b1a@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1569; i=brauner@kernel.org;
 h=from:subject:message-id; bh=saz4p5rW2UOPmCRi+6zEslqjX7E5721ehvji7/y2TLU=;
 b=kA0DAAoWkcYbwGV43KIByyZiAGropzGhaJWnu9+4zvQgXLhUThJNad18i/diIL3NsOXTHFLIm
 Yh1BAAWCgAdFiEEQIc0Vx6nDHizMmkokcYbwGV43KIFAmropzEACgkQkcYbwGV43KIUZwD+IHp+
 nA7hxed0nI3IkqLBHaX8l90Mx69iUsGXRMOlkboA/3KH9SLJ/MMw6rQ8ujZlKhQxzG1q+lU/vjC
 oZkDuYDUH
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Implement ->proc_write_buf() so procfs copies in what is written to
/proc/driver/rndis-<n> before it pins the entry, and handle the
commands from that copy. Writes larger than PAGE_SIZE - 1 bytes fail
with -EINVAL now.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 drivers/usb/gadget/function/rndis.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/function/rndis.c b/drivers/usb/gadget/function/rndis.c
index 3c7bd30b8a3a..e05e0c6ae8fb 100644
--- a/drivers/usb/gadget/function/rndis.c
+++ b/drivers/usb/gadget/function/rndis.c
@@ -1138,7 +1138,7 @@ static int rndis_proc_show(struct seq_file *m, void *v)
 	return 0;
 }
 
-static ssize_t rndis_proc_write(struct file *file, const char __user *buffer,
+static ssize_t rndis_proc_write(struct file *file, char *buffer,
 				size_t count, loff_t *ppos)
 {
 	rndis_params *p = pde_data(file_inode(file));
@@ -1146,9 +1146,8 @@ static ssize_t rndis_proc_write(struct file *file, const char __user *buffer,
 	int i, fl_speed = 0;
 
 	for (i = 0; i < count; i++) {
-		char c;
-		if (get_user(c, buffer))
-			return -EFAULT;
+		char c = *buffer;
+
 		switch (c) {
 		case '0':
 		case '1':
@@ -1185,7 +1184,7 @@ static ssize_t rndis_proc_write(struct file *file, const char __user *buffer,
 
 static const struct proc_ops rndis_proc_ops = {
 	.proc_show	= rndis_proc_show,
-	.proc_write	= rndis_proc_write,
+	.proc_write_buf	= rndis_proc_write,
 };
 
 #define	NAME_TEMPLATE "driver/rndis-%03d"

-- 
2.53.0

