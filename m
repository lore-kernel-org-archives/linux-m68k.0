Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793629655;
	b=RiNIXDKjyiEiIhvSZU54SNfN9HNkKkTpLhJExrb9fYgLGv0T+LAYo1FNm52jMgjPFUrN
	 /VG52eP4+mYgxP2bTTI/GlyyUp3h/8J5yGGpnmufrC57NR2xKsIUQpQyA2UkjWAB17H12
	 47uZE+TzJqK4ScxEClV1mPFr/FgP5gfFqvaiKlDu/A3QRz664cMr17zhyCdU2CJ47LEIQ
	 9t1swI+4ENfkMrQn5K4H3lWubIQoQ0GpCOuMBoSszTSEw07FsQsrmMFanEhK8G2f3Y6TX
	 rPlQszWEg+KWmsob8e3MczSBIZuGRb0vdi8+gQ72MqjqcYQtbOYm1CXHy2K4TlkV3Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629655;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=v5t8qKNo68SCWoforDimF8hL2ZYL+p0Okj8bWoZ1JT0=;
	b=n2fdYjIBIdu8zWUSViA5nX35Q2+XMTpAK7n9A6+KGyUL3Cd+WU3UXMxymhK4y5M57OoV
	 Dx6ztwaW0R8TjNmuP+59EgPoMAjIAJNem0jROOKgEsv5h3jPsJwH7CJvR4ftP5NtzDHsn
	 JdrPFp1HFhDUPy+3jwxVbEtb6GvIZdwJ6O+z1l9GChRB1laoXUqu7lEPoD1+01C0To0x9
	 rf9/WsLNtZ0Dtt68569x7Derz3Jdll4uRJ1N4wMrKPot7k4Tk1eKwfErhfLCb5kSrZhiL
	 HyAZyQsKMX8KhglGqRP3004wkF5I6iuKLARFN6Q/AR4D5QpcXLMsnw4YIz3u3/BsXPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hvt3N63R;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F62607CAB5
	for <linux-m68k@lists.linux-m68k.org>; Mon,  2 Nov 2026 14:27:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93F62607CAB5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hvt3N63R
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D7D6A60238;
	Mon,  2 Nov 2026 14:27:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFFDE1F00A1A;
	Mon,  2 Nov 2026 14:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793629653;
	bh=v5t8qKNo68SCWoforDimF8hL2ZYL+p0Okj8bWoZ1JT0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=hvt3N63R16p2fDZtChXjcMwdKVbvtxfkoL2k4OxbkJ9NXiN3sUvoI90Anz8tghLzV
	 tw7TRLB1mJI+ndKzKgYA8EusdDfCEFHDNDNB81AIW3QjjgCwg/TU6I079wNwJuekME
	 GgYfwUhSITW0rfvdsRQDJf8rj9zB05fpKjF8xVxdybjPcer/CH1qH37gxEgqe+026Q
	 OuFUuk+WcD3uSGWDc90qsgO7GgFfaxkgSrLrqyeXVxjbcarjoj5jc97EhboLO3/3O0
	 KcAvyFsBb08Hf5sOjHYp74WBf8FtRIs604ayotkQgHKNOSX4SCmldQ2ODja09nMv8N
	 2p+DzdlRSt69w==
From: Christian Brauner <brauner@kernel.org>
Date: Mon, 02 Nov 2026 15:21:40 +0100
Subject: [PATCH RFC 25/38] powerpc/crash_dump: check ioremap_cache() in
 copy_oldmem_page()
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
Message-Id: <20261102-work-procfs-bugfixes-v1-25-59422ed3e465@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1312; i=brauner@kernel.org;
 h=from:subject:message-id; bh=2dbZnDPFapx3dAW5qeN54CL6hHWBvjsrs28L3h6tsIk=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS9mJOT3t4mUyCor3Li661vsa/yObLOB7XeUji6boXCC
 secScIdHaUsDGJcDLJiiiwO7Sbhcst5KjYbZWrAzGFlAhnCwMUpABPh7WFkeC/LwqiVxiMX6PN4
 IXM3/4WNlnf/rlkw4SVrp5CBfEGgISND+4Gm4KSDXU7MDmLZHq5y5z4dYP+8p+ODD1PYa4mTduu
 YAA==
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

copy_oldmem_page() maps a page of the old kernel that isn't in the
linear mapping with ioremap_cache() and copies from it without checking
whether the mapping worked. If it didn't, the copy reads from an offset
into the NULL page. That oopses unless the copy happens to be a user
copy, whose exception table entries turn the fault into a short copy.

Return -ENOMEM like the other architectures do. read_from_oldmem()
turns that into -EFAULT like any other short copy.

Reported-by: Chris Mason <mason@kernel.org>
Fixes: 54c32021eb6f ("[PATCH] powerpc: Add arch-dependent copy_oldmem_page")
Cc: stable@vger.kernel.org
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 arch/powerpc/kernel/crash_dump.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kernel/crash_dump.c b/arch/powerpc/kernel/crash_dump.c
index 103b6605dd68..1543917bd3e1 100644
--- a/arch/powerpc/kernel/crash_dump.c
+++ b/arch/powerpc/kernel/crash_dump.c
@@ -86,6 +86,8 @@ ssize_t copy_oldmem_page(struct iov_iter *iter, unsigned long pfn,
 		csize = copy_to_iter(vaddr + offset, csize, iter);
 	} else {
 		vaddr = ioremap_cache(paddr, PAGE_SIZE);
+		if (!vaddr)
+			return -ENOMEM;
 		csize = copy_to_iter(vaddr + offset, csize, iter);
 		iounmap(vaddr);
 	}

-- 
2.53.0

