Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793819922;
	b=Auumxfx/os5C8DyI0ERWKpvQFHmP9o3tSE8/1vj6ieOCqv9Xn0x+fS/ug0bcv8ph0ccG
	 U8BZjqvR0f9n4B4QXSbAgcv0mUfi0GFAX1C6kO2T79/8wzvG8+fR0y1nkoUbNWn/I/woJ
	 j9cfAroRq/IqWc0MZC4S6hDnjQ4or625ru6RiF6Rdt8e0W+mCJO4LjK8kuqQgKIpKX4VN
	 E615madTWH8fP+0ak/W2uvXA/LCm6RysW10lsr+rs5eieLaeRWwmi91D/Xz7YhoDEHrT9
	 ENVfJsp55KY5TUEllfFFHngAR8CILPTwx9B4yJI4AcBPALfX7jqzkZSIng0xDmVZ3HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793819922;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=Di83VHF6QbwHOpQhBimI2/C2To6SvYozNijzJKB62VA=;
	b=pgXeaEPivBr9zjmCB5mf5bzxPW4I9HXB7llTppuKFN9dlZIiBRqAiDTJTOoqakQHjxAu
	 LkfznNHGb7cCCy0nPwr0/wEYzLmtItPkszRx5UPi3EZJLdSf4cno9IoWv6NoSkQDjlUCV
	 ISCF/vXIgY3fA7M+q221vbRh5xkaJZhq52KGWKzttfy/cqlzZjX7Ax2ptv05o6DFpkD/I
	 8t6dr8xQNSx+qi87qjpfBMc3oIFrMw9ptTMQ2WHdGsfkgB4zLZTJ3EpcdkppsZ2yB7dhr
	 vZNyfxK89P+eSBMSn8FVLWjzzwE09wuWsyu9r4t0+Y9i0/pwwjf2gHs2+Ax1YmDgGPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JIdLOXp6;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6010606B2FD
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Nov 2026 19:18:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6010606B2FD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JIdLOXp6
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 437B460D7A;
	Wed,  4 Nov 2026 19:18:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEFA51F00A16;
	Wed,  4 Nov 2026 19:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793819921;
	bh=Di83VHF6QbwHOpQhBimI2/C2To6SvYozNijzJKB62VA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JIdLOXp6sxEmZBJpMlxDZmERDwf9C8sLM/z2dbJBoBY9UBXkGBGAj7Yxhgr3YbwIo
	 WLzNZhjCHsHdhaQxnTFFO0VEGKxMv1vINJffnyQzpOIw9IevG2oqGRabpoxY4U5ohN
	 dsW1/Ep2BQuneanTV1J2VPfld0/EzmI9Txpbh/m9xuzYl3I8AGELsVFoKVbyxoHr4k
	 3c7remBwAQpRVBw2eStXkccOoVSUONc3WQN6TCMP9ZphCN52UWu0ZYRKWjmfYAQkhn
	 K0VZsnobCWkJjfjb7T3ZWzf5xxANP/HeKYAhnhy6yvKDBY5FqItsSBFDLO5ybI5gH0
	 NwA1fy8O+LCSQ==
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
Subject: [PATCH RESEND v2 10/51] zorro: size the proc files like what they serve
Date: Wed,  4 Nov 2026 20:18:26 +0100
Message-ID: <20261104-work-procfs-bugfixes-v2-10-021c84d852e0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=796; i=brauner@kernel.org; h=from:subject:message-id; bh=l/jVDuzMOjj8ie0SJoZ9zbu/qnGtbORxwaULd7yJNic=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS9bryu4qPpOT1kc4isZaDhv1/bXwk9vbD2UmCm1l1v/ 29zJLs2dpSyMIhxMciKKbI4tJuEyy3nqdhslKkBM4eVCWQIAxenAEyk6jwjw6sm06P+wcoHVfTf +okVXHjMEBzWYri1p826+M+MhiW+0owMC9vz1pp/V1r0kenzR652vZM5y5jOqWdbe18R57A5vkq ZEwA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

The files under /proc/bus/zorro hand out a struct ConfigDev and seek
within that, but their size says sizeof(struct zorro_dev). Say
sizeof(struct ConfigDev).

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 drivers/zorro/proc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/zorro/proc.c b/drivers/zorro/proc.c
index f916bf60b312..4c6f8f1c4d71 100644
--- a/drivers/zorro/proc.c
+++ b/drivers/zorro/proc.c
@@ -108,7 +108,7 @@ static int __init zorro_proc_attach_device(unsigned int slot)
 				 &zorro_autocon[slot]);
 	if (!entry)
 		return -ENOMEM;
-	proc_set_size(entry, sizeof(struct zorro_dev));
+	proc_set_size(entry, sizeof(struct ConfigDev));
 	return 0;
 }
 

-- 
2.53.0

