Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793718086;
	b=xvISvrfFSnaFYhaWnjUMDK6s8L9TVc7VchHGQa8a5vw3BWlRgp0J0Ps2R1AkOJtYlDrw
	 LLbi+vItVwCNAkbmf3pkFRk3iM0BTCLCFVmyxsgm/mKKAMZAia4QFGlIKR+8IJIfBwbwO
	 ed4i6PTZXPMuQdKh5PsrEVyDmRm7qdV5qAmFWlAzoQxK5q4kL1p3cJIs9DPLzInA1qmo+
	 k8ig4MZ679JaEk0g/TJTR2Qni+jC1LktgtWXhDVztyJW5IVvOx88tgh2PgsQx7GfhhDEG
	 gpQFarhV8/PMs/KeM5/cTiXRsAXMARUmOhExIwHPyk9ykc2wpMqB93dIiB5lIPMhg3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718086;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=dIw22hellGsRZPI14+JVbBwK78rQrm3yTTTK9Ys+5tw=;
	b=3MjdgIAQ1oLLbLDpdoxxXgbrrIlefL1Q/B3eShSZCHzE1yisoP7q7rou52NRLLf/uAZI
	 k1GO8b7QO8oM33i6jv/g9TusD6CP7R/JCmkX4NISU8b6QILNPoZeWIlsAzwgvVM26aQDU
	 jr+SrUvHfGPo3l3QzB94iwcqNhQfUe1OfSPuviaom2/tbZ0x9ZkGhClzqGkid5wJDWWqx
	 QujUkF+NEpzaJR/jCTXUxIusSUAmpAH+BJJ/HQT7ZM0S1+TonqlFpIICMcK8gf/Wg7wMg
	 tnL3q9zr0tacngRprS+cX9P8pIuXTIYPkfRdKdSEj25n46ZQfj5P+rxUaAXR5vhixOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J9zRjcK8;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B857E606F632
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Nov 2026 15:01:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B857E606F632
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J9zRjcK8
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0118560A05;
	Tue,  3 Nov 2026 15:01:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AFDC1F00A15;
	Tue,  3 Nov 2026 15:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793718084;
	bh=dIw22hellGsRZPI14+JVbBwK78rQrm3yTTTK9Ys+5tw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J9zRjcK8tkqP0OOHkyyQWNXKpHjayTJHd7AtFexhBe5dbYovaPo9C8usW0OHYBlSC
	 /5dtYS2PdCjxKfMWbcAnLUUdiW1twwftTdOo99PdFsXJEHTOZpqFh9fXEQiywggwJe
	 7nfxn7jV6zKsxegd0ELW1S2j8/fzK8Knlxp97LIaw/Kn9MmrUTDFfG6dloh8HlrdSm
	 /wEXiHDFRFrCOrub4wo87A9DmFfXtp2TaZ0TG3Ic6djd/ETejzbbX/Np9YP3yz/9xR
	 vM6wssy2cIbz3mmNRnAJddZ3bAzcVepF09fwGkyEmeGvPXpRAnVAqcJexRi0pu+w4U
	 kgad2WMGyOFYA==
Message-ID: <sashiko-outbox-195537@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 10/16] proc: let procfs own the seq_file of
 /proc/stat
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
In-Reply-To: <20261102-work-procfs-core-v1-10-75df35e4f8b8@kernel.org>
References: <20261102-work-procfs-core-v1-0-75df35e4f8b8@kernel.org>
 <20261102-work-procfs-core-v1-10-75df35e4f8b8@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 15:01:21 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Declare the show function and let procfs open and free the seq_file.
> ->proc_open() only preallocates the buffer now.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-work-procf=
s-core-v1-0-75df35e4f8b8@kernel.org?part=3D10

