Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908650;
	b=vA/hQK0Xcz36GwciXoaL2buRUARY8K4U8R/HVZr8ZZ1YrPuSg+JAg/WOCJg8AoGx153d
	 bize+qyFqKDIZbz16k3pzXjrNHFIw7Qtk0/vKBhrwspks7zV0z67Rlabjufai5r58Ytti
	 o0DH4c9cXZKOW3v0Q6L4kR3FJvyLInQKbufTNbAjAHDP+jvUZN074c05Bvmzd+qBMN3OE
	 OnAeg600tivEwZk/lQD+ZuySht4nSDpA2K+t33oYbRjGdzQdJ/0CNhW2zGrxUxx+uxDU7
	 c0cuwOgAYnTBDCynlOVFUKYT8mOrpaNXLRTxcFtN4Yn626Mt1zw/YmA5PK5Xprh6mwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908650;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=Wdq9ubmWttjgXl8+8abc/GBLatPB6YvLkctn10o4MJ0=;
	b=4TeJxJ4pbDSxCgUU3671OqZhSQ3T4z+kvx13tj72NzdAQSWxXO8LZOcwCxukBy+wgRuG
	 fVVIZU59CiDUc2Vq+Z8V+sOAa/H5iKDwxavUIVtXWPxZCQh2FNqadAj7i/baP6zGIcyDG
	 VDsZIh/3AMZyCvU3c9/XybUlrytv6fz1cqeYiXLlxKG/fkzHpcFl8ac5AM+60pEGKm2Wd
	 LlF+vhJTJjSVuehKzLDKcZAIvAiwwECSyKH2sKxBljntyg8037MeQI/aGorEhjkIIOKVM
	 1MU8vmRLGe1lTw3B+A4V4aGQAFq9hSds1tk0AvxN8zdPFQx4Z/SFBg9LMRCEBFBZIlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TJ6pjbyS;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95333606A33C
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:57:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95333606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TJ6pjbyS
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 35593414D4;
	Thu,  5 Nov 2026 19:57:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9252D1F008A1;
	Thu,  5 Nov 2026 19:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793908649;
	bh=Wdq9ubmWttjgXl8+8abc/GBLatPB6YvLkctn10o4MJ0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TJ6pjbySwYPW4bkV01Rt/FbOgOqtmyAOPGD+O3TVHeq99rf/KXFpC7uZkHXuQh2Sk
	 lB1yfJfNloihr3VqdG4yyojYVlPmqgN4VM9TGihxuSSgWgGXfVzHF7AfncQjyDCnY3
	 pBqfcM8lMgy6okNe8/A3xSvVLA/lFiGj5We/OdiFdUURLaIR+EC/N0nvBgfQ1x8XGA
	 XNDHxytc8FZkJM52EHmNjCpiqXkT1r9WWykbQNf2AKXGunxR3m71gqzdclIhVQc1x4
	 grrssyB4i93FgdFCR/cDyuNHXcp8uHCwB8OC/y8mz6vTZaCbzl8Kd478uO85QBG5hj
	 oGiy809F91fOA==
Message-ID: <sashiko-outbox-200035@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 01/30] jbd2: let procfs own the seq_file of
 the info file
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
In-Reply-To: <20261104-work-procfs-fs-v2-1-319e0f9a8aae@kernel.org>
References: <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
 <20261104-work-procfs-fs-v2-1-319e0f9a8aae@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:57:23 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Declare the seq_operations and the size of the session state and let
> procfs open and free the seq_file of /proc/fs/jbd2/<dev>/info.
> ->proc_open() only takes the snapshot of the statistics now and
> ->proc_release() frees it. Reading the file then no longer holds up its
> removal when the journal goes away.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-fs-v2-0-319e0f9a8aae@kernel.org?part=3D1

