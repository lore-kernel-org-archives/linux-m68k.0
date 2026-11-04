Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793821362;
	b=vjmlrEMPby78cyFE4+522WkJ9jAcexnfL5x0kYow+vn4BxJlX8vXiGj921A+7GvCKOJD
	 BKuMCd34fyCPngo7cQQ8W/mBZrK2UYEBUlDn29HV4JTPIRqJPS8b+EMiTLQ5acy/IOSQR
	 hifAFYNeMtEgJrEhH8U1JZr/IHPpVFnS9De7pUv6zx+iomiU1adnVE/v5703J3vKt6YOy
	 mBzmFO1nXq+iEnhwh4gt/O0vcsAo7VWiJN2N7zP1iaOWF54avSgl2+p80ipINGdWXXbey
	 U7Mk7KqvI3JEdcIwa68j2HspPEwnJGbcSBNFP/bdDeOKUrZjYNwbzcZkqLb8x1aZvyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793821362;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=uhE82sMafPzxvfPBNz7KCycPN06o3nm9WBF7ozqhvvQ=;
	b=m4mrBaH6Etk0mqoA6HpI7TzNEb5KgWUWg8kK6hnwxeflFETncV3a380b9wAQpPAbVhMi
	 vzPltJPAnxEU+BltNUCqPi7RmMChhXpe7h9ZQjlSuZZDaWVKihYoL2xJC5VgTMI54kkv8
	 fM66W2VS/kwY9IEN5JX5So8sbVqMe5cw654QCWsF5q90/ZAmclxdGvrfW4taECMmkgbM3
	 suIvLhEO8o17MLu6lAwdGpoVanOnSzR8Tlsx8/H3YZqxBHgL2BbcZMlylFP53chHmOaHe
	 oFtI0TELXjsJcyRdDHlXfFeKIB3WCRhdAZocdt9xRa5bl5eQcGbPXNbiKZMCxY4sOFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CY3vhRi4;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D176087D0C
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Nov 2026 19:42:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34D176087D0C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CY3vhRi4
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A9CCE60F10;
	Wed,  4 Nov 2026 19:42:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43B831F000C1;
	Wed,  4 Nov 2026 19:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793821361;
	bh=uhE82sMafPzxvfPBNz7KCycPN06o3nm9WBF7ozqhvvQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CY3vhRi4hQxkqcpQ1Mm/O3l6e+OzedeN/4+37SeNZjOvlqXmy34qriVvD3TH67ywH
	 DQzl6FzuyIa5uiOv7Dc7vMjmQMkxqYHlBr0eMd+Xera9VB0QWJPHsXDK0rpkNzXBBK
	 tX9Y7Jq5/fQhLGsvIaKNSEhYv51qK+oUfD0NCrdQZjRmHE0FizjDeNxZM3dzQpWJZy
	 HRwBQTyj5k9AawVsBYNGBCFZHPpK+UsKw3yqcCB9jomRWBq8KMKMHMiOAFjbyWU1JH
	 JbXTNMiiUjnz72MrV0u90yAZ2M59tRnRkIXF5dI/J/zo2XxESLkUQl4Q5E9EaHZPuO
	 H5e07M+u+h5bw==
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
Subject: [PATCH RESEND v2 01/26] nubus: let procfs own the seq_file of the resource files
Date: Wed,  4 Nov 2026 20:42:27 +0100
Message-ID: <20261104-work-procfs-drivers-v2-1-245e54e87116@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1301; i=brauner@kernel.org; h=from:subject:message-id; bh=x7z4QEHcj9RNvDtDgoKANKctl9Sfloc7qmQpa+Y73Ns=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS97ioOOa68o/Kq2fmOY5NWuTU8iP3ZEGF+bqWx4z+Wl OQWlcZPHaUsDGJcDLJiiiwO7Sbhcst5KjYbZWrAzGFlAhnCwMUpABP5yMrIcHHmjxMtv47deeBR f8hmwmHx04XBoiyTn7ROi1p5ovDEfjGGf0pS7v/tJ675tu3LE5ZOszvfVmhY9L9Rd7yQdf+7rII THxsA
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

Get the inode from the file instead of ->private, declare the show
function and let procfs open and free the seq_file.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 drivers/nubus/proc.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/nubus/proc.c b/drivers/nubus/proc.c
index 3ea3d1738eae..cb21ad1d9964 100644
--- a/drivers/nubus/proc.c
+++ b/drivers/nubus/proc.c
@@ -107,7 +107,7 @@ nubus_proc_alloc_pde_data(unsigned char *ptr, unsigned int size)
 
 static int nubus_proc_rsrc_show(struct seq_file *m, void *v)
 {
-	struct inode *inode = m->private;
+	struct inode *inode = file_inode(m->file);
 	struct nubus_proc_pde_data *pded;
 
 	pded = pde_data(inode);
@@ -138,16 +138,8 @@ static int nubus_proc_rsrc_show(struct seq_file *m, void *v)
 	return 0;
 }
 
-static int nubus_rsrc_proc_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, nubus_proc_rsrc_show, inode);
-}
-
 static const struct proc_ops nubus_rsrc_proc_ops = {
-	.proc_open	= nubus_rsrc_proc_open,
-	.proc_read	= seq_read,
-	.proc_lseek	= seq_lseek,
-	.proc_release	= single_release,
+	.proc_show	= nubus_proc_rsrc_show,
 };
 
 void nubus_proc_add_rsrc_mem(struct proc_dir_entry *procdir,

-- 
2.53.0

