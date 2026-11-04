Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793814617;
	b=Jhbck3PwCQSuZtO0ui1UBlj0vEyNmZ59m5Dg41rLdFYfNlG2x9n8ZnvJ5uOHFKevnIFM
	 NQImMCIdFla4erckYH/dwStJRFCEby62kYg0s3r2pQdSjxTB6KdYlDnVxdhu/uOjK2uLv
	 oFbMPVNlfkJuzXIVFCWauX+oI2lBKPtgNALIFPf9Jjcw/95pb4KkXZjQ0JwZoSdeVInOh
	 Bxjkes78cbuQndp0qU81Cn9CFqetRRAyjSy2w0fOjEVhDSBwiZLBdPi9HXoDihZjcP8b3
	 NqmYZOcSut8V0dFxrQA25KsraIq42eYae4xX7JLZaHsHC4klWSXFsk/iYNONMMOXLsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793814617;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=Ayyh3GSY9IX8l/NxmtUwOJrSt8ohKQ1xsnTJeKuAZFg=;
	b=TDxHWXk1iRsFMH5DrZtajMn3RqrgfGrlewwd7jx6Tom6V+kxA5NswuNx6KxRMuV5tsqI
	 qSfXRXETGLj5iRIOsNmO39KKoah4jSBVPuFgykW3+ziPLaI8Fmz6oJBLy2+HHAl09JHgo
	 MFK+93qoTA8cnHtflurKSvlh5Cfl3aKO2zdRuOqGwGEemH5REoqxb9+qIxAVFu6dO2YU4
	 7RD+pPOHzLjgKYuvcaHRFcHPTs/T038ufti7FAsMKStsr+hZynswi7J3NtCJ1gIKmWFAa
	 jjeZrPLM8tYwTpsPSORopirkJk2bqardoTDVW+wb1xLADPRn18iP5Im80SZLLBbbomA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IGhyitu5;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C444606BDEA
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Nov 2026 17:50:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C444606BDEA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IGhyitu5
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9CC9E609EC;
	Wed,  4 Nov 2026 17:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EC531F00919;
	Wed,  4 Nov 2026 17:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793814616;
	bh=Ayyh3GSY9IX8l/NxmtUwOJrSt8ohKQ1xsnTJeKuAZFg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IGhyitu5c+TLBGkN2ZGwDU5Rsh1w/dzPMJRviHA5R0mqU+LsoYuTVg18Jscu2+6e9
	 Bde/aMBOPoYzdl/OGhbYhq2RMksr0qSkO6OBBKfsIB2QpTbcfD5O1d7DOOn6y0WboD
	 luv6dPR8E2zuVmQwRu6+4E313LCJ0DI7VA+RNwygcTxJ2P+0Zxk4UQl+ViD8uLTSyj
	 0Bj56pQlnnoENGhH5tM4j+e/k88FvtR06w4zxZ0OD2mDGN5+rEvzwyzh17+R2wIXby
	 my99TU5Vz2jDt+TrjxUCacOsyHguhDC7NltTczyRHXx91ZO5qtVY+n6qU6a+sO5L4R
	 ZOW5mHfdcdKFg==
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
Subject: [PATCH v2 20/51] powerpc/rtas_flash: don't read past the validate message
Date: Wed,  4 Nov 2026 18:47:06 +0100
Message-ID: <20261104-work-procfs-bugfixes-v2-20-bbf7d5546809@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1303; i=brauner@kernel.org; h=from:subject:message-id; bh=7JHU1Fe1PUKfNakrIeb+3f7MU5rT/9SRwlQjBFg57NM=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS9zru+45fmhHOmCTv0/xXyljhu8Ir9cn6xZ2brsiN/Z jmlm2+821HKwiDGxSArpsji0G4SLrecp2KzUaYGzBxWJpAhDFycAjCRKEaG//GPri/6rCTy5+J8 1kMXe3b3xt9+LRAy/bux8ZXk+aLWoroM//OvT312ZfeyeUVOzxsmOu8P7DVL+ub/7E+HuUjwFae yubwA
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

get_validate_flash_msg() adds up what snprintf() returns, which is the
length of the whole string and not what fit into msg. If the update
results the firmware hands back don't fit into what is left of the 256
bytes, the length ends up larger than msg and validate_flash_read()
copies whatever follows it on the stack to userspace. Use scnprintf().

Fixes: a94a14720eaf ("powerpc/rtas_flash: Fix validate_flash buffer overflow issue")
Cc: stable@vger.kernel.org
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 arch/powerpc/kernel/rtas_flash.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/rtas_flash.c b/arch/powerpc/kernel/rtas_flash.c
index 722dbfb6fbf8..f1cd105f7426 100644
--- a/arch/powerpc/kernel/rtas_flash.c
+++ b/arch/powerpc/kernel/rtas_flash.c
@@ -448,7 +448,7 @@ static int get_validate_flash_msg(struct rtas_validate_flash_t *args_buf,
 		n = sprintf(msg, "%d\n", args_buf->update_results);
 		if ((args_buf->update_results >= VALIDATE_CUR_UNKNOWN) ||
 		    (args_buf->update_results == VALIDATE_TMP_UPDATE))
-			n += snprintf(msg + n, msglen - n, "%s\n",
+			n += scnprintf(msg + n, msglen - n, "%s\n",
 					args_buf->buf);
 	} else {
 		n = sprintf(msg, "%d\n", args_buf->status);

-- 
2.53.0

