Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793813443;
	b=lxnzByFHgoahrKlM6pelddIO1E7FYumHh87FLjVxaIADVO2scDjr9bcMIoee7pxlPC3y
	 5lhNRBof7tfuhGAzaKjJ3tP1PdNSiC/8rIKz+FTXMANB4Bz07EIBfxOeoIkr9ay6mm2Cs
	 TXkXVq45G9IMjuiUkcGEnteY+KqgRgj/J3CjXf0WfFjJB0/66Y8tmV+qTOkyZWZ+6VWr1
	 FUkgpcQS1Rh1rPtAzwhawgprMo5roF4ECPnrqSoauFV18oq6eVHdShMnDMQt0ws7Ot6GM
	 vXFWTKi9N8TxRHenTAYHVEBdRR17J0RfQxP+aY7zLf/K8uarAyVdBuBp2JA5bp/ah4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793813443;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=axjAzDMxe/T5Kt/VR9558Sdu9PB/HLdF+q053OKTtnM=;
	b=QESDP1uXrg8RH8syBRsPB8DhsRBS68RZJBYD5DyQ5NaLIJ6syhrHmc8s4OGljzM2qFgA
	 ohBxW2McybCmwHUeaEuADs3N3EBr/ora8uRKmrua1fTOxDBp6YHYVLEv7nD3HtiKPqlw8
	 yW7i7pTjh4Xu/v4lTUZQexsFpxnF/m4HlVjQZhlrV9wQd3yYYE8firafyUFqqHuNf9nJ4
	 5rp8auHAb53E/mrP1vV0Sunr9MRSX5cNg9c54RjZ7LUu6oPkwEig1vxPo5rGoqqH43Uyo
	 XTdiGocxfglcVGB7gh2yNd8b+DXXWRjXu0Ol9VS0iWeN2kLLZDSVvH2FUlLNW1eYDsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BpyBwaL0;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662CC608363B
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Nov 2026 17:30:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 662CC608363B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BpyBwaL0
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3BA3040BCA;
	Wed,  4 Nov 2026 17:30:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 318C11F0093A;
	Wed,  4 Nov 2026 17:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793813443;
	bh=axjAzDMxe/T5Kt/VR9558Sdu9PB/HLdF+q053OKTtnM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BpyBwaL0/aYVXoHwq05IXwkJfbiN+sH/NMlrIciQjG65t4BqcyIJFg2nSk8XDCCkV
	 c7rAC5Gwt0eJ+/2lGcpbp0ALBTDjeOzJXNQqmnuVDle4iduB5dvN2rzhDckY+qtIzb
	 gs1CNuM6mGLr4omD5X5lb2yIJHjoEFVFY17i90YDIqHEiBZHsPoN/pZZJkVTJ0KPFp
	 EUeGwANAMrg4AicMXKhoLnEodEFkU0cutq7m4urrRAjYhUQUJ5q8o2+x5TkfWHjCPD
	 i91uDDI+3s3/ZTdD9a7P2TXIzuGYqpzF7L202zVk0SuzYL1uXQEo7tJ52MN1ssXopq
	 kuzwiBlPYX93w==
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 04 Nov 2026 18:27:26 +0100
Subject: [PATCH v2 09/51] profiling: report it when /proc/profile can't be
 created
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
Message-Id: <20261104-work-procfs-bugfixes-v2-9-bbf7d5546809@kernel.org>
References: <20261104-work-procfs-bugfixes-v2-0-bbf7d5546809@kernel.org>
In-Reply-To: <20261104-work-procfs-bugfixes-v2-0-bbf7d5546809@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1225; i=brauner@kernel.org;
 h=from:subject:message-id; bh=tYIXM5EjsYRFpz3d9CdZ23LhMvzI2JA5U8qSrxldqzY=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS9zmb5c+HYnPYns6fufFrw5b7Y3/kPP5ytKnep0a7Jn
 RU85ZS3VkcpC4MYF4OsmCKLQ7tJuNxynorNRpkaMHNYmUCGMHBxCsBEDoUzMjw1q1TdWGx2OGny
 nwfxD9yf9a1xbZhUXGz4leXXTAWLvycZ/tmE5T+0eFcqb8S9dXuWRJTqOn+e0/UWz2+d/yn/trX
 0PxsA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

create_proc_profile() returns 0 whether proc_create() worked or not, so
a write to /sys/kernel/profiling that turned profiling on but didn't
get the file reports success and there is no file to read the profile
from. Return -ENOMEM like the other failures of that write do.

Fixes: 22b8ce94708f ("profiling: dynamically enable readprofile at runtime")
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 kernel/profile.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/kernel/profile.c b/kernel/profile.c
index e7defa90a34c..820d5ec909d4 100644
--- a/kernel/profile.c
+++ b/kernel/profile.c
@@ -216,15 +216,15 @@ static const struct proc_ops profile_proc_ops = {
 int __ref create_proc_profile(void)
 {
 	struct proc_dir_entry *entry;
-	int err = 0;
 
 	if (!prof_on)
 		return 0;
 	entry = proc_create("profile", S_IWUSR | S_IRUGO,
 			    NULL, &profile_proc_ops);
-	if (entry)
-		proc_set_size(entry, (1 + prof_len) * sizeof(atomic_t));
-	return err;
+	if (!entry)
+		return -ENOMEM;
+	proc_set_size(entry, (1 + prof_len) * sizeof(atomic_t));
+	return 0;
 }
 subsys_initcall(create_proc_profile);
 #endif /* CONFIG_PROC_FS */

-- 
2.53.0

