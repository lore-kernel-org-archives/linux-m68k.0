Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717303;
	b=duk0Fel7EAa0raAvN2OspDlFOOwZ/BiUSTCo1R0YhCLRaE/qI46TiLA07fqfE4mgpNEm
	 oE1sYhhMu3v4W1WG6PoT3QcZXa7rJnj1gXe2TIaNckyW4U/7gsBWMkJ2/M1a8WjUKq9Kr
	 xkkFLRp8EosJItNunZR77nPk+1NmY9DhWQzTj/K9191a56EomlTUVb7WZgV6jNWy0Y4io
	 FK3/psrvbp1QjLLMfuw822OzQAhcVmW4xZG6/bh19hK4Vcrowih58zLXVjsagl3Unbbkr
	 YgWwZl7+DrrjJxz8QeTd9SiqFC81sI+B51jUC0p0VYq/LD9deYPozQslsriyVLu514w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717303;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=mDllQPiaDt7W9nUabOs1aaubEh71hf4xh0JVA1Ds0Qo=;
	b=LTgk5u8W8y4/RNLgJc1hnXZ5sC2d16ItMmKchG0hJ/wihuhaPvi3Qm1IGKaLrjaIAx0N
	 Y2zPCMbNKhap3I9qskewyJfsnpb8whb4gnAZTDYKBb4PRvDV50EtD5kKm3HbCgFeoW/Zj
	 ZiqmCIiHjsaiUMJOKvDHuplUIvw+mb93LpO/HsgR9m3zjuzSbE1aLDrl30vbfpmW9FFbm
	 hGz3N3hs3xFPbCsWWTAQUVmHYe73JoT7gcyfduuyydpwnbRatfCc1gqYd4NEiRp9tTZEk
	 xoST6qfmE3dP6CiigMCEIMkOHQOxr1T306EfdAkB56dbg/v3sVb6ar6THisDI7NJhgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aZQFVLsQ;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B03F606A7BB
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Nov 2026 14:48:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B03F606A7BB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aZQFVLsQ
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8B261609F1;
	Tue,  3 Nov 2026 14:48:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2DEA1F00A1D;
	Tue,  3 Nov 2026 14:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793717302;
	bh=mDllQPiaDt7W9nUabOs1aaubEh71hf4xh0JVA1Ds0Qo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aZQFVLsQSM/JJy7diD15+tL/x+/slfZHNsBHLgIYPNtPog62JjqylkMBb6gBJkiXN
	 8YNZ5GHXUCxbBxxVc34SjciIfhd9qd03FXJbglkmblnJZ+ktUmrSf9jT9is7H2wS2x
	 shULjdrAYy4v6TNHg87xWMouFG+YMuyhxCYuuodpdcLJxbVYVrIGw1sLPqhUrgPkqv
	 yicgUOsjrgp6LNPHnHnviDvzZPOwY9GU5O3HAIomWFab2PQNIpoE+CSFrgCNxrrUvW
	 hxLxx9Akzs2s93iXVT6Uyuw88VwCWCXGpW7OqZ8I+wEv0uBmmOA0DnKxLjt0OZKcWV
	 tZCMxMvtLkKwg==
Message-ID: <sashiko-outbox-195499@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 27/38] sunrpc: make queue_wait a global wait queue
 again
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
In-Reply-To: <20261102-work-procfs-bugfixes-v1-27-59422ed3e465@kernel.org>
References: <20261102-work-procfs-bugfixes-v1-0-59422ed3e465@kernel.org>
 <20261102-work-procfs-bugfixes-v1-27-59422ed3e465@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 14:48:20 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Since commit 552d0e17ea04 ("sunrpc: convert queue_wait from global to
> per-cache-detail waitqueue") poll() and epoll queue their waiters for a
> channel file on the queue_wait head in struct cache_detail. But the
> cache_detail can be freed while its channel file is still open and
> waited on.
>=20
> The procfs channel files of a network namespace are removed when the
> namespace goes away. Removing a procfs file waits for the callers that
> are in one of its methods right now and then calls ->release on every
> file that is still open (cf. close_pdeo()). The waiters that poll() and
> epoll left on the head stay queued until their file is really closed.
> So:
>=20
>   sunrpc_exit_net()
>   -> ip_map_cache_destroy()
> [ ... ]
>=20
> Reported-by: Chris Mason <mason@kernel.org>
> Fixes: 552d0e17ea04 ("sunrpc: convert queue_wait from global to per-cache=
-detail waitqueue")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-work-procf=
s-bugfixes-v1-0-59422ed3e465@kernel.org?part=3D27

