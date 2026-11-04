Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793820215;
	b=YOOJRPThqkfRTYmQfY+sGRD9CRZOYbzPMBPViNY0Ej7315lle/YheYBLhVnkhH3FFrsN
	 OVqw16h7IHT2NtlEf12TYpu3fEJPimOXSlZfKwtoGs2RavwJD58LpHC40RD5TiXSBg/Ut
	 VIP65u8IAOaZaBlh4ki3uI4S3tWF6vytP9sHWGScLy8htSCGYddTH8psQ285VyPzyXcUv
	 Hp++FDqIrLgiCbSXxj3cplwM9w3WY5VvXL45rPMJEWB13m7pitiXZqSL93tNtiKIOi47n
	 sMCgatJDm2JpbJvM96b+4E7n1NBeU+aSg/usQJKHfhkJllB4JEF+unCRBWvEg2O1m7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793820215;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=QKQgab6F/A3kQED3xQkQ3++bbO+NbqHo8+XrgOES7ts=;
	b=IDWVmE7E/WqfQSS3IiuQN5+8IyZ3N2MlCGtjfjgMB7DWfhwB3hnOVAEKI3M8AHx9/Xlg
	 JCoNWN0XMnI9q9dAbHxurKC+lXMAEFCd0ADkSfOVPaf/8cWdQRzJMldT5E7qFRAEy9NRm
	 IkxLc9clfvJ/eMNHjSFtzKwVC6lHGtR59nbXg0XYz7PPMugDZDjEwP2yR6WfArjxe66lv
	 VOZAj3uQMNx6O6KGRaDZkCrzJNffr+o7L+3l52mzGTjTVHvK7hvDRIJDekIbw825/dno/
	 8PfOfqONFg9NO+D9JiumpFKX5DQhqcMae2DpjsT/fmNcX8qaxjQsBWoZEfvU7uwJwWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ijd6v8za;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E363C6079FAA
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Nov 2026 19:23:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E363C6079FAA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ijd6v8za
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 436EC60D82;
	Wed,  4 Nov 2026 19:23:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D48D21F000C1;
	Wed,  4 Nov 2026 19:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793820214;
	bh=QKQgab6F/A3kQED3xQkQ3++bbO+NbqHo8+XrgOES7ts=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ijd6v8zaNqCLmRZYja1X4maFJ83wlAF/2YPzGzhX/4NJzDk8gpRvHBDtpnvW2kzrE
	 pKuK7II1mOaBx0Gj+L1vraczZZkB7OeRZ9ZoB7qpwQKM+pSqrDe3QY2fA7KCW/Fq2E
	 oXyjbE6QtyNjJgArz+0tadzVnc7sFgUV5Zt+ED3IG+SNM2u1iqpNqo6J7AwifNHxzv
	 2i3LIYQcM2epUeP/ADp5fAb3awZdnh30Pv8kl3Wbf1o49zKnVC71mI5vqn+a8eOGO2
	 saOpPzNjuia2w4fAF7Rtkl4Ucl9o3AVDThJjpyzmxHF+vZXftQlfa3DzlUUjytBfdL
	 q0wb/VbaGQJDg==
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
Subject: [PATCH RESEND v2 30/51] net: pktgen: reject device names with a '/'
Date: Wed,  4 Nov 2026 20:23:19 +0100
Message-ID: <20261104-work-procfs-bugfixes-v2-30-021c84d852e0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1684; i=brauner@kernel.org; h=from:subject:message-id; bh=F9CLtO30/n/hY0YqeSuPpMfy319PBmjhBXOfLkB61UI=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS9bvywqoXlbXOlS3uySJpukM32T6snilzOFXlqcfhEv dGWr1sudJSyMIhxMciKKbI4tJuEyy3nqdhslKkBM4eVCWQIAxenAEzE9TTD/4KNy/KDs66oZjvq T7CTumjecrWj1yL2eO6RGRVGM7v/WjIynJutWGeWKrqa/8u9wz/unp7yJ4GpNbJ15Zfil4dMVgm eYwEA
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

"add_device" takes a name like eth0@1. Only the part in front of the
'@' has to name a network device. The rest is free text and all of it
becomes the name of a file in /proc/net/pktgen, where procfs takes a
'/' as a directory separator. So "add_device lo@a/b" makes procfs look
for a directory "lo@a" that doesn't exist and warn about it. Any user
can do that in a network namespace of its own:

  name 'lo@a/b'
  WARNING: fs/proc/generic.c:174 at __xlate_proc_name+0xb1/0xf0, CPU#3: bash/241
  Call Trace:
   __proc_create+0xd0/0x9b0
   proc_create_reg+0x45/0xf0
   proc_create_data+0x77/0xf0
   pktgen_thread_write+0xd8d/0x1750

With panic_on_warn that takes the machine down. And if "lo@a" exists
because somebody added a device of that name, procfs used to register
the new entry below that regular file, and removing "lo@a" freed both.

Reject names with a '/'.

Reported-by: Chris Mason <mason@kernel.org>
Fixes: e6fce5b916cd ("pktgen: multiqueue etc.")
Cc: stable@vger.kernel.org
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 net/core/pktgen.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/core/pktgen.c b/net/core/pktgen.c
index d63eeadddfcc..02af70d360bc 100644
--- a/net/core/pktgen.c
+++ b/net/core/pktgen.c
@@ -3831,6 +3831,10 @@ static int pktgen_add_device(struct pktgen_thread *t, const char *ifname)
 	int err;
 	int node = cpu_to_node(t->cpu);
 
+	/* The name becomes the name of a file in /proc/net/pktgen. */
+	if (strchr(ifname, '/'))
+		return -EINVAL;
+
 	/* We don't allow a device to be on several threads */
 
 	if (__pktgen_NN_threads(t->net, ifname, FIND)) {

-- 
2.53.0

