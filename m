Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793820702;
	b=3iCORab+oD4xiuo1X0/xF5AAYYFJ6+H3aNVAD9tQxjrh+flowMBypJc2K2zL6q8CTFqt
	 mK0XwSvg9uoDsUrYyPVEH11N+Uq1Hx4Ol1H3TmQ+/G+mbjJA2meLOfauSZq76fZJpiRZs
	 0eKWOQEQEQmdvI6YjQNqvGjBkQlf8OHmdFwO9TrgiaQrdTiS9ulPr5ih1z0gfVwr3t+mI
	 GpeyxLwyz+YAWeDwdOk7F/ZPtBjvXxs6eu55maliCqEuysSKw6I7FV77Feolh0dJ/yUjN
	 aF1Z3v7ByIasEn5kgqvHTS9Cn4kKld63JceIbIBoqaPTAgalhmZnuCv5xUBk4C6M2SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793820702;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=iNga88T+PVpZfmycjurDSPkD9sK5xR0SX7kfbe+Tx54=;
	b=CmPcljGONLXh03RsiitJM/0Nn8ErX5Vyca19lGpefJrL0vKaoHuuXmlztXLB+sbB7VZC
	 1kqJ/jQGCYvXfoMgLKK/j+eXATzmJEX/ViTrf+NJsLsM1SEVorL5LE/Xu7g+AuTLA57cC
	 qT6pCVA3I3QBAb0tYmH8KZSbBWmoHEJ3J23u3P14BQYT5kmvQU7AkQ++Lyc9d3EPHxjLT
	 edYr3tQ/Li3Y7lpbf1AUIHYK2PVlYMA9dgdd0TennhCk6KHGYiCBS+hrkMcbAnAkLT56F
	 JyODsWRmA1UbeSnVmFbB2TZu5A2JHNwyS35ao7RqTpkrpaGOErDhs9EO3ZEpqOPp8vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QTUtfoyG;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAF4607871F
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Nov 2026 19:31:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FAF4607871F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QTUtfoyG
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9850560D8B;
	Wed,  4 Nov 2026 19:31:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C04D1F00A15;
	Wed,  4 Nov 2026 19:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793820701;
	bh=iNga88T+PVpZfmycjurDSPkD9sK5xR0SX7kfbe+Tx54=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QTUtfoyG9KimBN6AkuRRVKxf3yuHufM2Wi/2H06w/quFXdhMDoJ9b0J6ZGIpIGDK5
	 z976qLZrwGZZUEOM/2QIyKDbUKj8FDXwDBDduM9rT2JEpxfbS5W9S6Mm8PwwlXubYy
	 Byfx1vCeM6TyCBhpgKK3txGGQOhUx2gc7WMApbzBGlSMkxBhA0OSCSFLxKPNEU7q0h
	 FqpNY0wnGJwPDfBnXRKv+pXROQVVMWRvXSvePhYyYWGDW0C1FBZKM6snqSFwxIPGpL
	 n/TNrzyLKLnTrYCGsUsu1BjbO8fvjf0609ggkLleGQJeqlMRkm/wkvB/Y3xMoP4jHN
	 3X4C+LMwgRt5Q==
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
Subject: [PATCH RESEND v2 09/23] proc: let procfs own the seq_file of DEFINE_PROC_SHOW_ATTRIBUTE() files
Date: Wed,  4 Nov 2026 20:31:27 +0100
Message-ID: <20261104-work-procfs-core-v2-9-76ace653a773@kernel.org>
In-Reply-To: <20261104-work-procfs-core-v2-0-76ace653a773@kernel.org>
References: <20261104-work-procfs-core-v2-0-76ace653a773@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1051; i=brauner@kernel.org; h=from:subject:message-id; bh=asSZ4ovZjSippDtL33YbhRRNyZXb/VmTI9lzg7rupAw=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS9bq/5nqVqXtG267Wf70TxqQELt9YvquFOrjuo9Dzyi bzbsaDujlIWBjEuBlkxRRaHdpNwueU8FZuNMjVg5rAygQxh4OIUgIm8Wc7IMPEii96mWaJZ+q4z Be1mv1zvuTjM8YLV/BfT77Nf3z5H/zQjw1zRTpZdUeKsERs+f18mIsCt+iZRS73q0Q+xwL2+7nb POQA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

Declare the show function and let procfs open the seq_file.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 include/linux/seq_file.h | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/include/linux/seq_file.h b/include/linux/seq_file.h
index dc0e8c62d9e0..b813b7e63d89 100644
--- a/include/linux/seq_file.h
+++ b/include/linux/seq_file.h
@@ -233,16 +233,8 @@ static const struct file_operations __name ## _fops = {			\
 }
 
 #define DEFINE_PROC_SHOW_ATTRIBUTE(__name)				\
-static int __name ## _open(struct inode *inode, struct file *file)	\
-{									\
-	return single_open(file, __name ## _show, pde_data(inode));	\
-}									\
-									\
 static const struct proc_ops __name ## _proc_ops = {			\
-	.proc_open	= __name ## _open,				\
-	.proc_read	= seq_read,					\
-	.proc_lseek	= seq_lseek,					\
-	.proc_release	= single_release,				\
+	.proc_show	= __name ## _show,				\
 }
 
 static inline struct user_namespace *seq_user_ns(struct seq_file *seq)

-- 
2.53.0

