Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719111;
	b=D2odEPRJrk2kBooC//AVStcjtpX5vQHsLYc0jXMfI5Bc4qY9l8W/nopGrTtEdHMqcfJm
	 5K7vm3y9+ikoiIkPgyfSpgYjDIcgqyWTK8Huf0YJy5brz18AAPKhRu0ot2niy9EsW/wcq
	 gt2Vn6BRrol+IqSsjvfEQJ3xB5JnuiZeXZrTSglcvD0Csl5a4dK7eEF5TLWOGTyjLl0EX
	 +Tl1xc4YDGLeQMTBLyx7IYzJZ2LsrXhvXMpyWgOxY0gPwpjUDzCJPltntU1GsEoUoqB2z
	 s10tJdkntt965o9Ye9PlILzyMzzLDIplf8dlSKfJpZ8a0jmOiK+/VkE+pwpquHCxLNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719111;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=1o/qScwOY5OW3AcPfET/LwYcniW1dmaX0ZfM6e2VYhw=;
	b=koEzk8sHV9eY+AioJ2nE9Kguroy0lLSBGWEIkpG+kRl4fMv3nRPvZXOzoHptRO2yIDHB
	 j3vauMHJPy9rmEvzUqEivjMPGcU1zX3lDajUmNtPLSnPPWMZcfqivC74Zcv0DmaRIhEOp
	 XxdSFAN1GX0sn+QVo5eBkBLxXS4gG/f9dww0iF+xWEzzFYrjrxydQ91tneRL1TPD1Ik6g
	 goOlCOlEt1Ka/bZeIkgtjcf16zN17QzPIC5TtFsvJzFfnDfogWaoRF88QRCY2vzsVY7IC
	 RCHUVJOVdi7khFCC0v5nu61sXj/gIhvvybGA1AO2pf/8XfzCYzFBZJIXvAc50K/suJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TcKAfBX5;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5961606F603
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Nov 2026 15:18:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5961606F603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TcKAfBX5
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 139B66061C;
	Tue,  3 Nov 2026 15:18:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42CD71F00A21;
	Tue,  3 Nov 2026 15:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793719109;
	bh=1o/qScwOY5OW3AcPfET/LwYcniW1dmaX0ZfM6e2VYhw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TcKAfBX5e1XdhXILhg5rfmKhO4PgyKlj3eq0azh6XrZ1+WfufOQSJYBqlzejziYAx
	 Sb6DYr+s5coWPEgX6S1IM5k/YDXX0pvL98XkLLvnJPLg+EsxjLIhB2wgm3VZi561Cb
	 8VKdmJiB++oOsCK3xY9w9+lVosNEzmPZWtLYnjt53FuUOKgldLtg9kEklxZmPmHwiC
	 jqUerjRhuYVQxDyrizw2H6TVQG1rnSfyfBTRMuR5mGl44VbCc7aPIqfk47+B5n5uQ0
	 IMubBM/eIpHoA5BVhQqZFtR6QEgZWVeYz13eEPN4NA/t98KWQGF4Uaf2N1yKfid9Eh
	 8QFXLM1gS14JA==
Message-ID: <sashiko-outbox-195583@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 03/23] PCI/proc: let procfs copy in config space
 writes
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
In-Reply-To: <20261102-work-procfs-drivers-v1-3-a994bd4d3b1a@kernel.org>
References: <20261102-work-procfs-drivers-v1-0-a994bd4d3b1a@kernel.org>
 <20261102-work-procfs-drivers-v1-3-a994bd4d3b1a@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 15:18:27 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Implement ->proc_write_buf() so procfs copies in what is written before
> it pins the entry, and write the config space from that copy with
> get_unaligned_le16() and get_unaligned_le32() instead of get_user().
>=20
> The copy holds at most PCI_CFG_SPACE_EXP_SIZE bytes. Larger writes come
> up short with PROC_ENTRY_SHORT_WRITES, like they did before because
> they were cut at the end of the config space.
>=20
> A buffer that can't be read used to write zeroes to the config space and
> report success. It fails with -EFAULT now and nothing is written.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-work-procf=
s-drivers-v1-0-a994bd4d3b1a@kernel.org?part=3D3

