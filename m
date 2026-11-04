Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793814673;
	b=WhUFMM8rAXa8Sya9b5Wapv0QBjrd7sw3vosBfn5uzF31Oc1sCihTE+6LGwPKDYdw6sFm
	 7EI5gkpzMBCbXWkuy8E2U9Omh53imr+lxWFZTzvg+p8+G6lIAkhd/ZEl/X4yPQOTWguiK
	 ja11rDGIzdioiYEwPiT5BtvtYB1hxX2UmxpiGj1+ypEce8+chF703S234KlgAcRMDofbo
	 uGES884BHr2XYKEfxmUksLvUzWf5fLj1FhUu22eoRjmXydYi59ixFUGBMW5mfK42HzBqG
	 gJZpeH6Qzp9noztGqh0SZ94GhjQfnoEoNwMjdWUdoArlH27eBjdyKNB0uPAYMEGaCNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793814673;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=bRUY7zR2xEebSKJvbp7QJxGSJz7lwz+abCfF6bzfIu4=;
	b=uD0HdGcQFUoB3tUpN1d7g6LZ7VmSmyl1DZqojuMw8zxl4l9IzBNhrXVUa969bgcITigm
	 uo+c0Mz1mcGSJzjDnBxuh0xkGJ0+xuJBYdvj0JwkaSjqotefYgXPxlfkgbld5UukjWz/w
	 adgLFXPQCPnqhIgLrG0grdFn1lLnlSwuLBEcxvy1Tft5LztiBqMU/kV+BoO5gLrZXzwy7
	 bHCLxR6lPJaaTeNR+5lDMuuOw/X/k2vTMVbuvJu4a4vNNIhO4xkcTjNoMo98qJukpl0W+
	 ItjzCxbJwaNDOVMYqwo3og2elZwkDGj6F2u3xRGSzKl8h4e333vCZZGiisefsV2fd2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dl7dlqCu;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E5A606A33B
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Nov 2026 17:51:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6E5A606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dl7dlqCu
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7BDF443420;
	Wed,  4 Nov 2026 17:51:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A87C21F0093A;
	Wed,  4 Nov 2026 17:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793814672;
	bh=bRUY7zR2xEebSKJvbp7QJxGSJz7lwz+abCfF6bzfIu4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dl7dlqCuigVtArFtm/v13PbvgoN21cEiJmv94TSdAfPYArcKB6G/oXjD8zdO24lnJ
	 ybF4ni0+zMxMXq66lTdyJm83mF5fI6TixB6jE4f2N9R1sc2LzqOgYA/CX08BrmhHiq
	 h5hWq+Guf6DVaBgNQPt0j0kZIA0xF83tJU/turfMgN1hOL3RG5geYK5UPa02oN+gzo
	 v+gW0NlE7T5ApRB2hs2V3O3dpHprLN/Sb2l6PJxOJgwtefZgJFn/HTsU9hDAnwxif0
	 uHwP71grr1P14LWO0dSiwyCEi1kPf44CFdlCPvbOI6cPhToAbeUH93m6qN8VxQJfEn
	 Hp/uLwaFySsTw==
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
Subject: [PATCH v2 23/51] scsi: BusLogic: don't return 0 from writes to the proc file
Date: Wed,  4 Nov 2026 18:47:09 +0100
Message-ID: <20261104-work-procfs-bugfixes-v2-23-bbf7d5546809@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=938; i=brauner@kernel.org; h=from:subject:message-id; bh=7Bhyn2ehZ0sKrsH+Wp9jL6/kN1Jv4nVldfkK6knOcds=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS9zrudfHff/e+eJxMXl8yZKxXjd1JJhqM6dufPj3/OX 2dK7+SU7ChlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZjILROG/zVzphx+JGd7gfnE OQVeVkvb3OYYjch7EkWC4pcW3gmxTWJkmP47ztIzec7OKQ5aW8Xzd+v6Z97cqbrJUdNk4eHpdlN mMgAA
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

A write to /proc/scsi/BusLogic/<n> resets the statistics and returns 0.
Writers that use stdio, echo for example, take that as no progress and
retry forever. Return the number of bytes that were written.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 drivers/scsi/BusLogic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/BusLogic.c b/drivers/scsi/BusLogic.c
index 27b446c0c5d0..7ad814f549ae 100644
--- a/drivers/scsi/BusLogic.c
+++ b/drivers/scsi/BusLogic.c
@@ -3328,7 +3328,7 @@ static int blogic_write_info(struct Scsi_Host *shost, char *procbuf,
 	adapter->ext_resets = 0;
 	adapter->adapter_intern_errors = 0;
 	memset(tgt_stats, 0, BLOGIC_MAXDEV * sizeof(struct blogic_tgt_stats));
-	return 0;
+	return bytes_avail;
 }
 
 static int blogic_show_info(struct seq_file *m, struct Scsi_Host *shost)

-- 
2.53.0

