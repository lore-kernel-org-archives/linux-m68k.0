Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793629709;
	b=fl/6jOGe4pvIj/jFdDhh07T/D1NCvxJrccWEr/Zxq+kh5dNLzRc2Yb7xXW1pCTw37xaX
	 KBBoUqm0VvrO93O3xE7qp2nkVuQkqhZ9JCPEc/VcQrz2mfikWBueXf3bZq4eBmNdOGxJ8
	 GkwGjNRrnmSJMJe1el3bPUt4ESIsqrFpMdpl5tz9aLq+2ShRlfDK8ZzP7NxNntgMi0HYP
	 w7qzl9wZIqlnh5ueYFX50iFqOVweEQbMmx0zXAXgkDntCEI9K8hEgNONmVJ5UUjfi82rV
	 MCcQXpWNfmVbkOH9mFeiBtHKW7PdiU/Cyc3zp5q92q3No9yWDnHwr2mV1MShWPWmFcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629709;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=VsGmMsU5ViaEXrFm2/HEk+OSOttZ2XCHXLgyJx8eD0g=;
	b=yLgd4Ov2KiyjkdueAfYrvbP+gi9W+40BAHEPdsg5tejd1ScNdCtMNKiGCIshxguaDXCX
	 vam+F7FSPE8SgPmzPRRvNIgYp8F1G58U+r3ZSAm0imj/nCh6yTpCYohmrcJc2vqZXnD9Y
	 vn2FxGTFDyjCf0TpojMoUDqbv7kfSE243tRwg8u6mZyOQyhFeELLt0sXSf/s/aEdBTI5b
	 y0K0cIrTnwQWO9QIg427LovDt7RT4zwwkJrOO9iPKj3xZICKljTvoNJkTnofmb1R4rD1f
	 nU07I0QmPESFEpQ3y/L4QAd1DgqaNwpXzAsIiu6C/GXx5y+c0JGCmtrLln5Jn2NUijw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XqeV2NQm;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA55B607F6F2
	for <linux-m68k@lists.linux-m68k.org>; Mon,  2 Nov 2026 14:28:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA55B607F6F2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XqeV2NQm
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8BDA5437D6;
	Mon,  2 Nov 2026 14:28:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13A371F00A17;
	Mon,  2 Nov 2026 14:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793629708;
	bh=VsGmMsU5ViaEXrFm2/HEk+OSOttZ2XCHXLgyJx8eD0g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=XqeV2NQmybmcQpQCfl29ZjQwKCUGyTxg3Lk86HZD3i6fKefYdRhi6Czqkj/uY0gbw
	 WIMDP6xlkx2+VEkRPOdds7rQS/Uyu9UXSkxhmRXEhC5evtJOy9tI/yOL5szCJhbeLc
	 0E5d3uMaycB0bt6F9SqARsY6HZ9K2Zfxz47uxakdila20hiMIqVwKfumClrZvot30Z
	 0TzxA0nOHiKy1ykKqAGRyBaWolaL8pxg29oFyVMB6WnCop+8tSXpiWoJYlA9GSs8di
	 n96TiYbYdDvUjg9bfLf9swi1GEQWlrFWmIElw3Xf/XFNUaLj2StS2zAyQW67MjajXk
	 tc+uqwcEoZ88g==
From: Christian Brauner <brauner@kernel.org>
Date: Mon, 02 Nov 2026 15:21:44 +0100
Subject: [PATCH RFC 29/38] powerpc/pseries: bound the lengths in the ofdt
 property parser
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-work-procfs-bugfixes-v1-29-59422ed3e465@kernel.org>
References: <20261102-work-procfs-bugfixes-v1-0-59422ed3e465@kernel.org>
In-Reply-To: <20261102-work-procfs-bugfixes-v1-0-59422ed3e465@kernel.org>
To: linux-fsdevel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
 Jann Horn <jannh@google.com>, Josef Bacik <josef@toxicpanda.com>, 
 Chris Mason <mason@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
 NeilBrown <neil@brown.name>, Eric Dumazet <edumazet@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
 Jonathan Corbet <corbet@lwn.net>, Christoph Hellwig <hch@lst.de>, 
 Greg Kroah-Hartman <gregkh@suse.de>, 
 Joel Granados <joel.granados@kernel.org>, Kees Cook <kees@kernel.org>, 
 Jan Kara <jack@suse.cz>, Jan Kara <jack@suse.com>, 
 linux-kernel@vger.kernel.org, linux-nfs@vger.kernel.org, 
 linux-acpi@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-um@lists.infradead.org, linux-wireless@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org, 
 ntfs3@lists.linux.dev, platform-driver-x86@vger.kernel.org, 
 coreteam@netfilter.org, kexec@lists.infradead.org, 
 linux-pci@vger.kernel.org, linux-sound@vger.kernel.org, 
 netfilter-devel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 ibm-acpi-devel@lists.sourceforge.net, jfs-discussion@lists.sourceforge.net, 
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-cifs@vger.kernel.org, linux-fbdev@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-mm@kvack.org, linux-sh@vger.kernel.org, 
 linux-usb@vger.kernel.org, samba-technical@lists.samba.org, 
 sparclinux@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
 linux-doc@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-atm-general@lists.sourceforge.net, Takashi Iwai <tiwai@suse.de>, 
 linux-input@vger.kernel.org, linux-raid@vger.kernel.org, 
 linux-ext4@vger.kernel.org, linux-modules@vger.kernel.org, 
 linux-debuggers@vger.kernel.org, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Chuck Lever <cel@kernel.org>, stable@vger.kernel.org
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4036; i=brauner@kernel.org;
 h=from:subject:message-id; bh=8Hd2AVI62ImOZ5MsmuM9jPXUwAC7qJ+A0OqSTVpNjVY=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS9mJOjt7/StVJ92/OGaG62tVk7lptsnry1XOeEU0MEt
 6WRwtT+jlIWBjEuBlkxRRaHdpNwueU8FZuNMjVg5rAygQxh4OIUgImICTH89xVRKXt8brGes8gD
 hbehWc6VDwOeTlTd5HNl61HeI6E7HzD8D7LS778lssD/iJNbEMt1XRWVzwwGj4q5Nv1edEZE+NV
 ibgA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

The commands for /proc/powerpc/ofdt that carry properties, "add_node",
"add_property" and "update_property", can make the parser read past the
buffer they were copied into:

(1) do_update_property() computes the end of the buffer after
    parse_node() moved buf past the phandle. So the end is off by the
    length of the phandle string, which can be padded with zeroes, and
    parse_next_property() accepts a value that reaches that far past
    the command. new_property() then copies those bytes into the
    property, which everyone can read in /proc/device-tree.

(2) parse_next_property() parses the length with simple_strtoul() into
    an int and only rejects -1. A length above INT_MAX turns negative,
    tmp += *length moves backwards and passes the check against the
    end, so *tmp is read up to 2G in front of the buffer.

(3) Updating "slb-size" or "ibm,slb-size" reads an int from the value
    whatever its length.

Compute the end before parsing the phandle, reject lengths that don't
fit into an int or into what is left of the buffer, and only take the
slb size from a value that holds one. The file is root-only and
refused under lockdown but the parser still shouldn't read past its
input.

Reported-by: Chris Mason <mason@kernel.org>
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Fixes: 610d91511f99 ("[PATCH] powerpc: Add support for changing properties from userspace")
Fixes: 46db2f86a3b2 ("powerpc/pseries: Fix to handle slb resize across migration")
Cc: stable@vger.kernel.org
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 arch/powerpc/platforms/pseries/reconfig.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/reconfig.c b/arch/powerpc/platforms/pseries/reconfig.c
index 18e3f1a036e3..b41c5db726c9 100644
--- a/arch/powerpc/platforms/pseries/reconfig.c
+++ b/arch/powerpc/platforms/pseries/reconfig.c
@@ -114,6 +114,7 @@ static void release_prop_list(const struct property *prop)
 static char * parse_next_property(char *buf, char *end, char **name, int *length,
 				  unsigned char **value)
 {
+	unsigned long len;
 	char *tmp;
 
 	*name = buf;
@@ -133,13 +134,13 @@ static char * parse_next_property(char *buf, char *end, char **name, int *length
 	}
 
 	/* now we're on the length */
-	*length = -1;
-	*length = simple_strtoul(tmp, &tmp, 10);
-	if (*length == -1) {
+	len = simple_strtoul(tmp, &tmp, 10);
+	if (len > INT_MAX) {
 		printk(KERN_ERR "property parse failed in %s at line %d\n",
 		       __func__, __LINE__);
 		return NULL;
 	}
+	*length = len;
 	if (*tmp != ' ' || ++tmp >= end) {
 		printk(KERN_ERR "property parse failed in %s at line %d\n",
 		       __func__, __LINE__);
@@ -148,13 +149,13 @@ static char * parse_next_property(char *buf, char *end, char **name, int *length
 
 	/* now we're on the value */
 	*value = tmp;
-	tmp += *length;
-	if (tmp > end) {
+	if (len > end - tmp) {
 		printk(KERN_ERR "property parse failed in %s at line %d\n",
 		       __func__, __LINE__);
 		return NULL;
 	}
-	else if (tmp < end && *tmp != ' ' && *tmp != '\0') {
+	tmp += len;
+	if (tmp < end && *tmp != ' ' && *tmp != '\0') {
 		printk(KERN_ERR "property parse failed in %s at line %d\n",
 		       __func__, __LINE__);
 		return NULL;
@@ -320,8 +321,8 @@ static int do_update_property(char *buf, size_t bufsize)
 	char *name, *end, *next_prop;
 	int length;
 	struct property *newprop;
-	buf = parse_node(buf, bufsize, &np);
 	end = buf + bufsize;
+	buf = parse_node(buf, bufsize, &np);
 
 	if (!np)
 		return -ENODEV;
@@ -337,7 +338,8 @@ static int do_update_property(char *buf, size_t bufsize)
 	if (!newprop)
 		return -ENOMEM;
 
-	if (!strcmp(name, "slb-size") || !strcmp(name, "ibm,slb-size"))
+	if ((!strcmp(name, "slb-size") || !strcmp(name, "ibm,slb-size")) &&
+	    length >= (int)sizeof(int))
 		slb_set_size(*(int *)value);
 
 	return of_update_property(np, newprop);

-- 
2.53.0

