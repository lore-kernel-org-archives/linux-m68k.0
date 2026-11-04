Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793814545;
	b=uf9KeaXLe5zdsBe8URFnsiGZ3Lf7bIUn9l8vrOcriyg4fLw2Mm8/cWaMblKAFfdOhorM
	 smJJNf53tql0Uy6BamrGrfW8/9AxMhntM2DmtsKF9xi3+ulINa+8EzUAPasoPOFJ/G51s
	 QmttYVCbCRzEpdfRcaJneEqVuonG5OS6SlgEMMHC8Ce3OUfL5rTHQlJ96V9L/g008C48T
	 +ZuX0jZ2SPeV4dKabr4HTCQwu/rm4DzqDL+4kZOfWbIjxtAqxu+ziS7iXrgPMfhn7vU66
	 PU3meT0FGjWRgHn1d18+FzTdXvn1fpkyJ7kQip7EJu9Rupoz17ZOsfKfZY9r1r5y0ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793814545;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=bK3Qf/Fgrn1kHJyqbDbeKZxjvVolEa0ioklWbWt66po=;
	b=GgHYQLTBzegHguBdZYHTOXyUViFlfzvrDqgWfoj+Wp9be+P9nEjVdnYlG5p/2k09x06P
	 XzH4NjJ29qPhD1H5opGGRK7WEh+9JlCkkKfP2rSjEVl1UJTICu7FJ2U+y1pnemb/qnN9i
	 sRb3jqcPVrTJ1VpEb0vP062D1r+7+R23LTAZJXVhyTbCPnTZkCUhnkBc/kAGZsHM58pM+
	 Qcuc3PkYiw+5kuf74Vwk8WjsxB+hw7SYJI3RAUIF4hPnd+GLN3kOkV6GKY2D74MPSPz/z
	 Zn8o5NKTTeTAtUGQx50utHakGBztbl3FtDJc8TPhrs1AMu+jyo2QxMfio61ijmdcnCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QsOdg87q;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB98606EEB7
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Nov 2026 17:49:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CB98606EEB7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QsOdg87q
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 96B28609EB;
	Wed,  4 Nov 2026 17:49:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB4F51F00919;
	Wed,  4 Nov 2026 17:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793814544;
	bh=bK3Qf/Fgrn1kHJyqbDbeKZxjvVolEa0ioklWbWt66po=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QsOdg87qWEg4aAKfu42To6vm/UZV1yNeYmTYxJ9SEUa/L2vi7OcsNlGlo2QQG2p6e
	 34AxPqlbbt6FZqDFJFIZMQiw2QLV0hsb7qkRHhaUHYG8OhjWZZxNbDfCtYWBXY66dR
	 VwZtDdP5yKhUNn9j7efRMjKG472FghHcQMK4JtIsnl4KhIMc8luozwn9XNgpb/dLym
	 jnqFG/d1QX/MfntKNGND0ysdcv+kpGphBM4Ug63Wx4kZTxmszYwPEvM/O0aBqXbUjj
	 pg9EfmnQMNMIXhEAC2kHoCZcfVdgQDKxuS9t66VW2im/z5SAnSAWeh1gNRAJCCLFig
	 V6dyyYC8gUYnA==
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
	Chuck Lever <cel@kernel.org>,
	"Rafael J. Wysocki (Intel)" <rafael@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH v2 16/51] PNP: isapnp: don't read past the end of the buffer on a large pread()
Date: Wed,  4 Nov 2026 18:47:02 +0100
Message-ID: <20261104-work-procfs-bugfixes-v2-16-bbf7d5546809@kernel.org>
In-Reply-To: <20261104-work-procfs-bugfixes-v2-0-bbf7d5546809@kernel.org>
References: <20261104-work-procfs-bugfixes-v2-0-bbf7d5546809@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1354; i=brauner@kernel.org; h=from:subject:message-id; bh=PRZX3tU6vm07qtbuZVgSHwh1cNhLueRVjGfMu08d6P4=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS9zrtUYRVq+tJ15s3yZb8YE8ruM70T7nORa7gzVYHp6 IWYiau+dZSyMIhxMciKKbI4tJuEyy3nqdhslKkBM4eVCWQIAxenAExkayzDP437H9oT5hamvooK OVxRlmLxXWH+GcXu85dCX7799vrxjHCG/1VvHrytuewz1X2zy+xnicIPZ+XMqNI6IcTmwLa42Wc DJzcA
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

isapnp_proc_bus_read() truncates the position to an int. A pread() at
an offset like 0xfffffc00 turns it negative, the check against the size
of the configuration space passes, and the loop then puts everything
from that position up to byte 256 into the reader's buffer, no matter
how few bytes were asked for.

Keep the position as a loff_t and clamp the count against what is left
of the configuration space.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reviewed-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>
Cc: stable@vger.kernel.org
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 drivers/pnp/isapnp/proc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pnp/isapnp/proc.c b/drivers/pnp/isapnp/proc.c
index b3abab24050b..1829c20d5446 100644
--- a/drivers/pnp/isapnp/proc.c
+++ b/drivers/pnp/isapnp/proc.c
@@ -23,15 +23,13 @@ static ssize_t isapnp_proc_bus_read(struct file *file, char __user * buf,
 				    size_t nbytes, loff_t * ppos)
 {
 	struct pnp_dev *dev = pde_data(file_inode(file));
-	int pos = *ppos;
+	loff_t pos = *ppos;
 	int cnt, size = 256;
 	int ret;
 
 	if (pos >= size)
 		return 0;
-	if (nbytes >= size)
-		nbytes = size;
-	if (pos + nbytes > size)
+	if (nbytes > size - pos)
 		nbytes = size - pos;
 	cnt = nbytes;
 

-- 
2.53.0

