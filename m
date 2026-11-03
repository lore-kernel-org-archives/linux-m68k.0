Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719109;
	b=WTGjlDVcPioHfr4TCM7HLSGQWkkkasuVkLfqce/xo1K/YAuVm9N0/JQiD19WBt9TuKZP
	 CAtEONuZ3OvrQil8C1z+j2To/GKhmEnZALGiT24GV0b8P0xEYn1YzeNVoOZtSWv3q6inj
	 BNjVtF/NoZDKETDUqM8n97wwgG9VM7nCGM4+la5K1Fq9ZF1mbygHdXveVXM5lvF+Gjq2Q
	 WdEfuP4TsAEGxFE0TY/XALDnkXkwesH4AJ93EUnNb4kIfiBciWdhf/9LN5dvOe+Dot0ki
	 i/+ifU4Nb/gBEX36VEYVoAgQc/B6xU4jFrXSpD7nI8EBlf3V/yLnKxOPGUO60GgNoGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719109;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=COmy7lgtAJ8HjYnvwZlyatM95Cc/R3fEepPQFsTWDRk=;
	b=Y5XWNWBiNoDH1NudLuIoE0313zhfr6ikFssJm0M4Xqp7AcZRiQFd18/EjRWd6qiv8LqF
	 YRUgwiMNsKGte9TM3lSOOpof9RTuNEV5jgCXnIPhn6iWhaR2b7UhHqiLUxiqBjUKicF8l
	 6hFfq96Y+f8OHkWtRuVF5m5s72oDqK+HTQNtiPHGzyBkx+zdrBrgwHDjtukAp/UJcm+Ed
	 Qp5ytALLwaABqojvkuJGTldIcvyMSosWfIC/8abPFpnz5dBSg7R4dwCLfOOYZSplq8wmd
	 tu1jSaSpOPimzCrk9Voj9w2lJY5DiQ6Hn8HsLFjmvWgrB9x9D3kWJ+mWzmdhnNR/SrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=frDTm6yT;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F530606EEAC
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Nov 2026 15:18:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F530606EEAC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=frDTm6yT
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1786860233;
	Tue,  3 Nov 2026 15:18:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61D1F1F00A15;
	Tue,  3 Nov 2026 15:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793719107;
	bh=COmy7lgtAJ8HjYnvwZlyatM95Cc/R3fEepPQFsTWDRk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=frDTm6yT3bevsP4DaCnnVtk66+Bdq9DiCW14YPmrY9E76z+eXmS5xcRY9JtMjZfaK
	 uO3JBh6L5k0M2tbG8prMNfOIalV0NwGUjAwazvLQwfZ0mYE+NeNJAGwoFsAQUyfGXS
	 FV9vek10ph/worG0rqyc4rJJeOwgtzQATT5RIWeEMhQ0jGPYZl+fpGUs8LbexXEUyx
	 uQ8Vcx8fFuyDnqEKZpIbM5XZIVeWMjWfeIs8gpal/kk8xiXemZNch1aUtZNS130AGY
	 Qe9fs4FIXqch3OLvR/m5fPNY/mofwiPPZys9hAALm6BUn55IKNJySBTWoLz6/xziXu
	 HSMSSN5wgys8w==
Message-ID: <sashiko-outbox-195582@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 02/23] zorro: let procfs copy out reads
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
In-Reply-To: <20261102-work-procfs-drivers-v1-2-a994bd4d3b1a@kernel.org>
References: <20261102-work-procfs-drivers-v1-0-a994bd4d3b1a@kernel.org>
 <20261102-work-procfs-drivers-v1-2-a994bd4d3b1a@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 15:18:26 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Implement ->proc_read_buf() so procfs copies what is read from
> /proc/bus/zorro/<slot> to userspace after it unpinned the entry.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-work-procf=
s-drivers-v1-0-a994bd4d3b1a@kernel.org?part=3D2

