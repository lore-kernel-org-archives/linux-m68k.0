Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793820289;
	b=au2T9a2boWmqWFU6XGSriAOko0Tjox3JVKdLqw0JPt9k6eAEjvo9e7kkKzowZn0W0Kyc
	 ymWncDW0DmRHABE0ICuAyqjkpJu5R+h6JHICw3bPC3UYu5MlXYsmVrliB+Tx9aSEmnLJT
	 6jtWU/sFUT7OW+1kVm6nrMDh8MOZ2wwS4UmSz50k6ip6zWbu7BBB5YeaSMQ8WsGawI+ik
	 bSzOzhXUW2XmqvIZ8osKszan4C6FKkEyUKz7fW9SiItYt9tQbCNOhTzjkJHee4acq+XfP
	 4DRogK1mQ2IqI/sNVD4l5tTGuXxsVtCHmGxv6T6Gw1+f5J+4uuubSaTa56DU2QtS7wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793820289;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=89c02+ELWuX5+S2o66zdN47fZ8jrr3os6Vl1YJUNtuU=;
	b=2rf3GmkdiqVnV3IOEaRXeczv+CoVS2yi3ieclHLflFSjkrvwJqjVbXDm80rxLhk1F00F
	 jf2sfAGSvoiQCdUfmilnll0ERcskF9UwgvpQ8ix1I1RXpZMVYuE5loycvlOs9SYGTdaEk
	 o9aNcu8zWh14udulcYP2AnE6B4vgEcNE+wA7bh73z9o43JtbkA4wsn5VyQBgS/TuF5ff2
	 K7vDb4ZLxQCHRjBnbbxO30GFoGWPp1yjlgZPRI+XgFK9wCB29ADBeVCPcrL/HK9zfejKe
	 7PE4VB8ivZp0teX4Xv0e+VmA4AVBr6v2BS1q2J6QhAfD5uEXleKYro9jUZ0c/wO2jMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NBvnHOor;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF08606A32F
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Nov 2026 19:24:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BF08606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NBvnHOor
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0276B60D84;
	Wed,  4 Nov 2026 19:24:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C990C1F00919;
	Wed,  4 Nov 2026 19:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793820287;
	bh=89c02+ELWuX5+S2o66zdN47fZ8jrr3os6Vl1YJUNtuU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NBvnHOoroeWxQ1cOOxGo9m9MA6Z7LEBlZbLAJEvOneMlnaSFVUAHEoOxi9i2IfbXF
	 w20Ht0aXbsrhlt2LI+8dp7MfxPXK35jBrTUUE4uym6/6KRNyTKrtxEXHNfYj+zGR1C
	 MrB2v0Z3ccjhhQerm8Lv/9FmrfKC9usWqJjV0ufa9B9Qw6Lmm2ksVQk22VO6bMLLE/
	 jg0y+5nrG1cHV7yAi4jBctD/xpQTxg0PKbh+cGWH0b/Sb4X964XH4XG0mppzdy1nTz
	 6/oUtDGSMGXK7yysZhE+5tK3yC0/sExDABR8ByjMCYipV1GH0kne1nc7HQcNhzHHJ2
	 v7JrFyLdA4wQQ==
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
Subject: [PATCH RESEND v2 35/51] proc: warn about entries left in /proc/net of a dying namespace
Date: Wed,  4 Nov 2026 20:24:33 +0100
Message-ID: <20261104-work-procfs-bugfixes-v2-35-021c84d852e0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1410; i=brauner@kernel.org; h=from:subject:message-id; bh=WtI/bNxyA4ZViPTNrsQhWLRSUjQUZ6M8VP3x2XTkww0=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS9bvymwr+T+Vz2JR+nc89N9V823XygyJDC9+jLAf3Jv AnTY2bf7ChlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZiI4WJGhsUW72quPfX4b31E IbtBQO1d76XlB6+6HQxzXub367PChF6Gv9IbN3C/7glYG3TsgoS65eoLbkHfXx9fd+nFlQ9vuiv 9tBkA
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

proc_net_ns_exit() runs after all the other pernet exits and frees
net->proc_net right after removing "stat" from it. An entry that some
pernet exit forgot to remove is left with a freed ->parent, and so
PDE_NET() hands seq_open_net() and single_open_net() a freed struct net
when the entry is opened through a file descriptor that someone kept.

There is no such entry in the tree that we know of, but nothing would
tell us about one either. So warn about it like remove_proc_entry()
does for a directory that isn't empty.

Reported-by: Chris Mason <mason@kernel.org>
Fixes: e9720acd728a ("[NET]: Make /proc/net a symlink on /proc/self/net (v3)")
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 fs/proc/proc_net.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/proc/proc_net.c b/fs/proc/proc_net.c
index dbcf87a257e1..df5484813d5d 100644
--- a/fs/proc/proc_net.c
+++ b/fs/proc/proc_net.c
@@ -410,7 +410,13 @@ out:
 
 static __net_exit void proc_net_ns_exit(struct net *net)
 {
+	struct proc_dir_entry *left;
+
 	remove_proc_entry("stat", net->proc_net);
+	/* Whatever is left still points at net->proc_net and so at net. */
+	left = rb_entry_safe(rb_first(&net->proc_net->subdir),
+			     struct proc_dir_entry, subdir_node);
+	WARN(left, "/proc/net: leaking at least '%s'\n", left->name);
 	pde_free(net->proc_net);
 }
 

-- 
2.53.0

