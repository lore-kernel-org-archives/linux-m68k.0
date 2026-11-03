Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793718067;
	b=FF1Atlr5zgxbWRCm+RbaDFAhiCYYJgpMq+I8mqSUWvAHeZZ4VfmgzbaLS8RzRJTL5y58
	 92+OqueaYgsZIVOaLkZaEszNxDMeAvbYNvfWtnajEYkxMTEgIr1O9/iZYCHfDYxtTgKdt
	 tEko4AcJxioJX30uyux4KV6F6r8N2vQYS9Fd/xzNBTMSO0gyW4Wr1aLR9++bMMQxF8TP+
	 4EufEnxlNQOrUwmDFCpiU7TJ+i6MxSaB63beM8cCMbImYQIacHlyEbhRwhdcvEFqU2GG4
	 qe3bBOKkM+dNTCr0qc7naLEapFyyupmBQ0hL0JpTFhBqvKTxSE5TJFLjXPySW/Gd+1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718067;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=ID7LC75za88M69BElGmlUwzZxk8blr2d/qu4Qw48pXo=;
	b=X49PYhFCaDP413EVVv51CE1tfMF/yU9eanrJXskguhbdMBhPkfurbQJ8Ti9VWGpK8NsU
	 uPjHNX2Vpj+VdS0wS37/YMSj9P3/zBhQ++clG6G44TWC5iCa4fJnu6Y1GpWBwNNYYf1Yi
	 cH4CauI2V9IgMsJqzDJg0LMk9iXYOBkt6Bw1WeeiUu4SpDmBhfYEdU06X34Gdc7sMoMXY
	 pCLnO3BtBRuwI2Mg+i6qaYpYtYiv3YL16yXgLDZC0gFjUxN0PbfYE30miaqBDKYZZAZqk
	 6G78fK3tWnHt+SFRvIeOfF3OnK6tpmTuhLJHRT5hOXOJ1MPrpO4XtdIppd0XBtwy4Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jajaKVz5;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B379606A796
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Nov 2026 15:01:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B379606A796
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jajaKVz5
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9BB34609FC;
	Tue,  3 Nov 2026 15:01:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE5311F00A1E;
	Tue,  3 Nov 2026 15:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793718066;
	bh=ID7LC75za88M69BElGmlUwzZxk8blr2d/qu4Qw48pXo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jajaKVz5uF5jV8KNkaRZ9jm2p4d6qjnBibcW+RdQG415ddsGl+0d3bo5j0mleaLxm
	 RwN0oymilT3njGexXy56725ypD8aMhBv35E9z3nBKq7iYYj1uGr0z2x1vioz+IJ0zr
	 CIMhu6ko7LsevcSiGh6ht2M3uptrpuTNi8xCLl9RYAGb2JQIB1dYpM4tY3O3Yj0v1Q
	 i6wOkRWSaCouWbczxv6hLshYtafnWa40AAByma6d3JjyufxRbPRcUODDXJFJzDRzTt
	 QFQvvpET6EoFeMBD9/m6afIrzXxj97ddDjVi2YA1OzWzbIgGVogylw7h1FKknnweMl
	 qgPPLhzd74S9A==
Message-ID: <sashiko-outbox-195530@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 03/16] proc: make room for more entry flags
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Brauner" <brauner@kernel.org>
Cc: "Linus Torvalds" <torvalds@linux-foundation.org>, "Jann Horn" <jannh@google.com>, "Josef
 Bacik" <josef@toxicpanda.com>, "Chris Mason" <mason@kernel.org>, "Jeff
 Layton" <jlayton@kernel.org>, NeilBrown <neil@brown.name>, "Eric Dumazet" <edumazet@kernel.org>, "Thomas
 Gleixner" <tglx@kernel.org>, "Al Viro" <viro@zeniv.linux.org.uk>, "Jonathan
 Corbet" <corbet@lwn.net>, "Christoph Hellwig" <hch@lst.de>, "Greg
 Kroah-Hartman" <gregkh@suse.de>, "Joel Granados" <joel.granados@kernel.org>, "Kees
 Cook" <kees@kernel.org>, "Jan Kara" <jack@suse.cz>, "Jan Kara" <jack@suse.com>, linux-s390@vger.kernel.org, coreteam@netfilter.org, kexec@lists.infradead.org, linux-pci@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-usb@vger.kernel.org, samba-technical@lists.samba.org, linux-m68k@lists.linux-m68k.org, linux-serial@vger.kernel.org, "Takashi
 Iwai" <tiwai@suse.de>, linux-ext4@vger.kernel.org, "Chuck Lever" <cel@kernel.org>, tytso@mit.edu, "Heiko
 Carstens" <hca@linux.ibm.com>, "Vasily Gorbik" <gor@linux.ibm.com>, "Alexander
 Gordeev" <agordeev@linux.ibm.com>, "Christian Borntraeger" <borntraeger@linux.ibm.com>
In-Reply-To: <20261102-work-procfs-core-v1-3-75df35e4f8b8@kernel.org>
References: <20261102-work-procfs-core-v1-0-75df35e4f8b8@kernel.org>
 <20261102-work-procfs-core-v1-3-75df35e4f8b8@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 15:01:04 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> ->flags of struct proc_dir_entry is a u8 and the next patches need more
> flags than it has room for, so make it a u16. Bit 6 stays free,
> vfs-7.5.mount takes it for PROC_ENTRY_CANT_MOUNT.
>=20
> No functional changes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-work-procf=
s-core-v1-0-75df35e4f8b8@kernel.org?part=3D3

