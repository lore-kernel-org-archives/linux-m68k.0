Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793821911;
	b=RIl42W3TU5uOIQLhtq4E2958MUHlPTEQTOzt61V9C66ZGr7LNvXlFDqm00aiz4kzdpUa
	 bWqQ53QReu7CEqqF4RL0fwsH/fQlEbfIFBd8NE4Dm3UMtTbd65YYku35iy22BHTR9oj5V
	 LQuAkrbSKK7cODouKssetsC1Hr7g7Cg3f+QqGQL4OA8J/NSQrmrcMop6kDuLPluIHsY+1
	 l/EIPtpzCUSrnSoL6tJnB5YH5cVx8rQV3EBtrcohzAVqzSUGEEktzo74b5jeFiCUOvNnz
	 St5v1JLIVqw40NWATOe12AzNhMpS5IdoCayYUTv03cdlSKY4SGpOvgjW4idNHEtErcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793821911;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=lzw2p1lwQVTXGjOVK+O2fRllw6EWFGiyVpP4wwnyOh0=;
	b=YH+5ixpWcZib7sjIkJUxc+cERvQBFtCWCP63SbbySIRbpFyvqyuVjXNn63mkuSnODfaJ
	 C00hZuG0s9B93nYZlbKiKVv5ks0aeeV4zzmDGFJyXxKOsURO2/ePdd/kvDUY2WTpFvj1I
	 l/3JrEd2+J25tfUt+Q9vqRpkaE10/ssjYrGf9K16suT3Tss4v3mwb0aup7fyhbgLv8sIh
	 G6TvSmU1A0ud9czuk8iygxlZpgEz9z756F/a3Wvu//S4IbJrBhmCb5X7HjD/CHjlIaxhI
	 8wZYyyf7qfF/NLdRYJE4iCnl3IV2/nx3HI7saROtnBwGZUchDrnGu0RHpzY2k74BBlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QAJQ3+WL;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60E7606C45B
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Nov 2026 19:51:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C60E7606C45B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QAJQ3+WL
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 84484417A1;
	Wed,  4 Nov 2026 19:51:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 515511F0093A;
	Wed,  4 Nov 2026 19:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793821910;
	bh=lzw2p1lwQVTXGjOVK+O2fRllw6EWFGiyVpP4wwnyOh0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QAJQ3+WLDUkYLImp3HYyJ9xNQzT5ktofk3vTOb5CY1yyjGgMiMLV84eXcv7Ngn9pO
	 0R1aIfFok0raVnzXU9Vxsqv/+8svHg8UrA6VN+qDutbG0MoaDiCzmWdmWTuVYeXa/I
	 N2GChnCG6weK3daO3o2GHaFO3/dOVqhIMLzDjlCpOjj7c7+2YrdYYhUy9NCshP6wdl
	 Lk+TkGZGwLWFEFiLx/wufa/ZxQYuvNY4PHonWIRM9HX3gymQ16OIyPKKYKRaJNOE5j
	 ooOiwYlFZWYxO07ewx8hUYCero4307WQRVTKLVnFylG/X2Vx0yOkMhn63aRL8xUxMW
	 sonQvq7YDKhvw==
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
Subject: [PATCH RESEND v2 08/30] smb: client: let procfs own the seq_file of the smbdirect files
Date: Wed,  4 Nov 2026 20:51:35 +0100
Message-ID: <20261104-work-procfs-fs-v2-8-319e0f9a8aae@kernel.org>
In-Reply-To: <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
References: <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1034; i=brauner@kernel.org; h=from:subject:message-id; bh=RIZYcDqYt7NhFvt2L4C6pTMn3DylkXBLCyRwuGHjm7I=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS97jG5tPWrw/cVrCsb765In/OBvcn09R7LsHQ9/q6+O V1HHE9ndpSyMIhxMciKKbI4tJuEyy3nqdhslKkBM4eVCWQIAxenAExkz01Ghl3rSlga96Rmhvie 3JVu2vHMZ1KgvNQ2f7ZfM06avi3c5s3wv8ZDfv2t3meZR3nKlGZN/Jj7Lukpr3r48QVnD/23mvz tIT8A
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

Declare the show function in PROC_FILE_DEFINE() and let procfs open and
free the seq_file. That makes the open functions unnecessary.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 fs/smb/client/cifs_debug.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/fs/smb/client/cifs_debug.c b/fs/smb/client/cifs_debug.c
index dfcd2cdbb2a8..664072ab3342 100644
--- a/fs/smb/client/cifs_debug.c
+++ b/fs/smb/client/cifs_debug.c
@@ -873,16 +873,9 @@ static int name##_proc_show(struct seq_file *m, void *v) \
 	seq_printf(m, "%d\n", name); \
 	return 0; \
 } \
-static int name##_open(struct inode *inode, struct file *file) \
-{ \
-	return single_open(file, name##_proc_show, NULL); \
-} \
 \
 static const struct proc_ops cifs_##name##_proc_fops = { \
-	.proc_open	= name##_open, \
-	.proc_read	= seq_read, \
-	.proc_lseek	= seq_lseek, \
-	.proc_release	= single_release, \
+	.proc_show	= name##_proc_show, \
 	.proc_write	= name##_write, \
 }
 

-- 
2.53.0

