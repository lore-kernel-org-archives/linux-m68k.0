Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793819951;
	b=W4rFwzuk92ZJTWxKQrzw0pJRLl4z6/9HpezZchDitLWmLH/FeKGr1/HXhnFoDhVc0A/U
	 RIAx4C9xiMWkDkPxFhBln+i0ryF70aqERuhB+Qbla19H43LJvL4TwLNt8KEIQ7AdxS2H5
	 vpITCi9LoGCK+cjRNgwEqU9lX0hZdwSCFe40NZI/Ty0Au2fMeEgyXzdpTyAB21i8/lLjd
	 /q4zWCvBC36sxVUL8ZQ3leCMSZlE84AhMdG+5LAC32Xl8Y7Xy7Jt/w+ekpv7TIcKh4efm
	 hvED6HPshwYLn+24PWKMSX8ADPLF9wvW5QPd+2SQj6F2cuCSFUDGJ6hS7Eidz2LsQiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793819951;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=mdnthwMs9LvqnLJy6kPpeiwqrlhi6ADC7izliWiN2IE=;
	b=3YXDdSXs9N3lII+FzAAMuOYJjzMF9QLyI6YEcZAgaVpkD03zsqimn2AG3rT50jke/7JQ
	 S196lQffwkAJabS5rJHng4CfNWbWzwlHu6sRG3cvS26To15P4YDLjVSHyLul1/9YOhZkX
	 8jQC+QGYAqZWrFX3wnonD2gbOGgUyr73JK4VUnUZ7LUFvqw+5Minj34DVE39ELhInU5EY
	 /EClwMSvci6pwGGOUE8HP7UfdbdD1VWNxrxPdu5nOzOVYeJvOyjoqfslnMc3tTJ3i6d/v
	 bzMLeEQX/C3YNL0MFiMP4FavjcCMCDS/B7gKjTc96sRSlRVCzN4FrAgGVaqMVvgHriw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ijnLltQe;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7239C606D4CC
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Nov 2026 19:19:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7239C606D4CC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ijnLltQe
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B8B2660AA2;
	Wed,  4 Nov 2026 19:19:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C86A61F000C1;
	Wed,  4 Nov 2026 19:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793819949;
	bh=mdnthwMs9LvqnLJy6kPpeiwqrlhi6ADC7izliWiN2IE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ijnLltQe5Qk+CqE+VUlDwwHbbObH+9ltW/RmuNk6+QVTedz2m/LYfiuF9co7AFJwE
	 sjrkuOfRO38+K7HcQrICBAwdPPqSWw81opUhQAieZFdKhLDYrT6ksUVuCvctpIzPGG
	 5IfV2bo/AIGZF92z/NIw2/tSYbEzpTKjlj5R/IpCOGOCq9t1qLgWWrxzM1Ldm3iL6v
	 jl4JL0l0pT78R+g4k6uEp1SAko5fY5xHs148DGpmxVJocVPvD8ORDyvyCDVv0yKLOp
	 0BGiObxQ1YUEMDTuDs/OR2Xrm+87BYRn1BsklV+azupKzmP8Z1i0K9CmVfX9sZIjIF
	 wvV04uPKt3MdQ==
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
Subject: [PATCH RESEND v2 12/51] powerpc/rtas: consume the whole write to /proc/powerpc/rtas/progress
Date: Wed,  4 Nov 2026 20:18:55 +0100
Message-ID: <20261104-work-procfs-bugfixes-v2-12-021c84d852e0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1217; i=brauner@kernel.org; h=from:subject:message-id; bh=uNEn+pHXbIRRMkqtNF6NnFXDW3eMy9Pk3SJ7wJuNwck=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS9brzZHzRlctZde+1Go+8eGv7b1+cVSZ7+f//NhYzz+ 8+/DW/t7ChlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZhI5ROG/2mHUo8Ur0zzZ3Z9 kx7D/2mua/jtI8eaYjr1fyTPTo02WcfIcOywWBSj5altb2eddZvFnrJ1ZrTjumSG/rNnerMtg50 vcgMA
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

ppc_rtas_progress_write() shows the first 255 bytes of a write and
returns that many, so a writer that loops until everything is written
shows the rest as a second message. Return the whole count, the rest is
ignored.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 arch/powerpc/kernel/rtas-proc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/rtas-proc.c b/arch/powerpc/kernel/rtas-proc.c
index f38df72e64b8..89b165986851 100644
--- a/arch/powerpc/kernel/rtas-proc.c
+++ b/arch/powerpc/kernel/rtas-proc.c
@@ -311,6 +311,7 @@ static int ppc_rtas_poweron_show(struct seq_file *m, void *v)
 static ssize_t ppc_rtas_progress_write(struct file *file,
 		const char __user *buf, size_t count, loff_t *ppos)
 {
+	size_t len = count;
 	unsigned long hex;
 
 	if (count >= MAX_LINELENGTH)
@@ -324,7 +325,7 @@ static ssize_t ppc_rtas_progress_write(struct file *file,
 	hex = simple_strtoul(progress_led, NULL, 10);
 
 	rtas_progress ((char *)progress_led, hex);
-	return count;
+	return len;
 
 	/* clear the line */
 	/* rtas_progress("                   ", 0xffff);*/

-- 
2.53.0

