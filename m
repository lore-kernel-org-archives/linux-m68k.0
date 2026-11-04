Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793820066;
	b=mlBK2eR8bGBNRcx6OpQeCvZPg4hRHOndMF40U0mOVRu8Ddea0Rg6+BTD81VTy6FqQ4OJ
	 PcoUyJthiULDXQ7WtVLo7kERhFf2xM9JMRliXE+4ob4zjcTxWWmuZT+hkE/Te8hB6hZA+
	 ummtK8F6DICLy5J00PuQ5neGVFk7u95E6CUf5q2vf5rKOfNqPNptT+nmHRv8lBlIIi/G8
	 /kngsRhHiIoKKIJiWOwImidy9RV45iRPIXN62DE2Nmi1xIzgca4VNBTQtZirn2VHNn4fi
	 LFe9bZrR6l3Lq0h6D98lrDGXd/XYniGijbT9qNfcnvRM9mQuFGvMbGWP7NukAo3b67g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793820066;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=Ayyh3GSY9IX8l/NxmtUwOJrSt8ohKQ1xsnTJeKuAZFg=;
	b=DD82adpswrParbqGTbBQew+wjaTEPACTYEAODltylUT6MAwhCkxJIVw7MUdKAYRxFAtq
	 tzZlN9byRu9lVHUy7vt3NSwP9FVhdT7eJ4hF3ZdXSuqxzkpIDx+yi6Hd81QSVbdKBR6Ng
	 smrsQ9O+eqRrcwUQS45tqXLkkViK7Se+cSiFdOhu51qYc64G1wEN6hxIjrMYcSGVs0KfM
	 3qq8On9ZwvNAtCyuePrI9+eyXVoI2st5mYO9Cn+vdqDIDTU8JEW8mo7af5szHc3Obo86K
	 zTEejAKXeVAQtCMPcoXbbW837ADz55wnv16I7UIoqcwTWanhxvsMZ/7d3FcplulAF3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PMovg2oc;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD771606EE81
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Nov 2026 19:21:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD771606EE81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PMovg2oc
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C2A7140DD0;
	Wed,  4 Nov 2026 19:21:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 806C21F000C1;
	Wed,  4 Nov 2026 19:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793820065;
	bh=Ayyh3GSY9IX8l/NxmtUwOJrSt8ohKQ1xsnTJeKuAZFg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PMovg2ocC+6+72mN+MPUqHUmY8Gh6jGtgFhxfGrbKQmCA+LwwQyl3c6SAd7ODK0Un
	 TeSpRqADQ9Kqhq1oQjD9vPlOAPX0N4L6G2Yq972WfVK0QyS2eoZkVjrC7gXV2Wp9AD
	 CUv1f8DxJzlMPkll9V0KMpG8czJ1Cdjc1NusWgGh651UisUDwupbe65VXluiYLVRKq
	 bmTGqSa/cBkfg+tO9lwTlkqyyX8ntnHu3rqhgeRlRLNSz2FtgHHB11uhlH75pZze0J
	 a0y9Qbx+5R9AkShgQfuaWjn2D8HWZ6fFJZRJfSSM3b8p5Slumunw5NJkGXiVuTlwsj
	 o0bkzl5ZAaHdA==
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
Subject: [PATCH RESEND v2 20/51] powerpc/rtas_flash: don't read past the validate message
Date: Wed,  4 Nov 2026 20:20:51 +0100
Message-ID: <20261104-work-procfs-bugfixes-v2-20-021c84d852e0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1303; i=brauner@kernel.org; h=from:subject:message-id; bh=7JHU1Fe1PUKfNakrIeb+3f7MU5rT/9SRwlQjBFg57NM=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS9bnzclOH/9YSeueXTgCsviu6+YT3ptfO90YO+xGe3o vXy9vC4dpSyMIhxMciKKbI4tJuEyy3nqdhslKkBM4eVCWQIAxenAEzkEwsjw/ZKfvGdFYG8TydZ OMpPUCz4mPFg57VZEq4Ws+oPejxnmMPI8PHqDVmb3Q9X/9/a4700i1N297SNPI27n4dcu7jAKU/ qBTMA
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

