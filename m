Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793718072;
	b=kpvYYogPP31qmfLayaVwUnxeg/iA4BwMU1kHRJ05tXtNB7K8pr7kuMfsL2RU7R4ImNQ+
	 WaoxVITSr38ifbMUgEHP+pvU+v1QcPGFMIloeGVvdQrMIwmW5biwvEtu9MH8MyM4jPSc5
	 PNCRX/kJbZKhVAwUJAbAlbFw4TQgtNgu2+wCfXSMcuumToFtKWRNZpS8N4qk3bpFgNbot
	 z2uV2a6XUOk6RfR71eileWk69eDst72wGbPk6msjhyC+IP1JDBFIUAwnxGD7Hna4Ji99I
	 09uzYELK/DHaB109KgCuYFMfO/bqfzZrubg23/JL2OxrV8xwLTCaMWw61iQKB7CFDew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718072;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=paGK4Vm3mtE5b0c2DhkRMvpNzDa4nvSsw4DnEf+BgQc=;
	b=28nsKSnMwhniHfFnWyHMHsgVfBO0uW8fNj6s7HiGjvNc1yiP/JgEqmOftYe7/wLZ5Oft
	 I7tUIFGlbN0lHFBdBj7ILCX8C6TULToi1yWdi6ZD4/xl+/UNDbMh4lA5CNKvqaaquIieh
	 4nOGFA7Xpvy97hr48s8e2SDOk4POQe2nTsJvizb0n5wrgy3+YjiKODqV0Jlc2j69DvNQ0
	 ienJDl6lLeDFuT2H7t8VwGQV3yOg088fBUq3MuHBppYqkJNkacrDW4Ln2BzPEZmO3+Qfh
	 h/R9xKThth/hbUm9soB9aksKLhIgJ6YiQL5TlPEYyiEHfNfy/1AwnIx/C7DPlzzxYCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Kz/9BmYM";
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E19606EEB5
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Nov 2026 15:01:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6E19606EEB5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kz/9BmYM
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4F47D609D1;
	Tue,  3 Nov 2026 15:01:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C80F1F00919;
	Tue,  3 Nov 2026 15:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793718071;
	bh=paGK4Vm3mtE5b0c2DhkRMvpNzDa4nvSsw4DnEf+BgQc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Kz/9BmYM8ipZ0nqa4i1SDv6lAnRGk0DIAMwuEMDu9VajUTqnuibPJ60MM7nVnRyWU
	 0YGeeeZk1WD+5JhFzeeiubPttCRps/6djOG+ittG2lCUSz7LOAZYeKer7ogjO+h2Kf
	 NysxxWG34bBgucluHmCoqrvXiFc86zWo0lyI1OFo9kGGQlfblamt4HbUkUxT4PE6CV
	 LOEA6bDUBX8DU55FH/kj+Kw7Csqqg0NGPAkqtEvSpQ2QlNenqLvrP7m5r9qMAJz+Bp
	 sLUC6fAIW91wbjix1EMEC1iN30+fEqcayJA2ywzzSpskhM1z/zvbwlYUrxSQ32aLe+
	 VKbU2vNEoY5eQ==
Message-ID: <sashiko-outbox-195532@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 05/16] proc: let procfs own the seq_file of
 proc_create_seq() and friends
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
In-Reply-To: <20261102-work-procfs-core-v1-5-75df35e4f8b8@kernel.org>
References: <20261102-work-procfs-core-v1-0-75df35e4f8b8@kernel.org>
 <20261102-work-procfs-core-v1-5-75df35e4f8b8@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 15:01:09 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> proc_create_seq_private(), proc_create_single_data() and their network
> namespace variants keep the seq_operations or the show function in the
> entry already. Let procfs own the seq_file for all of them. For the
> network namespace variants ->proc_open() and ->proc_release() keep
> taking and dropping the reference to the network namespace.
>=20
> That's most of /proc/net, among them the files of xt_hashlimit and
> /proc/net/dev_snmp6/<dev>. A reader that faults on its buffer no longer
> holds up their removal.
>=20
> Reported-by: Chris Mason <mason@kernel.org>
> Fixes: 786d7e1612f0 ("Fix rmmod/read/write races in /proc entries")
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-work-procf=
s-core-v1-0-75df35e4f8b8@kernel.org?part=3D5

