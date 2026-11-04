Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793819820;
	b=RDF4JAE4PEJ4d9YxpREPEC4ezbY9mBunYv83kkpT+87rV085f0CWdTkGfsJB06Su9BMX
	 6kDf+bUe5JpIkKZjZ+xc6/ldsbDS7TLYVtesEIJy+5go+Qrnr6qsOBYarNhb3VR/+ANCl
	 CMPaK1R1/QrYiSgi1cIG9nMjIdRzIkdcvCQ8iWvxYbS2Hhi6ep+fSZZmiUcnJtSwDFH6n
	 CfBLzmcfRSnjZNo1PwEaj+9aJWPaTm3N0biiKANJ29cNUnj8pGFwVgpMZLBDdV/C0Ewa8
	 nFDdnyMdAaQtShoojBF/cUNOSr3j5AULd+U9y/1IAXzmhz5XbidVy9KRERgMOclhRJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793819820;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=Cbujoj2vf5W42joV5o7W0AvKkij9cCOpaGGghku9+G8=;
	b=LwSL7BXOTYXgZ+96SRdX1b0OkRUbr2o6UlzcxrhmE6YnQpoG19vTq3n85vLrIegOU2AS
	 glUmG2ojqZL3rhAMbBzIA7VTdSZ3T6thUDRvIjHIJopbL3xJANDoKVrdcPc5kzmd/eaY9
	 yKx/LXQELYXEbzqDMRl3bKjGsO7HSKLgoGp0wKPWafv9Kkoug0YV42qFVPuBt+Y4MB8cR
	 InBAFjhvNjLAJUV0ITA3g2sX4sxIXJr5RvrNRAiPUjkizTr69hikVJNQaEcpZ4fhv6bZa
	 Ktgf7aOHJ+C9/V9+yAFzw6WCbXfwCGGnOxR3zb3Le4Xb/1mQecIYH7x8MlYrjIxT1zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=omO9IGCx;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A35D606D808
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Nov 2026 19:17:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A35D606D808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=omO9IGCx
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 95EAF60A51;
	Wed,  4 Nov 2026 19:16:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24F441F00A02;
	Wed,  4 Nov 2026 19:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793819819;
	bh=Cbujoj2vf5W42joV5o7W0AvKkij9cCOpaGGghku9+G8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=omO9IGCxRyG7KD0kOxfDpDxNQyYIzODWVtRjkLnN3/zFnPKj34X5crXOKucSFkfWr
	 K2vwmPWEfSCfTc7KrJwcOMFunLOjtXDVztdyYUmknteKFz3PelPVAL1UgBnI+tAbd4
	 XF5ErKRbX8bdCtSjgX0zvSFTT6L0PDEOQbHUmwQkI114XRdB8cIfxqGscpwpemafw3
	 K7MJZBUNHbtj7OSLbkije9HCjsdQTGe+6yASXSAIELhzrF5YD6mcuYVUBb8Sm2r2MZ
	 MV/cCX6mrHLPa/XrLIYAdVEN9IQTdCweH82A0WOCV2qCcCupff8Ero6Vt+lk3uRxZE
	 xip5YgJ7X0fVA==
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
Subject: [PATCH RESEND v2 03/51] ALSA: cs46xx: hand the region to the region proc files
Date: Wed,  4 Nov 2026 20:16:45 +0100
Message-ID: <20261104-work-procfs-bugfixes-v2-3-021c84d852e0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1215; i=brauner@kernel.org; h=from:subject:message-id; bh=Z6ZRkJrhuCU4H5MdQ4cObdjJffW/paOotMbfYVXoKlo=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS9bjy38dymo9fKTmUGbmnq3vJ19u55ybMf3qtLXF/lV 3V+wtzWzx2lLAxiXAyyYoosDu0m4XLLeSo2G2VqwMxhZQIZwsDFKQAT+VXCyPDsb6PwnbR1njvC l2SKvFp3T79ebMkTpTsZWRmxsjzl6xoZ/qmcK6g8/p/jzJXZ7Ak/uerEBKe8Z+6ItmpmfjKzNzX 8DSMA
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

snd_cs46xx_proc_init() stores the chip in the private data of the five
region entries, but snd_cs46xx_io_read() reads that back as the region,
so a read of /proc/asound/cardN/CS46xx_BA0 and friends copies from
whatever sits at the region's offset in struct snd_cs46xx instead of
the mapped registers. Store the region.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 sound/pci/cs46xx/cs46xx_lib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/cs46xx/cs46xx_lib.c b/sound/pci/cs46xx/cs46xx_lib.c
index 797a5f09cade..efc7df444cb5 100644
--- a/sound/pci/cs46xx/cs46xx_lib.c
+++ b/sound/pci/cs46xx/cs46xx_lib.c
@@ -2764,7 +2764,7 @@ static int snd_cs46xx_proc_init(struct snd_card *card, struct snd_cs46xx *chip)
 		struct snd_cs46xx_region *region = &chip->region.idx[idx];
 		if (! snd_card_proc_new(card, region->name, &entry)) {
 			entry->content = SNDRV_INFO_CONTENT_DATA;
-			entry->private_data = chip;
+			entry->private_data = region;
 			entry->c.ops = &snd_cs46xx_proc_io_ops;
 			entry->size = region->size;
 			entry->mode = S_IFREG | 0400;

-- 
2.53.0

