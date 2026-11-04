Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793819994;
	b=TQTH2bGQuh5Q1JVaqH3aO8JF+/zWo3Jp6G6DbtPZCmii1MSMhZWn4STy6R0Xtja9FBOu
	 lH8t76V8sJMS+suIpGiUJNqhKPD+wAVuZIgssa+gyjqzL7y1fBH9dxZ2/pv55UiJxasC4
	 +1zDNGmWW6ckY6AwhrYMdpYLVk0llLZ967/T4yxXFdV3styhudyNRtNbe1/H9kPQmNaBN
	 tmI/2c//g24wWCJuPIIPoO0V1wmweC5/ir4DdMoC/4NJZCmxDDVGAj4PUJf1YEcPSXzy9
	 nuUOWaMPubsvmcsA+qCaUQUyHZ8RID0pwOTYl4trT3a80+1CXCtI07MVwvtrXH5bfPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793819994;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=0oFqdYtQQ93hmf66Xu9P3kJmoMCkLJeiEqd5UgVqoAA=;
	b=NrmGz7FYldCdx4VnMe3WAlmTzzmac2cgWIlWfcPG850udDq5rCca0MMb9dB26z46jZib
	 r1Xu6aE72Vo9IKogdSCuavFlVwfMQMvBqhAnYSHKc4F6DB0sn6R1xFgV8kaysfDrH8aW2
	 JuJEpPASsWuLZ1VtMh7ZsUdvU1xsveZg+D7u20Qw3qUaTSJzF4SBWcCpXYMuHsBg+SK3n
	 Q5uT4o+9PUxNmhkr1kzxeSdzJkjru0eaW24CPZfQFdbXUDrPWxltjNnkkE8Pqkzf+eK2c
	 cEBKv3GTdy7T79f/gb4MRCZq0HGkjH+dHaohJJ5h8eS0Ab3znCI9TkzrNZ7VGADybkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hz+Hi3BA;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43AA60A5BDF
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Nov 2026 19:19:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C43AA60A5BDF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hz+Hi3BA
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2A7CE60A86;
	Wed,  4 Nov 2026 19:19:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00FB41F00A20;
	Wed,  4 Nov 2026 19:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793819992;
	bh=0oFqdYtQQ93hmf66Xu9P3kJmoMCkLJeiEqd5UgVqoAA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hz+Hi3BAL89sr/lh4dJvgeuEtclyRy1SO0NwI+zM8ybFv2jV939+Dv5j/nFojjivC
	 34KWZ812aeES23dMGvAnt3ycz/SqajABSGrcdN3MX9xaOrork7AxoU/7QteXfxvHfl
	 /V4rWTo2CoC5Jzjt8ZGo2GAXtUIc69Tn9FoUURbwhYdsskX97AesbdGMm73a/kHJmu
	 TWwsRNLr3d8FIdQP7kWnDBE0CbOSCCNE5mAI3+7DlKk2UgHvWoVbDBDqf4bqYXIQ1F
	 1/2Tfi4Gd8xeoe7KjATEoAV/9UDvE75iATYms6WdPb3WRBuJ8ZphmbEUZbFmU49bNO
	 mp7Eo0gjrTdqA==
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
	stable@vger.kernel.org
Subject: [PATCH RESEND v2 15/51] PCI/proc: don't truncate the position of config space accesses
Date: Wed,  4 Nov 2026 20:19:38 +0100
Message-ID: <20261104-work-procfs-bugfixes-v2-15-021c84d852e0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2714; i=brauner@kernel.org; h=from:subject:message-id; bh=57Zv3BgjxHPYJgAYtfWWUhWCD6jzurA4v7Zp2iJg+04=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS9brzb+9rGxHjWvh7zmt3Cx6bFvVAJkBPctFNvxnKOf apBXbbyHaUsDGJcDLJiiiwO7Sbhcst5KjYbZWrAzGFlAhnCwMUpABNRf8Twz2qLtYhEpvbj94Wu aQbrKrb8tHnS1sSutCx7f+mETxuYtRn+Cnk3vJkpqGW+cuXUS7IR5159W7FMY03xNO+3W9a/8tV 5zgYA
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

proc_bus_pci_write() truncates the file position to an int. A pwrite()
at an offset like 0xfffff000 turns it negative, the check against the
size of the config space passes and the count it clamps to ends up
larger than what was written. The loop then reads past the end of the
caller's buffer and writes all of it into config space at negative
offsets, which pci_user_write_config_*() pass on to the config
accessors unchecked. The write also returns more than it was asked to
write.

An offset above 4G that truncates to a small positive value writes to
the start of config space instead. proc_bus_pci_read() keeps the
position in an unsigned int, so a read at such an offset returns the
start of config space instead of hitting EOF.

Check the position against the size of the config space before
narrowing it.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 drivers/pci/proc.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/proc.c b/drivers/pci/proc.c
index 3d7a9ed5fc22..e0dc70123f82 100644
--- a/drivers/pci/proc.c
+++ b/drivers/pci/proc.c
@@ -32,8 +32,7 @@ static ssize_t proc_bus_pci_read(struct file *file, char __user *buf,
 				 size_t nbytes, loff_t *ppos)
 {
 	struct pci_dev *dev = pde_data(file_inode(file));
-	unsigned int pos = *ppos;
-	unsigned int cnt, size;
+	unsigned int pos, cnt, size;
 
 	/*
 	 * Normal users can read only the standardized portion of the
@@ -51,8 +50,9 @@ static ssize_t proc_bus_pci_read(struct file *file, char __user *buf,
 	if (!nbytes)
 		return 0;
 
-	if (pos >= size)
+	if (*ppos >= size)
 		return 0;
+	pos = *ppos;
 	if (nbytes >= size)
 		nbytes = size;
 	if (pos + nbytes > size)
@@ -119,9 +119,8 @@ static ssize_t proc_bus_pci_write(struct file *file, const char __user *buf,
 {
 	struct inode *ino = file_inode(file);
 	struct pci_dev *dev = pde_data(ino);
-	int pos = *ppos;
 	int size = dev->cfg_size;
-	int cnt, ret;
+	int pos, cnt, ret;
 
 	ret = security_locked_down(LOCKDOWN_PCI_ACCESS);
 	if (ret)
@@ -130,14 +129,16 @@ static ssize_t proc_bus_pci_write(struct file *file, const char __user *buf,
 	if (!nbytes)
 		return 0;
 
+	if (*ppos >= size)
+		return 0;
+	pos = *ppos;
+
 	if (resource_is_exclusive(&dev->driver_exclusive_resource, pos, nbytes)) {
 		pci_warn_once(dev, "%s: Unexpected write to kernel-exclusive config offset %x",
 			      current->comm, pos);
 		add_taint(TAINT_USER, LOCKDEP_STILL_OK);
 	}
 
-	if (pos >= size)
-		return 0;
 	if (nbytes >= size)
 		nbytes = size;
 	if (pos + nbytes > size)

-- 
2.53.0

