Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717274;
	b=nmtdOisOrE7jCl1OqH2SfKSACcH9HoSAZbHQuO1Z2q9BgF3C/0RLMCTLG3FL+A/AWVxa
	 ++8g/SQ0eT3CGuJ5SQJKBcBOMBo7TOR0VUaHs4tdt9Lvbrg3pBv8JZgbljK1h4q2r/2eD
	 E5CU8JTlmSPjoiDFfbFTnaTLQJQVFBbsAr8yPJtG+TKCBDZbvi46y7d3GOW/njYlKlTla
	 kNqnmJzJzeWuq2sFhdvQCfyG70WiUxui9thp4OYhW8jUf2aKh5rlYUabUu5lyp3vwNIf9
	 uL9RjMuyGgMR4Tj1PwXY9n+/UZ/oPYbj9LkKDHoO0/s9TH+XAJ7l9L9U9Qx5lieY9yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717274;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=VXMUtsHfQTM8ehBaoiCzItOpo0wlFMHyP4KpaoP+TJw=;
	b=IJ/T6AKZ6UHBGXcUf0GZ/gVWAcIDtdX0k+6kSzbtzsb/izgucUY73LPQG7n20uxPEaQs
	 flgGri/ijaXIGXkBlJBpMkM4YLf48oWLTwW+NWkjCZ0mo7JKRFl96eYz9ZeTx/1pnMBUd
	 naMGlBZcYTMBWq6M90ShfBoy10GjGutnHs7jHsivjMhEi7FhkSSFGQ1bOt1s5XZxmfrpl
	 m3i09SwWpkYYbljYsJ49kqKRcK20uOWMHgKcuRkHsTRaP5VEeGf+7G1CF60A1IFSynJ65
	 ubIXtf+YvV6wPqrTdm9h0gnrCU0UUvKtaMAxVLrxlxUtDJLTicqJiKV4VI5zy49tfzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BhIDX50f;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D516083618
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Nov 2026 14:47:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34D516083618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BhIDX50f
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8495660258;
	Tue,  3 Nov 2026 14:47:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB8581F00A1A;
	Tue,  3 Nov 2026 14:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793717273;
	bh=VXMUtsHfQTM8ehBaoiCzItOpo0wlFMHyP4KpaoP+TJw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BhIDX50fZD3GGyEzS/ikmaR8zeMkB5OGeMIgm/tbgOhzPWrBZdWsC+tbrpR28AdYr
	 y3gIAbA9tORdQwifVX097HrJTcxhg5Ti4Kg4bqcyLx0KxPC3OdQlaAqq+EsL5DzLEy
	 y9ezT0t+gH5B6gfU6yBTJLut1mMFzWSgEkEMq984oe69utPAyOufz+c5qMd0DsJKJi
	 4chNM7WJ/pwpiLiKwaDsdXRchxMXpLXv3rTqFY5iprInrROKqH4oGU7pwml/nW6r5m
	 XaOnNRmGJOyEf+eVhyWOUyj2w45ZXuucOBUsC1wdU5xDQHfLFXoZkbzuNGGkUHo7vl
	 BkrM8qAOk4TnQ==
Message-ID: <sashiko-outbox-195485@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 13/38] scsi: core: NUL-terminate what is written to
 the host proc files
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
In-Reply-To: <20261102-work-procfs-bugfixes-v1-13-59422ed3e465@kernel.org>
References: <20261102-work-procfs-bugfixes-v1-0-59422ed3e465@kernel.org>
 <20261102-work-procfs-bugfixes-v1-13-59422ed3e465@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 14:47:51 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> proc_scsi_host_write() copies what is written into a page and hands it
> to ->write_info() without terminating it. ppa and imm parse it with
> strncmp() and simple_strtoul(), which read on past what was written into
> whatever the page held before. Terminate the copy. A write is at most
> PROC_BLOCK_SIZE bytes, so the page always has room for that.
>=20
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-work-procf=
s-bugfixes-v1-0-59422ed3e465@kernel.org?part=3D13

